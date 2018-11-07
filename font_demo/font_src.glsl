#define SS(x, y, z) smoothstep(x, y, z)
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))
#define PI (4.0 * atan(1.0))
#define TAU (2.*PI)
#define E exp(1.)
#define resx (iResolution.xy / iResolution.y)

// * License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
// 2018

//DIRT 1 hour font, its bad :)
//https://www.shadertoy.com/view/MtcBWf

//using http://www.iquilezles.org/www/articles/distfunctions2d/distfunctions2d.htm

float sdLine( in vec2 p, in vec2 a, in vec2 b )
{
    vec2 pa = p-a, ba = b-a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}

float sdCircle( vec2 p, float r )
{
  return length(p) - r;
}

float sdEllipse( in vec2 p, in vec2 ab )
{
    p = abs(p); if( p.x > p.y ) {p=p.yx;ab=ab.yx;}
    float l = ab.y*ab.y - ab.x*ab.x;
    float m = ab.x*p.x/l;      float m2 = m*m; 
    float n = ab.y*p.y/l;      float n2 = n*n; 
    float c = (m2+n2-1.0)/3.0; float c3 = c*c*c;
    float q = c3 + m2*n2*2.0;
    float d = c3 + m2*n2;
    float g = m + m*n2;
    float co;
    if( d < 0.0 )
    {
        float h = acos(q/c3)/3.0;
        float s = cos(h);
        float t = sin(h)*sqrt(3.0);
        float rx = sqrt( -c*(s + t + 2.0) + m2 );
        float ry = sqrt( -c*(s - t + 2.0) + m2 );
        co = (ry+sign(l)*rx+abs(g)/(rx*ry)- m)/2.0;
    }
    else
    {
        float h = 2.0*m*n*sqrt( d );
        float s = sign(q+h)*pow(abs(q+h), 1.0/3.0);
        float u = sign(q-h)*pow(abs(q-h), 1.0/3.0);
        float rx = -s - u - c*4.0 + 2.0*m2;
        float ry = (s - u)*sqrt(3.0);
        float rm = sqrt( rx*rx + ry*ry );
        co = (ry/sqrt(rm-rx)+2.0*g/rm-m)/2.0;
    }
    vec2 r = ab * vec2(co, sqrt(1.0-co*co));
    return length(r-p) * sign(p.y-r.y);
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,vec2(0))) + min(max(d.x,d.y),0.0);
}

// A
//--------------------
float l_A(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.08,0.05),vec2(0.,-0.15)));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.08,0.05),vec2(0.16,-0.15)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.07,0.02),vec2(0.138,-0.15))));
    d2=max(d2,1.-step(0.28-0.28*animl,p.y+0.2));
    d=min(d1,d2);
    return d;
}

//--------------------

// B
//--------------------
float l_B(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.,-0.15)));
    d1=min(d1,SS(0.002,0.005,sdLine(p,vec2(0.02,0.05),vec2(0.02,-0.02))));
    float d3=max(step(p.x,0.05),SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,-0.015),0.035))));
    d3=min(d3,max(step(p.x,0.05),SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,0.085),0.065)))));
    d3=min(d3,max(step(p.x,0.05),SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,0.085),0.025)))));
    d1=min(d1,d3);
    d1=max(d1,step(0.28*animl,-p.y+0.1));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.05,0.05)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.02),vec2(0.05,-0.02))));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.15),vec2(0.05,-0.15))));
    d2=max(d2,step(0.28*animl,(p*MD(PI-PI/4.)).y+0.05));
    d=min(d1,d2);
    return d;
}

//--------------------

// C
//--------------------
float l_C(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,0.05),0.08)));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,0.05),0.1)));
    d2=max(d2,step(0.28*animl,-p.y+0.1));
    d=min(d1,d2);
    d=max(d,SS(0.045,0.05,p.x));
    return d;
}

//--------------------

// D
//--------------------
float l_D(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.,-0.15)));
    float d2=SS(0.002,0.005,abs(sdEllipse(p+vec2(0.0,0.05),vec2(0.001+0.09*animl,0.1))));
    d2=max(d2,step(p.x,0.0));
    d=min(d1,d2);
    d=max(d,1.-step(0.25-0.25*animl,-p.x+0.24));
    return d;
}

//--------------------

// E
//--------------------
float l_E(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.,-0.15)));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.0,-0.15),vec2(0.13,-0.15)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.13,0.05))));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.04),vec2(0.1,-0.04))));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.06),vec2(0.1,-0.06))));
    d2=max(d2,1.-step(0.25-0.25*animl,-p.x+0.2));
    d=min(d1,d2);
    d=max(d,1.-step(0.25-0.25*animl,-p.x+0.2));
    return d;
}

//--------------------

// F
//--------------------
float l_F(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.,-0.15)));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.13,0.05)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.04),vec2(0.1,-0.04))));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.0,-0.06),vec2(0.1,-0.06))));
    d2=max(d2,1.-step(0.25-0.25*animl,-p.x+0.2));
    d=min(d1,d2);
    d=max(d,1.-step(0.25-0.25*animl,-p.x+0.2));
    return d;
}

//--------------------

