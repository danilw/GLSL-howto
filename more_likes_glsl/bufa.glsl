//logic

#define res (iResolution.xy / iResolution.y)

const int spawn_per_frame=60;

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

bool is_end(){
    return loadval(ivec2(2,1)).x>0.;
}

bool get_map_by_id(ivec2 idx){
    ivec2 ipx=ivec2(idx.x,0);
    float val=texelFetch(iChannel0,ipx,0)[idx.y];
    return val>0.;
}

vec4 tile_uv(vec2 p){
    vec2 tuv=p;
    tuv=(p)/3.*vec2(3.5*1.77,6.);
    tuv.x=sqrt(1.*floor(abs(tuv.x)+0.50));
    vec2 op=p;
    op.y+=-.03;
    op.y+=-0.15*(tuv.x);
    op=mod(op*vec2(4.,6.)*2.+(1./2.)*vec2(4.,6.),vec2(4.,6.))-(1./2.)*vec2(4.,6.);
    return vec4(op,tuv);
}

ivec2 tile_idx(vec2 p){
    vec4 tup=tile_uv(p);
    vec2 ti=tup.zw;
    vec2 etd=(p+res/2.*3.)/3.*vec2(3.5*1.77,6.);
    etd.y+=-.25*3.;
    etd.y+=1.-0.1*(ti.x)*2.;
    vec2 ftid=vec2(etd+vec2(((16./9.)-res.x)*3.1+1.,0.));
    ivec2 tid=ivec2(ftid);
    return clamp(tid-ivec2(1),ivec2(0),ivec2(10,3));
}

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

int spawner(int ifr){
    return int(20.*rand(vec2(float(ifr),iTime)));
}

int timer_cd(){
    return spawn_per_frame;
}

// map in [x[0-10],y[0]], [0,0].x==[0,0] element [0,0].y=[0,1] elem...etc
vec4 logic_map(ivec2 ipx){
    if(is_end()){
        return vec4(-1.);
    }
    vec4 retc=vec4(0.);
    vec4 ocol=loadval(ipx);
    retc=ocol;
    if((loadval(ivec2(1,1)).x>=0.)&&(loadval(ivec2(1,1)).z>0.)){
        ivec2 tidx=tile_idx((loadval(ivec2(1,1)).xy/iResolution.xy-0.5)*res*vec2(3.));
        if(ipx==ivec2(tidx.x,0))retc[tidx.y]=1.;
        ivec2 mtidx=ivec2(5,0)+ivec2(-tidx.x,tidx.y)+ivec2(5,0);
        if(ipx==ivec2(mtidx.x,0))retc[mtidx.y]=-1.;
    }
    
    int local_iFrame=iFrame-int(loadval(ivec2(2,1)).w);
    if(local_iFrame/timer_cd()<=10){
    if(local_iFrame%timer_cd()==0){
        ivec2 rr=ivec2(-1);
        rr=ivec2(6,0);
        int rnd=spawner(iFrame);
        bool br=false;
        for(int a=0;a<20;a++){
            if(!br){
                rnd=rnd%20;
                ivec2 trr=ivec2(rr.x+rnd-5*(rnd/5),rr.y+rnd/5);
                if(!get_map_by_id(trr)){
                    br=true;
                    rr=trr;
                    break;
                }
                rnd+=1;
            }
        }
        if(ipx==ivec2(rr.x,0))retc[rr.y]=1.;
        if(br){
            ivec2 mtidx=ivec2(5,0)+ivec2(-rr.x,rr.y)+ivec2(5,0);
            if(ipx==ivec2(mtidx.x,0))retc[mtidx.y]=-1.;
        }
        
    }
    }
    
    return retc;
}

//[3,1]
//[score,last_click.x,last_click,y,0]
vec4 logic_vals3(){
    if(is_end()){
        return vec4(-1.);
    }
    vec4 self_dat=loadval(ivec2(3,1));
    float a=self_dat.x;
    float b=self_dat.y;
    float c=self_dat.z;
    float d=self_dat.w;
    
    if(a<0.)a=0.;
    
    if((loadval(ivec2(1,1)).x>=0.)&&(loadval(ivec2(1,1)).z>0.)){
        ivec2 tidx=tile_idx((loadval(ivec2(1,1)).xy/iResolution.xy-0.5)*res*vec2(3.));
        ivec2 ltidx=ivec2(b,c);
        if((!get_map_by_id(tidx))||(tidx!=ltidx)){
            a+=1.;
            b=float(tidx.x);
            c=float(tidx.y);
        }
    }
    
    vec4 sc_dat=loadval(ivec2(2,1));
    
    
    return vec4(a,b,c,d);
}

