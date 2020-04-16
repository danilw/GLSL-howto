// base on https://www.shadertoy.com/view/XdXGRB
// Source edited by David Hoskins - 2013.

#define font_size 15.
#define font_spacing .083
#define font_spacing_y .15
#define STROKEWIDTH 0.05
#define PI 3.14159265359

#define A_ vec2(0.,0.)
#define Aa_ vec2(0.35,0.)
#define B_ vec2(1.,0.)
#define Ba_ vec2(1.65,0.)
#define Bb_ vec2(.35,0.)
#define C_ vec2(2.,0.)

//#define D_ vec2(0.,1.)
#define E_ vec2(1.,1.)
//#define F_ vec2(2.,1.)

#define G_ vec2(0.,2.)
#define H_ vec2(1.,2.)
#define I_ vec2(2.,2.)
#define Ii_ vec2(1.65,2.)

#define J_ vec2(0.,3.)
#define K_ vec2(1.,3.)
#define L_ vec2(2.,3.)

#define M_ vec2(0.,4.)
#define Mm_ vec2(-0.35,4.)
#define N_ vec2(1.,4.)
#define O_ vec2(2.,4.)
#define Oo_ vec2(1.3,4.)

//#define P_ vec2(0.,5.)
//#define Q_ vec2(1.,5.)
//#define R_ vec2(1.,5.)

#define S_ vec2(0.,6.)
#define T_ vec2(1.,6.)
#define U_ vec2(2.0,6.)

//needed to make short code
#define _sz 1
#define _logic_fn all(lessThanEqual(idx,imid+ivec2(1)*_sz))&&all(greaterThanEqual(idx,imid-ivec2(1)*_sz))
#define _logic_fn2 any(greaterThan(idx,imid+ivec2(1)*_sz))||any(lessThan(idx,imid-ivec2(1)*_sz))

const vec4[5] va=vec4[](vec4(G_,I_),vec4(I_,O_),vec4(O_,M_),vec4(M_,J_),vec4(J_,L_));
const vec4[5] vb=vec4[](vec4(A_,M_),vec4(M_,O_),vec4(O_,I_),vec4(I_,G_),vec4(0));
const vec4[5] vc=vec4[](vec4(I_,G_),vec4(G_,M_),vec4(M_,O_),vec4(0),vec4(0));
const vec4[5] vd=vec4[](vec4(C_,O_),vec4(O_,M_),vec4(M_,G_),vec4(G_,I_),vec4(0));
const vec4[5] ve=vec4[](vec4(O_,M_),vec4(M_,G_),vec4(G_,I_),vec4(I_,L_),vec4(L_,J_));
const vec4[5] vf=vec4[](vec4(C_,B_),vec4(B_,N_),vec4(G_,I_),vec4(0),vec4(0));
const vec4[5] vg=vec4[](vec4(O_,M_),vec4(M_,G_),vec4(G_,I_),vec4(I_,U_),vec4(U_,S_));
const vec4[5] vh=vec4[](vec4(A_,M_),vec4(G_,I_),vec4(I_,O_),vec4(0),vec4(0));
const vec4[5] vi=vec4[](vec4(E_,E_),vec4(H_,N_),vec4(0),vec4(0),vec4(0));
const vec4[5] vj=vec4[](vec4(E_,E_),vec4(H_,T_),vec4(T_,S_),vec4(0),vec4(0));
const vec4[5] vk=vec4[](vec4(A_,M_),vec4(M_,I_),vec4(K_,O_),vec4(0),vec4(0));
const vec4[5] vl=vec4[](vec4(B_,N_),vec4(0),vec4(0),vec4(0),vec4(0));
const vec4[5] vm=vec4[](vec4(M_,G_),vec4(G_,I_),vec4(H_,N_),vec4(I_,O_),vec4(0));
const vec4[5] vn=vec4[](vec4(M_,G_),vec4(G_,I_),vec4(I_,O_),vec4(0),vec4(0));
const vec4[5] vo=vec4[](vec4(G_,I_),vec4(I_,O_),vec4(O_,M_),vec4(M_,G_),vec4(0));
const vec4[5] vp=vec4[](vec4(S_,G_),vec4(G_,I_),vec4(I_,O_),vec4(O_,M_),vec4(0));
const vec4[5] vq=vec4[](vec4(U_,I_),vec4(I_,G_),vec4(G_,M_),vec4(M_,O_),vec4(0));
const vec4[5] vr=vec4[](vec4(M_,G_),vec4(G_,I_),vec4(0),vec4(0),vec4(0));
const vec4[5] vs=vec4[](vec4(I_,G_),vec4(G_,J_),vec4(J_,L_),vec4(L_,O_),vec4(O_,M_));
const vec4[5] vt=vec4[](vec4(B_,N_),vec4(N_,O_),vec4(G_,I_),vec4(0),vec4(0));
const vec4[5] vu=vec4[](vec4(G_,M_),vec4(M_,O_),vec4(O_,I_),vec4(0),vec4(0));
const vec4[5] vv=vec4[](vec4(G_,J_),vec4(J_,N_),vec4(N_,L_),vec4(L_,I_),vec4(0));
const vec4[5] vw=vec4[](vec4(G_,M_),vec4(M_,O_),vec4(N_,H_),vec4(O_,I_),vec4(0));
const vec4[5] vx=vec4[](vec4(G_,O_),vec4(I_,M_),vec4(0),vec4(0),vec4(0));
const vec4[5] vy=vec4[](vec4(G_,M_),vec4(M_,O_),vec4(I_,U_),vec4(U_,S_),vec4(0));
const vec4[5] vz=vec4[](vec4(G_,I_),vec4(I_,M_),vec4(M_,O_),vec4(0),vec4(0));

