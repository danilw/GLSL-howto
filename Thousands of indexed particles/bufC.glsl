// base on https://www.shadertoy.com/view/wdG3Wd

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

// data
// in [x,y,z,w]
// x-0xfffff-posx, 0xf-data
// y-0xfffff-posy, 0xf-data
// z-0xffff-velx, 0xff-data
// w-0xffff-vely, 0xff-data
// data used to store particle IDs
	
// get [pos,vel]

vec4 getV(in vec2 p,float max_pos){
    if (p.x < 0.001 || p.y < 0.001) return vec4(0);
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

ivec2 extra_dat_vel(vec2 p){
    vec4 tval=texelFetch( iChannel2, ivec2(p), 0 );
    return ivec2(abs(int(tval.z))&0xff,abs(int(tval.w))&0xff);
}

ivec2 extra_dat_pos(vec2 p){
    vec4 tval=texelFetch( iChannel2, ivec2(p), 0 );
    return ivec2(int(tval.x)&0xf,int(tval.y)&0xf);
}

// get saved unique ID
int get_id(vec2 p){
    ivec2 v1=extra_dat_pos(p);
    ivec2 v2=extra_dat_vel(p);
    int iret=(v1[0]<<20)|(v1[1]<<16)|(v2[0]<<8)|(v2[1]<<0);
    return iret;
}

ivec4 save_id(int id){
    int a=(id>>20)&0xf;
    int b=(id>>16)&0xf;
    int c=(id>>8)&0xff;
    int d=(id>>0)&0xff;
    return ivec4(a,b,c,d);
}

vec2 pack_pos(vec2 pos,ivec2 extra_val, float max_pos){
    int v1=max(int((pos.x/max_pos)*float(0xfffff)),0);
    int v2=max(int((pos.y/max_pos)*float(0xfffff)),0);
    float px=float(encodeval_pos(ivec2(v1,extra_val.x)));
    float py=float(encodeval_pos(ivec2(v2,extra_val.y)));
    return vec2(px,py);
}

vec2 pack_vel(vec2 vel,ivec2 extra_val){
    int v1=abs(int(vel.x*float(0xffff)));
    int v2=abs(int(vel.y*float(0xffff)));
    float vx=float(encodeval_vel(ivec2(v1,extra_val.x)));
    float vy=float(encodeval_vel(ivec2(v2,extra_val.y)));
    float si=1.;
    if(vel.x<0.)si=-1.;
    float si2=1.;
    if(vel.y<0.)si2=-1.;
    return vec2(vx*si,vy*si2);
}

// save everything to pixel color
vec4 save_all(vec2 pos, vec2 vel, int id){
    ivec4 tid=save_id(id);
    ivec2 extra_data_pos=tid.xy;
    ivec2 extra_data_vel=tid.zw;
    float max_pos=abs(loadval(ivec2(1,0)).x);
    vec2 pos_ret=pack_pos(pos,extra_data_pos,max_pos);
    vec2 vel_ret=pack_vel(vel,extra_data_vel);
    return vec4(pos_ret,vel_ret);
}

float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void sim_step( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 middle = fragCoord;
    int self_id=0;
    float max_pos=abs(loadval(ivec2(1,0)).x);
    bool mouseReset = (loadval(ivec2(1,0)).z>0.5)||(loadval(ivec2(1,0)).w>0.5);
    if (iFrame <= 10 || mouseReset) {
        ivec2 iv = ivec2(fragCoord);
        float max_posy=abs(loadval(ivec2(1,0)).y);
        float tH=H;
        if(loadval(ivec2(1,0)).w>0.5)fragColor = vec4(0);
        else
            if ((iv.x + iv.y) %2 == 0 && iv.y % 2 == 0 && iv.y < int(max_posy*H)){//&&(iv.x>0&&iv.y>0)) {
            //init
            int id=int(floor(fragCoord.x)+floor(fragCoord.y-fragCoord.y/2.)*iResolution.x)/2;
            vec2 pos=(middle+ (rand(fragCoord)-0.5)* 0.25);
            vec2 vel=vec2(0.);
            fragColor = save_all(pos,vel,id);
        } else {
            fragColor = vec4(0);
        }
    } else {
        // check if ball needs to transition between cells
        vec4 v = vec4(0.); 
        vec2 lp=vec2(-10.);
        bool br=false;
        for (int x=-1; x<=1; x++) {
            if(br)break;
            for (int y=-1; y<=1; y++) {
                vec2 np = fragCoord + vec2(x,y);
                vec4 p = getV(np,max_pos);
                //found ball for transition
                if(trunc(middle) == trunc(p.xy)){
                    v = p;
                    lp=np;
                    br=true;
                    break;
                }
            }
        }

        // movement calculations
        if (br){
            self_id=get_id(trunc(lp.xy));
            vec2 dr = vec2(0);//vec2(0.0, -0.01);

            // collision checks
            float stress = 0.0;
            for (int x=-2; x<=2; x++) {
                for (int y=-2; y<=2; y++) {
                    if (x !=0 || y != 0) 
                    {
                        vec4 p = getV(fragCoord + vec2(x,y),max_pos);
                        if (p.x > 0.0) {
                            vec2 d2 = v.xy - p.xy;
                            float l = length(d2);
                            float f = BALL_D - l;
                            if (l >= 0.001* BALL_SIZE &&  f > 0.0) {
                                float f2 = f / (BALL_D);
                                f2 +=  SQ_K*f2*f2;
                                f2 *= BALL_D;
                                vec2 force_part = E_FORCE * normalize(d2)*f2;
                                stress += abs(force_part.x)+abs(force_part.y);
                                dr += force_part;
                            }
                        }
                    }
                }
            }

            // force from mouse
            if((int(loadval(ivec2(1,1)).w)==1)||(int(loadval(ivec2(1,1)).w)==2)){
            float ss=SCALE_size_non_linear(loadval(ivec2(0,0)).x);
            float mn=1.;
            float scpx=loadval(ivec2(0,0)).z-0.015;
            float scpy=loadval(ivec2(0,0)).w-0.015;
            if(loadval(ivec2(0,0)).x>0.95)mn=0.;
            float scale = max(0.001,SCALE_size_non_linear(loadval(ivec2(0,0)).x));
            vec2 ssx=mn*iResolution.y*vec2(scpx,scpy)/scale; //real scale
            if(SCALE_size_non_linear(loadval(ivec2(0,0)).x)>0.95)ss=1.;
            vec2 mouseDir = v.xy - (iMouse.xy+ssx)*ss;
            float d2 = dot(mouseDir, mouseDir);
            dr += M * MOUSE_F *
                max(stress, 1.0) *
                clamp(iMouse.z, 0.0, 1.0) * // mouse clicked outside zoom region
                mouseDir * BALL_SIZE / max(d2, 0.01); //  normalize(mouseDir) / (length(mouseDir)/BALL_SIZE)
            }
            // movement calculation
            vec2 pos = v.xy;
            float damp_k = length(dr)>0.001? DAMP_K : 1.0; // don't apply damping to freely flying balls
            vec2 gravity=loadval(ivec2(0,1)).xy*maxG;
            dr += gravity * M; // gravity
            vec2 vel = damp_k * v.zw + dr / M;
            vel = clamp(vel, vec2(-1.0), vec2(1.0));
            if(loadval(ivec2(0,1)).w<0.){if((v.x<=1.)||(v.x>=iResolution.x-2.))vel=vec2(0.);if((v.y<=1.)||(v.y>=iResolution.y-2.))vel=vec2(0.);}

            vec2 dpos = vel * VEL_LIMIT;
            pos += dpos*loadval(ivec2(0,0)).y;
            v.xy = pos;
            v.xy = clamp(v.xy,vec2(BALL_SIZE *(1.0 + sin(pos.y)*0.1),BALL_SIZE),iResolution.xy-vec2(BALL_SIZE));
            
            //pack everything
            v=save_all(v.xy,vel,self_id);
            fragColor = v; 
        } else {
            if((int(loadval(ivec2(1,1)).w)==2)&&(iMouse.z>0.)){
            float ss=SCALE_size_non_linear(loadval(ivec2(0,0)).x);
            float mn=1.;
            float scpx=loadval(ivec2(0,0)).z-0.015;
            float scpy=loadval(ivec2(0,0)).w-0.015;
            if(loadval(ivec2(0,0)).x>0.95)mn=0.;
            float scale = max(0.001,SCALE_size_non_linear(loadval(ivec2(0,0)).x));
            vec2 ssx=mn*iResolution.y*vec2(scpx,scpy)/scale; //real scale
            if(SCALE_size_non_linear(loadval(ivec2(0,0)).x)>0.95)ss=1.;
            vec2 mouseDir = (iMouse.xy+ssx)*ss;
            if((length(trunc(middle)-trunc(mouseDir))<SPAWN_point_size)&&(iFrame%3==0)){
            int id=iFrame; //all generated by mause with ID==iFrame
            vec2 pos=(middle+ (rand(fragCoord)-0.5)* 0.25);
            vec2 vel=vec2(0.);
            fragColor = save_all(pos,vel,id);
            return;
            }
            }
            fragColor = vec4(v); //equl to fragColor = vec4(0);
        }
    }
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    sim_step(fragColor, fragCoord);
}
