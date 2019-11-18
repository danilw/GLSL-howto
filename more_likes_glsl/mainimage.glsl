// this is clicker(made for last two days...)

// Gamplay:
// Left side is for player, player click same buttons (in mirror) as on right side.
// right side spawn 10 elements at same time max, when player clean all spawn again.
// Goal is-get max score as you can.
// score is numbers in right of screen

// Created by Danil (2019+) https://github.com/danilw
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
// self https://www.shadertoy.com/view/3syXDD

#define SS(x, y, z) smoothstep	(x, y, z)
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))
#define PI atan(0.,-1.)
#define TAU (2.*PI)
#define E exp(1.)
#define res (iResolution.xy / iResolution.y)

float global_zoom=3.;
const float smooth_zoom=2.;

const vec3 redocol=vec3(ivec3(0xff,0x78,0x78))/float(0xff);
const vec3 reddcol=vec3(ivec3(0xe8,0x00,0x00))/float(0xff);
const vec3 darkcol=vec3(ivec3(0x22,0x22,0x22))/float(0xff);
const vec3 bluocol=vec3(ivec3(0xd4,0xe6,0xff))/float(0xff);
const vec3 colhl1=vec3(0x7a,0xda,0xfd)/float(0xff);
const vec3 colhl2=vec3(0xfa,0x1a,0x0d)/float(0xff);
const vec3 redd = vec3(0xe1, 0x46, 0x14) / float(0xff);

vec4 mix_alpha(vec4 src1, vec4 src2){
    return vec4(mix(src1.rgb, src2.rgb, src2.a), 	max(src1.a, src2.a));
}

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

bool get_map_by_id(ivec2 idx){
    ivec2 ipx=ivec2(idx.x,0);
    float val=texelFetch(iChannel0,ipx,0)[idx.y];
    return val>0.;
}

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

//http://www.iquilezles.org/www/articles/distfunctions2d/distfunctions2d.htm

float sdCircle( vec2 p, float r )
{
  return length(p) - r;
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,vec2(0))) + min(max(d.x,d.y),0.0);
}

float sdTriangleIsosceles( in vec2 p, in vec2 q )
{
    p.x = abs(p.x);
    vec2 a = p - q*clamp( dot(p,q)/dot(q,q), 0.0, 1.0 );
    vec2 b = p - q*vec2( clamp( p.x/q.x, 0.0, 1.0 ), 1.0 );
    float s = -sign( q.y );
    vec2 d = min( vec2( dot(a,a), s*(p.x*q.y-p.y*q.x) ),
                  vec2( dot(b,b), s*(p.y-q.y)  ));
    return -sqrt(d.x)*sign(d.y);
}

float sdUnevenCapsule( vec2 p, float r1, float r2, float h )
{
    p.x = abs(p.x);
    float b = (r1-r2)/h;
    float a = sqrt(1.0-b*b);
    float k = dot(p,vec2(-b,a));
    if( k < 0.0 ) return length(p) - r1;
    if( k > a*h ) return length(p-vec2(0.0,h)) - r2;
    return dot(p, vec2(a,b) ) - r1;
}

float sdCross( in vec2 p, in vec2 b, float r ) 
{
    p = abs(p); p = (p.y>p.x) ? p.yx : p.xy;
    vec2  q = p - b;
    float k = max(q.y,q.x);
    vec2  w = (k>0.0) ? q : vec2(b.y-p.x,-k);
    return sign(k)*length(max(w,0.0)) + r;
}

//https://www.shadertoy.com/view/ldsyz4
// The MIT License
// Copyright © 2017 Inigo Quilez
// Digit data by P_Malin (https://www.shadertoy.com/view/4sf3RN)
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

float hand_dist(vec2 p){
    p.y+=0.05;
    float dsq1=sdBox(p+vec2(-0.25,-0.1),vec2(0.035,0.15))-0.01;
    float dsq2=sdBox(p+vec2(0.0,-0.1),vec2(0.11,0.11))-0.05;
    float dtr1=sdTriangleIsosceles(p*vec2(1.,-1.)+vec2(0.1275,0.25-0.03),vec2(0.07,0.18))-0.03;
    float dsq3=max(min(1.,step(0.05,p.x)+step(0.04,p.y)),sdBox(p+vec2(0.0276,-0.14),vec2(0.13,0.13))-0.07);
    float dtr2=max(step(p.x,-0.03),sdTriangleIsosceles(p+vec2(0.05,0.2),vec2(0.18,0.18))-0.03);
    float duc1=max(step(-0.03,p.x),sdUnevenCapsule(p+vec2(-0.001,0.148),0.05,0.005,0.2)-0.03);
    float dcr1=max(min(1.,step(0.05,p.x)+step(0.1,p.y)),sdCross(p+vec2(-0.011,-0.017),vec2(0.15,0.1),0.025));
    float dsum=min(min(min(min(dsq1,dsq2),min(dtr1,dsq3)),min(dtr2,duc1)),dcr1);
    return dsum;
}

