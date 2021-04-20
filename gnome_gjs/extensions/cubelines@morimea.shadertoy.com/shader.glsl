
            // --- NOT shadertoy shader ---

// MODIFIED shader only for Gnome extension

// this is GLES2 port of my own shader, original

// https://www.shadertoy.com/view/NslGRN







// Created by Danil (2021+) https://twitter.com/AruGL
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.



// --defines for "DESKTOP WALLPAPERS" that use this shader--
// comment or uncomment every define to make it work (add or remove "//" before #define)


// this shadertoy use ALPHA, NO_ALPHA set alpha to 1, BG_ALPHA set background as alpha
// iChannel0 used as background if alpha ignored by wallpaper-app
//#define NO_ALPHA
//#define BG_ALPHA
#define SHADOW_ALPHA
//#define ONLY_BOX



// ANIMATION color change
//#define ANIM_COLOR


// custom COLOR, and change those const values
#define USE_COLOR
//const vec3 color_blue=vec3(0.5,0.65,0.8);
//const vec3 color_red=vec3(0.99,0.2,0.1);


// --shader code--


#define tshift 53.

// reflect back side
//#define backside_refl

// Camera with mouse
//#define MOUSE_control

#define FDIST 0.7
#define PI 3.1415926
#define GROUNDSPACING 0.5
#define GROUNDGRID 0.05
#define BOXDIMS vec3(0.75, 0.75, 1.25)

#define IOR 1.33

mat3 rotx(float a){float s = sin(a);float c = cos(a);return mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, c, s), vec3(0.0, -s, c));  }
mat3 roty(float a){float s = sin(a);float c = cos(a);return mat3(vec3(c, 0.0, s), vec3(0.0, 1.0, 0.0), vec3(-s, 0.0, c));}
mat3 rotz(float a){float s = sin(a);float c = cos(a);return mat3(vec3(c, s, 0.0), vec3(-s, c, 0.0), vec3(0.0, 0.0, 1.0 ));}

vec3 fcos(vec3 x) {
    vec3 w = fwidth(x);
    //if((length(w)==0.))return vec3(0.); // dFd fix2
    if((length(w)==0.)){vec3 tc=vec3(0.); for(int i=0;i<8;i++)tc+=cos(x+x*float(i-4)*(0.01*720./iResolution.y));return tc/8.;}
    return cos(x) * smoothstep(3.14 * 2.0, 0.0, w);
}

// rename to fcos to see some black pixels generated on edges because dFd
vec3 fcos2( vec3 x){return cos(x);}

vec3 getColor(vec3 p)
{
    // dFd fix, dFd broken on borders, but it fix only top level dFd, self intersection has border
    //if (length(p) > 0.99)return vec3(0.);
    p = abs(p);

    p *= 01.25;
    p = 0.5 * p / dot(p, p);
#ifdef ANIM_COLOR
    p+=0.072*iTime;
#endif

    float t = (0.13) * length(p);
    vec3 col = vec3(0.3, 0.4, 0.5);
    col += 0.12 * fcos(6.28318 * t * 1.0 + vec3(0.0, 0.8, 1.1));
    col += 0.11 * fcos(6.28318 * t * 3.1 + vec3(0.3, 0.4, 0.1));
    col += 0.10 * fcos(6.28318 * t * 5.1 + vec3(0.1, 0.7, 1.1));
    col += 0.10 * fcos(6.28318 * t * 17.1 + vec3(0.2, 0.6, 0.7));
    col += 0.10 * fcos(6.28318 * t * 31.1 + vec3(0.1, 0.6, 0.7));
    col += 0.10 * fcos(6.28318 * t * 65.1 + vec3(0.0, 0.5, 0.8));
    col += 0.10 * fcos(6.28318 * t * 115.1 + vec3(0.1, 0.4, 0.7));
    col += 0.10 * fcos(6.28318 * t * 265.1 + vec3(1.1, 1.4, 2.7));
    col = clamp(col, 0., 1.);
 
    return col;
}

