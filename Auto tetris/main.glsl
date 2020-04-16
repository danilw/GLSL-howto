// REQUAREMENT webGL float should support 0xffffff value in it (24bit int)
// int max_int=0x7FFFFFFF; //webGL does not support 32bit int

// IDEA - "run max numbers of tetris bots for one framebuffer, to see whos gonna win"
// <max number> for this code= (Res.x*Res.y/3) (691k for 1920x1080)

// WHAT IS IT
// <num>(yellow) tetris AI launched same time on GPU

// the AI
// VERY minimal it die at ~30 lines burn

// how it work:

// DATA tetris board need 10*22=220 bits to store data(1/0 block free/non)
// 1 pixel can store 24*4=96bits
// to save full board used
// 2*96(two pixels) + 24(1 component of third pixel)+4(four bits second component third pixel)
// [pixel 1] [pixel 2] [x, 4 bit of y, z unused, w unused]

// LOGIC saved in unused blocks
// logic work this way:
// data pixels(1-3) execute action_e, logic pixel(3) check if action_l is valid for map
// so data logic load only "self" part of map(does not load full map)
// "logic"(3 pixel) load full map (debug_draw ~20% faster, it does not load full map)



// also read my comment under shader



// Created by Danil (2019+) https://github.com/danilw
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.




//antialiasing set 3+
#define AA 0

//other useful defines in Common


#define SS(x, y, z) smoothstep(x, y, z)
#define res (iResolution.xy / iResolution.y)

float zv;
vec2 res_g;
ivec2 ipx;

#define alp min(0, iFrame)

const vec3 white = vec3(0xa4, 0xc4, 0xd8) / float(0xff);
const vec3 whitel = vec3(0xdc, 0xe0, 0xd1) / float(0xff);
const vec3 dark = vec3(0x1d, 0x1d, 0x2b) / float(0xff);
const vec3 darkb = vec3(0x00, 0x20, 0x59) / float(0xff);
const vec3 redd = vec3(0xe1, 0x46, 0x14) / float(0xff);
const vec3 green = vec3(0x00, 0x66, 0x33) / float(0xff);

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

vec4 loadval2(ivec2 ipx) {
    return texelFetch(iChannel1, ipx, 0);
}

#if AA>1
bool once_AAlgs = false;
bool once_AAlgs2 = false;
vec4 retv_AAlgs = vec4(0.);
vec4 retv_AAlgs2 = vec4(0.);

vec4 lgs() {
    if (!once_AAlgs)retv_AAlgs = loadval2(ivec2(0., 0.));
    once_AAlgs = true;
    return retv_AAlgs;
}

vec4 lgs2() {
    if (!once_AAlgs2)retv_AAlgs2 = loadval2(ivec2(0., 1.));
    once_AAlgs2 = true;
    return retv_AAlgs2;
}
#else

vec4 lgs() {
    return loadval2(ivec2(0., 0.));
}

vec4 lgs2() {
    return loadval2(ivec2(0., 1.));
}
#endif

int gai() {
#if AI > 0
    return AI;
#endif
    return int((iResolution.x * iResolution.y) / 3.);
}

float block(vec2 p, float z) {
    float d = 0.;
    p *= z;
    float zv = zv*z;
    d = max(d, SS(zv, -zv, sdBox(p, vec2(0.25)) - 0.05));
    float td = SS(zv, -zv, (sdBox(p, vec2(0.3))) - 0.15);
    td *= 1. - SS(zv, -zv, (sdBox(p, vec2(0.3))) - 0.075);
    d = max(d, td);
    return d;
}

int maptmp(int id, int midg);

float board_box(vec2 p, vec2 bpp, float bsz, int midg) {
    float d = 0.;
    p += bpp;
    if (any(lessThanEqual(p, vec2(0.))) || any(greaterThanEqual(p, bsz * vec2(msize - ivec2(0, 2))))) return d;
    int mid = int(floor((p.y) / bsz) * float(msize.x) + floor((p.x) / bsz));
    p = mod(p, bsz) - bsz / 2.;
    d = block(p, 25.);
    float mv = 1.;
    if (d > 0.)if (maptmp(mid, midg) == 0)mv = 0.05;
    d *= mv;
    return d;
}

