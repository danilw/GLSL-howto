// this is example store of data for particles
// particle ID==fragCoord
// I store only particle color as RGB(0xff,0xff,0xff) in .x

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
    vec4 oldc=texelFetch(iChannel1,ivec2(fragCoord),0);
    bool mouseReset = (loadval(ivec2(1,0)).z>0.5)||(loadval(ivec2(1,0)).w>0.5);
    float max_pos=abs(loadval(ivec2(1,0)).x/SSIZE);
    float max_posy=abs(loadval(ivec2(1,0)).y);
    int self_id=int(floor(fragCoord.x)+floor(fragCoord.y)*iResolution.x);
    
    //set collors by ID, as example
        if(self_id==902){
            fragColor=vec4(float(0xff0000),0.,0.,0.);
            return;
        }
        if(self_id==903){
            fragColor=vec4(float(0x00ff00),0.,0.,0.);
            return;
        }
        if(self_id==904){
            fragColor=vec4(float(0x0000ff),0.,0.,0.);
            return;
        }
    
    
    if((iFrame<10)||(oldc.x<1.)||(mouseReset)){
        vec3 shade=vec3(1.);
        if((fragCoord.x<iResolution.x/4.)||((fragCoord.x>iResolution.x/2.)&&(fragCoord.x<iResolution.x-iResolution.x/4.))){
            float mpx=max_pos;
            int sx=self_id%int(mpx);
            int sy=(self_id/int(mpx));
            shade.r*=(float(sx%20)/20.);
            shade.g*=(float(sy%20)/20.);
            shade.b*=0.25+0.75*(float(self_id)/(mpx*max_posy));}
        else
        shade=texture(iChannel3,(fragCoord/iResolution.xy)*vec2(1.,2.)*4.,0.0).rgb; //texture as color
        shade=shade*float(0xff);
        int val=encodeval16(ivec3(shade));
        fragColor=vec4(float(val),0.,0.,0.);
        return;
    }
    fragColor=oldc;
}