void calcColor(vec3 ro, vec3 rd, vec3 nor, float d, float len, int idx, bool si, float td, out vec4 colx,
               out vec4 colsi)
{

    vec3 pos = (ro + rd * d);
#ifdef DEBUG
    float a = 1. - smoothstep(len - 0.15, len + 0.00001, length(pos));
    if (idx == 0)colx = vec4(1., 0., 0., a);
    if (idx == 1)colx = vec4(0., 1., 0., a);
    if (idx == 2)colx = vec4(0., 0., 1., a);
    if (si)
    {
        pos = (ro + rd * td);
        float ta = 1. - smoothstep(len - 0.15, len + 0.00001, length(pos));
        if (idx == 0)colsi = vec4(1., 0., 0., ta);
        if (idx == 1)colsi = vec4(0., 1., 0., ta);
        if (idx == 2)colsi = vec4(0., 0., 1., ta);
    }
#else
    float a = 1. - smoothstep(len - 0.15*0.5, len + 0.00001, length(pos));
    //a=1.;
    vec3 col = getColor(pos);
    colx = vec4(col, a);
    if (si)
    {
        pos = (ro + rd * td);
        float ta = 1. - smoothstep(len - 0.15*0.5, len + 0.00001, length(pos));
        //ta=1.;
        col = getColor(pos);
        colsi = vec4(col, ta);
    }
#endif
}

// xSI is self intersect data, fade to fix dFd on edges
bool iBilinearPatch(in vec3 ro, in vec3 rd, in vec4 ps, in vec4 ph, in float sz, out float t, out vec3 norm,
                    out bool si, out float tsi, out vec3 normsi, out float fade, out float fadesi)
{
    vec3 va = vec3(0.0, 0.0, ph.x + ph.w - ph.y - ph.z);
    vec3 vb = vec3(0.0, ps.w - ps.y, ph.z - ph.x);
    vec3 vc = vec3(ps.z - ps.x, 0.0, ph.y - ph.x);
    vec3 vd = vec3(ps.xy, ph.x);
    t = -1.;
    tsi = -1.;
    si = false;

    float tmp = 1.0 / (vb.y * vc.x);
    float a = 0.0;
    float b = 0.0;
    float c = 0.0;
    float d = va.z * tmp;
    float e = 0.0;
    float f = 0.0;
    float g = (vc.z * vb.y - vd.y * va.z) * tmp;
    float h = (vb.z * vc.x - va.z * vd.x) * tmp;
    float i = -1.0;
    float j = (vd.x * vd.y * va.z + vd.z * vb.y * vc.x) * tmp - (vd.y * vb.z * vc.x + vd.x * vc.z * vb.y) * tmp;

    float p = dot(vec3(a, b, c), rd.xzy * rd.xzy) + dot(vec3(d, e, f), rd.xzy * rd.zyx);
    float q = dot(vec3(2.0, 2.0, 2.0) * ro.xzy * rd.xyz, vec3(a, b, c)) + dot(ro.xzz * rd.zxy, vec3(d, d, e)) +
              dot(ro.yyx * rd.zxy, vec3(e, f, f)) + dot(vec3(g, h, i), rd.xzy);
    float r =
        dot(vec3(a, b, c), ro.xzy * ro.xzy) + dot(vec3(d, e, f), ro.xzy * ro.zyx) + dot(vec3(g, h, i), ro.xzy) + j;

    if (abs(p) < 0.000001)
    {
        float tt = -r / q;
        if (tt <= 0.)
            return false;
        t = tt;
        // normal

        vec3 pos = ro + t * rd;
        vec3 grad =
            vec3(2.0) * pos.xzy * vec3(a, b, c) + pos.zxz * vec3(d, d, e) + pos.yyx * vec3(f, e, f) + vec3(g, h, i);
        norm = -normalize(grad);
        return true;
    }
    else
    {
        float sq = q * q - 4.0 * p * r;
        if (sq < 0.0)
        {
            return false;
        }
        else
        {
            float s = sqrt(sq);
            float t0 = (-q + s) / (2.0 * p);
            float t1 = (-q - s) / (2.0 * p);
            float tt1 = min(t0 < 0.0 ? t1 : t0, t1 < 0.0 ? t0 : t1);
            float tt2 = max(t0 > 0.0 ? t1 : t0, t1 > 0.0 ? t0 : t1);
            float tt0 = tt1;
            if (tt0 <= 0.)
                return false;
            vec3 pos = ro + tt0 * rd;
            // black border on end of circle and self intersection with alpha come because dFd
            // uncomment this to see or rename fcos2 to fcos
            //sz+=0.3; 
            bool ru = step(sz, length(pos)) > 0.5;
            if (ru)
            {
                tt0 = tt2;
                pos = ro + tt0 * rd;
            }
            if (tt0 <= 0.)
                return false;
            bool ru2 = step(sz, length(pos)) > 0.5;
            if (ru2)
                return false;

            // self intersect
            if ((tt2 > 0.) && ((!ru)) && !(step(sz, length(ro + tt2 * rd)) > 0.5))
            {
                si = true;
                fadesi=s;
                tsi = tt2;
                vec3 tpos = ro + tsi * rd;
                // normal
                vec3 tgrad = vec3(2.0) * tpos.xzy * vec3(a, b, c) + tpos.zxz * vec3(d, d, e) +
                             tpos.yyx * vec3(f, e, f) + vec3(g, h, i);
                normsi = -normalize(tgrad);
            }
            
            fade=s;
            t = tt0;
            // normal
            vec3 grad =
                vec3(2.0) * pos.xzy * vec3(a, b, c) + pos.zxz * vec3(d, d, e) + pos.yyx * vec3(f, e, f) + vec3(g, h, i);
            norm = -normalize(grad);

            return true;
        }
    }
}

