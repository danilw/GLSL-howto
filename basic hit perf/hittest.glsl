uniform vec3      iResolution;

//#define square2

//performance hit-test IF square vs circle
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 poss=fragCoord;
   
	vec2 uv = fragCoord.xy / iResolution.xy; 
    vec2 R=vec2(iResolution.x*0.2,iResolution.y*0.2);
    for(int i=0;i<1000;i++)
        #ifdef square
        if ((poss.x > 0.)&&(poss.x < R.x)&&(poss.y > 0.)&&(poss.y < R.x))fragColor = vec4(1.);else fragColor = vec4(0.);
        #else
        #ifdef square2
        if(step(0.2,  max(abs(uv.x), abs(uv.y)))  -1.>-1.)fragColor = vec4(1.);else fragColor = vec4(0.);
        #else
        if(step(0.2,length(uv))-1.>-1.)fragColor = vec4(1.);else fragColor = vec4(0.);
        #endif
        #endif
}



void main (void)
{
  vec4 color = vec4 (0.0, 0.0, 0.0, 1.0);
  mainImage (color, gl_FragCoord.xy);
  color.w = 1.0;
  gl_FragColor = color;
}
