#define iChannel3 iTexture1
#define iChannel0 u_channel1
#define iChannel1 u_channel2
#define iChannel2 u_channel3
// Created by Danil (2018)
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

// using https://www.shadertoy.com/view/4tlBDs
// using https://www.shadertoy.com/view/XdcSzH

#define AA 0

uvec3 decodeval16(uint varz) {
    int colz=int(varz);
    ivec3 retc = ivec3(0);
    retc.x = ((colz) / (0x10000)) - (0x1);
    retc.y = ((-(retc.x + 0x1)*0x10000 + (colz)) / (0x100)) - (0x1);
    retc.z = (-(retc.y + 0x1)*(0x100) - (retc.x + 0x1)*(0x10000) + (colz)) - (0x1);
    return uvec3(retc);
}

uvec3 decodeval(uint varz) {
    int colz=int(varz);
    ivec3 retc = ivec3(0);
    retc.x = ((colz) / 10000) - 1;
    retc.y = ((-(retc.x + 1)*10000 + (colz)) / 100) - 1;
    retc.z = (-(retc.y + 1)*100 - (retc.x + 1)*10000 + (colz)) - 1;
    return uvec3(retc);
}

float sdCircle( vec2 p, float r )
{
  return length(p) - r;
}

#define MAX_DIST 1000.
#define MIN_DIST 1.

float M_PI = 3.1415972;
float nb_layers = 12.0;
float border_step = 0.15;

const vec3 mainc1= vec3(0xfa, 0xf9, 0xf8) / float(0xff);
const vec3 mainc2= vec3(0xae, 0x96, 0x3a) / float(0xff);
const vec3 mainc3= vec3(0xf6, 0xea, 0x89) / float(0xff);

vec2 res;

vec2 getUV(float i)
{
    return vec2((i)/iResolution.x, 0);
}

vec3 l1Pos = vec3(2,1,0);

struct Ray
{
    vec3 pos;
    vec3 dir;
};

struct Camera
{
    vec3 pos;
    vec3 forward;
    vec3 right;
    vec3 up;
    float fovScalar;
};

void setCamera(vec3 pos, vec3 forward, vec3 upGuide, float fov, out Camera cam)
{
    cam.pos = pos;
    cam.forward = normalize(forward);
    cam.right = cross(-cam.forward, normalize(upGuide));
    cam.up = cross(cam.right, -cam.forward);
    cam.fovScalar = tan(radians(fov/2.0));
}

Ray castRay(vec2 uv, in Camera cam)
{
    uv *= cam.fovScalar;
    return Ray(
        cam.pos,
        normalize(cam.forward + uv.x * cam.right + uv.y * cam.up)
    );
}

bool SphereIntersect(vec3 SpPos, float SpRad, vec3 ro, vec3 rd, out float t, out vec3 norm) {
    ro -= SpPos;
    float A = dot(rd, rd);
    float B = 2.0*dot(ro, rd);
    float C = dot(ro, ro)-SpRad*SpRad;
    float D = B*B-4.0*A*C;
    if (D < 0.0) return false;
    D = sqrt(D);
    A *= 2.0;
    float t1 = (-B+D)/A;
    float t2 = (-B-D)/A;
    if (t1 < 0.0) t1 = t2;
    if (t2 < 0.0) t2 = t1;
    t1 = min(t1, t2);
    if (t1 < 0.0) return false;
    norm = ro+t1*rd;
    t = t1;
    norm = normalize(norm);
    return true;
}

bool PlaneIntersect(vec4 Plane, vec3 ro, vec3 rd, out float t, out vec3 norm) {
    float dd = dot(rd, Plane.xyz);
    if (dd == 0.0) return false;
    float t1 = -(dot(ro, Plane.xyz) + Plane.w) / dd;
    if (t1 < 0.0) return false;
    norm = normalize(Plane.xyz);
    t = t1;
    return true;
}