float dot2( in vec3 v ) { return dot(v,v); }

float segShadow( in vec3 ro, in vec3 rd, in vec3 pa, float sh )
{
    float dm = dot(rd.yz,rd.yz);
    float k1 = (ro.x-pa.x)*dm;
    float k2 = (ro.x+pa.x)*dm;
    vec2  k5 = (ro.yz+pa.yz)*dm;
    float k3 = dot(ro.yz+pa.yz,rd.yz);
    vec2  k4 = (pa.yz+pa.yz)*rd.yz;
    vec2  k6 = (pa.yz+pa.yz)*dm;
    
    //for( int i=0; i<4 + ANGLE_loops; i++ )
    {
        vec2  s = vec2(0.,0);
        float t = dot(s,k4) - k3;
        
        if( t>0.0 )
        sh = min(sh,dot2(vec3(clamp(-rd.x*t,k1,k2),k5-k6*s)+rd*t)/(t*t));
    }
    {
        vec2  s = vec2(1.,0);
        float t = dot(s,k4) - k3;
        
        if( t>0.0 )
        sh = min(sh,dot2(vec3(clamp(-rd.x*t,k1,k2),k5-k6*s)+rd*t)/(t*t));
    }
    {
        vec2  s = vec2(0.,1);
        float t = dot(s,k4) - k3;
        
        if( t>0.0 )
        sh = min(sh,dot2(vec3(clamp(-rd.x*t,k1,k2),k5-k6*s)+rd*t)/(t*t));
    }
    {
        vec2  s = vec2(1.,1);
        float t = dot(s,k4) - k3;
        
        if( t>0.0 )
        sh = min(sh,dot2(vec3(clamp(-rd.x*t,k1,k2),k5-k6*s)+rd*t)/(t*t));
    }
    return sh;
}

float boxSoftShadow( in vec3 ro, in vec3 rd, in vec3 rad, in float sk ) 
{
  if(use_shadow)return 1.;
	vec3 rdd = rd;
	vec3 roo = ro;

    vec3 m = 1.0/rdd;
    vec3 n = m*roo;
    vec3 k = abs(m)*rad;
	
    vec3 t1 = -n - k;
    vec3 t2 = -n + k;

    float tN = max( max( t1.x, t1.y ), t1.z );
	float tF = min( min( t2.x, t2.y ), t2.z );
	
    if( tN<tF && tF>0.0) return 0.0;
    
    float sh = 1.0;
    sh = segShadow( roo.xyz, rdd.xyz, rad.xyz, sh );
    sh = segShadow( roo.yzx, rdd.yzx, rad.yzx, sh );
    sh = segShadow( roo.zxy, rdd.zxy, rad.zxy, sh );
    sh = clamp(sk*sqrt(sh),0.0,1.0);
    return sh*sh*(3.0-2.0*sh);
}

float box(in vec3 ro, in vec3 rd, in vec3 r, out vec3 nn, bool entering)
{
    vec3 dr = 1.0 / rd;
    vec3 n = ro * dr;
    vec3 k = r * abs(dr);

    vec3 pin = -k - n;
    vec3 pout = k - n;
    float tin = max(pin.x, max(pin.y, pin.z));
    float tout = min(pout.x, min(pout.y, pout.z));
    if (tin > tout)
        return -1.;
    if (entering)
    {
        nn = -sign(rd) * step(pin.zxy, pin.xyz) * step(pin.yzx, pin.xyz);
    }
    else
    {
        nn = sign(rd) * step(pout.xyz, pout.zxy) * step(pout.xyz, pout.yzx);
    }
    return entering ? tin : tout;
}

