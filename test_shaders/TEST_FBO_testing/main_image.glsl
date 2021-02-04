// self https://www.shadertoy.com/view/WlcBWr

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    int idx=int(uv.x*2.)+int(uv.y*2.)*2;
    uv=fract(uv*2.);
    vec4 col = vec4(0.);
    switch(idx){
        case 0:col=vec4(texture(iChannel0,uv).rgb,1.);break;
        case 1:col=vec4(vec3(1.),0.);break;
        case 2:col=vec4(texture(iChannel2,uv).rgb,1.);break;
        case 3:col=vec4(texture(iChannel3,uv).rgb,1.);break;
    }
    fragColor = col;
}
