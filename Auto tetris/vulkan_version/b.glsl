#define speed 35
#define AIspeed 0

const ivec2 msize=ivec2(10,22);
bool is_pause=false; //uniform

//actions
// _l logic actions
// _e action to execute
#define nac 0
#define left_l 1
#define right_l 2
#define down_l 3
#define rotate_l 4
#define left_e 11
#define right_e 12
#define down_e 13
#define rotate_e 14
#define draw 100
#define afc 200
#define afc_e 201



// Created by Danil (2019+) https://github.com/danilw
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

// UI control

// pixel [iRes.x,iRes.y] (right top) "is it launched" and resolution change

// [0,0] scroll board by mouse
// x, y buffer for scroll
// z, w Mouse.y for left and right side

// [0,1]
// x ID for main table on screen
// y control click once
// z action(key press)


#define res (iResolution.xy / iResolution.y)

ivec2 ipx;
vec2 res_g;

const int KEY_LEFT = 37;
const int KEY_UP = 38;
const int KEY_RIGHT = 39;
const int KEY_DOWN = 40;

bool key_press(int key) {
    return texelFetch(iChannel3, ivec2(key, 1), 0).x != 0.;
}

bool key_state(int key) {
    return texelFetch(iChannel3, ivec2(key, 0), 0).x != 0.;
}

int key_control() {
    if (key_press(KEY_LEFT)) {
        return left_l;
    }
    if (key_press(KEY_RIGHT)) {
        return right_l;
    }
    if (key_press(KEY_UP)) {
        return rotate_l;
    }
    if (key_state(KEY_DOWN)) {
        return down_l;
    }
    return nac;
}


int gai() {
    ivec2 szt = ivec2(7, 5);
    return AI_size / szt.x;
}

int gaio() {
    return AI_size;
}

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel1, ipx, 0);
}

vec4 loadval3(ivec2 ipx) {
    return texelFetch(iChannel2, ipx, 0);
}

vec4 load_pxid() {
    return loadval3(ivec2(0, 1));
}

vec4 lll() {
    return loadval(ivec2(iResolution.xy - 1.));
}

vec4 lgs() {
    return loadval(ivec2(0., 0.));
}

int index_idx(ivec2 p) {
    return (p.y * int(iResolution.x) + p.x) / 3;
}

void init_globals(vec2 fragCoord) {
    ipx = ivec2(fragCoord - 0.5);
    res_g = res;
}

vec4 init_global_st() {
    return vec4(0., 0., -3.0, float(2 + gai()));
}

vec2 postmove(vec2 mzw) {
    for (int i = 0; i < 2; i++) {
        // 0.0001 to fix some bug(maybe because float precision) (look line 215 in Image)
        //mzw[i]=mzw[i]<0.?mzw[i]-(mzw[i])/5.:mzw[i]; //test bug, left side of board blink after ~6-7 sec
        mzw[i] = mzw[i] < 0. - 1. ? mzw[i]-(mzw[i] + 1.) / 20. + 0.0001 : mzw[i]; //comment this for test bug
        mzw[i] = (mzw[i]>float(gai())*0.2 * 5. - 2.) ? mzw[i]-(mzw[i] - float(gai())*0.2 * 5. + 2.) / 20. - 0.0001 : mzw[i];
    }
    return mzw;
}

void global_st(out vec4 fragColor) {
    vec4 retc = loadval(ipx);
    if (lll().x >= 0.) {
        fragColor = init_global_st();
        return;
    }

    if (iMouse.z > 0.) {
        vec2 im = (iMouse.zw) / iResolution.y - res_g / 2.0;
        if (retc.xy == vec2(0.)) {
            if (iMouse.z > iResolution.x / 2.)retc.y = retc.w;
            else retc.x = retc.z;
        }
        vec2 ima = (iMouse.xy) / iResolution.y - res_g / 2.0;
        float bsz = 1. / 25.;
        if ((abs(im.x) > bsz * 5. + 0.02)&&(abs(im.x) < .862)) {
            if (im.x > 0.)retc.w = ((0.5 - ima.y)-(0.5 - im.y))*5. + retc.y;
            else retc.z = ((0.5 - ima.y)-(0.5 - im.y))*5. + retc.x;
        }
        if (im.x > 0.)retc.z = postmove(retc.zw).x;
        else retc.w = postmove(retc.zw).y;
        if (!((abs(im.x) > bsz * 5. + 0.02)&&(abs(im.x) < .862))) {
            if ((abs(im.x) > .862)&&(abs(im.x) < 0.9)) {
                if (im.x > 0.)retc.w = (0.5 - ima.y)*(float(gaio()) / 7.);
                else retc.z = (0.5 - ima.y)*(float(gaio()) / 7.);
            } else retc.zw = postmove(retc.zw);

        }
    } else {
        retc.xy = vec2(0.);
        retc.zw = postmove(retc.zw);
    }
    fragColor = retc;
}

void map_id(out vec4 fragColor) {
    
    vec4 retc = loadval(ipx);
    if (lll().x >= 0.) {
        fragColor = vec4(0.);
        return;
    }
    if (retc.y < 0.){
        if (iMouse.z > 0.) {
            //copy of main_c in image
            vec2 p = (iMouse.zw) / iResolution.y - res_g / 2.0;
            float bsz = 1. / 25.;
            vec2 bpp = vec2((bsz * 10.) / 2., 0.45);
            if (abs(p.x) <= bpp.x + 0.02) {

            } else {
                float zo = 5.;
                vec2 msize = vec2(msize);
                if (((abs(p.x) >= 0.5 * (msize.x / msize.y) / zo + 2. * (msize.x / msize.y) / zo))&&
                        ((abs(p.x) <= 0.5 * (msize.x / msize.y) / zo + 9. * (msize.x / msize.y) / zo))) {
                    vec2 szt = vec2(7., 5.);
                    bool pl = p.x < 0.;
                    p *= zo;
                    vec2 vt = vec2(float(msize.x) / float(msize.y), 1.);
                    p += vt / 2.;
                    float tv = pl ? (lgs().z) : (lgs().w);
                    p.y += (mod(tv, szt.y));
                    vec2 rt = vec2(1.815, 1.2);
                    int mid = int(floor((p.y + rt.y * zo / 2.) / vt.y - 1.) * szt.x + floor(mod((p.x + rt.x * zo / 2.) / vt.x, 12.) - 1.));
                    mid += int((tv < 0. ? -(5. - tv) : tv) / 5.) * int(szt.y * szt.x);
                    p = mod(p, vt) - vt / 2.;
                    if ((mid >= 0)&&(mid < gaio())) {
                        retc.x = float(mid);
                    }
                }
            }
        }else{
            if((gaio()>play_o0)&&!is_pause){
                retc=load_pxid();
                retc.x+=-1.;}
        }
    }
    retc.y = iMouse.z > 0. ? 1. : -1.;
    retc.z = float(key_control());
    fragColor = retc;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord.xy) / iResolution.y - res / 2.0;
    fragColor = vec4(0.);
    init_globals(fragCoord);
    if (ipx == ivec2(iResolution.xy - 1.)) {
        //reset
        if (iMouse.z > 0.) {
            vec2 im = (iMouse.zw) / iResolution.y - res_g / 2.0;
            if (step(0.46, im.y) * step(0.1, im.x) * step(im.x, 0.2) > 0.) {
                fragColor += 1.;
                return;
            }
        }
        fragColor += -1.;
        return;
    }
    if (ipx == ivec2(0., 0.)) {
        global_st(fragColor);
        return;
    }
    if (ipx == ivec2(0., 1.)) {
        map_id(fragColor);
        return;
    }
}