bool ParallelogramIntersect( in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2, in vec3 v3, out float tx, out vec3 norm)
{
    vec3 a = v0 - v1;
    vec3 b = v2 - v0;
    vec3 p = v0 - ro;
    vec3 n = cross( a, b );
    vec3 q = cross( rd, p );
    float i = 1.0/dot( rd, n );
    float u = dot( q, a )*i;
    float v = dot( q, b )*i;
    float t = dot( n, p )*i;
    if( u<0.0 || u>1.0 || v<0.0 || v>1.0 ) return false;
    vec3 normx = vec3( t, u, v );
    if( normx.x>MIN_DIST && normx.x<MAX_DIST )
    {
    tx = normx.x;
    vec3 nor = normalize( cross(v2-v1,v1-v3) );
    norm = faceforward( nor, rd, nor );
    return true;
    }
    return false;
}

float anim_col(vec3 p){
    return sin(1.-cos(p.x+iTime/1.));
}

float anim_col2(vec3 p){
    return sin(1.-cos(p.x+iTime/2.));
}

float anim_col3(vec3 p){
    return sin(1.-cos(p.x+iTime/4.));
}

vec4 calcColorg(vec3 p)
{
    vec3 tc=texture(iChannel3,(p.xz*vec2(iResolution.y/iResolution.x,1.))*.5+0.5).rrr;
    vec3 m3=mix(mainc3,mainc3.rbg,anim_col2(p));
    vec3 m2=mix(mainc2,mix(mainc2.bgr,mainc2,anim_col3(p)),anim_col2(p));
    vec3 tcx=(tc*tc*((m3*m2)/(1.*clamp(sdCircle((p.xz+vec2(0.5*border_step*nb_layers,0.0))*vec2(1.,.35),0.35),0.2,1.)))*1.);
    tcx*=max(0.15,anim_col(p));
    return vec4(tcx*0.5,1.);
}

vec4 calcColorg1(vec3 p)
{
    vec3 tc=texture(iChannel3,(p.xy*vec2(iResolution.y/iResolution.x,1.))*.5+0.5).rrr;
    vec3 m3=mix(mainc3,mainc3.rbg,anim_col2(p));
    vec3 m2=mix(mainc2,mix(mainc2.bgr,mainc2,anim_col3(p)),anim_col2(p));
    vec3 tcx=(tc*tc*((m3*m2)/(1.*clamp(sdCircle((p.xy+vec2(border_step*nb_layers,1.0))*vec2(1.,1.),0.3),0.2,1.)))*1.);
    tcx*=max(0.15,anim_col(p));
    return vec4(tcx*0.5,1.);
}

vec4 calcColortx(vec3 p,float i, float j)
{
    uvec4 tc=uvec4(0);
    
    //if all layers in single buffer
    //tc=uvec4(abs(texelFetch(iChannel0,ivec2(((p.zy*vec2(iResolution.y/iResolution.x,1.))*.5+0.5)*iResolution.xy-0.5),0)));
    
    //three buffers
    if(i*3.+j<4.)
    tc=uvec4(abs(texelFetch(iChannel0,ivec2(((p.zy*vec2(iResolution.y/iResolution.x,1.))*.5+0.5)*iResolution.xy-0.5),0)));
	else if(i*3.+j<8.)
    tc=uvec4(abs(texelFetch(iChannel1,ivec2(((p.zy*vec2(iResolution.y/iResolution.x,1.))*.5+0.5)*iResolution.xy-0.5),0)));
	else
    tc=uvec4(abs(texelFetch(iChannel2,ivec2(((p.zy*vec2(iResolution.y/iResolution.x,1.))*.5+0.5)*iResolution.xy-0.5),0)));

    float d =float(decodeval( tc[int(i)])[int(j)])/float(98);
    vec3 tcx=vec3(0.);
    vec3 m3=mix(mainc3,mainc3.rbg,anim_col2(p));
    vec3 m2=mix(mainc2,mix(mainc2.bgr,mainc2,anim_col3(p)),anim_col2(p));
    if(i*3.+j==nb_layers-1.)
    tcx=mix(vec3(0.),((m3*m2)/(1.*clamp(sdCircle((p.zy+vec2(0.,.5))*vec2(.65,1.),0.3),0.2,1.)))*1.,d);
    else
    tcx=((i*3.+j)/(nb_layers-1.))*mix(vec3(0.),((m3*m2)/(1.*clamp(sdCircle((p.zy+vec2(0.,1.25))*vec2(.25,1.),0.1),0.2,1.)))*1.,d);
    
    tcx=clamp(tcx,vec3(0.),vec3(10.));
    tcx*=max(0.25*((i*3.+j)/(nb_layers-1.)),anim_col(p));
    return vec4(tcx,d);
}

