#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform float rot;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform sampler2D u_texture1;
uniform float u_time;
uniform vec2 pos;
out vec4 glFragColor;

#define iTime u_time
#define iResolution u_resolution
#define iChannel0 u_texture1
#define iMouse u_mouse

// License Creative Commons Attribution-NonCommercial-ShareAlike
// original source github.com/danilw

vec4 getScene(vec2 fc)
{
    vec2 uv=fc/iResolution;
    return texture(iChannel0,uv);
}


void main() {
    glFragColor=getScene(vec2(gl_FragCoord.x,gl_FragCoord.y));
//glFragColor=vec4(1.,0.,0.,0.5);
}