vec4 draw_dlike(vec2 p){
    float a=1.;
    vec3 col=vec3(0.);
    float px=global_zoom/iResolution.y;
    px*=smooth_zoom;
    
    float dc=SS(0.,0.+px,sdCircle(p,0.5));
    
    float dh=hand_dist(p);
    
    float dsum=SS(0.,0.+px,dh);
    
    col=mix(vec3(1.),reddcol,dc);
    col=mix(darkcol,col,dsum);

    float dhq=sdBox(p,vec2(0.5));
    float dq=SS(0.-px,0.+px,dhq-0.1);
    a=1.-dq;
    col.rgb*=a;
    a=min(1.,a+0.5-0.5*SS(0.,0.+px+0.015*global_zoom,dhq-0.1));
    
    return vec4(col,1.-dq);
    
}

vec2 heart_uv(vec2 p){
    p.x *= 1.;
    p.y -= sqrt(abs(p.x))*.65; 
    return p;
}

float heartLength(vec2 p,float z){
    p.y -= 0.1;
    p*=z;
    float r = abs(atan(p.x, p.y) / PI);
    float r2 = r * r;
    float s = (39.0 * r - 66.0 * r2 + 30.0 * r2 * r) / (6.0 - 5.0 * r);   
    return length(p) / s;
}

vec4 draw_heart(vec2 p){
    float heart_zoom=7.;
    float px=global_zoom/iResolution.y;
    float heart_dist = heartLength(p,heart_zoom);
    float dh = (1.0 - SS(1.0, 1.0+px*heart_zoom*smooth_zoom, heart_dist));
    float a=1.;
    vec3 col=vec3(0.);
    float dc=SS(0.-px,0.+px,sdCircle(p,0.5));
    col=mix(redocol,vec3(1.),dh);
    col=mix(col,vec3(1.),dc);
    a=1.-dc;
    col.rgb*=a;
    a=min(1.,a+0.5-0.5*SS(0.,0.+px+0.015*global_zoom,sdCircle(p,0.5)));
    return vec4(col,a);
}

//this is bad, dont use it
vec4 tile_uv(vec2 p){
    vec2 tuv=p;
    tuv=(p)/3.*vec2(3.5*1.77,6.);
    tuv.x=sqrt(1.*floor(abs(tuv.x)+0.50));
    vec2 op=p;
    op.y+=-.03;
    op.y+=-0.15*(tuv.x);
    op=mod(op*vec2(4.,6.)*2.+(1./2.)*vec2(4.,6.),vec2(4.,6.))-(1./2.)*vec2(4.,6.);
    return vec4(op,tuv);
}

ivec2 tile_idx(vec2 p){
    vec4 tup=tile_uv(p);
    vec2 ti=tup.zw;
    vec2 etd=(p+res/2.*3.)/3.*vec2(3.5*1.77,6.);
    etd.y+=-.25*3.;
    etd.y+=1.-0.1*(ti.x)*2.;
    vec2 ftid=vec2(etd+vec2(((16./9.)-res.x)*3.1+1.,0.));
    ivec2 tid=ivec2(ftid);
    return clamp(tid-ivec2(1),ivec2(0),ivec2(10,3));
}

vec2 get_posidx(ivec2 idx){
    vec2 tid=vec2(idx)-vec2(5.,2.);
    tid*=vec2((0.5)/1.,0.5);
    tid.y+=0.15*sqrt(1.*floor(abs(tid.x*2.)+0.50));
    return tid;
}