vec4 calcColortb(vec3 p)
{
    vec3 tc=texture(iChannel3,(p.xz*vec2(iResolution.y/iResolution.x,1.))*.5+0.5).rgb;
    return vec4(0.15+tc*tc,1.);
}

vec4 calcColorg2(vec3 p)
{
    vec3 tc=vec3(0.); //p.zy
    vec3 m3=mix(mainc3,mainc3.rbg,anim_col2(p));
    vec3 m2=mix(mainc2,mix(mainc2.bgr,mainc2,anim_col3(p)),anim_col2(p));
    tc=0.45*(m3*m2)/(p.y+res.y);
    tc*=max(0.5,anim_col(p));
    return vec4(tc,1.);
}

#define OBJ_BALL 1
#define OBJ_FLOOR 2
#define OBJ_WALL 3
#define OBJ_SUN 4
#define OBJ_WALL_N 5
#define OBJ_WALL_V 6
#define OBJ_WALL_H 7
#define OBJ_WALL_B 8
#define OBJ_WALL_V2 9

struct HitInfo {
    float t;
    vec3 norm;
    vec4 color;
    int obj_type;
};

void ParallelogramIntersectMin(vec3 ro, vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2, inout bool result, 
                               inout HitInfo hit, int OBJ, float i,float j) {
    float tnew;
    vec3 normnew;
    vec3 v3 = v1 + v2 - v0;
    if (ParallelogramIntersect(ro, rd, v0, v1, v2, v3, tnew, normnew)) {
        if (tnew < hit.t) {
            hit.t = tnew;
            hit.norm = normnew;
            vec4 tlc=vec4(0.);
            if(OBJ==OBJ_WALL_N)
            tlc=calcColortx(ro+rd*hit.t,i,j);
            else
                if(OBJ==OBJ_WALL_V)
                    tlc= calcColorg(ro+rd*hit.t);
                else 
                    if(OBJ==OBJ_WALL_V2){
                        tlc= calcColorg(ro+rd*hit.t);
                        tlc.rgb*=0.5;
                    }
                else 
                    if(OBJ==OBJ_WALL_H)
                    tlc= calcColorg1(ro+rd*hit.t);
                    else 
                        tlc= calcColorg2(ro+rd*hit.t);
                //if(i*3.+j==nb_layers-1.)tlc.a=1.; //last layer is not transparent, remove if need
                hit.color.rgb = tlc.rgb*tlc.a+hit.color.rgb*(1.-tlc.a);
                hit.color.a+=tlc.a;
            
            
            hit.obj_type = OBJ;
        }
        result = true;
    }
}

void GroundIntersectMin(vec3 ro, vec3 rd, inout bool result, inout HitInfo hit) {
    float tnew;
    vec3 normnew;
    vec4 pp=vec4(0.0,01.,0.0,01.01);
    if (PlaneIntersect(pp, ro, rd, tnew, normnew)) {
        if (tnew < hit.t) {
            hit.t = tnew;
            hit.norm = normnew;
            hit.color = calcColortb(ro+rd*hit.t);
            hit.obj_type = OBJ_FLOOR;
        }
        result = true;
    }
}