// O
//--------------------
float l_O(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=animl>0.?SS(0.002,0.005,sdLine((p+vec2(-0.05,0.05))*MD(-PI/4.+PI/1.*animl),vec2(0.0,0.1),vec2(0.,0.1-0.2*animl))):1.;
    float d2=SS(0.002,0.005,abs(sdCircle(p+vec2(-0.05,0.05),0.1)));
    vec2 tp=(p+vec2(-0.05,0.05))*MD(-PI/4.+PI);
    float af = atan(tp.x,tp.y);
    float r = length(tp);
    vec2 px = vec2(af/TAU,r);
    float t2=((px+vec2(0.5-1.001*animl,0.))).x;
    d2=max(d2,step(0.0,(t2)));
    d=min(d1,d2);
    return d;
}

//--------------------

// V
//--------------------
float l_V(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    p=vec2(p.x,-p.y)+vec2(0.05,-0.1);
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.08,0.05),vec2(0.,-0.15)));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.08,0.05),vec2(0.16,-0.15)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.07,0.02),vec2(0.138,-0.15))));
    d2=max(d2,1.-step(0.28-0.28*animl,p.y+0.2));
    d=min(d1,d2);
    return d;
}

//--------------------

// N
//--------------------
float l_N(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.,0.),vec2(0.1,-0.15)));
    d1=min(d1,SS(0.002,0.005,sdLine(p,vec2(0.,0.),vec2(0.,-0.15))));
    d1=max(d1,step(0.25*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.,0.05),vec2(0.135,-0.15)));
    d2=min(d2,SS(0.002,0.005,sdLine(p,vec2(0.135,-0.15),vec2(0.135,0.05))));
    d2=max(d2,step(0.28*animl,-p.y+0.1));
    d=min(d1,d2);
    return d;
}

//--------------------


// I
//--------------------
float l_I(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(-0.025,0.),vec2(0.025,-0.0)));
    d1=min(d1,SS(0.002,0.005,sdLine(p,vec2(-0.025,-0.02),vec2(0.025,-0.02))));
    d1=max(d1,step(0.25*animl,(p*MD(PI-PI/4.)).y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.,0.05),vec2(0.,-0.15)));
    d2=max(d2,step(0.28*animl,p.y+0.2));
    d=min(d1,d2);
    return d;
}

//--------------------

// T
//--------------------
float l_T(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(-0.05,0.05),vec2(0.05,0.05)));
    d1=min(d1,SS(0.002,0.005,sdLine(p,vec2(-0.05,0.03),vec2(0.05,0.03))));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.,0.03),vec2(0.,-0.15)));
    d=min(d1,d2);
    d=max(d,1.-step(0.28-0.28*animl,((abs(p-vec2(0,-0.2))*MD(PI-PI/4.))).x+0.28));
    return d;
}

//--------------------

// L
//--------------------
float l_L(vec2 p, float a){
    float d=0.;
    vec2 op=p;
    float animl=SS(0.,1.,a);
    float d1=SS(0.002,0.005,sdLine(p,vec2(0.0,0.05),vec2(0.,-0.15)));
    d1=min(d1,SS(0.002,0.005,sdLine(p,vec2(0.02,0.05),vec2(0.02,-0.15))));
    d1=max(d1,step(0.28*animl,p.y+0.2));
    float d2=SS(0.002,0.005,sdLine(p,vec2(0.0,-0.15),vec2(0.13,-0.15)));
    d2=max(d2,1.-step(0.25-0.25*animl,-p.x+0.2));
    d=min(d1,d2);
    return d;
}

//--------------------

float func(vec2 p, float animx){
    float d=1.;
    const float ax=-0.25;
    float ag=SS(0.,1.,animx);
    float af=SS(6.,5.,animx);
    const float fx=0.255;
    d=SS(0.002,0.005,sdLine(p,vec2(-1.+2.5*ag,-0.15),vec2(1.-2.5*af,-0.15)));
    d=min(d,l_A(p+vec2(0.7+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_B(p+vec2(0.5+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_C(p+vec2(0.3+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_D(p+vec2(0.195+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_E(p+vec2(0.05+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_F(p+vec2(-0.12+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_N(p+vec2(-0.3+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_O(p+vec2(-0.52+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_I(p+vec2(-0.72+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_T(p+vec2(-0.82+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_L(p+vec2(-0.9+fx,-0.05), animx));
    animx+=ax;
    d=min(d,l_V(p+vec2(-01.1+fx,-0.05), animx));
    animx+=ax;
    d*=1.-step((p*MD(PI/4.)).x,1.-2.*af);
    return 1.-d;
}

const vec3 col1_ = vec3(0x00, 0xcf, 0xc7) / float(0xff);
const vec3 col2_ = vec3(0xff, 0x21, 0x78) / float(0xff);
const vec3 black = vec3(0x0, 0x0, 0x0) / float(0xff);
const vec3 white = vec3(0xfd, 0xfd, 0xfd) / float(0xff);

vec4 main_c(vec2 p){
    vec3 col=vec3(0.);
    float d=0.;
    float ax=mod(iTime,7.);
    
    const float av=-0.15;
    ax+=av;
    float d3=func(p,ax);
    ax+=av;
    float d2=func(p,ax);
    ax+=av;
    d=func(p,ax);
    vec3 col3=mix(black,col2_,d3-d2+d);
    vec3 col2=mix(black,col1_,d2);
    float af=SS(6.,5.,ax);
    col=mix(black,white,d);
    col=max(col,col2);
    col=max(col,col3);
    col*=1.-step((p*MD(PI/4.)).x,1.-2.*af);
    col*=vec3(SS(0.005,0.002,sdBox(p,vec2(resx.x-0.8,0.2))));
    return vec4(col,1.);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy) / iResolution.y - resx/2.0;
    uv*=1.2;
    vec4 ret_col=main_c(uv);
    fragColor = ret_col;
}