vec3 bgcol(in vec3 rd)
{
    return mix(vec3(0.01), vec3(0.336, 0.458, .668), 1. - pow(abs(rd.z+0.25), 1.3));
}

vec3 background(in vec3 ro, in vec3 rd , vec3 l_dir, out float alpha)
{
#ifdef ONLY_BOX
alpha=0.;
return vec3(0.01);
#endif
    float t = (-BOXDIMS.z - ro.z) / rd.z;
    alpha=0.;
    vec3 bgc = bgcol(rd);
    if (t < 0.)
        return bgc;
    vec2 uv = ro.xy + t * rd.xy;
#ifdef NO_SHADOW
    float shad=1.;
#else
    float shad = boxSoftShadow((ro + t * rd), normalize(l_dir+vec3(0.,0.,1.))*rotz(PI*0.65) , BOXDIMS, 1.5);
#endif
    float aofac = smoothstep(-0.95, .75, length(abs(uv) - min(abs(uv), vec2(0.45))));
    aofac = min(aofac,smoothstep(-0.65, 1., shad));
    float lght=max(dot(normalize(ro + t * rd+vec3(0.,-0.,-5.)), normalize(l_dir-vec3(0.,0.,1.))*rotz(PI*0.65)), 0.0);
    vec3 col = mix(vec3(0.4), vec3(.71,.772,0.895), lght*lght* aofac+ 0.05) * aofac;
    alpha=1.-smoothstep(7.,10.,length(uv));
#ifdef SHADOW_ALPHA
    //alpha=clamp(alpha*max(lght*lght*0.95,(1.-aofac)*1.25),0.,1.);
    alpha=clamp(alpha*(1.-aofac)*1.25,0.,1.);
#endif
    return mix(col*length(col)*0.8,bgc,smoothstep(7.,10.,length(uv)));
}

#define swap(a,b) tv=a;a=b;b=tv

// emulating arrays
// if(i) b c d  to a equal to a=bcd[i]
#define ifibcda(i,b,c,d,a) {if(i==0){a=b;}else{if(i==1){a=c;}else if(i==2){a=d;}}}
// if(i) a to b c d equal to bcd[i]=a
#define ifiabcd(i,a,b,c,d) {if(i==0){b=a;}else{if(i==1){c=a;}else if(i==2){d=a;}}}

