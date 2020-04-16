// self https://www.shadertoy.com/view/WsXyRM
// https://www.pouet.net/prod.php?which=85052
#define speed 35
#define AIspeed 0

const ivec2 msize=ivec2(10,22);



// 0xff max
ivec3 decodeval16(int varz) {
    ivec3 iret=ivec3(0);
    iret.x=varz>>16;
    iret.y=(varz>>8)&0xff;
    iret.z=(varz>>0)&0xff;
    return iret;
}

// &0xff just to make each val max 0xff
int encodeval16(ivec3 colz) {
    return int(((colz[0]&0xff)<<16)|((colz[1]&0xff)<< 8)|((colz[2]&0xff)<< 0));
}

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

const int bsize=4;

const int barr=19;


const int[] font = int[](0x75557, 0x22222, 0x74717, 0x74747, 0x11574, 0x71747, 0x71757, 0x74444, 0x75757, 0x75747);
const int[] powers = int[](1, 10, 100, 1000, 10000, 100000, 1000000);

int PrintInt( in vec2 uv, in int value, const int maxDigits )
{
    if( abs(uv.y-0.5)<0.5 )
    {
        int iu = int(floor(uv.x));
        if( iu>=0 && iu<maxDigits )
        {
            int n = (value/powers[maxDigits-iu-1]) % 10;
            uv.x = fract(uv.x);//(uv.x-float(iu)); 
            ivec2 p = ivec2(floor(uv*vec2(4.0,5.0)));
            return (font[n] >> (p.x+p.y*4)) & 1;
        }
    }
    return 0;
}


float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,vec2(0))) + min(max(d.x,d.y),0.0);
}


//antialiasing set 3+
#define AA 2

//other useful defines in Common


#define SS(x, y, z) smoothstep(x, y, z)
#define res (iResolution.xy / iResolution.y)

float zv;
vec2 res_g;
ivec2 ipx;
int alp = 0;

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
    return AI_size;
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
    vec2 irt=vec2(textureSize(iChannel0,0).xy);
    int itt = (id / 24) / 4; //data pixel id 0-2
    int midy = (3 * midg) / int(irt.x);
    int midx = (midg * 3 - (midy) * int(irt.x));
    midx += itt;
    if (midx >= int(irt.x)) {
        midx = midx - int(irt.x);
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
    alp = min(0, iFrame);
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
    float vignetteAmt = clamp(1. - dot(uv * 0.65, uv * 0.65),0.,1.);
    tot *= vignetteAmt;
    tot = tot / 2. + tot*tot;
    tot += (rand(uv) - .5)*.07;
    //tot=sqrt(tot);
    fragColor = vec4(clamp(tot, vec3(0.), vec3(1.)), 1.0);

    if(iTime<10.){
        vec2 fix_res=(fragCoord.xy) / iResolution.y-0.5*res;
        vec2 ttsz=vec2(textureSize(iChannel3,0).xy);
        fix_res=(fix_res*ttsz.y+0.5*(ttsz.xy))/ttsz;
        vec4 tc=texture(iChannel3,fix_res )*SS(10.,8.5,iTime)*SS(-0.5,.5,iTime);
        fragColor = (0.8+0.2*SS(8.5,10.,iTime))*fragColor*SS(-1.,3.5,iTime)*(1.-tc.a)+tc;
    }
    if(iTime>19.){ //19
            float gt=mod(iTime,20.);
            //if(floor(gt)<=1.){
            vec2 fix_res=(fragCoord.xy) / iResolution.y-0.5*res;
            vec2 ttsz=vec2(textureSize(iChannel3,0).xy);
            fix_res=(fix_res*ttsz.y+0.5*(ttsz.xy))/ttsz;
            vec4 tc=texture(iChannel3,fix_res );//*SS(.0,0.2,gt)*SS(2.,1.8,gt);
            //tc.a*=0.5;
            tc.a*=SS(20.,22.,iTime); //return
            fragColor = fragColor*(1.-tc.a)+tc*tc.a;
        //}
    }
    
    //fragColor*=0.25;
    //fragColor+=texture(iChannel0,(fragCoord/iResolution.xy+vec2(0.,-0.15))*0.05)/float(0xffffff);
    //fragColor+=texture(iChannel0,fragCoord/iResolution.xy+vec2(0.,-0.5))/float(0xffffff);
}