//[2,1]
//[is_end,timer,spwan_at_score,iFrame_spawn_start]
vec4 logic_vals2(){
    vec4 self_dat=loadval(ivec2(2,1));
    float a=self_dat.x;
    float b=self_dat.y;
    float c=self_dat.z;
    float d=self_dat.w;
    if(a<0.){
        if((loadval(ivec2(1,1)).x>=0.)&&(loadval(ivec2(1,1)).z>0.)){
            ivec2 tidx=tile_idx((loadval(ivec2(1,1)).xy/iResolution.xy-0.5)*res*vec2(3.));
            ivec2 mtidx=ivec2(5,0)+ivec2(-tidx.x,tidx.y)+ivec2(5,0);
            if((!get_map_by_id(tidx))&&(!get_map_by_id(mtidx))){
                a=1.;
                b=iTime;
            }
        }
    }else{
        if(iTime-b>1.){
            a=-1.;
        }
    }
    
    if((c<0.)||(a>0.)){
        c=10.;
        d=float(iFrame);
    }else{	
        vec4 sc_val=loadval(ivec2(3,1));
        int score=int(sc_val.x);
        if(int(c)<=score){
            c=float(score)+10.;
            d=float(iFrame);
        }
    }
    return vec4(a,b,c,d);
}

//[0,1]
//[last_rand,this_rand,timer,0]
vec4 logic_vals1(){
    if(is_end()){
        return vec4(-1.);
    }
    vec4 self_dat=loadval(ivec2(0,1));
    float a=self_dat.x;
    float b=self_dat.y;
    float c=self_dat.z;
    float d=self_dat.w;
    int local_iFrame=iFrame-int(loadval(ivec2(2,1)).w);
    if(local_iFrame/timer_cd()<=10){
    if(local_iFrame%timer_cd()==0){
        ivec2 rr=ivec2(-1);
        rr=ivec2(6,0);
        int rnd=spawner(iFrame);	
        bool br=false;
        for(int a=0;a<20;a++){
            if(!br){
                rnd=rnd%20;
                ivec2 trr=ivec2(rr.x+rnd-5*(rnd/5),rr.y+rnd/5);
                if(!get_map_by_id(trr)){
                    br=true;
                    rr=trr;
                    break;
                }
                rnd+=1;
            }
        }
        if(br)c=iTime;
        a=b;
        b=float(rnd);
        if(!br)b=-1.;
    }
    }
    
    return vec4(a,b,c,d);
}

//[1,1]
//[m.x,m.y,click,timer]
vec4 focus_mouse(){
    if(is_end()){
        return vec4(-1.);
    }
    
    int local_iFrame=iFrame-int(loadval(ivec2(2,1)).w);
    if(local_iFrame==1){
        return vec4(-1.);
    }
    
    
    vec4 self_dat=loadval(ivec2(1,1));
    float fpx=self_dat.x;
    float fpy=self_dat.y;
    float a=self_dat.z;
    float b=self_dat.w;

    if(iMouse.z>0.){
        if(a<0.){
            ivec2 tidx=tile_idx((iMouse.xy/iResolution.xy-0.5)*res*vec2(3.));
            if(!get_map_by_id(tidx))
                if(tidx.x<6)
                    if(tidx.x!=5){
                        fpx=iMouse.x;
                        fpy=iMouse.y;
                        b=iTime;
                    }
        }
        a=1.;
    }
    else{
        a=-1.;
    }
    vec4 col = vec4(fpx,fpy,a,b);
    return col;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    //init
    if(iFrame<10){
        fragColor=vec4(-10.);
        return;
    }
    fragColor=vec4(0.);
    ivec2 ipx = ivec2(fragCoord);
    if((ipx.x<=10)&&(ipx.y<1)){
        fragColor=logic_map(ipx);
    }
    if(ipx==ivec2(1,1)){
        fragColor=focus_mouse();
    }
    if(ipx==ivec2(0,1)){
        fragColor=logic_vals1();
    }
    if(ipx==ivec2(2,1)){
        fragColor=logic_vals2();
    }
    if(ipx==ivec2(3,1)){
        fragColor=logic_vals3();
    }
}
