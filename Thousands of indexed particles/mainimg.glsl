// base on https://www.shadertoy.com/view/wdG3Wd

// license is base on original author code, original shader has No Licence
// this shader has No Licence, use it as you wish


//bufA UI
//bufB data by index for particles
//bufC particle logic
//bufD removed, was copy of bufC without mouse, just to speedup
//image draw particles

// data (bufC)
// in [x,y,z,w]
// x-0xfffff-posx, 0xf-data
// y-0xfffff-posy, 0xf-data
// z-0xffff-velx, 0xff-data
// w-0xffff-vely, 0xff-data
// data used to store particle IDs (or other unique data as you need)

// bug because of float precision https://www.shadertoy.com/view/WdtSWS
// because of logic with store/get value (that use (1./0xfffff) as float step for pos)
// set in Common SSIZE to 3 or 10, to see bug (10 for full screen, 1-3 for small)
// then set Speed scale(UI) to 0 or comment in bufC pos += dpos*loadval(ivec2(0,0)).y;
// press Reset
// some of particles will move
// I keep it *3. to have it work on fullscreen without reset...for real use better do not store 0xf in pos
// for real use use full [x,y] in pixel to save position, without encoding to 0xfffff,0xf

// bufB data by index for particles:
// used only [pixel.x] to store data, [y,z,w] unused 
// particle_ID==position on texture(coordinate.xy), index(ID) converted form 1d to 2d obviously
// Image shader read particle ID, and get its color by its ID set any color for any ID in bufB to test



vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

// https://www.shadertoy.com/view/llyXRW

void C(inout vec2 U, inout vec4 T, in int c){
    U.x+=.5;	
    if(U.x<.0||U.x>1.||U.y<0.||U.y>1. ){
        T+= vec4(0);
    }		
    else{
        vec2 tu=U/16. + fract( vec2(float(c), float(15-c/16)) / 16.);
		//tu.y=1.-tu.y;
        T+= textureGrad( iChannel3,tu, dFdx(tu/16.),dFdy(tu/16.));
    }
}

float print_int(vec2 U, int val) {
    vec4 T = vec4(0);
    int cval=val;
    int X=8;
    for(int i=0;i<X;i++){
            if(cval>0){
        int tv=cval%10;
        C(U,T,48+tv);
        cval=cval/10;
    }
    else{
        if(length(T.yz)==0.)
            return 0.;
        else return T.x;
    }
    }

    if(length(T.yz)==0.)
        return 0.;
    else return T.x;
}

vec4 ballD(in vec2 ipos, in vec2 ballp)
{
    float d = distance(ipos, ballp)/BALL_SIZE;
    return vec4(clamp(sign(1.0-d), 0.0, 1.0)*(1.-d) * float(ballp.x > 0.0)) ;
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,vec2(0))) + min(max(d.x,d.y),0.0);
}

vec4 getV(in ivec2 p,float max_pos){
    vec4 tval=texelFetch( iChannel2, ivec2(p), 0 );
    float p1=decodeval_pos(int(tval.x))*max_pos;
    float p2=decodeval_pos(int(tval.y))*max_pos;
    float v1=decodeval_vel(abs(int(tval.z)));
    float v2=decodeval_vel(abs(int(tval.w)));
    float si=1.;
    if(tval.z<0.)si=-1.;
    float si2=1.;
    if(tval.w<0.)si2=-1.;
    vec2 unp=vec2(si*v1,si2*v2);
	return vec4(vec2(p1,p2),unp.xy);
}

ivec2 extra_dat_vel(ivec2 p){
    vec4 tval=texelFetch( iChannel2, ivec2(p), 0 );
    return ivec2(abs(int(tval.z))&0xff,abs(int(tval.w))&0xff);
}

ivec2 extra_dat_pos(ivec2 p){
    vec4 tval=texelFetch( iChannel2, ivec2(p), 0 );
    return ivec2(int(tval.x)&0xf,int(tval.y)&0xf);
}

int get_id(ivec2 p){
    ivec2 v1=extra_dat_pos(p);
    ivec2 v2=extra_dat_vel(p);
    int iret=(v1[0]<<20)|(v1[1]<<16)|(v2[0]<<8)|(v2[1]<<0);
    return iret;
}

