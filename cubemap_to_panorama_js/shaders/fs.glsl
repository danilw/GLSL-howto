precision mediump float;
varying vec4 color;
uniform float u_time;
uniform vec2 u_resolution;
//uniform sampler2D u_texture1;
uniform samplerCube u_cubemap1;
uniform bool ef_sqrt;
uniform bool ef_pow;
uniform bool stop_mov;

#define iResolution u_resolution
#define iTime u_time
#define iChannel0 u_cubemap1
            
void mainImage( out vec4 fragColor, in vec2 fragCoord) {
float pi = 3.1415926536;
vec2 P = fragCoord.xy / iResolution.xy;
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

void main( void ) {
vec4 fragColor=vec4(0.);
mainImage(fragColor,gl_FragCoord.xy);
gl_FragColor = fragColor;
}