float map(vec2 p) {
    float hz=8.;
    vec2 tp=heart_uv(p*hz);
    vec2 otp=tp;
    tp=mod(tp+1.*2.,2.*2.)-1.*2.;
    float d=1.;
    d=(1.-length(tp));
    float td = smoothstep(-0.05,0.35,-otp.y-hz-2.);
    td = max(td,smoothstep(0.,0.4,otp.y-hz+2.));
    td = max(td,smoothstep(0.4,0.,otp.x+hz*2.+4.5+0.5*res.x));
    td = max(td,smoothstep(0.4,0.,-otp.x+hz*2.+4.5+0.5*res.x));
    if(loadval(ivec2(1,1)).x>=0.){
        ivec2 tidx=tile_idx(((loadval(ivec2(1,1)).xy/iResolution.xy-0.5))*3.*res);
        if(get_map_by_id(tidx))
            d=min(d,sdCircle(0.5*hz*((p-get_posidx(tidx))),0.65));
    }
    if(loadval(ivec2(0,1)).y>=0.){
        ivec2 rr=ivec2(6,0);
        int rnd=int(loadval(ivec2(0,1)).y);
        ivec2 tidx=ivec2(rr.x+rnd-5*(rnd/5),rr.y+rnd/5);
        if(get_map_by_id(tidx))
        d=min(d,sdCircle(0.5*hz*((p-get_posidx(tidx))),0.65));
    }
    d=max(td,d);
	return max(d,0.0001);
}

vec4 calcNormal(vec2 p) {
	vec2 e = vec2(0.001, 0.00);
    float m=map(p);
	vec3 nor = vec3(
		map(p + e.xy) - map(p - e.xy),
		map(p + e.yx) - map(p - e.yx),
		m * 0.13
	);
    return vec4(normalize(nor),m);
}

/*
vec3 calcNormal(vec2 p) {
    return texture(iChannel3,(p/3.)/(res)+0.5).rgb;
}*/

float lineSegToBrightness(vec2 U, vec2 P0, vec2 P1)
{
    P0 -= U; P1 -= U;
    float a = mod ( ( atan(P0.y,P0.x) - atan(P1.y,P1.x) ) / PI, 2.);  
    return min( a, 2.-a );
}

vec4 ggnergne( vec2 p ) 
{
	float sx = 0.;
    //sx=0.18 * cos( 4.0 * p.y - iTime*2.)*SS(0.2,0.84,p.y+0.5*3.)*SS(2.28,1.5,p.y+0.5*3.);
    p*=12.;
	float dy = 79./ ( 423. * abs(p.x-sx)); //-sx
	dy += 11./ (200. * max(-0.01+length(p.yx - vec2(p.y, 	0.0)),0.0001));
	return vec4( (p.y + 0.2) * dy, 0.43 * dy, dy, 1. );

}