ivec2 index_x(int id){
    ivec2 p_res=ivec2(iResolution.xy);
	int x=id%p_res.x;
	int y=id/p_res.x;
	return ivec2(x,y);
}

vec3 get_col_byid(int id){
    ivec2 pos=index_x(id);
    int val=int(texelFetch(iChannel1,pos,0).x);
    return vec3(decodeval16(val))/float(0xff);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
        float max_pos=abs(loadval(ivec2(1,0)).x);
        float max_posy=abs(loadval(ivec2(1,0)).y);
        float scale = max(0.001,SCALE_size_non_linear(loadval(ivec2(0,0)).x));

        if(SCALE_size_non_linear(loadval(ivec2(0,0)).x)>0.95)scale=1.;
        float scpx=loadval(ivec2(0,0)).z-0.015;
        float scpy=loadval(ivec2(0,0)).w-0.015;
        float mn=1.;
        if(loadval(ivec2(0,0)).x>0.95)mn=0.;
        vec2 fc=fragCoord;
        fc+=mn*iResolution.y*vec2(scpx,scpy)/scale; //real scale



        ivec2 cellIndex = ivec2(fc * scale);
        vec2 cellp = mod(fc, scale)/scale;

        vec4 res = vec4(0.0, 0.0, 0.0, 1.0);
        vec2 worldPos = fc * scale;
        float overlaps = 0.0;
        vec4 normSum = vec4(0.0);
        for (int x=-1; x<=1; x++) {
            for (int y=-1; y<=1; y++) {

                ivec2 tp = max(cellIndex+ivec2(x,y), ivec2(0));			

                vec4 ball  = getV(tp,max_pos);
                vec2 p = ball.xy;
                vec2 vel = ball.zw;

                float d=sdBox((worldPos-p.xy)*SIZE_to_draw,vec2(BALL_SIZE*SIZE_to_draw)*.5);
                ///normSum += vec4(p.xy-worldPos, 0.0, 0.0)/BALL_SIZE*(d < 1.0 ? 1.0 : 0.0);
                vec4 shade = vec4(clamp(sign(1.0-d), 0.0, 1.0)*(1.-d) * float(ball.x > 0.0)) ;


                int self_id=get_id(tp);

                //color by id without data buf
    /*
                float mpx=max_pos/SSIZE;
                int sx=self_id%int(mpx);
                int sy=(self_id/int(mpx));
                shade.r*=(float(sx%20)/20.);
                shade.g*=(float(sy%20)/20.);
                shade.b*=0.25+0.75*(float(self_id)/(mpx*max_posy));
    */

                //from data
                shade.rgb*=get_col_byid(self_id);

                if((loadval(ivec2(0,0)).x)<0.6){
                float nba=max(float(print_int((worldPos-p.xy+vec2(-0.35,0.15))*SIZE_to_draw*1.,self_id)),0.);
                shade.rgb=shade.rgb*(1.-nba)+nba*(1.-shade.rgb);
                }

                //vec4 shade = vec4(nc(worldPos-p.xy),1.);

                //vec4 shade = vec4(d < 1.0 ? 1.0 : 0.0) ;
                //res=max(res, shade*vec4(vel.x,-vel.x-vel.y,vel.y, 1.0));
                res=max(res, shade);
                //overlaps += d < 1.0 ? 1.0 : 0.0;
            }
        }
        fragColor = res;
    //fragColor = res * vec4(2.0 - overlaps, 3.0 - 2.0*overlaps, 1.0, 1.0);
    //fragColor = normSum+vec4(1.0, 1.0, 1.0,1.0)*0.5;
    //fragColor = texture(iChannel2,fragCoord/iResolution.xy);
    //fragColor.gb*=(float(abs(int(fragColor.w))&0xff)/float(0xff));
    
    vec2 uv=fragCoord/iResolution.xy;
    fragColor=fragColor*(1.-texture(iChannel0,uv).a)+texture(iChannel0,uv)*texture(iChannel0,uv).a;
    

}