vec4 insides(vec3 ro, vec3 rd, vec3 nor_c, vec3 l_dir, out float tout, vec4 ps, vec4 ph, float bil_size)
{
    tout = -1.;
    vec3 trd=rd;

    vec3 col = vec3(0.);

    float pi = 3.1415926;

    if (abs(nor_c.x) > 0.5)
    {
        rd = rd.xzy * nor_c.x;
        ro = ro.xzy * nor_c.x;
    }
    else if (abs(nor_c.z) > 0.5)
    {
        l_dir *= roty(pi);
        rd = rd.yxz * nor_c.z;
        ro = ro.yxz * nor_c.z;
    }
    else if (abs(nor_c.y) > 0.5)
    {
        l_dir *= rotz(-pi * 0.5);
        rd = rd * nor_c.y;
        ro = ro * nor_c.y;
    }

    vec3 dx0=vec3(-1.);vec3 dx1=vec3(-1.);vec3 dx2=vec3(-1.);
    vec4 colx0=vec4(0.);vec4 colx1=vec4(0.);vec4 colx2=vec4(0.);
    vec4 colxsi0=vec4(0.);vec4 colxsi1=vec4(0.);vec4 colxsi2=vec4(0.);
    int order0=0;int order1=1;int order2=2;

    for (int i = 0; i < 3 ; i++)
    {
        if (abs(nor_c.x) > 0.5)
        {
            ro *= rotz(-pi * (1. / float(3)));
            rd *= rotz(-pi * (1. / float(3)));
        }
        else if (abs(nor_c.z) > 0.5)
        {
            ro *= rotz(pi * (1. / float(3)));
            rd *= rotz(pi * (1. / float(3)));
        }
        else if (abs(nor_c.y) > 0.5)
        {
            ro *= rotx(pi * (1. / float(3)));
            rd *= rotx(pi * (1. / float(3)));
        }
        vec3 normnew;
        float tnew;
        bool si;
        float tsi;
        vec3 normsi;
        float fade;
        float fadesi;

        if (iBilinearPatch(ro, rd, ps, ph, bil_size, tnew, normnew, si, tsi, normsi, fade, fadesi))
        {
            if (tnew > 0.)
            {
                vec4 tcol, tcolsi;
                calcColor(ro, rd, normnew, tnew, bil_size, i, si, tsi, tcol, tcolsi);
                if (tcol.a > 0.0)
                {
                    {
                        vec3 tvalx = vec3(tnew, float(si), tsi);
                        ifiabcd(i, tvalx, dx0, dx1, dx2);
                    }
#ifdef DEBUG
                    ifiabcd(i, tcol, colx0, colx1, colx2);
                    if (si)ifiabcd(i, tcolsi, colxsi0, colxsi1, colxsi2);
#else

                    float dif = clamp(dot(normnew, l_dir), 0.0, 1.0);
                    float amb = clamp(0.5 + 0.5 * dot(normnew, l_dir), 0.0, 1.0);

                    {
#ifdef USE_COLOR
                        vec3 shad = 0.57 * color_blue * amb + 1.5*color_blue.bgr * dif;
                        vec3 tcr = color_red;
#else
                        vec3 shad = vec3(0.32, 0.43, 0.54) * amb + vec3(1.0, 0.9, 0.7) * dif;
                        const vec3 tcr = vec3(1.,0.21,0.11);
#endif
                        float ta = clamp(length(tcol.rgb),0.,1.);
                        tcol=clamp(tcol*tcol*2.,0.,1.);
                        vec4 tvalx =
                            vec4((tcol.rgb*shad*1.4 + 3.*(tcr*tcol.rgb)*clamp(1.-(amb+dif),0.,1.)), min(tcol.a,ta));
                        tvalx.rgb=clamp(2.*tvalx.rgb*tvalx.rgb,0.,1.);
                        tvalx*=(min(fade*5.,1.));
                        ifiabcd(i, tvalx, colx0, colx1, colx2);
                    }
                    if (si)
                    {
                        dif = clamp(dot(normsi, l_dir), 0.0, 1.0);
                        amb = clamp(0.5 + 0.5 * dot(normsi, l_dir), 0.0, 1.0);
                        {
#ifdef USE_COLOR
                            vec3 shad = 0.57 * color_blue * amb + 1.5*color_blue.bgr * dif;
                            vec3 tcr = color_red;
#else
                            vec3 shad = vec3(0.32, 0.43, 0.54) * amb + vec3(1.0, 0.9, 0.7) * dif;
                            const vec3 tcr = vec3(1.,0.21,0.11);
#endif
                            float ta = clamp(length(tcolsi.rgb),0.,1.);
                            tcolsi=clamp(tcolsi*tcolsi*2.,0.,1.);
                            vec4 tvalx =
                                vec4(tcolsi.rgb * shad + 3.*(tcr*tcolsi.rgb)*clamp(1.-(amb+dif),0.,1.), min(tcolsi.a,ta));
                            tvalx.rgb=clamp(2.*tvalx.rgb*tvalx.rgb,0.,1.);
                            tvalx.rgb*=(min(fadesi*5.,1.));
                            ifiabcd(i, tvalx, colxsi0, colxsi1, colxsi2);
                        }
                    }
#endif
                }
            }
        }
    }
    // transparency logic and layers sorting 
    float a = 1.;
    if (dx0.x < dx1.x){{vec3 swap(dx0, dx1);}{int swap(order0, order1);}}
    if (dx1.x < dx2.x){{vec3 swap(dx1, dx2);}{int swap(order1, order2);}}
    if (dx0.x < dx1.x){{vec3 swap(dx0, dx1);}{int swap(order0, order1);}}

    tout = max(max(dx0.x, dx1.x), dx2.x);

    if (dx0.y < 0.5)
    {
        ifibcda(order0, colx0.a, colx1.a, colx2.a, a);
    }
    // self intersection
    if ((dx0.y > 0.5) && (dx1.x <= 0.))
    {
        vec4 tcolxsi = vec4(0.);
        ifibcda(order0, colxsi0, colxsi1, colxsi2, tcolxsi);
        vec4 tcolx = vec4(0.);
        ifibcda(order0, colx0, colx1, colx2, tcolx);
        vec4 tvalx = mix(tcolxsi, tcolx, tcolx.a);
        ifiabcd(order0, tvalx, colx0, colx1, colx2);

        vec4 tvalx2 = mix(vec4(0.), tvalx, max(tcolx.a, tcolxsi.a));
        ifiabcd(order0, tvalx2, colx0, colx1, colx2);
    }
    // second layer self intersection
    if ((dx1.y > 0.5) && (dx0.x > dx1.z))
    {
        vec4 tcolxsi = vec4(0.);
        ifibcda(order1, colxsi0, colxsi1, colxsi2, tcolxsi);
        vec4 tcolx = vec4(0.);
        ifibcda(order1, colx0, colx1, colx2, tcolx);
        vec4 tvalx = mix(tcolxsi, tcolx, tcolx.a);
        ifiabcd(order1, tvalx, colx0, colx1, colx2);

        vec4 tvalx2 = mix(vec4(0.), tvalx, max(tcolx.a, tcolxsi.a));
        ifiabcd(order1, tvalx2, colx0, colx1, colx2);
    }
    // third layer self intersection
    if ((dx2.y > 0.5) && (dx1.x > dx2.z))
    {
        vec4 tcolxsi = vec4(0.);
        ifibcda(order2, colxsi0, colxsi1, colxsi2, tcolxsi);
        vec4 tcolx = vec4(0.);
        ifibcda(order2, colx0, colx1, colx2, tcolx);
        vec4 tvalx = mix(tcolxsi, tcolx, tcolx.a);
        ifiabcd(order2, tvalx, colx0, colx1, colx2);

        vec4 tvalx2 = mix(vec4(0.), tvalx, max(tcolx.a, tcolxsi.a));
        ifiabcd(order2, tvalx2, colx0, colx1, colx2);
    }

    vec4 cbo0 = vec4(0.);
    vec4 cbo1 = vec4(0.);
    vec4 cbo2 = vec4(0.);
    ifibcda(order0, colx0, colx1, colx2, cbo0);
    ifibcda(order1, colx0, colx1, colx2, cbo1);
    ifibcda(order2, colx0, colx1, colx2, cbo2);
    float a1 = (dx1.y < 0.5) ? cbo1.a : ((dx1.z > dx0.x) ? cbo1.a : 1.);
    float a2 = (dx2.y < 0.5) ? cbo2.a : ((dx2.z > dx1.x) ? cbo2.a : 1.);
    col = mix(mix(cbo0.rgb, cbo1.rgb, a1), cbo2.rgb, a2);
    a = max(max(a, a1), a2);
    return vec4(col, a);
}

