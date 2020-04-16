#define SS(x, y, z) smoothstep(x, y, z)
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))
#define PI (4.0 * atan(1.0))
#define TAU (2.*PI)
#define E exp(1.)
#define res (iResolution.xy / iResolution.y)

// Created by Danil (2019+) https://github.com/danilw
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

float zv;
vec2 res_g;
ivec2 ipx;

float func(vec2 p){
    float d=0.;
    return d;
}

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

vec4 loadval3(ivec2 ipx) {
    return texelFetch(iChannel2, ipx, 0);
}

vec4 load_pxid() {
    return loadval3(ivec2(0, 1));
}

int rgai(ivec2 ip) {
    return (ip.x+(ip.y*int(textureSize(iChannel0,0).x))) / 3;
}

int gai() {
    return AI_size;
}

//id to display and num of alive bots
vec2 func1(){
    vec2 oids=load_pxid().xy;
    //if((iFrame%int(60.*19.9))!=0)return oids;
    float alive=0.;
    float fid=-1.;
    for(int i=0;i<int(iResolution.y);i++){
        vec2 tpx=loadval3(ivec2(i, 0)).xy;
        alive+=tpx.y;
        if(tpx.x>0.)if(fid==-1.)fid=tpx.x;
    }
    if(fid==-1.)fid=oids.x;
    //alive=100.;
    vec2 nids=vec2(fid,alive);
    return nids;
}

vec2 func2(){
    vec2 oids=loadval3(ipx).xy;
    if(ipx.x>=int(textureSize(iChannel0,0).y))return oids;
    //if((iFrame%int(60.*19.9))!=0)return oids;
    float alive=0.;
    float fid=-1.;
    int line_shift=((int(textureSize(iChannel0,0).x)-((int(textureSize(iChannel0,0).x)/3)*3)));
    //bad rules, better be done by some formula
    if(ipx.x==0)line_shift=0;
    switch(line_shift){
        case 0:line_shift=0;break;
        case 1:line_shift=-(ipx.x)%3;break;
        case 2:line_shift=-(2-(ipx.x-1)%3);break;
    }
    vec2 irt=vec2(textureSize(iChannel0,0).xy);
    for(int i=1;i<=int(ceil(floor(irt.x)/3.));i++){
        if(i*3-1+line_shift>=int(irt.x))break;
        float tpx=loadval(ivec2(i*3-1+line_shift, ipx.x)).z;
        if(rgai(ivec2(i*3-1+line_shift, ipx.x))>=gai())break;
        if(tpx>=0.){alive++;if(fid==-1.)fid=float(i+ipx.x*int(irt.x)/3);}

    }
    vec2 nids=vec2(fid,alive);
    return nids;
}

vec4 main_c(vec2 p){
    vec3 col=vec3(0.,0.,-1.);
    float d=0.;
    if(ipx==ivec2(0,1)){
        col.xy=func1();
        vec3 oids=load_pxid().xyz;
        if((int(col.y)==0)&&(oids.z<0.)){
            col.z=iTime;
        }else if(int(col.y)==0)col.z=oids.z;
    }
    if(ipx.y==0)col.xy=func2();
    return vec4(col,d);
}

float zoom_calc(float zx) {
    float ex = (1.*zx)/ (iResolution.y);
    return ex;
}

void init_globals(vec2 fragCoord) {
    zv = zoom_calc(1.);
    ipx = ivec2(fragCoord - 0.5);
    res_g = res;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    if(!(gai()>play_o0)){
        fragColor=vec4(0.);
        return;
    }
    vec2 uv = (fragCoord.xy) / iResolution.y - res/2.0;
    init_globals(fragCoord);
    
    vec4 ret_col=main_c(uv);
    
    fragColor = ret_col;
}
