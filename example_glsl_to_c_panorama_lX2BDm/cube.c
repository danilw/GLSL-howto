



// gcc cube.c -lm -o cube
// ./cube

// this is example of porting shader to C-code
// result of this is identical to BufA in https://www.shadertoy.com/view/lX2BDm - uncomment define TEST in Image there.

// to change output image resilution edit ivec2 iResolution = (ivec2){800, 450};




#include "C_bmp_rw_header.h"

#include <math.h>
#define PI 3.141592654

struct vec2f {float x;float y;};
struct vec3f {float x;float y;float z;};
struct vec4f {float x;float y;float z;float w;};

typedef struct vec2f vec2;
typedef struct vec3f vec3;
typedef struct vec4f vec4;

struct vec2i {int x;int y;};
struct vec3i {int x;int y;int z;};
struct vec4i {int x;int y;int z;int w;};

typedef struct vec2i ivec2;
typedef struct vec3i ivec3;
typedef struct vec4i ivec4;

typedef vec3 mat3[3];

#define min(a,b) (((a)<(b))?(a):(b))
#define max(a,b) (((a)>(b))?(a):(b))

vec3 cos3(vec3 a){vec3 ret; ret.x=cos(a.x); ret.y=cos(a.y); ret.z=cos(a.z); return ret;}




// return texture projected on panorama

//look mainCubemap - edit prj_pos to change position of texture

// https://www.shadertoy.com/view/lX2BDm

//------------------------
//shader copde
//------------------------

// C port of shader - discord help cube-pan

void rotx(float a, vec3 *matx){float s = sin(a);float c = cos(a);matx[0] = (vec3){1.0, 0.0, 0.0};matx[1] = (vec3){0.0, c, s};matx[2] = (vec3){0.0, -s, c};}
void roty(float a, vec3 *matx){float s = sin(a);float c = cos(a);matx[0] = (vec3){c, 0.0, s};matx[1] = (vec3){0.0, 1.0, 0.0};matx[2] = (vec3){-s, 0.0, c};}
void rotz(float a, vec3 *matx){float s = sin(a);float c = cos(a);matx[0] = (vec3){c, s, 0.0};matx[1] = (vec3){-s, c, 0.0};matx[2] = (vec3){0.0, 0.0, 1.0};}

vec3 vec3_multiply_mat3(vec3 a, mat3 m)
{
  float x = a.x;
  float y = a.y;
  float z = a.z;
  vec3 res;
  res.x = m[0].x * x + m[1].x * y + m[2].x * z;
  res.y = m[0].y * x + m[1].y * y + m[2].y * z;
  res.z = m[0].z * x + m[1].z * y + m[2].z * z;
  return res;
}
void *mat3_multiply(vec3 *res, mat3 m0, mat3 m1)
{
  res[0].x = m0[0].x * m1[0].x + m0[1].x * m1[0].y + m0[2].x * m1[0].z;
  res[0].y = m0[0].y * m1[0].x + m0[1].y * m1[0].y + m0[2].y * m1[0].z;
  res[0].z = m0[0].z * m1[0].x + m0[1].z * m1[0].y + m0[2].z * m1[0].z;
  res[1].x = m0[0].x * m1[1].x + m0[1].x * m1[1].y + m0[2].x * m1[1].z;
  res[1].y = m0[0].y * m1[1].x + m0[1].y * m1[1].y + m0[2].y * m1[1].z;
  res[1].z = m0[0].z * m1[1].x + m0[1].z * m1[1].y + m0[2].z * m1[1].z;
  res[2].x = m0[0].x * m1[2].x + m0[1].x * m1[2].y + m0[2].x * m1[2].z;
  res[2].y = m0[0].y * m1[2].x + m0[1].y * m1[2].y + m0[2].y * m1[2].z;
  res[2].z = m0[0].z * m1[2].x + m0[1].z * m1[2].y + m0[2].z * m1[2].z;
}

float vec3_length(vec3 v)
{
  return sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
}

vec3 vec3_normalize(vec3 v)
{
  float l = vec3_length(v);
  vec3 res;
  res.x = v.x / l;
  res.y = v.y / l;
  res.z = v.z / l;
  return res;
}

vec3 vec3_mix(vec3 ax, vec3 ab, float a){
  vec3 ret;
  ret.x = ax.x*(1.0-a)+ab.x*a;
  ret.y = ax.y*(1.0-a)+ab.y*a;
  ret.z = ax.z*(1.0-a)+ab.z*a;
  return ret;
}

