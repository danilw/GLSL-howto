#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
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
#define iResolution u_resolution
#define iMouse u_mouse
#define iChannel0 u_texture1
#define iChannel1 u_texture2
#define iChannel2 u_texture3
#define iChannel3 u_tex_texture1


// License Creative Commons Attribution-NonCommercial-ShareAlike
// original source github.com/danilw

// https://www.shadertoy.com/view/3dl3z7

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 iMouse=vec2(iResolution.xy/2.);
	vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 pixelSize = 1. / iResolution.xy;
    vec2 aspect = vec2(1.,iResolution.y/iResolution.x);

    vec4 noise = texture(iChannel3, fragCoord.xy / iResolution.xy + fract(vec2(42,56)*iTime));
    
	vec2 lightSize=vec2(4.);

    // get the gradients from the blurred image
	vec2 d = pixelSize*2.;
	vec4 dx = vec4(0.);
	vec4 dy = vec4(0.);

	// add the pixel gradients
	d = pixelSize*1.;
	dx += texture(iChannel0, uv + vec2(1,0)*d) - texture(iChannel0, uv - vec2(1,0)*d);
	dy += texture(iChannel0, uv + vec2(0,1)*d) - texture(iChannel0, uv - vec2(0,1)*d);

	vec2 displacement = vec2(dx.x,dy.x)*lightSize; // using only the red gradient as displacement vector
	float light = pow(max(1.-distance(0.5+(uv-0.5)*aspect*lightSize + displacement,0.5+(iMouse.xy*pixelSize-0.5)*aspect*lightSize),0.),4.);

	// recolor the red channel
	vec4 rd = vec4(texture(iChannel0,uv+vec2(dx.x,dy.x)*pixelSize*8.).x)*vec4(0.7,1.5,2.0,1.0)-vec4(0.3,1.0,1.0,1.0);

    // and add the light map
    fragColor = mix(rd,vec4(8.0,6.,2.,1.), light*0.75*vec4(1.-texture(iChannel0,uv+vec2(dx.x,dy.x)*pixelSize*8.).x)); 
	fragColor.a=1.;
	//fragColor = texture(iChannel0, uv); // bypass    
}


void main(void) {
    vec4 fragColor = vec4(0.);
    mainImage(fragColor,gl_FragCoord.xy);
    glFragColor = fragColor;
}
