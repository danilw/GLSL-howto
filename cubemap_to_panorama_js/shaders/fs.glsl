precision mediump float;
varying vec4 color;
uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
//uniform sampler2D u_texture1;
uniform samplerCube u_cubemap1;
uniform bool ef_sqrt;
uniform bool ef_pow;
uniform bool stop_mov;
uniform bool sphere_map;

#define iResolution u_resolution
#define iTime u_time
#define iMouse u_mouse
#define iChannel0 u_cubemap1

float pi = 3.1415926536;

void get_panorama( out vec4 fragColor, in vec2 P ) {
float theta = (1.0 - P.y) * pi;
float phi   = P.x * pi * 2.0;
if(!stop_mov)phi += sin(iTime/5.)*pi;
vec3 dir = vec3(sin(theta) * sin(phi), cos(theta), sin(theta) * cos(phi));
fragColor = (textureCube(iChannel0, dir));
if(ef_sqrt)
fragColor=sqrt(fragColor);
if(ef_pow)
fragColor*=fragColor;
fragColor.a=1.;
}

vec3 SetCamera(vec2 uv)
{
    vec3 ro = vec3(0.,2.,0.);
    vec2 m = (iMouse.xy*2.5)/iResolution.xy;
    m.x=-m.x;
    uv.y=-uv.y;
    vec3 rd = normalize(vec3(uv, 1.5));
    mat3 rotX = mat3(1.0, 0.0, 0.0, 0.0, cos(m.y), sin(m.y), 0.0, -sin(m.y), cos(m.y));
    mat3 rotY = mat3(cos(m.x), 0.0, -sin(m.x), 0.0, 1.0, 0.0, sin(m.x), 0.0, cos(m.x));
    rd = (rotY * rotX) * rd;
    return rd;
}

vec2 uv_sphere(vec3 v)
{
	return vec2(0.5 + atan(v.z, v.x) / (2.0 * pi), acos(v.y) / pi);
}

void to_sphere( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 P = fragCoord.xy / iResolution.y-(iResolution.xy/iResolution.y)/2.;
	vec3 dir=SetCamera(P);
    get_panorama(fragColor, uv_sphere(dir));
}

void mainImage( out vec4 fragColor, in vec2 fragCoord) {
vec2 P = fragCoord.xy / iResolution.xy;
if(!sphere_map)get_panorama(fragColor,P);
else to_sphere(fragColor,fragCoord);
fragColor.a=1.;
}

void main( void ) {
vec4 fragColor=vec4(0.);
mainImage(fragColor,gl_FragCoord.xy);
gl_FragColor = fragColor;
}