// NO INTERPOLATION - just for example
vec4 textureFetch(uint8_t *rgba_ich, int w, int h, vec2 tuv){
  int x = (int)(((float)w)*tuv.x);
  int y = (int)(((float)h)*tuv.y);
  x = max(min(x,w-1),0);
  x = (w-1)-x;// x-fliped - no idea why
  y = max(min(y,h-1),0);
  vec4 ret;
  ret.x = ((float)rgba_ich[(x+y*w)*4+0])/255.0;
  ret.y = ((float)rgba_ich[(x+y*w)*4+1])/255.0;
  ret.z = ((float)rgba_ich[(x+y*w)*4+2])/255.0;
  ret.w = ((float)rgba_ich[(x+y*w)*4+3])/255.0;
  return ret;
}

vec3 panorama_screen_uv_to_rd(vec2 uv);
vec4 mainCubemap(vec3 rayOri, vec3 rayDir, uint8_t *texture_1_rgba, uint8_t *texture_2_rgba, uint8_t *texture_3_rgba, int w1, int h1, int w2, int h2, int w3, int h3 );
vec4 mainImage(vec2 fragCoord, vec2 iResolution, uint8_t *texture_1_rgba, uint8_t *texture_2_rgba, uint8_t *texture_3_rgba, int w1, int h1, int w2, int h2, int w3, int h3)
{
    vec2 uv = (vec2){fragCoord.x/iResolution.x,fragCoord.y/iResolution.y};
    vec3 rd = panorama_screen_uv_to_rd(uv);
    return mainCubemap((vec3){0,0,0}, rd, texture_1_rgba, texture_2_rgba, texture_3_rgba, w1, h1, w2, h2, w3, h3); // panorama by calling cubemap function
}


vec2 rd_to_screen_uv(vec3 rd, vec2 pos, float aspect, float fov);
// prj_pos - position vector on sphere(0-1), prj_fov - degres fov project
vec4 project_texture_on_cube(uint8_t *rgba_ich, int w, int h, vec3 rd, float prj_fov, vec2 prj_pos){
    vec2 texture_sz = (vec2){w,h};
    float t_aspect = texture_sz.x/texture_sz.y;
    vec2 tuv = rd_to_screen_uv(rd, prj_pos, t_aspect, prj_fov);
    if((fabs(tuv.x-0.5)<0.5)&&(fabs(tuv.y-0.5)<0.5))return textureFetch(rgba_ich, w, h, tuv); //fabs because C
    return (vec4){0,0,0,0};
}

vec4 mainCubemap(vec3 rayOri, vec3 rayDir, uint8_t *texture_1_rgba, uint8_t *texture_2_rgba, uint8_t *texture_3_rgba, int w1, int h1, int w2, int h2, int w3, int h3 )
{
    vec3 fragColor_rgb = (vec3){0,0,0};
    float alpha = 0.0;
    
    vec4 texture_1 = project_texture_on_cube(texture_1_rgba, w1, h1, rayDir, 70., (vec2){0.,0.});
    vec3 texture_1_rgb = (vec3){texture_1.x,texture_1.y,texture_1.z};
    fragColor_rgb = vec3_mix(fragColor_rgb, texture_1_rgb, texture_1.w);
    alpha = max(alpha, texture_1.w);
    
    vec4 texture_2 = project_texture_on_cube(texture_2_rgba, w2, h2, rayDir, 70., (vec2){0.,0.5});
    vec3 texture_2_rgb = (vec3){texture_2.x,texture_2.y,texture_2.z};
    fragColor_rgb = vec3_mix(fragColor_rgb, texture_2_rgb, texture_2.w);
    alpha = max(alpha, texture_2.w);
    
    vec4 texture_3 = project_texture_on_cube(texture_3_rgba, w3, h3, rayDir, 50., (vec2){0.25,0.25});
    vec3 texture_3_rgb = (vec3){texture_3.x,texture_3.y,texture_3.z};
    fragColor_rgb = vec3_mix(fragColor_rgb, texture_3_rgb, texture_3.w);
    alpha = max(alpha, texture_3.w);
    
    vec4 fragColor = (vec4){0,0,0,0};
    fragColor.x = fragColor_rgb.x;
    fragColor.y = fragColor_rgb.y;
    fragColor.z = fragColor_rgb.z;
    fragColor.w = alpha;
    return fragColor;
}


