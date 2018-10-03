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
out vec4 glFragColor;


#define iTime u_time
#define iResolution u_resolution
#define iMouse u_mouse
#define iChannel0 u_texture1
#define iChannel1 u_texture2
#define iChannel2 u_texture3



// Final composite/post pass

// License Creative Commons Attribution-NonCommercial-ShareAlike
// original source github.com/danilw

vec3 hableTonemap(vec3 x)
{
    float a = .15;
    float b = .5;
    float c = .1;
    float d = .2;
    float e = .02;
    float f = .3;

    return ((x * (x * a + c * b) + d * e) / (x * (x * a + b) + d * f)) - e / f;
}

vec3 tonemap(vec3 rawColor, float exposure)
{
    float w = 1.2;

    vec3 exposedColor = max(rawColor * exposure, 0.0);

    vec3 linear = pow(exposedColor, vec3(1.0 / 2.2));

    vec3 reinhard = pow(exposedColor / (exposedColor + 1.0), vec3(1.0 / 2.2));

    vec3 x = max(exposedColor - .04, 0.0);
    vec3 hejlBurgessDawson = (x * (x * 6.2 + .85)) / (x * (x * 6.2 +.07) + .56); //bright

    float exposureBias = 2.0;
    vec3 curr = hableTonemap(exposedColor * exposureBias);
    float whiteScale = (vec3(1.0) / hableTonemap(vec3(w))).x;
    vec3 color = curr * whiteScale;
    vec3 hable = pow(color, vec3(1.0 / 2.2));

    return
        //linear
        //reinhard
        hejlBurgessDawson
        //hable
        ;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    
    float bloomAmount = 0.07;
    vec3 original = texture(iChannel0, uv).xyz;
    vec3 bloom = texture(iChannel1, uv).xyz;
    vec3 inputColor = original + bloom * bloomAmount;
    
    // Vignette
    float vignetteStrength = 0.9;
    float vignetteSizeBias = 0.5;
    float vignettePower = 1.0;
    float d = clamp(length(uv * 2.0 - 1.0) - vignetteSizeBias, 0.0, 1.0); //edges
	inputColor *= 1.0 - clamp(pow(d, vignettePower) * vignetteStrength, 0.0, 1.0);
    
    // Bring up lows a bit
    inputColor = inputColor * .995 + .005;

    // Some toy grading :)
	//inputColor = pow(inputColor, vec3(1.175, 1.05, 1.0));
    
    // Tonemap
    float exposure = 0.0;
    vec3 tonemappedColor = clamp(tonemap(inputColor, pow(2.0, exposure)), 0.0, 1.0);
    
    // Output luma for fxaa
    float luma = sqrt(dot(tonemappedColor, vec3(0.299, 0.587, 0.114)));
    
    fragColor = vec4(tonemappedColor, luma);
}


void main(void) {
    vec4 fragColor = vec4(0.);
    mainImage(fragColor,gl_FragCoord.xy);
    glFragColor = fragColor;
}