float block_z(vec2 p, float z) {
    float d = 0.;
    p *= z;
    float zv = zv * z * 5.; //*5 for small resolution
    d = max(d, SS(zv, -zv, sdBox(p, vec2(0.4))));
    return d;
}

float board_box_vz(vec2 p, vec2 bpp, float bsz, float z, int midg) {
    float d = 0.;
    p += bpp;
    if (any(lessThanEqual(p, vec2(0.))) || any(greaterThanEqual(p, bsz * vec2(msize - ivec2(0, 2))))) return d;
    int mid = int(floor((p.y) / bsz) * float(msize.x) + floor((p.x) / bsz));
    p = mod(p, bsz) - bsz / 2.;
    d = block_z(p, z + 25.);
    float mv = 1.;
    if (d > 0.)if (maptmp(mid, midg) == 0)mv = 0.05;
    d *= mv;
    return d;
}

ivec3 logicw = ivec3(0);
bool is_end = false;
void loadlogic(int midg);
ivec4 loadat(int id, int midg);

float lines(vec2 p, vec2 bpp, float bsz, float z, int idx, bool xx) {
    float d = 0.;
    vec2 bszx = bsz * vec2(msize);
    p += bpp - bszx / 2.;
    d = max(d, SS(zv*z, -zv*z, abs(sdBox(p, bszx / 2.) - 0.01) - 0.002));
    if (xx)if (idx == int(lgs2().x) + 1) d = max(d, 0.25 * SS(zv * z, -zv * z, (sdBox(p, bszx / 2.) - 0.01) - 0.002));
    if (p.y > 0.35)d = max(d, float(PrintInt((p + vec2(0.197, -0.36)) * vec2(25., 12.), idx, 6)));
    if (p.y > 0.35) {
        loadlogic(idx);
        d = max(d, 0.5 * float(PrintInt((p + vec2(-0.046, -0.385)) * vec2(25., 20.),
                (logicw.y << 8) + logicw.z, 4)));
    }
    return d;
}

vec4 main_c(vec2 p) {
    vec3 col = white;
    if ((abs(p.x) > .862)&&(abs(p.x) < 0.9))
        col = mix(whitel * 0.9, dark, 0.5 *
            step(abs(p.y + clamp((p.x < 0. ? (-0.5 + 7. * lgs().z / float(gai()))*01. : (-0.5 + 7. * lgs().w / float(gai()))*01.), -.5, .5)), 0.05));
    float d = 0.;
    float bsz = 1. / 25.; //block size
    vec2 bpp = vec2((bsz * 10.) / 2., 0.45); //board pos
    // mid table
    if (abs(p.x) <= bpp.x + 0.02) {
        int mid = int(lgs2().x);
        d = lines(p, bpp, bsz, 1., mid + 1, false);
        col = mix(col, darkb, d);
        d = board_box(p, bpp, bsz, mid);
        col = mix(col, dark, d);
        d = 0.7 * step(0.46, p.y) * step(0.1, p.x) * step(p.x, 0.2);
        col = mix(col, redd, d);
        d = step(0.42, p.y) * step(abs(p.x + 0.05), 0.15);
        if (d > 0.)
            col = mix(col, redd.rrb, 0.65 * float(PrintInt((p + vec2(0.197, -0.445)) * vec2(25., 20.),
                int(gai()), 6)));
    } else {
        //tiles on sides
        float zo = 5.;
        vec2 msize = vec2(msize);
        //this is bad, and I wont rewrite it xD (instead of use szt to divide (uv) I divide it on msize..idk why)
        //it was late night
        if (((abs(p.x) >= 0.5 * (msize.x / msize.y) / zo + 2. * (msize.x / msize.y) / zo))&&
                ((abs(p.x) <= 0.5 * (msize.x / msize.y) / zo + 9. * (msize.x / msize.y) / zo))) {
            // [7,5] size
            vec2 szt = vec2(7., 5.);
            bool pl = p.x < 0.;
            p *= zo;
            vec2 vt = vec2(float(msize.x) / float(msize.y), 1.);
            p += vt / 2.;
            float tv = pl ? (lgs().z) : (lgs().w);
            p.y += (mod(tv, szt.y)); //protection from float precision

            //...this number come because I use msize to divide uv and szt as tables/screen...weird
            vec2 rt = vec2(1.815, 1.2);

            int mid = int(floor((p.y + rt.y * zo / 2.) / vt.y - 1.) * szt.x + floor(mod((p.x + rt.x * zo / 2.) / vt.x, 12.) - 1.));

            //protection from float precision(2)
            mid += int((tv < 0. ? -(5. - tv) : tv) / 5.) * int(szt.y * szt.x); //this has bug if tv close to -0.0....low
            p = mod(p, vt) - vt / 2.;
            if ((mid >= 0)&&(mid < gai())) {
                d = lines(p, bpp, bsz, zo, mid + 1, true);
                col = mix(col, (is_end?green:redd* 0.7 ), d);

                d = board_box_vz(p, bpp, bsz, zo, mid);
                col = mix(col, dark, d);
            }
        }
    }

    return vec4(col, d);
}