bool minDist(vec3 ro, vec3 rd, out HitInfo hit)
{
    hit.t = MAX_DIST;
    bool result = false;
    
    vec3 v0 = vec3(-border_step*nb_layers,-res.x,-1.) ; 
	vec3 v1 =  vec3(0.,-res.x,-1.) ; 
	vec3 v2 =  vec3(-border_step*nb_layers,res.x,-1.); 
    
    vec3 v01 = vec3(-border_step*nb_layers,-01.,res.x) ; 
	vec3 v11 =  vec3(-border_step*nb_layers,-01.,-res.x) ; 
	vec3 v21 =  vec3(-border_step*nb_layers,01.,res.x); 
    
    v0=v0.xzy;v1=v1.xzy;v2=v2.xzy;

    GroundIntersectMin(ro, rd, result, hit);
    
    ParallelogramIntersectMin(ro, rd, v0, v1, v2, result, hit,OBJ_WALL_V,0.,0.);
    ParallelogramIntersectMin(ro, rd, v0*vec3(1,-1,1), v1*vec3(1,-1,1), v2*vec3(1,-1,1), result, hit,OBJ_WALL_V2,0.,0.);
    ParallelogramIntersectMin(ro, rd, v0*vec3(0,1,1), v1*vec3(1,-1,1), v2*vec3(1,1,-1), result, hit,OBJ_WALL_H,0.,0.);
    ParallelogramIntersectMin(ro, rd, v0*vec3(0,1,-1), v1*vec3(1,-1,-1), v2*vec3(1,1,1), result, hit,OBJ_WALL_H,0.,0.);
    
    ParallelogramIntersectMin(ro, rd, v01+vec3(border_step*(0.),0.,0.), 
                                 v11+vec3(border_step*(0.),0.,0.), v21+vec3(border_step*(0.),0.,0.), result, hit,OBJ_WALL_B,0.,0.);
    for(float i=floor((nb_layers-0.)/3.)-1.+float(min(0,iFrame));i>=0.;i--){
        for(float j=2.+float(min(0,iFrame));j>=0.;j--){
        ParallelogramIntersectMin(ro, rd, v01+vec3(border_step*(nb_layers-(i*3.+j)),0.,0.), 
                                  v11+vec3(border_step*(nb_layers-(i*3.+j)),0.,0.), v21+vec3(border_step*(nb_layers-(i*3.+j)),0.,0.), result, hit,OBJ_WALL_N,i,j);
        }}
    return result;
}

const float eps = 1e-3;

vec3 calcFinalColor(Ray r)
{
    vec3 col = vec3(0.0);
    vec3 objectcolor = vec3(1.0);
    vec3 mask = vec3(1.0);
    HitInfo hit;
    hit.color=vec4(0.);

    {
        if(minDist(r.pos, r.dir, hit)){
            objectcolor = hit.color.rgb;
            vec3 p = r.pos + r.dir * hit.t + hit.norm*eps;
            vec3 sunDir = normalize(l1Pos-p);
            col = objectcolor;
            col = objectcolor * (vec3(max(dot(hit.norm,sunDir),0.0)) + 0.05);
        }
    }
    return col;
 }

vec3 render(Ray r)
{
    return calcFinalColor(r);
}

#define PI (4.0 * atan(1.0))

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{   
    Camera cam;
    res = (iResolution.xy / iResolution.y);
    vec2 iM=vec2(0.);
    iM=iMouse.xy;
    if(iMouse.x>0.)iM=iMouse.xy;
    else iM=vec2(iResolution.x/9.+0.5*iResolution.x*cos(cos(iTime/8.)),iResolution.y/2.5);
    //else iM=vec2(-iResolution.x/4.+iResolution.x*cos(cos(iTime/15.)),iResolution.y/2.5);
    vec3 tot = vec3(0.0);
    vec3 pos = vec3(0.,0.,0.)+vec3((-2.85*((.5+iM.y/iResolution.y)*1.18))*cos((iM.x/iResolution.x+-01.55)
                                                                                                         *3.0),
                    4.-4.,
                    (2.85*((.5+iM.y/iResolution.y)*1.18))*sin((iM.x/iResolution.x+-01.55)*3.0));
    setCamera(vec3(0.,0.,-res.x*2.*(iM.x/iResolution.x-0.5))+pos, -pos, vec3(0,1,0), 60.0, cam);

    #if AA>1
    for( int mx=0; mx<AA; mx++ )
    for( int nx=0; nx<AA; nx++ )
    {
    vec2 o = vec2(float(mx),float(nx)) / float(AA) - 0.5;
    vec2 uv = (fragCoord+o)/iResolution.xy * 2.0 - 1.0;
    #else
    vec2 uv = fragCoord/iResolution.xy * 2.0 - 1.0;
    #endif
    uv.y *= iResolution.y/iResolution.x;

    vec3 col = render(castRay(uv, cam));
    tot += col;
    #if AA>1
    }
    tot /= float(AA*AA);
    #endif
    fragColor = vec4( clamp(tot,vec3(0.),vec3(1.)), 1.0 );
}
