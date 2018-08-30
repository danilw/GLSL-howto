#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform sampler2D u_texture1;
uniform float u_time;
out vec4 glFragColor;

#define iTime u_time
#define iResolution u_resolution
#define iChannel0 u_texture1
#define iMouse u_mouse

// License Creative Commons Attribution-NonCommercial-ShareAlike

void mainImage(out vec4 o,vec2 u)
{
    o =  mix(o = texture(iChannel0, u /= iResolution.xy),
             vec4 ( dot(o,vec4(.3,.59,.11,0)) ), 1.); //1-0 anim
}


void main() {
	vec4 ret;
	mainImage(ret,gl_FragCoord.xy);
	glFragColor=ret;
	glFragColor.a=1.;
}