#define ifiabc(i,a,b,c) {if(i==0){b=a;}else{if(i==1){c=a;}}}
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    fragColor=vec4(0.);
    float osc = 0.5;
    vec3 l_dir = normalize(vec3(0., 1., 0.));
    l_dir *= rotz(0.5);
    float curvature = (0.001+1.5-1.5*smoothstep(0.,8.5,mod((iTime+tshift)*0.44,20.))*(1.-smoothstep(10.,18.5,mod((iTime+tshift)*0.44,20.))));
    if(cam_shape>0.001)curvature = cam_shape;
    const float bil_size = 1.;
    vec4 ps = vec4(-bil_size, -bil_size, bil_size, bil_size) * curvature;
    vec4 ph = vec4(-bil_size, bil_size, bil_size, -bil_size) * curvature;
    vec2 uv = (fragCoord-vec2(custom_posx_shift,custom_posy_shift) - 0.5 * iResolution.xy) / iResolution.x;
    float mouseY = 1.0 * 0.5 * PI;
#ifdef MOUSE_control
    mouseY = (1.0 - 1.15 * iMouse.y / iResolution.y) * 0.5 * PI;
    if(iMouse.y < 1.)
#endif
if(cam_static>0.001)
    mouseY = PI*(cam_static-0.49999);
else
    mouseY = PI*0.49 - smoothstep(0.,8.5,mod((iTime+tshift)*0.33,25.))*(1.-smoothstep(14.,24.0,mod((iTime+tshift)*0.33,25.))) * 0.55 * PI;
#ifdef ROTATION_SPEED
    float mouseX = -2.*PI-0.25*(iTime*ROTATION_SPEED+tshift);
#else
    float mouseX = -2.*PI-0.25*(iTime+tshift);
#endif
#ifdef MOUSE_control
    mouseX+=-(iMouse.x / iResolution.x) * 2. * PI;
