
const float SPAWN_point_size=3.; //spawn in square X*X pixel

//this used only to have particles keep its position on changeing to fullscreen, it has no use if your FBO is static size
const float SSIZE = 3.0; //max particle posiiton *X //has bug https://www.shadertoy.com/view/WdtSWS

const float SIZE_to_draw = 3.0; //ball size to draw
const float BALL_SIZE = 0.90; // should be between sqrt(2)/2 and 1
const float BALL_D = 2.0 * BALL_SIZE; 
const float H = 0.5; // on init fill % of screen iResolution.y
const float VEL_LIMIT = 0.52 * BALL_SIZE;
const float maxG = 0.006; // max gravity
const float E_FORCE = 1.9;
const float M = 0.6 * BALL_SIZE;
const float DAMP_K = 0.98;
const float SQ_K = 0.0;
const float MOUSE_F = 0.38;
	
ivec3 decodeval16(int varz) {
    ivec3 iret=ivec3(0);
    iret.x=varz>>16;
    iret.y=(varz>>8)&0xff;
    iret.z=(varz>>0)&0xff;
    return iret;
}

int encodeval16(ivec3 colz) {
    return int(((colz[0]&0xff)<<16)|((colz[1]&0xff)<< 8)|((colz[2]&0xff)<< 0));
}

float decodeval_vel(int varz) {
    int iret=0;
    iret=varz>>8;
    return float(iret)/float(0xffff);
}

int encodeval_vel(ivec2 colz) {
    return int(((colz[0]&0xffff)<< 8)|((colz[1]&0xff)<< 0));
}

float decodeval_pos(int varz) {
    int iret=0;
    iret=varz>>4;
    return float(iret)/float(0xfffff);
}

int encodeval_pos(ivec2 colz) {
    return int(((colz[0]&0xfffff)<< 4)|((colz[1]&0xf)<< 0));
}

float SCALE_size_non_linear(float val){
    //return val; //linear
    return min(smoothstep(0.,5.,val)+smoothstep(0.5,1.6,val)+smoothstep(0.7,1.3,val),1.);
}
