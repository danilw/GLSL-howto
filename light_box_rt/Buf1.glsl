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

const float WSCALE = 0.8;
const float LEAF = 1.0;
const float TRUNK = 2.0;
vec2 seed;
vec2 im;

//http://iquilezles.org/www/articles/smin/smin.htm
float smin( float a, float b )
{
    float k = 0.003;
    float h = clamp( 0.5+0.5*(b-a)/k, 0.0, 1.0 );
    return mix( b, a, h ) - k*h*(1.0-h);
}

const float pi =acos(-1.);
const float phi=sqrt(5.)*.5-.5;
const float Phi=sqrt(5.)*.5+.5;
const float fha=14142.1356237;

float rand(vec2 coordinate){
 return fract(sin(dot(coordinate*seed,vec2(Phi,pi)))*fha);}


vec2 rotate(vec2 point, float a)
{
    return point*MD(a);
}

float sdTreePart(vec2 pos, vec2 uv, vec2 pivot, float angle, float w, float h)
{
    uv -= pos;
    uv = rotate(uv, angle) + pivot;
    float b = WSCALE + smoothstep(0.0, -h * 2., uv.y - h) * (1.0 - WSCALE);
    w *= b;
    float y = max(uv.y - h, -h - uv.y);
    float x = max(uv.x - w, -w - uv.x);
    return max(x, y);
}

float sdLeaf(vec2 pos, vec2 uv, vec2 pivot, float angle, float w, float h)
{
    uv -= pos;
    uv = rotate(uv, angle) + pivot;
    w -= cos(uv.y * 500.) * 0.001;
    h -= sin(uv.x * 500.) * 0.002;
    float y = max(uv.y - h, -h - uv.y);
    float x = max(uv.x - w, -w - uv.x);
    return max(x, y);
}

float Cursor(in vec2 uv, inout vec2 pos, float H, inout float angle, inout float W)
{
    seed += vec2(0.01, 0.04);
    W *= WSCALE;
    vec2 pivot = vec2(0.0, -H);
    float b = sdTreePart(pos, uv, pivot, angle, W, H);
    pos += vec2(sin(angle), cos(angle)) * H * 2.;
    float r = rand(seed);
    angle += (r - 0.5) * 0.9;
    return b;
}

int leafIndex = 0;

vec2 Tree (vec2 pos, vec2 uv, int LEAFS, int BRANCHES, int TRUNKS)
{
    float H = 0.03;
    vec2 pivot = vec2(0.0, -H);
    float b = 999.0;
    float angle = 0.0;
    float W = 0.01;
    float randH = 0.5 * (rand(im.xy) - 0.5);
    float randA = rand(im.yx) - 0.5;
    float lf = 999.0;
    float LEAFANGLE = PI * 0.2;
    vec2 leafSize = vec2(0.005, 0.01);
    for (int i = 0; i < TRUNKS; ++i)
    {
        b = smin(b, Cursor(uv, pos, H, angle, W));
        vec2 p = pos;
        float h = H; 
        float a = randA + angle + sin(0. + float(i)) * 0.1;
        float w = W;
        for (int j = 0; j < BRANCHES; ++j)
        {
            b = smin(b, Cursor(uv, p, h, a, w));    
            vec2 p1 = p;
            float h1 = max(randH * 0.06, 0.006); 
            float a1 = randA + a + sin(0.+ float(j) * 0.4) * 0.1;
            float w1 = w;
            for (int k = 0; k < LEAFS; ++k)
            {
               b = smin(b, Cursor(uv, p1, h1, a1, w1));    
               float angl = mod(float(k), 2.0)  == 0.0 ? 1.0 : -1.0;
               float newLeaf = sdLeaf(p1, uv, vec2(0.0, -leafSize.y),  (a1 + angl * LEAFANGLE), leafSize.x, leafSize.y);
               if(newLeaf < lf) leafIndex = i * 100 + j * 10 + k;
               lf = min(lf, newLeaf);
               if(lf < 0.0 || b < 0.0) break; 
            }
            if(lf < 0.0 || b < 0.0) break; 
        }
        if(lf < 0.0 || b < 0.0) break; 
    }
    if(b < lf)
    {
        return vec2(TRUNK, b);
    }
    return vec2(LEAF, lf);
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

float layer1(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.045;
    float td=0.;
    if(p.x<0.3){
    im=vec2(4.,2.); 
    seed=vec2(10.);
    td=SS(zv*.75,0.,Tree(vec2(0.65, -0.33),vec2(-p.x,p.y)*.75,6,8,8).y);
        d=max(d,td);
    }
    else{
    im=vec2(11.,2.);
    seed=vec2(1.);
    td=SS(zv*.75,0.,Tree(vec2(0.75, -0.33),p*.75,8,4,8).y);
        d=max(d,td);
    }
    vec2 tp=p;
    tp.x+=0.;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
    d=max(d,gen_grass(p,tva));
    d=min(d,tdx);
    return d;
}

float layer2(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.045;
    vec2 tp=p;
    tp.x+=1.5;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
    if(p.x<-0.3){
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.35,.55)+vec2(0.42,-0.35)+0.5).r,0.,1.));}
    else
        if(p.x>0.3)
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.35,.55)+vec2(-0.1,-0.35)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(0.5,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer3(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.04;
    vec2 tp=p;
    tp.x+=1.85;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
        if(p.x<-0.3){
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.3,.6)+vec2(-0.18,-0.35)+0.5).r,0.,1.));}
    else
        if(p.x>0.3)
        d=max(d,clamp(2.*texture(iChannel0,p*vec2(iResolution.y/iResolution.x-0.3,.6)+vec2(-0.3,-0.35)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(01.5,0.),tva));
    d=min(d,tdx);
    return d;
}

float layer4(vec2 p){
    float d=0.;
    d=max(d,bborders(p));
    float tdx=bborders2(p);
    p.y+=0.035;
    vec2 tp=p;
    tp.x+=2.05;
    tp*=10.;
    float tva=0.1*(sin(tp.x+.5)-2.*cos(tp.x/2.-1.5));
    d=max(d,SS(-04.051-tva,-zv*10.-04.051-tva,tp.y));
            if(p.x<-0.1){
        d=max(d,clamp(2.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.25,.6)
                                 +vec2(0.125,-0.35)+0.5).r,0.,1.));}
    else
        if(p.x>0.3)
        d=max(d,clamp(2.*texture(iChannel0,vec2(-p.x,p.y)*vec2(iResolution.y/iResolution.x-0.25,.6)
                                 +vec2(0.23,-0.35)+0.5).r,0.,1.));
    d=max(d,gen_grass(p+vec2(02.,0.),tva));
    d=min(d,tdx);
    return d;
}


vec4 main_c(vec2 p){
    vec4 col=vec4(0.);
    float d1=layer1(p);
    float d2=layer2(p);
    float d3=layer3(p);
    uvec3 val1=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=layer4(p);
    d2=0.;
    d3=0.;
    uvec3 val2=uvec3(vec3(d1,d2,d3)*float(98));
    
    d1=0.;
    d2=0.;
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
    seed=vec2(0.);
    im=vec2(0.);
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