vec4 draw_bg(vec2 p){
    float ed2=SS(.15,0.0,(p.y-01.));
    vec3 rd = normalize(vec3(0.0, 0.0, -1.0));
	vec3 nor = calcNormal(p).rgb;
    vec3 col=vec3(0.);
    
    vec4 tup=tile_uv(p);
    vec2 ti=tup.zw;
    vec2 etd=(p+res/2.*3.)/3.*vec2(3.5*1.77,6.);
    etd.y+=-.25*3.;
    etd.y+=1.-0.1*(ti.x)*2.;
    vec2 ftid=vec2(etd+vec2(((16./9.)-res.x)*3.1+1.,0.));
    ivec2 tid=ivec2(ftid);
    vec2 tuv=tup.xy;
    vec3 ecol=clamp(ggnergne(p).rgb*(0.05+0.95*SS(0.2,0.4,p.y+0.5*3.)*SS(2.28,2.1,p.y-0.15*sqrt(abs(p.x))*1.5+0.5*3.))*SS(01.5,0.3,abs(p.x)),0.,15.);
    vec4 tile_col=vec4(0.);
    if((tid.y<5)&&(tid.y>=1)&&(tid.x<12)&&(tid.x>=1)){
        if(get_map_by_id(tid-ivec2(1))){
            float odz=global_zoom;
            global_zoom=global_zoom*3.;
            if(ftid.x<=6.5){
                tile_col=draw_heart(tuv*(vec2(1.,.67))*0.5+vec2(0.,0.));
            }else{
                tile_col=draw_dlike(tuv*(vec2(1.,.67))*0.5+vec2(0.,0.));
            }
            tile_col*=tile_col;
            global_zoom=odz;
        }
    }
    
    {
        vec3 elc=0.8*vec3((redocol*0.3+0.7)*lineSegToBrightness((vec2(-(p.x),p.y)+vec2(-1.1,-1.5)),vec2(0.),vec2(1.,0.)));
        vec3 lig = normalize(vec3(p.x, p.y, 0.0) - vec3(-1.5-0.1, 01.5, -1.0));
        float dif = clamp(dot(nor, lig), 0.0, 1.0);
        float spea=clamp(dot(reflect(rd, nor), lig), 0.0, 1.0);
        float spe = pow(spea, 64.0);
        float fre = 1.0 - dot(-rd, nor);
        vec3 c=1.25*elc+redocol*0.1*step(p.x,0.)+redocol*ecol*dif+tile_col.rgb*dif;
        col =  (1.)*(c * dif + spe*ed2 + fre * 0.2*elc.r);
    }
    {
        vec3 elc=0.7*vec3((bluocol*0.3+0.7)*lineSegToBrightness((vec2((p.x),p.y)+vec2(-1.1,-1.5)),vec2(0.),vec2(1.,0.)));
        vec3 lig = normalize(vec3(p.x, p.y, 0.0) - vec3(1.5+0.1, 01.5, -1.0));
        float dif = clamp(dot(nor, lig), 0.0, 1.0);
        float spea=clamp(dot(reflect(rd, nor), lig), 0.0, 1.0);
        float spe = pow(spea, 64.0);
        float fre = 1.0 - dot(-rd, nor);
        vec3 c=1.25*elc+bluocol*0.1*step(0.,p.x)+bluocol*ecol*dif+tile_col.rgb*dif;
        col =  max(col,(1.)*(c * dif  + spe*ed2  + fre *0.2*elc.r));
    }
    {
        vec3 lig = normalize(vec3(p.x, p.y, 0.0) - vec3(vec2(0.,0.03)+get_posidx(tile_idx((loadval(ivec2(1,1)).xy/iResolution.xy-0.5)*3.*res)), -.50));
        float dif = clamp(dot(nor, lig), 0.0, 1.0);
        float spea=clamp(dot(reflect(rd, nor), lig), 0.0, 1.0);
        float spe = pow(spea, 128.0);
        float fre = 1.0 - dot(-rd, nor);
        vec3 c=mix(2.*(colhl1)*(0.2+0.8*SS(0.3,0.,length(lig.xy))),tile_col.rgb,+tile_col.a)*SS(1.,0.,iTime-loadval(ivec2(1,1)).w);
        col =  max(col,c*( dif + spe + fre * 0.2));
    }
    {
        ivec2 rr=ivec2(6,0);
        int rnd=int(loadval(ivec2(0,1)).y);
        vec3 lig = normalize(vec3(p.x, p.y, 0.0) - vec3(vec2(0.,0.03)+get_posidx(ivec2(rr.x+rnd-5*(rnd/5),rr.y+rnd/5)), -.50));
        float dif = clamp(dot(nor, lig), 0.0, 1.0);
        float spea=clamp(dot(reflect(rd, nor), lig), 0.0, 1.0);
        float spe = pow(spea, 128.0);
        float fre = 1.0 - dot(-rd, nor);
        vec3 c=mix(2.*(colhl2)*(0.2+0.8*SS(0.3,0.,length(lig.xy))),tile_col.rgb,+tile_col.a)*SS(1.,0.,iTime-loadval(ivec2(0,1)).z);
        col =  max(col,c*( dif + spe + fre * 0.2));
    }
    //col=mix_alpha(vec4(col,1.),tile_col).rgb;
    col += (rand(p)-.5)*.057;
    return vec4(col,1.);
}

vec4 draw_it(vec2 fragCoord){
    vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    uv*=global_zoom;
    vec4 col=vec4(0.);
    col=draw_bg(uv);
    col.rgb+=float(PrintInt((uv+vec2(-0.68,0.43)*global_zoom)*6.,int(max(loadval(ivec2(3,1)).x,0.)),3))*redd.rrg*0.35;
    return col;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    
    vec4 col=texture(iChannel0,uv);
    vec4 col2=texture(iChannel1,uv);
    vec4 col3=texture(iChannel3,uv);
    
    fragColor = col3;
    //fragColor = col2;
    fragColor = draw_it(fragCoord);
    //fragColor*=fragColor;
    //fragColor = vec4(SS(0.,0.+0.001,col.a));
    //fragColor = vec4(col.a);
}


