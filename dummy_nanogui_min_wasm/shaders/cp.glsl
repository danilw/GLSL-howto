#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform float rot;
uniform vec2 u_resolution;
uniform vec2 u_resolution_resize;
uniform vec2 u_mouse;
uniform sampler2D u_texture1;
uniform bool u_filter;
uniform float u_time;
uniform vec2 pos;
out vec4 glFragColor;

#define iTime u_time
#define iResolution u_resolution
#define iChannel0 u_texture1
#define iMouse u_mouse


vec4 getScene(vec2 fc)
{
    vec2 uv=fc/iResolution;
    vec4 tc=vec4(0.);
    if(u_filter)tc=textureLod(iChannel0,uv,0.);
    else tc=texelFetch(iChannel0,ivec2(uv*u_resolution_resize),0);
    return tc;
}


void main() {
    glFragColor=getScene(vec2(gl_FragCoord.x,gl_FragCoord.y));
}