const vec4[5] vTt=vec4[](vec4(A_,C_),vec4(B_,N_),vec4(0),vec4(0),vec4(0));

const vec4[5] vdot=vec4[](vec4(N_,N_),vec4(0),vec4(0),vec4(0),vec4(0));
const vec4[5] vminus=vec4[](vec4(G_,I_),vec4(0),vec4(0),vec4(0),vec4(0));

const vec4[5] v0=vec4[](vec4(Aa_,Mm_),vec4(C_,Oo_),vec4(Aa_,C_),vec4(Mm_,Oo_),vec4(0));
const vec4[5] v1=vec4[](vec4(G_,Ba_),vec4(Ba_,N_),vec4(0),vec4(0),vec4(0));
const vec4[5] v2=vec4[](vec4(Aa_,C_),vec4(C_,Ii_),vec4(Ii_,G_),vec4(G_,Mm_),vec4(Mm_,Oo_));

const vec4[5] v3=vec4[](vec4(Aa_,C_),vec4(Ii_,G_),vec4(Mm_,Oo_),vec4(C_,Oo_),vec4(0));
const vec4[5] v4=vec4[](vec4(G_,Bb_),vec4(Ii_,G_),vec4(C_,Oo_),vec4(0),vec4(0));
const vec4[5] v5=vec4[](vec4(Aa_,C_),vec4(Aa_,G_),vec4(Ii_,G_),vec4(Ii_,Oo_),vec4(Mm_,Oo_));

const vec4[5] v6=vec4[](vec4(G_,B_),vec4(G_,Mm_),vec4(Mm_,Oo_),vec4(Ii_,Oo_),vec4(Ii_,G_));
const vec4[5] v7=vec4[](vec4(Aa_,C_),vec4(C_,Oo_),vec4(0),vec4(0),vec4(0));
const vec4[5] v8=vec4[](vec4(Aa_,Mm_),vec4(C_,Oo_),vec4(Aa_,C_),vec4(Ii_,G_),vec4(Mm_,Oo_));

const vec4[5] v9=vec4[](vec4(Aa_,C_),vec4(G_,Bb_),vec4(Ii_,G_),vec4(C_,Oo_),vec4(Mm_,Oo_));

#define _a t_t(va,5.);
#define _b t_t(vb,4.);
#define _c t_t(vc,3.);
#define _d t_t(vd,4.);
#define _e t_t(ve,5.);
#define _f t_t(vf,3.);
#define _g t_t(vg,5.);
#define _h t_t(vh,3.);
#define _i t_t(vi,2.);
#define _j t_t(vj,3.);
#define _k t_t(vk,3.);
#define _l t_t(vl,1.);
#define _m t_t(vm,4.);
#define _n t_t(vn,3.);
#define _o t_t(vo,4.);
#define _p t_t(vp,4.);
#define _q t_t(vq,4.);
#define _r t_t(vr,2.);
#define _s t_t(vs,5.);
#define _t t_t(vt,3.);
#define _u t_t(vu,3.);
#define _v t_t(vv,4.);
#define _w t_t(vw,4.);
#define _x t_t(vx,2.);
#define _y t_t(vy,4.);
#define _z t_t(vz,3.);
#define _dot t_t(vdot,1.);
#define _minus t_t(vminus,1.);

#define _T t_t(vTt,2.);

#define _1 t_t(v1,2.);
#define _2 t_t(v2,5.);
#define _3 t_t(v3,4.);
#define _4 t_t(v4,3.);
#define _5 t_t(v5,5.);
#define _6 t_t(v6,5.);
#define _7 t_t(v7,2.);
#define _8 t_t(v8,5.);
#define _9 t_t(v9,5.);
#define _0 t_t(v0,4.);