#endif
    
    vec3 eye = (2. + cam_far) * vec3(cos(mouseX) * cos(mouseY), sin(mouseX) * cos(mouseY), sin(mouseY));
    vec3 w = normalize(-eye);
    vec3 up = vec3(0., 0., 1.);
    vec3 u = normalize(cross(w, up));
    vec3 v = cross(u, w);

    vec3 rd = normalize(w * FDIST + uv.x * u + uv.y * v);

    vec3 ni;
    float t = box(eye, rd, BOXDIMS, ni, true);
    vec3 ro = eye + t * rd;
    vec2 coords = ro.xy * ni.z/BOXDIMS.xy + ro.yz * ni.x/BOXDIMS.yz + ro.zx * ni.y/BOXDIMS.zx;
    float fadeborders = (1.-smoothstep(0.915,1.05,abs(coords.x)))*(1.-smoothstep(0.915,1.05,abs(coords.y)));

    if (t > 0.)
    {
        float ang = -iTime * 0.33;
        vec3 col = vec3(0.);
        float R0 = (IOR - 1.) / (IOR + 1.);
        R0 *= R0;

        vec2 theta = vec2(0.);
        vec3 n = vec3(cos(theta.x) * sin(theta.y), sin(theta.x) * sin(theta.y), cos(theta.y));

        vec3 nr = n.zxy * ni.x + n.yzx * ni.y + n.xyz * ni.z;
        vec3 rdr = reflect(rd, nr);
        float talpha;
        vec3 reflcol = background(ro, rdr, l_dir,talpha);

        vec3 rd2 = refract(rd, nr, 1. / IOR);

        float accum = 1.;
        vec3 no2 = ni;
        vec3 ro_refr = ro;

        vec4 colo0 = vec4(0.);
        vec4 colo1 = vec4(0.);

        for (int j = 0; j < 2 ; j++)
        {
            float tb;
            vec2 coords2 = ro_refr.xy * no2.z + ro_refr.yz * no2.x + ro_refr.zx * no2.y;
            vec3 eye2 = vec3(coords2, -1.);
            vec3 rd2trans = rd2.yzx * no2.x + rd2.zxy * no2.y + rd2.xyz * no2.z;

            rd2trans.z = -rd2trans.z;
            
            vec4 internalcol = insides(eye2, rd2trans, no2, l_dir, tb, ps, ph, bil_size);
            if (tb > 0.)
            {
                internalcol.rgb *= accum;
                ifiabc(j, internalcol, colo0, colo1);
                //break_val=!(internalcol.a<1.);
            }

            if ((tb <= 0.) || (internalcol.a < 1.))
            {
                float tout = box(ro_refr, rd2, BOXDIMS, no2, false);
                no2 = n.zyx * no2.x + n.xzy * no2.y + n.yxz * no2.z;
                vec3 rout = ro_refr + tout * rd2;
                vec3 rdout = refract(rd2, -no2, IOR);
                float fresnel2 = R0 + (1. - R0) * pow(1. - dot(rdout, no2), 1.3);
                rd2 = reflect(rd2, -no2);
                
#ifdef backside_refl
                if((dot(rdout, no2))>0.5){fresnel2=1.;}
#endif
                ro_refr = rout;
                ro_refr.z = max(ro_refr.z, -0.999);
                
                //if (fresnel2 < 0.0001) break_val=true;
                
                accum *= fresnel2;
            }
        }
        float fresnel = R0 + (1. - R0) * pow(1. - dot(-rd, nr), 5.);
        col = mix(mix(colo1.rgb * colo1.a, colo0.rgb, colo0.a)*fadeborders, reflcol, pow(fresnel, 1.5));
        col=clamp(col,0.,1.);
        fragColor = vec4(col, 1.);
    }
        else
    {
        float alpha;
        fragColor = vec4(background(eye, rd, l_dir, alpha), 0.15);
#if defined(BG_ALPHA)||defined(ONLY_BOX)||defined(SHADOW_ALPHA)
        if(use_alpha) fragColor.w = alpha;
        else fragColor.w = 1.;
#endif
    }
#ifdef NO_ALPHA
    fragColor.w = 1.;
#endif
    fragColor.rgb=clamp(fragColor.rgb,0.,1.);
#if defined(BG_ALPHA)||defined(ONLY_BOX)||defined(SHADOW_ALPHA)
    fragColor.rgb=fragColor.rgb*fragColor.w;
#endif

}

            // --- end of NOT shadertoy shader ---
            
