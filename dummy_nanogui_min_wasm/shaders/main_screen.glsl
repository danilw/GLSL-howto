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

#define round(x, f) (floor((x)/(f) + 0.5) * (f))

float random(float p)
{
    return fract(52.043*sin(p*205.429));
}
float random2(float p)
{
    return random(p)*2.0-1.0;
}

vec3 stars(vec2 uv)
{
    vec2 r = round(uv, 0.1);
    
    float rand = r.x*2.32 + r.y;
    
    uv -= r;
    uv.x += 0.05 * random2(rand);
    uv.y += 0.05 * random2(rand+0.541);
    
    float blink = random(rand+0.5) < 0.1 ? 0.8 + 0.2 * sin(35.0*iTime+random(rand+1.5)) : 0.0;
    float dark = random(rand+52.0) < 0.5 ? 1.0 : 0.3;
    
    return vec3(dark * max(0.0, 0.8 + blink - iResolution.y * length(uv)));
}

vec3 meteor(vec2 uv, float gtime, float delay)
{
    float seed = round(gtime, delay);
    
    float startTime = (delay - 1.5) * random(seed);
    float time = max(0.0, min(1.0, gtime-seed - startTime));
    
    vec2 start = vec2(
        random2(seed),
        0.7 + 0.3 * random(seed+0.1)
    );
    
    vec2 end = start * 0.85;
    
    uv = uv - mix(start, end, time);
    
    end = normalize(end - start);
    uv = uv * mat2(end.x, end.y, -end.y, end.x);
    uv.x *= 0.1;
    
    float alpha = 16.0 * pow(time, 2.0) * pow(time - 1.0, 2.0);
    return vec3(max(0.0, alpha - iResolution.y * length(uv)));
}

vec3 meteorstorm(vec2 uv)
{
    return
        meteor(uv-vec2(0.,0.15), iTime/2., 4.5837) +
        meteor(uv-vec2(0.,0.15), iTime/2. + 15.3, 2.459) +
        meteor(uv-vec2(0.,0.15), iTime/2. + 125.0, 2.2);
}

void clouds( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 guv = (fragCoord.xy - vec2(iResolution.x*0.5, 0.0)) / iResolution.y;
    float gv = 20.0;
    float gz = 20.0;

    
    vec3 col =
        stars(guv+vec2(sin(iTime/280.),cos(iTime/280.))) +
        meteorstorm(guv) +
        mix(vec3(0.0, 0.1, 0.4), vec3(0.0, 0.0, 0.1), guv.y+cos(iTime/20.)/3.);
    
   /* col = mix(col, vec3(0.0), 100.0*(guv.y+0.005*sin(guv.x+0.1*iTime))<1.0?1.0:0.0);
    col = mix(col, vec3(0.4, 0.05, 0.0) * clamp(-gv, 0.0, 1.0), gv<0.0?1.0:0.0);
    
    float mist = max(0.0, 3.0-1.45*length(vec2(0.4*guv.x,guv.y+1.5)));
    col = mix(col, vec3(1.0), clamp(gz*mist*mist, 0.0, 1.0));
    */
    fragColor = vec4(sqrt(col), 1.0);
}

vec4 drawHolo(vec2 pos,vec2 uv, float range,float power, vec4 cl) {
    return cl * max(0., 1.-pow(length(uv-pos)/range,power));
}

vec4 drawSun(vec2 pos,vec2 uv, float range,float sunrange,float power) {
    float dis = distance(uv,pos) - range;
    return dis < 0.
        ? vec4(1,.974,.647,0)
        : vec4(1,.974,.007,0) * (1.-pow(clamp(dis/sunrange,0.,1.),power));
}

vec4 drawWave(float speed, float range, float height,float offset, float power, vec2 uv, float dis) {
   return uv.y > offset + height*pow(1.+sin(uv.x * range + iTime * speed), power)
        ? vec4(1)
        : mix(vec4(.796,.796,.745,0),vec4(.513,.513,.486,0),dis);
}

void mainImage( out vec4 o, vec2 uv ) {
    vec2 ofc=uv;
    uv /= iResolution.y;
    
    uv*=1.8;
    uv+=vec2(0.,0.42);
    float dis = length(uv-.5)/1.8;
    o  = mix(vec4(.91,.91,.88+0.15*cos(iTime/10.),1),vec4(.605,.605,.517+0.075*cos(iTime/20.),1),dis);
    o += drawHolo(vec2(.5,.7),uv,.7,.7,o/3.);
    o *=  drawWave(.06,70./1.8,.017,.5  ,1.3,uv,dis)
        * drawWave(.07,60./1.8,.015,.487,1.3,uv,dis)
        * drawWave(.08,50./1.8,.013,.462,1.3,uv,dis)
        * drawWave(.10,35./1.8,.011,.45 ,1.3,uv,dis);
    o += drawSun(vec2(.5,.7),uv,.03,.03,.02);
    vec4 c;
    clouds(c,ofc);
    float v=smoothstep(01.1,1.58,uv.y);
    //o+=o*v*c.rgba-o*(1.-v)*c.rgba;
    //o+=o/4.-o*c.rgba/2.;
    o=o*(1.-v)+max(vec4(0.),c.rgba*v);
}



void main() {
	vec4 ret;
	mainImage(ret,gl_FragCoord.xy);
	glFragColor=ret;
	glFragColor.a=1.;
}