float zoom_calc(float zx) {
    float ex = (1. * zx) / (iResolution.y);
    return ex;
}

#if AA>1
bool once_AA = false; //dont unpack again if AA enabled
int retv_AA = 0;
int maptmpAA(int id, int midg);

int maptmp(int id, int midg) {
    if (!once_AA)retv_AA = maptmpAA(id, midg);
    once_AA = true;
    return retv_AA;
}
#endif

ivec4 loadat(int id, int midg) {
    int itt = (id / 24) / 4; //data pixel id 0-2
    int midy = (3 * midg) / int(iResolution.x);
    int midx = (midg * 3 - (midy) * int(iResolution.x));
    midx += itt;
    if (midx >= int(iResolution.x)) {
        midx = midx - int(iResolution.x);
        midy += 1;
    } //fix for screen edges
    return ivec4(loadval(ivec2(midx, midy)));
}

#if AA>1
bool once_AA_l = false;
#endif

void loadlogic(int midg) {
#if AA>1
    if (once_AA_l)return;
    once_AA_l = true;
#endif
    ivec2 tpx = loadat(2 * 96, midg - 1).zw; // -1 because in func line +1
    logicw = decodeval16(tpx[1]);
    if(tpx.x<0)is_end=true;
}


//unpack bits (optimized no loops) load only needed bit
#if AA>1

int maptmpAA(int id, int midg) {
#else

int maptmp(int id, int midg) {
#endif
    int nBits = 8;
    ivec4 pixeldata = loadat(id, midg);
    int itt = (id / 24) / 4; //data pixel id 0-2
    int jtt = (id - itt * 24 * 4) / 24; //component in data pizel id 0-3
    int ott = (id - itt * 24 * 4 - jtt * 24) / 8; //component in unpacked value 0-2
    int ttt = (id - itt * 24 * 4 - jtt * 24 - ott * 8); //bit after int2bit 0-7
    ivec3 val = decodeval16(pixeldata[jtt]);
    int n = val[ott];
    for (int i = 0; i < nBits; ++i, n /= 2) {
        if (i == ttt) {
            if ((n % 2) == 0)return 0;
            else return 1;
            //switch + return does not work on windows(Angle)
            /*switch (n % 2) {
               case 0:return 0;break;
               case 1:return 1;break;
            }*/
        }
    }
    return 0;
}

void init_globals(vec2 fragCoord) {
    zv = zoom_calc(1.);
    ipx = ivec2(fragCoord - 0.5);
    res_g = res;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {

    vec2 uv = (fragCoord.xy) / iResolution.y - res / 2.0;

    init_globals(fragCoord);
    vec3 tot = vec3(0.0);
#if AA>1
    for (int mx = 0 + alp; mx < AA; mx++)
        for (int nx = 0 +alp ; nx < AA; nx++) {
            vec2 o = vec2(float(mx), float(nx)) / float(AA) - 0.5;
            uv = (fragCoord.xy + o) / iResolution.y - res / 2.0;
#endif

            vec3 col = main_c(uv).rgb;

            tot += col;
#if AA>1
        }
    tot /= float(AA * AA);
#endif
    float vignetteAmt = 1. - dot(uv * 0.65, uv * 0.65);
    tot *= vignetteAmt;
    tot = tot / 2. + tot*tot;
    tot += (rand(uv) - .5)*.07;
    //tot=sqrt(tot);
    fragColor = vec4(clamp(tot, vec3(0.), vec3(1.)), 1.0);

    //fragColor=texture(iChannel0,fragCoord/iResolution.xy)/float(0xffffff);
}
