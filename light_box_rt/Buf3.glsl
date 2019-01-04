#define iChannel1 u_channel3
#define iChannel3 iTexture0

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

float bluenoise(vec2 p){
    if(texelFetch(iChannel3,ivec2(0),0).x==0.)return 0.;
    float r = 8.*(iResolution.y/450.), d = 1./455.; 
    float t = texelFetch(iChannel3,ivec2(((p*vec2(iResolution.y/iResolution.x,1.)+0.5)*iResolution.xy)/r),0).x;
    if ( t< d ) return smoothstep(1.,1.-4./r,length(2.*fract(((p*vec2(iResolution.y/iResolution.x,1.)+0.5)*iResolution.xy)/r)-1.)); 
    return 0.;
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
    for(float ii=0.;ii<3.;ii++)
    {
        tp=p;
        tp.y+=0.08-ii*0.005;
        tp.x+=0.25*ii;
        tp*=10.;
        tp.y*=1.5+1.25*ii;
	for(int i = 0; i < BLADES; i++)
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

float layer9(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.01;
    vec2 tp=p;
    tp.x+=3.25;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if((p.x>-0.54)&&(p.x<-0.18)){
        d=max(d,clamp(1.5*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.05,.9)+
                                 vec2(-0.25+0.5,-0.05)+0.5).r,0.,1.));}
    else
        if((p.x<0.73)&&(p.x>0.34))
        d=max(d,clamp(1.5*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.05,.9)+
                                  vec2(-0.25+0.4,-0.05)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(04.5,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer10(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.005;
    vec2 tp=p;
    tp.x+=3.5;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if((p.x>-0.49)&&(p.x<-0.17)){
        d=max(d,clamp(1.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x,.95)+
                                 vec2(-0.75+0.83,-0.0)+0.5).r,0.,1.));}
    else
        if((p.x<0.73)&&(p.x>0.26))
        d=max(d,clamp(1.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x,.95)+
                                  vec2(-0.75+0.67,-0.0)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(05.,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer11(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.005;
    vec2 tp=p;
    tp.x+=3.85;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
    d=max(d,gen_grass(p+vec2(05.5,0.),tva));
        if((p.x>-0.54)&&(p.x<0.1))
    d=max(d,texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x,1.)+vec2(-0.75+0.22,0.)+0.5).r);
    else
        if((p.x>0.2)&&(p.x<0.54))
        d=max(d,texture(iChannel0,(p*vec2(iResolution.y/iResolution.x,1.)+0.5)+vec2(0.05,0.)).r);
        d=min(d,tdx);
    return d;
}

float layer12(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=-0.005;
    vec2 tp=p;
    tp.x+=4.5;
    tp*=10.;
    float tva=-0.015*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
    d=max(d,gen_grass(p+vec2(06.,0.),tva));
    d=max(d,min(1.-SS(zv,0.,sdCircle(p+vec2(-0.17,-0.165),0.1)),SS(zv,0.,sdCircle(p+vec2(-0.2,-0.15),0.1))));
    d=max(d,bluenoise(p));
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
    d2=0.;
    d3=0.;
    uvec3 val2=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=0.;
    d2=0.;
    d3=layer9(p);
    uvec3 val3=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=layer10(p);
    d2=layer11(p);
    d3=layer12(p);
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