//space etc
#define add p.x += -font_spacing;imid.x+=1*_sz;
#define space add;
#define newline p.x = op.x;p.y += font_spacing_y;imid.x=oimid.x;imid.y+=1*_sz;

#define caret_origin vec2(font_spacing, .7)


//-----------------------------------------------------------------------------------
float minimum_distance(vec2 v, vec2 w, vec2 p)
{
    float l2 = (v.x - w.x)*(v.x - w.x) + (v.y - w.y)*(v.y - w.y);
    if (l2 == 0.0) {
        return distance(p, v);
    }
    float t = dot(p - v, w - v) / l2;
    if(t < 0.0) {
        return distance(p, v);
    } else if (t > 1.0) {
        return distance(p, w);
    }
    vec2 projection = v + t * (w - v);
    return distance(p, projection);
}

//-----------------------------------------------------------------------------------
float textColor(vec2 from, vec2 to, vec2 p)
{
    p *= font_size;
    float inkNess = 0., nearLine, corner;
    nearLine = minimum_distance(from,to,p); 
    inkNess += smoothstep(0., 1., 1.- 14.*(nearLine - STROKEWIDTH));
    inkNess += smoothstep(0., 2.5, 1.- (nearLine  + 5. * STROKEWIDTH)); 
    return inkNess;
}

vec2 grid(vec2 p){return ( vec2( (p.x / 2.) * .95 , 1.0-((p.y / 2.) * .65) ));}

float count = 0.0;
float gtime=0.;

float t(vec2 from, vec2 to, vec2 p)
{
    count++;
    if (count > gtime*20.0) return 0.0;
    return textColor(grid(from), grid(to), p);
}

float d=0.;
vec2 p;
bool is_end=false;
bool is_act=false;
const ivec2 oimid=ivec2(2,2)*_sz;
ivec2 imid=oimid,idx;

void t_t(vec4[5] va, float lcount){
    if(!is_end){is_act=_logic_fn;}
        if((!is_end)&&is_act){
            for(int i=0;i<int(lcount);i++){
                d+=t(va[i].xy,va[i].zw,p);
            }
            is_end=_logic_fn2;
        } else{count+=lcount;};add;
}

