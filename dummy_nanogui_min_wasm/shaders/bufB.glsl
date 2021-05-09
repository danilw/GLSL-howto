#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform float u_time;
uniform int u_frames;
uniform vec2 u_resolution;
uniform vec4 u_mouse;
uniform sampler2D u_texture1;
uniform sampler2D u_texture2;
uniform sampler2D u_texture3;
uniform sampler2D u_texture4;
uniform sampler2D u_tex_texture1;
uniform sampler2D u_tex_texture2;
uniform sampler2D u_tex_texture3;
uniform sampler2D u_tex_texture4;
out vec4 glFragColor;


#define iTime u_time
#define iFrame u_frames
#define iResolution u_resolution
#define iMouse u_mouse
#define iChannel0 u_texture1
#define iChannel1 u_texture2
#define iChannel2 u_texture3
#define iChannel3 u_texture4



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    fragColor = vec4(0.0,0.0,0.0,1.0);
    
    ivec2 ipx=ivec2(fragCoord);
    if((ipx==ivec2(0,0))||(ipx==ivec2(iResolution.x-1.,0))
    ||(ipx==ivec2(0,iResolution.y-1.))||(ipx==ivec2(iResolution.x-1.,iResolution.y-1.))){
        vec4 data=texelFetch(iChannel1,ipx,0);
        fragColor=vec4(iTime,iFrame,data.z+1.,0.);
    }
}

void main(void) {
    vec4 fragColor = vec4(0.);
    mainImage(fragColor,gl_FragCoord.xy);
    glFragColor = fragColor;
}
