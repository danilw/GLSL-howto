#define iChannel1 u_channel2

#define SS(x, y, z) smoothstep(x, y, z)
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))
#define PI (4.0 * atan(1.0))
#define TAU (2.*PI)
#define E exp(1.)
#define res (iResolution.xy / iResolution.y)

// Created by Danil (2018)
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

//
//Buf B-D generate only single frame, dont use it in real time

//using http://www.iquilezles.org/www/articles/distfunctions2d/distfunctions2d.htm
//using https://www.shadertoy.com/view/lslGR8
//using https://www.shadertoy.com/view/ldGXWh
//using https://www.shadertoy.com/view/Xl3czS

float zv;
vec2 res_g;

// 0xfe max
// *float(0xfe)
uvec3 decodeval16(uint varz) {
    int colz=int(varz);
    ivec3 retc = ivec3(0);
    retc.x = ((colz) / (0x10000)) - (0x1);
    retc.y = ((-(retc.x + 0x1)*0x10000 + (colz)) / (0x100)) - (0x1);
    retc.z = (-(retc.y + 0x1)*(0x100) - (retc.x + 0x1)*(0x10000) + (colz)) - (0x1);
    return uvec3(retc);
}

uint encodeval16(uvec3 colz) {
    return uint(int(colz.r)*0x10000 + 0x10000 + int(colz.g)*0x100 + 0x100 + int(colz.b) + 0x1);
}

// 98 max
// *float(98)
uvec3 decodeval(uint varz) {
    int colz=int(varz);
    ivec3 retc = ivec3(0);
    retc.x = ((colz) / 10000) - 1;
    retc.y = ((-(retc.x + 1)*10000 + (colz)) / 100) - 1;
    retc.z = (-(retc.y + 1)*100 - (retc.x + 1)*10000 + (colz)) - 1;
    return uvec3(retc);
}

uint encodeval(uvec3 colz) {
    return uint(int(colz.r)*10000 + 10000 + int(colz.g)*100 + 100 + int(colz.b) + 1);
}

float grass(vec2 p, float x, float tv, float s)
{
	p.x += pow(1.0 + p.y, 2.0) * 0.1 * abs(cos(x + tv));
	p.x *= s;
	p.y = (1.0 + p.y) * s - 1.0;
	float m = 1.0 - smoothstep(-zv*100., clamp(1.0 - p.y * 1.5, 0.01, 0.6) * 0.2 * s, pow(abs(p.x) * 19.0, 1.5) + p.y - 0.6);
	return  m* smoothstep(-1.0, -0.9, p.y);
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,vec2(0))) + min(max(d.x,d.y),0.0);
}

float sdCircle( vec2 p, float r )
{
  return length(p) - r;
}

float bborders(vec2 p){
    return SS(-zv,zv,sdBox(p,(res_g/2.)-(res_g/2.)*0.015));
}

float bborders2(vec2 p){
    return SS(zv,-zv,sdBox(p,(res_g/2.)-(res_g/2.)*0.0025));
}

float gen_grass(vec2 p,float tva){
    float d=0.;
    vec2 tp=p;
    int BLADES=6;
    float BLADE_SEED=1.0;
    for(float ii=0.+float(min(0,iFrame));ii<3.;ii++)
    {
        tp=p;
        tp.y+=0.08-ii*0.005;
        tp.x+=0.25*ii;
        tp*=10.;
        tp.y*=1.5+1.25*ii;
	for(int i = 0+(min(0,iFrame)); i < BLADES; i++)
	{
		float z = -(float(BLADES - i) * 0.1 + 1.0);
		vec4 pln = vec4(0.0, 0.0, -1.3, z);
	    vec2 tc = tp+(vec2(0.,03.51+tva+0.3*ii))*(1.5+ii);
		tc.x += cos(float(i) + BLADE_SEED);
		float cell = floor(tc.x);
		tc.x = (tc.x - cell) - 0.9;
		float c = grass(tc, float(i) + cell * 11.0,ii,0.8-0.1*ii);
		d = max(d,c);
    }}
    return d;
}

float layer5(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.03;
    vec2 tp=p;
    tp.x+=2.25;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if((p.x>-0.73)&&(p.x<-0.1)){
        d=max(d,clamp(2.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.15,.7)+
                                 vec2(-0.53,-0.35)+0.5).r,0.,1.));}
    else
        if(p.x>0.3)
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.15,.7)+
                                 vec2(0.02,-0.35)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(02.5,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer6(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.025;
    vec2 tp=p;
    tp.x+=2.5;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if(p.x<-0.24){
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.1,.8)+
                                 vec2(-0.11,-0.35)+0.5).r,0.,1.));}
    else
        if(p.x>0.5)
        d=max(d,clamp(2.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.1,.8)+
                                 vec2(0.8,-0.35)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(03.,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer7(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.02;
    vec2 tp=p;
    tp.x+=2.85;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if((p.x>-0.7)&&(p.x<-0.33)){
        d=max(d,clamp(1.35*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.05,.85)+
                                 vec2(0.525,-0.15)+0.5).r,0.,1.));}
    else
        if((p.x<0.73)&&(p.x>0.37))
        d=max(d,clamp(1.35*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.05,.85)+
                                  vec2(0.35,-0.15)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(03.5,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer8(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.015;
    vec2 tp=p;
    tp.x+=3.05;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if((p.x>-0.67)&&(p.x<-0.27)){
        d=max(d,clamp(1.1*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.05,.9)+
                                 vec2(-0.725+0.36,-0.15)+0.5).r,0.,1.));}
    else
        if((p.x<0.73)&&(p.x>0.17))
        d=max(d,clamp(1.1*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.05,.9)+
                                  vec2(-0.725+0.12,-0.15)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(04.,0.),tva));
    d=min(d,tdx);
    return d;
}

vec4 main_c(vec2 p){
    vec4 col=vec4(0.);
    float d1=0.;
    float d2=0.;
    float d3=0.;
    uvec3 val1=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=0.;
    d2=layer5(p);
    d3=layer6(p);
    uvec3 val2=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=layer7(p);
    d2=layer8(p);
    d3=0.;
    uvec3 val3=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=0.;
    d2=0.;
    d3=0.;
    uvec3 val4=uvec3(vec3(d1,d2,d3)*float(98));
    
    col=vec4(encodeval(val1),encodeval(val2),encodeval(val3),encodeval(val4));
    return vec4(col);
}

float zoom_calc(float zv) {
    float ex = 0.0025 * ((1080. * zv) / (iResolution.y));
    return ex;
}

void init_globals() {
    zv = zoom_calc(1.);
    res_g = res;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    init_globals();
    vec4 ret_col=vec4(0.);
    
    //resolution control
    if(ivec2(fragCoord.xy)==ivec2(iResolution.xy-1.)){
        ret_col=vec4(-10101.);//=-0.
        fragColor = ret_col;
        return;
    }
    //repaint on resolution change
    if(texelFetch(iChannel1,ivec2(iResolution.xy-1.),0).x>=0.)
        ret_col=main_c(uv);
    else
        ret_col=texelFetch(iChannel1,ivec2(fragCoord.xy) ,0);
    
    fragColor = ret_col;
}
