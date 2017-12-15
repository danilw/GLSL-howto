#include "glslmath.h"
#include <math.h>

//example shader https://www.shadertoy.com/view/4llSzS

/*
void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
	fragColor.xy =  (fragCoord-2e2) * mat2(sin(iDate.w+vec4(1,2,0,1)*1.6)) ;
}
*/


//operation (vec2 * mat2) in glsl
/*
vec2 v = vec2(10., 20.);
mat2 m = mat2(1., 2.,  3., 4.);
vec2 w = m * v; // = vec2(1. * 10. + 3. * 20., 2. * 10. + 4. * 20.)
*/


//translation into C with glslmath.h
//shader

/*
void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    vec4 sinx4=sin(vec4(iDate.w)+vec4(1,2,0,1)*vec4(1.6));
    vec2 sinx2a=vec2(sinx4.x,sinx4.y);
    vec2 sinx2b=vec2(sinx4.z,sinx4.w);
    fragColor.x =  ((fragCoord.x-2e2) * (mat2(sinx2a,sinx2b)[0].x))-((fragCoord.y-2e2) * (mat2(sinx2a,sinx2b)[1].x));
    fragColor.y =  ((fragCoord.x-2e2) * (mat2(sinx2a,sinx2b)[0].y))-((fragCoord.y-2e2) * (mat2(sinx2a,sinx2b)[1].y));
}
*/


//vec4	iDate	Year, month, day, time in seconds in .xyzw

vec4 iDate(0);

vec4 sin4(vec4 inp){
	vec4 ret(0);
	ret.x=sin(inp.x);
	ret.y=sin(inp.y);
	ret.z=sin(inp.z);
	ret.w=sin(inp.w);
	return ret;
}

vec4 mainImage(vec2 fragCoord ) {
	vec4 fragColor(0); //z=red, y=green, z=blue, w=alpha
	vec4 sinx4=sin4(vec4(iDate.w)+vec4(1,2,0,1)*vec4(1.6));
    vec2 sinx2a=vec2(sinx4.x,sinx4.y);
    vec2 sinx2b=vec2(sinx4.z,sinx4.w);
	fragColor.x =  ((fragCoord.x-2e2) * (mat2(sinx2a,sinx2b)[0].x))-((fragCoord.y-2e2) * (mat2(sinx2a,sinx2b)[1].x));
    fragColor.y =  ((fragCoord.x-2e2) * (mat2(sinx2a,sinx2b)[0].y))-((fragCoord.y-2e2) * (mat2(sinx2a,sinx2b)[1].y));
	return fragColor;
}

int main()
{
	
	for(int i=0;i<200;i=i+10)//200msec=2 sec
	{
		iDate.w=i;
		vec4 fragColor;
		vec2 fragCoord(0,0); //x=0, y=0
		fragColor=mainImage(fragCoord);
		std::cout << "msec: " << iDate.w << std::endl;
		std::cout << "frag coord: " << fragCoord << std::endl;
		std::cout << "frag color: " << fragColor << std::endl;
		fragCoord=vec2(0,250); //x=0, y=250px
		fragColor=mainImage(fragCoord);
		std::cout << "frag coord: " << fragCoord << std::endl;
		std::cout << "frag color: " << fragColor << std::endl;
		fragCoord=vec2(250,250); 
		fragColor=mainImage(fragCoord);
		std::cout << "frag coord: " << fragCoord << std::endl;
		std::cout << "frag color: " << fragColor << std::endl;
		fragCoord=vec2(250,0); 
		fragColor=mainImage(fragCoord);
		std::cout << "frag coord: " << fragCoord << std::endl;
		std::cout << "frag color: " << fragColor << std::endl;
	}

   return(0);
}
