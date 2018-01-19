#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 resolution;

vec3 box(in vec2 p)
{
	return vec3((1.-step(0.08,abs(p.x)))*(1.-step(0.5,abs(p.y))));
	
}
vec3 curve(in vec2 p) 
{
	p.x +=  smoothstep(0.0, 1.0, pow(clamp(-p.y, 0.0, 1.0), 1.2));
	
	return vec3((step(-0.1*smoothstep(1.0, 1.5, 1.0-p.y),p.x))*(1.-step(0.15,p.x))*(1.-step(0.5,abs(p.y))));
	
}

void main( void ) {

	vec2 p = 2.0*( gl_FragCoord.xy / resolution.xy ) - 1.0;
	p.x *= resolution.x/resolution.y; 
	vec3 color = vec3(0.0); 
	
	color = box(p) + curve(p+vec2(0.30,0.0)) + curve(vec2(-p.x,p.y)+vec2(+0.30, 0.0));  
	
	gl_FragColor = vec4(color, 1.0); 
}