float print_num(int num){
    float d0=d;
    d=0.;
    int pa[10]=int[](-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
    for (int x=0;x<10;x++) {
        if(num < 1)break;
        int tv=(num%10);
        switch(tv){
            case 0: pa[9-x]=0;break;
            case 1: pa[9-x]=1;break;
            case 2: pa[9-x]=2;break;
            case 3: pa[9-x]=3;break;
            case 4: pa[9-x]=4;break;
            case 5: pa[9-x]=5;break;
            case 6: pa[9-x]=6;break;
            case 7: pa[9-x]=7;break;
            case 8: pa[9-x]=8;break;
            case 9: pa[9-x]=9;break;
        }
        num /= 10;
    }
    for (int x=0;x<10;x++) {
        switch(pa[x]){
            case 0: {_0;};break;
            case 1: {_1;};break;
            case 2: {_2;};break;
            case 3: {_3;};break;
            case 4: {_4;};break;
            case 5: {_5;};break;
            case 6: {_6;};break;
            case 7: {_7;};break;
            case 8: {_8;};break;
            case 9: {_9;};break;
        }
    }
    float dn=d;
    d=d0;
    return dn;
}

vec4 loadval3(ivec2 ipx) {
    return texelFetch(iChannel2, ipx, 0);
}

vec4 load_pxid() {
    return loadval3(ivec2(0, 1));
}

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

int gai() {
    return AI_size;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    fragColor=vec4(0.);
    vec2 res=(iResolution.xy / iResolution.y);
    vec2 uv=fragCoord/iResolution.y-0.*res;
    if(gai()>play_o0){
    if(iTime>19.){ //19
        int ival=int(load_pxid().y);
        if(ival==0){
            float ittm=load_pxid().z;
            gtime = iTime-ittm;
            const float zzv=0.57;
            uv=uv-0.5*res;
            uv*=zzv;
            uv+=vec2(0.37,0.6);
            vec2 guv=(uv-caret_origin)*vec2(1.,-1.);
            guv*=1./vec2(font_spacing,font_spacing_y)*float(_sz);
            guv+=vec2(2.,2.5)*float(_sz);
            idx=ivec2(guv); //id start from 2, 2 is first line and simbol (*_sz)
            vec2 op = (uv-caret_origin);
            p = op;
            int ivalx=int(load_pxid().x);
            _T _h _e space _e _n _d;
            newline;
            float tx=d;
            d=0.;
            _w _i _n _n _e _r;
            newline;
            float tx2=d;
            d=0.;
            float tx3=print_num(ivalx);
            tx=clamp(tx* (.75+sin(fragCoord.x*PI*.5-iTime*4.3)*.5), 0.0, 1.0);
            tx2=clamp(tx2* (.75+sin(fragCoord.x*PI*.5-iTime*4.3)*.5), 0.0, 1.0);
            tx3=clamp(tx3* (.75+sin(fragCoord.x*PI*.5-iTime*4.3)*.5), 0.0, 1.0);
            fragColor=vec4(vec3(1.,0.6,0.26)*tx,tx);
            vec2 xy = fragCoord.xy / iResolution.xy;

            fragColor+=vec4(vec3(.7,0.86,01.)*tx2,tx2);
            fragColor+=vec4(vec3(.307,0.536,0.980)*tx3,tx3);
            fragColor.rgb *= vec3(.4, .4, .3) + 0.5*pow(100.0*xy.x*xy.y*(1.0-xy.x)*(1.0-xy.y), .4 );    
            fragColor.a*=0.5;
            fragColor.rgb=2.*pow(fragColor.rgb,vec3(2.));
            return;
        }else{
            uv=uv-0.5*res;
            float gt=mod(iTime,20.);
            float tx=float(PrintInt(uv*7.+vec2(05.85*.5,-0.38+1.),ival,6));
            fragColor=vec4(vec3(1.)*tx,tx);
            fragColor.a*=(0.7+0.3*smoothstep(.0,1.,gt)*smoothstep(4.,3.,gt));
            fragColor.a*=0.75;
            return;
        }
    }
    }
    if(iTime>10.)return;
    float time = mod(iTime, 21.0);
    gtime = time;

    vec2 guv=(uv-caret_origin)*vec2(1.,-1.);
    guv*=1./vec2(font_spacing,font_spacing_y)*float(_sz);
    guv+=vec2(2.,2.5)*float(_sz);
    idx=ivec2(guv); //id start from 2, 2 is first line and simbol (*_sz)

    vec3 col = vec3(0.);
    vec2 op = uv-caret_origin;
    p = op;

    float dx=0.;
    float d0=0.;
    float dz=0.;
    gtime=gtime*1.5;
    if(gai()>play_o0){
        _T _e _t _r _i _s space _b _a _t _t _l _e _r _o _y _a _l _e;
        newline;
        _f _o _r space;
        d0=d;
        dx=print_num(gai());space;
        d=d0;
        _b _o _t _s;
        d0=d;
        newline;
        gtime=gtime-1.;
        d=0.;
        _s _t _a _r _t space;
        for(int i=0;i<14;i++){_dot}

        dz=d;
        d=d0;
    }else{
        _k _e _y _s
        newline;
        d0=d;
        d=0.;
        space space space _1 ;dz+=d;d=0.;_minus;d0+=d;d=0.;
        _1 _2 _0 _k;
        dx+=d;
        d=0.;
        newline;
        space space space _2 ;dz+=d;d=0.;_minus;d0+=d;d=0.;
        _3 _0 _0 _k;
        dx+=d;
        d=0.;
        newline;
        space space space _3 ;dz+=d;d=0.;_minus;d0+=d;d=0.;
        _6 _9 _1 _k;
        dx+=d;
        newline;
        d=0.;
        space space space _dot _dot _dot _o _r space _p _l _a _y _dot _dot _dot;
        d0+=d;d=0.;
        gtime=gtime-1.;
        d+=d0;
    }
    d=clamp(d,0.,1.);
    dz=clamp(dz,0.,1.);
    dx=clamp(dx,0.,1.);
    d = clamp(d* (.75+sin(fragCoord.x*PI*.5-time*4.3)*.5), 0.0, 1.0); //yellow
    dz = clamp(dz* (.75+sin(fragCoord.x*PI*.5-time*4.3)*.5), 0.0, 1.0); //red
    dx = clamp(dx* (.75+sin(fragCoord.x*PI*.5-time*4.3)*.5), 0.0, 1.0); //white
    //col = vec3(d*.5, d, d*.85);
    col = vec3(d, d*0.85, d*.5);
    col += vec3(dz*02., dz*0.85, dz*.85);
    col += vec3(dx*0.85, dx*0.85, dx);
    vec2 xy = fragCoord.xy / iResolution.xy;
    col *= vec3(.4, .4, .3) + 0.5*pow(100.0*xy.x*xy.y*(1.0-xy.x)*(1.0-xy.y), .4 );  
    fragColor = vec4( col, min(max(d+dx,dz),1.));
    //vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    //fragColor = vec4( text_playex(r()*10.));
}
