// Shader downloaded from https://www.shadertoy.com/view/4dGBWy
// written by shadertoy user morimea
//
// Name: 2d obj (space ship form) colored
// Description: Mouse left click will stop rotation
//    
//    colored version of [url]https://www.shadertoy.com/view/XdGBWy[/url]

uniform vec3      iResolution;           // viewport resolution (in pixels)
uniform float     iGlobalTime;           // shader playback time (in seconds)
uniform float     iChannelTime[4];       // channel playback time (in seconds)
uniform vec3      iChannelResolution[4]; // channel resolution (in pixels)
uniform vec4      iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
uniform sampler2D iChannel0;             // input channel. XX = 2D/Cube
uniform sampler2D iChannel1;             // input channel. XX = 2D/Cube
uniform vec4      iDate;                 // (year, month, day, time in secs)
uniform float     iSampleRate;           // sound sample rate (i.e., 44100)
uniform float     iTime;           

//no license, use it as you wish

//using
//https://www.shadertoy.com/view/Xllcz7
//https://www.shadertoy.com/view/ldfGWH

#define SS(x, y, z) smoothstep(x, y, z)
#define S(U, v)       SS(-(2.0*fwidth(U.x))/1.0, (2.0*fwidth(U.x))/1.0, v)
#define C(U,P,r)   S ( U, r - length(U-(P)) )
#define CC(U,P,r,t) (1.-S(U,abs(r - length(U-(P))) - t))
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))


//colors

//black
#define m0 vec3(.23921) 
//red
#define m1 vec3(.82352,.35294,.34901) 
//blue
#define m2 vec3(.41176,.53333,.78431)
//pink
#define m3 vec3(.78431,.49411,.70196)
//green
#define m4 vec3(.19607,.79215,.56078)

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
    n=(1.-S(uv,abs(uv.x)- .001))*(1.-step(.121,uv.y))*1.2;
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

float c4(vec2 uv){
    uv*=1./0.02;
    float r = length( uv );
    return mix( 0., 0.9-0.84*pow(r,4.0), 1.0-smoothstep(0.74,0.95,r) );
}

float c5(vec2 uv){
    uv*=1./0.02;
    float r = length( uv );
    return mix( 0., 0.9-0.84*pow(r,4.0), 1.0-smoothstep(0.74,0.95,r) );
}

vec3 model_decor_l5(float ccd,vec2 uv){
	float n;
    float lxn=S(uv,(-uv.x * 1.2 - uv.y* 1.52 + .02));
    float c1=C(uv, vec2(-.055, .059), .020);
    float c4=c4(uv-vec2(-.055, .059));
    float c5=c5(uv-vec2(.050, -.031));
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
    vec3 res=n*m4*2.;
    return res*(1.-c1)*(1.-c2)+max(c1*(m2)*(1.-c4*ccd)*2.,c1*m4)+max(c2*(m2)*(1.-c5*ccd)*2.,c2*m2);
}

//animation dots
//https://www.shadertoy.com/view/Xllcz7
#define rand(p)  fract(sin(dot(p,vec2(12.9898,78.233))) * 43758.5453+(iTime/2.8))
float model_ani_dots(vec2 uv )
{
    float num = 100.;
    uv *= num;
    return smoothstep(.5,.8, 1. -length(fract(uv.xy) - .5)) * rand(floor(uv)/num);
}
//-----

vec3 model_decor(float hline,vec2 uv){
    float n;
    float ll1=model_decor_ll1(hline,uv);
    float h3=model_hline3(uv);
    float c1=model_decor_c31(uv);
    float c2=model_decor_c32(uv);
    float cv1=model_decor_c2(uv);
    vec3 cc1=cv1*m2;
   	n=max(n,model_decor_c1(ll1,uv));
    n=max(n,model_decor_c3(hline,h3,ll1,uv));
    n=max(n,model_decor_l1(hline,ll1,c1,c2,uv));
    vec3 cc3=model_decor_l2(h3,uv)*m2*2.;
    n=max(n,model_decor_l4(c2,uv));
    float ccd=model_ani_dots(uv);
    vec3 cc2=model_decor_l5(ccd,uv);
    float mx1=1.-step(0.014,(max(abs(uv.x - 0.185), abs(uv.y*.315 - 0.096))));
    float mx2=1.-step(0.025,(max(abs(uv.x + 0.0355), abs(uv.y*.458 - 0.117))));
    return cc1*(1.-n)*3.+n*m3*2.+cc2+cc3+ccd*mx1*m2*3.+ccd*mx2*m1*3.;
}