vec3 panorama_screen_uv_to_rd(vec2 uv){
    //float M_PI = 3.1415926535;
    float ymul = 2.0; float ydiff = -1.0;
    uv.x = 2.0 * uv.x - 1.0;
    uv.y = ymul * uv.y + ydiff;
    mat3 rotxm;
    rotx(-uv.y*M_PI/2.0, rotxm);
    mat3 rotym;
    roty(-uv.x*M_PI, rotym);
    mat3 tmat;
    mat3_multiply(tmat, rotym, rotxm);
    vec3 rd = vec3_multiply_mat3((vec3){0.0, 0.0, 1.0}, tmat);
    if(vec3_length(rd)<0.0001)rd.x+=0.0001;
    rd = vec3_normalize(rd);
    return rd;

}

// pos - position vector on sphere(0-1), aspect texture aspect, fov - degres fov project
vec2 rd_to_screen_uv(vec3 rd, vec2 pos, float aspect, float fov)
{
    vec2 im = (vec2){pos.x-0.5,pos.y-0.5};
    im.x*=3.14159263;im.y*=3.14159263;
    im.y = -im.y;
    
    mat3 rotym;
    roty(-im.x, rotym);
    mat3 rotxm;
    rotx(im.y, rotxm);
    mat3 tmat;
    mat3_multiply(tmat, rotxm, rotym);
    rd = vec3_multiply_mat3(rd, tmat);
    if(rd.z<0.0001)return (vec2){0,0};
    float screenSize = (1.0 / (tan(((180.-fov)* (3.14159263 / 180.0)) / 2.0)));
    vec2 uv = (vec2){rd.x/rd.z,rd.y/rd.z};
    uv.x = uv.x/(screenSize*aspect);
    uv.y = uv.y/screenSize;
    uv.x*=0.5;uv.y*=0.5;
    uv.x+=0.5;uv.y+=0.5;
    return uv;
}


//------------------------
//end of shader copde
//------------------------



//test 
/*
vec4 mainImage(vec2 fragCoord, vec2 iResolution)
{
    vec2 uv;
    uv.x = fragCoord.x/iResolution.x;
    uv.y = fragCoord.y/iResolution.y;
    
    vec3 col = cos3((vec3){0+uv.x,2+uv.y,4+uv.x});
    col.x = 0.5+0.5*col.x;
    col.y = 0.5+0.5*col.y;
    col.z = 0.5+0.5*col.z;
    
    return (vec4){col.x,col.y,col.z,1.0};
}
*/



int main() {
  
  uint8_t *texture_1_rgba = NULL;
  int width1, height1;
  if(!read_bmp("01.bmp", &width1, &height1, &texture_1_rgba)){
    printf("ERROR LOADING TEXTURE\n");
    return 0;
  }
  uint8_t *texture_2_rgba = NULL;
  int width2, height2;
  if(!read_bmp("02.bmp", &width2, &height2, &texture_2_rgba)){
    printf("ERROR LOADING TEXTURE\n");
    return 0;
  }
  uint8_t *texture_3_rgba = NULL;
  int width3, height3;
  if(!read_bmp("03.bmp", &width3, &height3, &texture_3_rgba)){
    printf("ERROR LOADING TEXTURE\n");
    return 0;
  }
  
  uint8_t *rgba = NULL;
  
  int x = 0;
  int y = 0;
  
  ivec2 iResolution = (ivec2){800, 450};
  
  rgba = (uint8_t*)malloc((iResolution.x*iResolution.y*4) * sizeof(uint8_t));
  
  for(int x = 0;x<iResolution.x;x++){
    for(int y = 0;y<iResolution.y;y++){
      vec2 fc = (vec2){x,y};
      vec4 px = mainImage(fc, (vec2){iResolution.x,iResolution.y}, texture_1_rgba, texture_2_rgba, texture_3_rgba, width1, height1, width2, height2, width3, height3);
      rgba[(x+(iResolution.y-1-y)*iResolution.x)*4+0] = (uint8_t)(min(px.x*255.0,255));
      rgba[(x+(iResolution.y-1-y)*iResolution.x)*4+1] = (uint8_t)(min(px.y*255.0,255));
      rgba[(x+(iResolution.y-1-y)*iResolution.x)*4+2] = (uint8_t)(min(px.z*255.0,255));
      rgba[(x+(iResolution.y-1-y)*iResolution.x)*4+3] = (uint8_t)(min(px.w*255.0,255));
    }
  }
  
  write_bmp("result_BufA_panorama.bmp", iResolution.x, iResolution.y, rgba);
  
  free(rgba);
  free(texture_1_rgba);
  free(texture_2_rgba);
  free(texture_3_rgba);
  
  return 0;
}

