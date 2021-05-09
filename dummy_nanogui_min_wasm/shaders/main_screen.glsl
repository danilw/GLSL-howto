#version 300 es
#ifdef GL_ES
 precision highp float;
#endif
uniform float u_time;
uniform int u_frames;
uniform vec2 u_resolution;
uniform bool u_filter;
uniform vec4 u_mouse;
uniform vec4 u_keys;
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


#define texture(a,b) (u_filter?texture(a,b):texelFetch(a,ivec2(b*u_resolution),0))

// self https://www.shadertoy.com/view/WlcBWr

float DigitBin(in int x)
{
    if (x==0)return 480599.0;
	else if(x==1) return 139810.0;
	else if(x==2) return 476951.0;
	else if(x==3) return 476999.0;
	else if(x==4) return 350020.0;
	else if(x==5) return 464711.0;
	else if(x==6) return 464727.0;
	else if(x==7) return 476228.0;
	else if(x==8) return 481111.0;
	else if(x==9) return 481095.0;
	return 0.0;
}

float PrintValue(vec2 fragCoord, vec2 pixelCoord, vec2 fontSize, float value,
		float digits, float decimals) {
	vec2 charCoord = (fragCoord - pixelCoord) / fontSize;
	if(charCoord.y < 0.0 || charCoord.y >= 1.0) return 0.0;
	float bits = 0.0;
	float digitIndex1 = digits - floor(charCoord.x)+ 1.0;
	if(- digitIndex1 <= decimals) {
		float pow1 = pow(10.0, digitIndex1);
		float absValue = abs(value);
		float pivot = max(absValue, 1.5) * 10.0;
		if(pivot < pow1) {
			if(value < 0.0 && pivot >= pow1 * 0.1) bits = 1792.0;
		} else if(digitIndex1 == 0.0) {
			if(decimals > 0.0) bits = 2.0;
		} else {
			value = digitIndex1 < 0.0 ? fract(absValue) : absValue * 10.0;
			bits = DigitBin(int (mod(value / pow1, 10.0)));
		}
	}
	return floor(mod(bits / pow(2.0, floor(fract(charCoord.x) * 4.0) + floor(charCoord.y * 5.0) * 4.0), 2.0));
}

vec3 print_n(in vec2 uv ,float nm){
    	vec2 vPixelCoord2 = vec2(0.);
		float fValue2 = nm;
		float fDigits = 1.0;
		float fDecimalPlaces = 6.0;
        vec2 fontSize = vec2(50.)/vec2(1280,720);
		float fIsDigit2 = PrintValue(uv, vPixelCoord2, fontSize, fValue2, fDigits, fDecimalPlaces);
        return vec3(1.0, 1.0, 1.0)* fIsDigit2;
}
void mainImage_keyboard( out vec4 fragColor, in vec2 fragCoord );
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    int idx=int(uv.x*2.)+int(uv.y*2.)*2;
    uv=fract(uv*2.);
    vec4 col = vec4(0.);
    switch(idx){
        case 0:col=vec4(texture(iChannel0,uv).rgb,1.);break;
        case 1:
          col=vec4(vec3(1.),0.);
          float d=print_n(uv+vec2(-0.5,-0.5-0.3),iMouse.x).x;
          d+=print_n(uv+vec2(-0.5,-0.5-0.1),iMouse.y).x;
          d+=print_n(uv+vec2(-0.5,-0.5+0.1),iMouse.z).x;
          d+=print_n(uv+vec2(-0.5,-0.5+0.3),iMouse.w).x;
          col.rgb*=1.-d;col.a=d;col.a=1.;
          vec4 tc;
          mainImage_keyboard(tc,(uv*iResolution.xy));
          col.rgb=col.rgb*0.35+tc.rgb;
          break;
        case 2:col=vec4(texture(iChannel2,uv).rgb,1.);break;
        case 3:col=vec4(texture(iChannel3,uv).rgb,1.);break;
    }
    
    
    vec2 tuv=fragCoord/iResolution.xy;
    tuv*=5.;
    if((abs(tuv.x-0.5)<0.5)&&(abs(tuv.y-0.5)<0.5))
    col.rgb = textureLod(u_tex_texture1, vec2(tuv.x,1.-tuv.y),0.).rgb;
    
    
    fragColor = col;
}

void mainImage_keyboard( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (-iResolution.xy + 2.0*fragCoord) / iResolution.y;

    vec3 col = vec3(0.0);

    // state
    col = mix( col, vec3(1.0,0.0,0.0), 
        (1.0-smoothstep(0.3,0.31,length(uv-vec2(-0.75,0.0))))*
        (0.3+0.7*u_keys.x) );

    col = mix( col, vec3(1.0,1.0,0.0), 
        (1.0-smoothstep(0.3,0.31,length(uv-vec2(0.0,0.5))))*
        (0.3+0.7*u_keys.y));
	
    col = mix( col, vec3(0.0,1.0,0.0),
        (1.0-smoothstep(0.3,0.31,length(uv-vec2(0.75,0.0))))*
        (0.3+0.7*u_keys.z));

    col = mix( col, vec3(0.0,0.0,1.0),
        (1.0-smoothstep(0.3,0.31,length(uv-vec2(0.0,-0.5))))*
        (0.3+0.7*u_keys.w));

    fragColor = vec4(col,1.0);
}


void main(void) {
    vec4 fragColor = vec4(0.);
    mainImage(fragColor,gl_FragCoord.xy);
    glFragColor = fragColor;
}