float c1(vec2 uv){
    uv.y+=-0.09;
    uv*=2.5;
    float r = length( uv );
    return mix( 0., 0.9-0.84*pow(r,4.0), 1.0-smoothstep(0.94,0.95,r) );
}

float c2(vec2 uv){
    
    uv.x=abs(uv.x);
    float di=(1.-S(uv,-uv.x * 1.2 + uv.y* 1.52 - .183));
    float ssx=(smoothstep(-0.02,0.125,-uv.x * 1.2 + uv.y* .2 + .1505));
    uv.y+=-0.168;
    uv*=3.8;
    uv.x+=0.309;
    float r = length( uv );
    r = (1.-ssx)*di+r*(1.-di);
    float ret=mix( 0., 0.9-0.84*pow(r,4.0), (1.0-smoothstep(0.94,0.95,r))*(1.-di)+ssx*di);
    return ret;
}

float c3(float hline,vec2 uv){
    float n;
    uv.x=abs(uv.x);
    uv.y+=-0.25;
    uv.x+=0.01;
    uv*=7.05;
    float r = length( uv );
    return mix( 0., 0.9-0.84*pow(r,4.0), 1.0-smoothstep(0.64,0.95,r) )*hline;
    return n;
}

vec3 eng_ani(vec2 uv)
{
	float t = abs(1.0 / (uv.y * 50.0));
	t *= abs(1.0 / (uv.x * 50.0));
	return  min(vec3(1.),t * smoothstep(0.03,0.,abs(uv.x))*m3*cos(cos(iTime)))*smoothstep(-0.2,0.,uv.y);
}

//stars background
//https://www.shadertoy.com/view/ldfGWH

float random(vec2 ab) 
{
	float f = (cos(dot(ab ,vec2(21.9898,78.233))) * 43758.5453);
	return fract(f);
}

float noise(in vec2 xy) 
{
	vec2 ij = floor(xy);
	vec2 uv = xy-ij;
	uv = uv*uv*(3.0-2.0*uv);
	

	float a = random(vec2(ij.x, ij.y ));
	float b = random(vec2(ij.x+1., ij.y));
	float c = random(vec2(ij.x, ij.y+1.));
	float d = random(vec2(ij.x+1., ij.y+1.));
	float k0 = a;
	float k1 = b-a;
	float k2 = c-a;
	float k3 = a-b-c+d;
	return (k0 + k1*uv.x + k2*uv.y + k3*uv.x*uv.y);
}

vec3 background_stars(vec2 fragCoord )
{
    float time = 24.0;
	
	vec2 position = (fragCoord.xy);

	float color = pow(noise(fragCoord.xy), 40.0) * 20.0;

	float r1 = noise(fragCoord.xy*noise(vec2(sin(time*0.01))));
	float r2 = noise(fragCoord.xy*noise(vec2(cos(time*0.01), sin(time*0.01))));
	float r3 = noise(fragCoord.xy*noise(vec2(sin(time*0.05), cos(time*0.05))));
		
	return vec3(color*r1, color*r2, color*r3);
}
//-----

vec3 model(vec2 uv){
    float n;
    vec2 ouv=uv;
    //if(!(iMouse.z>0.5))uv*= MD(iTime/10.); //mouse
    float h1=model_hline1(uv);
    float mb=model_bot(h1,uv);
    float mt=model_top(h1,uv)*c1(uv);
    float c2x=c2(uv);
    n=(mt*(1.-mb)+mb*c2x);
    vec3 colxm=n*m0;
    vec3 colxd1=(model_decor(h1,uv))*n;
    vec3 colxd2=model_decor_l3(uv)*mb*c2x*m2*2.;
    vec3 colbx=c3(h1,uv)*m4*(1.-mb)*(.5+7.*((sin(2.-cos(iTime/1.)))));
    vec3 eng=eng_ani(vec2(abs(uv.x)-0.2,uv.y-0.23))*(1.-h1);
    eng+=eng_ani(vec2(abs(uv.x)-0.25,uv.y-0.23))*(1.-h1);
    vec3 resx=colxm+max(colxd1,colxd2)+colbx;
    if(!(resx.r>0.))resx = (background_stars(vec2((ouv.x*(1./(iResolution.x / iResolution.y))+0.5)*iResolution.x,(ouv.y+0.5)*iResolution.y)));
    resx+=eng;
    return resx;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 res = iResolution.xy / iResolution.y;
    vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    fragColor = vec4(0.);
    fragColor = vec4(model(uv),1.);
}

void main (void)
{
  vec4 color = vec4 (0.0, 0.0, 0.0, 1.0);
  mainImage (color, gl_FragCoord.xy);
  color.w = 1.0;
  gl_FragColor = color;
}
