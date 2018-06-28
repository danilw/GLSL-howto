// Shader downloaded from https://www.shadertoy.com/view/XdGBWy
// written by shadertoy user morimea
//
// Name: 2d object (space ship form) mask
// Description: Mouse left click will stop rotation

uniform vec3      iResolution;           // viewport resolution (in pixels)
uniform float     iGlobalTime;           // shader playback time (in seconds)
uniform float     iChannelTime[4];       // channel playback time (in seconds)
uniform vec3      iChannelResolution[4]; // channel resolution (in pixels)
uniform vec4      iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
uniform sampler2D iChannel0;             // input channel. XX = 2D/Cube
uniform sampler2D iChannel1;             // input channel. XX = 2D/Cube
uniform vec4      iDate;                 // (year, month, day, time in secs)
uniform float     iSampleRate;           // sound sample rate (i.e., 44100)

//no license, use it as you wish

#define SS(x, y, z) smoothstep(x, y, z)
#define S(U, v)       SS(-(2.0*fwidth(U.x))/1.0, (2.0*fwidth(U.x))/1.0, v)
#define C(U,P,r)   S ( U, r - length(U-(P)) )
#define CC(U,P,r,t) (1.-S(U,abs(r - length(U-(P))) - t))
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))


float model_hline1(vec2 uv){
    float n;
    n=S(uv,uv.y- .22);
    return n;
}

float model_hline2(vec2 uv){
    float n;
    n=S(uv,uv.y+ .4);
    return n;
}

float model_hline3(vec2 uv){
    float n;
    n=S(uv,uv.y- .23);
    return n;
}

float model_top(float hline,vec2 uv){
    float n;
    n=C(uv, vec2(.0, .08), .38);
    return n*hline;
}

float model_bot(float hline,vec2 uv){
    float n;
    uv.x=abs(uv.x);
    n=S(uv,-uv.x * 1.2 + uv.y* .2 + .105) ;
    n=max(n*(1.-hline),n*C(uv, vec2(-.35, -.038), .55));
    n=min(n,model_hline2(uv));
    return n;
}

float model_decor_c1(float ll1,vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=CC(uv, vec2(.0, .49), .06,0.001);
    n=n*ll1;
    return n;
}

float model_decor_c2(vec2 uv){
	float n;
    n=CC(uv, vec2(.0, .49), .073,0.008);
    return n;
}

float model_decor_c3(float hline,float h3,float ll1,vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=CC(uv, vec2(-.06, .209), .20,0.001);
    n=n*ll1*hline*h3;
    return n;
}

float model_decor_c31(vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=1.-C(uv, vec2(.0, .49), .06);
    return n;
}

float model_decor_c32(vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=1.-C(uv, vec2(-.06, .209), .20);
    return n;
}


float model_decor_ll1(float hline,vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=S(uv,uv.x- .005);
    return n;
}

float model_decor_l1(float hline,float ll1,float c1,float c2,vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=(1.-S(uv,abs(uv.x-0.005)- .001))*c1*c2*hline;
    return n;
}

float model_decor_l2(float h3,vec2 uv){
	float n;
    n=(1.-S(uv,abs(uv.x+0.21)- .006));
    n+=(1.-S(uv,abs(uv.x+0.18)- .002));
    n*=h3;
    return n;
}

float model_decor_l3(vec2 uv){
	float n;
    n=(1.-S(uv,abs(uv.x)- .001))*(1.-step(.121,uv.y));
    uv.x=abs(uv.x);
    n=max(n,1.-S(uv,abs(-uv.x * 1.2 + uv.y* 1.52 - .183)- .002));
    return n;
}

float model_decor_l4(float c2,vec2 uv){
	float n;
    uv.x=abs(uv.x);
    n=1.-S(uv,abs(uv.y- .23)- .001);
    n*=c2;
    return n;
}

float model_decor_l5(vec2 uv){
	float n;
    float lxn=S(uv,(-uv.x * 1.2 - uv.y* 1.52 + .02));
    float c1=C(uv, vec2(-.055, .059), .020);
    float c2=C(uv, vec2(.050, -.031), .020);
    uv.x=abs(uv.x);
    float lxn1=S(uv,-uv.x * 1.2 + uv.y* 1.52 + .283) ;
    float lxn2=S(uv,-uv.x * 1.2 + uv.y* 1.52 + .233) ;
    float lxn10=S(uv,-uv.x * 1.2 + uv.y* .1 + .075) ;
    float lxn20=S(uv,-uv.x * 1.2 + uv.y* .1 + .05) ;
    n=(1.-S(uv,abs(-uv.x * 1.2 + uv.y* 1.52 + .283)- .0015))*(lxn1*lxn10);
    n=max(n,(1.-S(uv,abs(-uv.x * 1.2 + uv.y* 1.52 + .233)- .0015))*(lxn2*lxn20));
    n=max(n,(1.-S(uv,abs(-uv.x * 1.2 + uv.y* .1 + .05)- .001))*(lxn2*lxn20));
    n=max(n,(1.-S(uv,abs(-uv.x * 1.2 + uv.y* .1 + .075)- .001))*(lxn1*lxn10));
    n*=lxn;
    n=max(n,c1);
    n=max(n,c2);
    return n;
}

float model_decor(float hline,vec2 uv){
    float n;
    float ll1=model_decor_ll1(hline,uv);
    float h3=model_hline3(uv);
    float c1=model_decor_c31(uv);
    float c2=model_decor_c32(uv);
    n=model_decor_c1(ll1,uv)+model_decor_c2(uv)+model_decor_c3(hline,h3,ll1,uv);
    n=max(n,model_decor_l1(hline,ll1,c1,c2,uv));
    n=max(n,model_decor_l2(h3,uv));
    n=max(n,model_decor_l4(c2,uv));
    n=max(n,model_decor_l5(uv));
    return n;
}

float model(vec2 uv){
    float n;
    //if(!(iMouse.z>0.5))uv*= MD(iTime/10.); //mouse
    float h1=model_hline1(uv);
    float mb=model_bot(h1,uv);
    float mt=model_top(h1,uv);
    n=max(mt,mb);
    n=(1.-model_decor(h1,uv))*n;
    n*=1.-model_decor_l3(uv)*mb;
    return n;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 res = iResolution.xy / iResolution.y;
    vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    fragColor = vec4(model(uv));
}

void main (void)
{
  vec4 color = vec4 (0.0, 0.0, 0.0, 1.0);
  mainImage (color, gl_FragCoord.xy);
  color.w = 1.0;
  gl_FragColor = color;
}
