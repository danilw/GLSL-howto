//UI

// data
// [0,0] [zoom,speed_scale,posx,posy]
// [1,0] [iResolution.x*3.,iResolution.y,is_reset,is_clean]
// [1,1] [focus_posx,focus_posy,is_focus,n/f/s]
// [0,1] [grav_x,grav_y,last_mouse.x,last_mouse.y]

#define res ((iResolution.xy/iResolution.y)*0.5)

// https://www.shadertoy.com/view/XsBBRd
// ------------------------------------------------------------------------------------------------
float m_stretch(float point, float stretch){
    return .5 * (sign(point) * stretch - point) * (sign(abs(point) - stretch) + 1.);
}

float ollj_rotate(vec2 uv){
    float ROTATE_PARAM0 = sqrt(1.);
    float ROTATE_PARAM1 = sqrt(.0);
    return dot(uv, vec2(ROTATE_PARAM0 + ROTATE_PARAM1, ROTATE_PARAM0 - ROTATE_PARAM1));
}


float sdf_arrow(vec2 uv, float norm, float angle, float head_height, float stem_width){
    uv = vec2(cos(angle) * uv.x + sin(angle) * uv.y, -sin(angle) * uv.x + cos(angle) * uv.y);

    norm -= head_height;
    uv.x -= norm;

    uv.y = abs(uv.y);
    float head = max(ollj_rotate(uv) - head_height, -uv.x);

    uv.x = (.5 * m_stretch(2. * uv.x + norm, norm));
    uv.y = (.5 * m_stretch(2. * uv.y, stem_width));
    float stem = length(uv);

    return min(head, stem);
}

// ------------------------------------------------------------------------------------------------

mat2 MD(float a) {return mat2(vec2(cos(a), -sin(a)), vec2(sin(a), cos(a)));}

float angle2d(vec2 c, vec2 e) {
    float theta = atan(e.y-c.y, e.x-c.x);
    return theta;
}

float my_sign(float v){return v<0.?-1.:1.;}


// https://www.shadertoy.com/view/llyXRW
#define C(c) U.x-=.5; T+= U.x<.0||U.x>1.||U.y<0.||U.y>1. ?vec4(0): textureGrad( iChannel3, U/16. + fract( vec2(c, 15-c/16) / 16.), dFdx(U/16.),dFdy(U/16.) )
#define initMsg vec4 T = vec4(0)
#define endMsg  return length(T.yz)==0. ? 0. : T.x

// U.x+=<X>*(0.5-0.2812*(res.x/0.5)); added to fix proportion moving

float text_z(vec2 U) {
    initMsg;
    U.x+=3.*(0.5-0.2812*(res.x/0.5));
    C(90);C(111);C(111);C(109);
    endMsg;
}

float text_s(vec2 U) {
    initMsg;
    U.x+=10.*(0.5-0.2812*(res.x/0.5));
    C(83);C(112);C(101);C(101);C(100);C(32);C(115);C(99);C(97);C(108);C(101);
    endMsg;
}

float text_g(vec2 U) {
    initMsg;
    U.x+=6.*(0.5-0.2812*(res.x/0.5));
    C(71);C(114);C(97);C(118);C(105);C(116);C(121);
    endMsg;
}

float text_t(vec2 U) {
    initMsg;
    U.x+=5.*(0.5-0.2812*(res.x/0.5));
    C(84);C(111);C(116);C(97);C(108);C(126);
    endMsg;
}

float text_m(vec2 U) {
    initMsg;
    U.x+=5.5*(0.5-0.2812*(res.x/0.5)); //4.+1.5
    C(77);C(111);C(117);C(115);C(101);;
    endMsg;
}

float text_f(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(70);C(111);C(114);C(99);C(101);
    endMsg;
}

float text_n(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5)); //3.+1.
    C(78);C(111);C(110);C(101);
    endMsg;
}

float text_ms(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(83);C(112);C(97);C(119);C(110);
    endMsg;
}

float text_r(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(82);C(101);C(115);C(101);C(116);
    endMsg;
}

float text_c(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(67);C(108);C(101);C(97);C(110);
    endMsg;
}

float text_nui(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(110);C(111);C(32);C(85);C(73);
    endMsg;
}

float text_floor(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(70);C(108);C(111);C(111);C(114);C(48);
    endMsg;
}

float text_floor2(vec2 U) {
    initMsg;
    U.x+=4.*(0.5-0.2812*(res.x/0.5));
    C(70);C(108);C(111);C(111);C(114);C(49);
    endMsg;
}

void Cd(inout vec2 U, inout vec4 T, in int c){
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
        Cd(U,T,48+tv);
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

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

bool is_scrollx(vec2 p){
    return (-p.y>res.y-0.035)&&(-p.x<res.x-0.035);
}

bool is_scrolly(vec2 p){
    return (-p.x>res.x-0.035);
}

bool is_reset(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.13)*step(abs(p.y+0.3),0.035)>0.5);
}

bool is_clean(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.13)*step(abs(p.y+0.2),0.035)>0.5);
}

bool is_grav(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.115)*step(abs(p.y-0.28),0.115)>0.5);
}

bool is_n(vec2 p){
    return (step(abs(p.x-0.3994*(res.x/0.5)),0.13)*step(abs(p.y-0.07),0.03)>0.5);
}

bool is_f(vec2 p){
    return (step(abs(p.x-0.3994*(res.x/0.5)),0.13)*step(abs(p.y-0.01),0.03)>0.5);
}

bool is_s(vec2 p){
    return (step(abs(p.x-0.3994*(res.x/0.5)),0.13)*step(abs(p.y+0.05),0.03)>0.5);
}

bool is_speed(vec2 p){
    return (step(abs(p.x-0.16994*(res.x/0.5)),0.15)*step(abs(p.y-.44),0.03)>0.5);
}

bool is_zoom(vec2 p){
    return (step(abs(p.x+0.26994*(res.x/0.5)),0.15)*step(abs(p.y-.44),0.03)>0.5);
}

bool is_m_scroll(vec2 p){
    return ((!(is_scrollx(p)&&is_scrolly(p)))&&((step(abs(p.x-0.3937*(res.x/0.5)),0.115)+step(abs(p.y-.44),0.03))<0.5));
}

bool is_nui(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.13)*step(abs(p.y+0.4),0.035)>0.5);
}

bool is_floor(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.1)*step(abs(p.y+0.1),0.015)>0.5);
}
bool is_floor2(vec2 p){
    return (step(abs(p.x-0.3937*(res.x/0.5)),0.1)*step(abs(p.y+0.14),0.015)>0.5);
}

float draw_grav_w(vec2 uv, vec2 im){
    vec2  arrow_uv = uv;
    float arrow_norm =clamp(length(im),0.05,1.); 
    float arrow_angle = angle2d(vec2(0.),im);
    float arrow_head_height = .1;  
    float arrow_stem_width = .04; 
    float arrow_aa = (4. * 1. / iResolution.y)*7.5;
    float arrow=0.;
    arrow = sdf_arrow(arrow_uv, arrow_norm, arrow_angle, arrow_head_height, arrow_stem_width);
    arrow = smoothstep(arrow_aa, 0., arrow);

    return arrow;
}

const vec3 whitel = vec3(0xdc, 0xe0, 0xd1) / float(0xff);
const vec3 darkb = vec3(0x00, 0x20, 0x59) / float(0xff);
const vec3 redd = vec3(0xe1, 0x46, 0x14) / float(0xff);
const vec3 green = vec3(0x00, 0x66, 0x33) / float(0xff);

vec4 draw_ui(vec2 fc){
    vec2 uv=fc/iResolution.y-res;
    vec3 col=vec3(0.);
    bool is_nuion=loadval(ivec2(1,0)).x<=0.;
    float a=0.;
    if(is_nuion){
    if(is_scrolly(uv)){
        float scp=loadval(ivec2(0,0)).w;
        if((uv.y+res.y<scp+0.05)&&(uv.y+res.y>scp-0.05))
            col=whitel*0.5;
        else
            col=whitel;
        a=0.68;
    }
    else
    if(is_scrollx(uv)){
        float scp=loadval(ivec2(0,0)).z;
        if((uv.x+res.x<scp+0.05)&&(uv.x+res.x>scp-0.05))
            col=whitel*0.5;
        else
            col=whitel;
        a=0.68;
    }}
    
    if(is_nuion)
    if(uv.y>0.3){
        float d=text_z((uv+vec2(0.47817*(res.x/0.5),-0.40))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_s((uv+vec2(0.19689*(res.x/0.5),-0.40))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_g((uv+vec2(-0.28127*(res.x/0.5),-0.40))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_t((uv+vec2(0.11251*(res.x/0.5),-0.30))*13.);
        col+=whitel*d;
        a=max(a,d);
        if((uv.x>0.0562*(res.x/0.5))&&(uv.x<0.28127*(res.x/0.5))&&(uv.y<0.4))
        {
            float max_pos=abs(loadval(ivec2(1,0)).x);
            float max_posy=abs(loadval(ivec2(1,0)).y);
            d=print_int((uv+vec2(-0.19689*(res.x/0.5),-0.30))*13.,int(max_pos/SSIZE)*int(max_posy*H/2.)/2);
            col+=whitel*d;
            a=max(a,d);
        }
    }
    
    if(is_nuion)
    if((uv.x>0.0562*(res.x/0.5))&&(uv.y>-0.1)){
        float d=text_m((uv+vec2(-0.28127*(res.x/0.5),-0.10))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_n((uv+vec2(-0.3094*(res.x/0.5),-0.03))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_f((uv+vec2(-0.3094*(res.x/0.5),0.03))*13.);
        col+=whitel*d;
        a=max(a,d);
        d=text_ms((uv+vec2(-0.3094*(res.x/0.5),0.09))*13.);
        col+=whitel*d;
        a=max(a,d);
        int sid=int(loadval(ivec2(1,1)).w);
        if(sid==0)
            if(is_n(uv)){
                d=.8;
                col+=green;
                a=max(a,d);
            }
        if(sid==1)
            if(is_f(uv)){
                d=.8;
                col+=green;
                a=max(a,d);
            }
        if(sid==2)
            if(is_s(uv)){
                d=.8;
                col+=green;
                a=max(a,d);
            }
    }
    
    if(is_reset(uv)&&is_nuion)
    {
        float d=1.;
        col+=redd*d;
        a=max(a,d*0.75);
        d=text_r((uv+vec2(-0.3094*(res.x/0.5),0.34))*13.);
        col+=whitel*d;
        a=max(a,d);
    }
    
    if(is_clean(uv)&&is_nuion)
    {
        float d=1.;
        col+=darkb*d;
        a=max(a,d*0.75);
        d=text_c((uv+vec2(-0.3094*(res.x/0.5),0.24))*13.);
        col+=whitel*d;
        a=max(a,d);
    }
    
    if(is_grav(uv))
    {
        vec2 gravity=loadval(ivec2(0,1)).xy;
        float d=1.;
        col=vec3(0.);
        a=max(a,d*(0.6-(is_nuion?0.:0.3)));
        d=draw_grav_w((uv-vec2(0.3937*(res.x/0.5),0.28))*7.5,gravity);
        col=whitel*d;
        a=max(a,d);
    }
    
    if(is_zoom(uv))
    {
        float state=loadval(ivec2(0,0)).x*0.15*2.;
        float d=1.-(is_nuion?0.:0.3);
        col=vec3(0.);
        if(abs(uv.x+0.26994*(res.x/0.5)-state+0.15-0.007)>0.015)
            col=whitel*d;
        else
            col=whitel*0.5;
        a=max(a,d*0.68);
    }
    
    if(is_speed(uv))
    {
        float state=loadval(ivec2(0,0)).y*0.15*2.;
        float d=1.-(is_nuion?0.:0.3);
        col=vec3(0.);
        if(abs(uv.x-0.16994*(res.x/0.5)-state+0.15-0.007)>0.015)
            col=whitel*d;
        else
            col=whitel*0.5;
        a=max(a,d*0.68);
    }
    
    if(is_nui(uv))
    {
        float d=1.-(is_nuion?0.:0.3);
        col+=darkb*d;
        a=max(a,d*0.75);
        d=text_nui((uv+vec2(-0.3094*(res.x/0.5),0.44))*13.);
        col+=whitel*d;
        a=max(a,d);
    }
    
    if(is_floor(uv)&&is_nuion)
    {
        float d=1.;
        if(loadval(ivec2(0,1)).w>=0.)col+=green*d;
        a=max(a,d*0.75);
        d=text_floor((uv+vec2(-0.324*(res.x/0.5),0.13))*18.);
        col+=whitel*d;
        a=max(a,d);
    }
    if(is_floor2(uv)&&is_nuion)
    {
        float d=1.;
        if(loadval(ivec2(0,1)).w<0.)col+=green*d;
        a=max(a,d*0.75);
        d=text_floor2((uv+vec2(-0.324*(res.x/0.5),0.168))*18.);
        col+=whitel*d;
        a=max(a,d);
    }
    
    
    col=clamp(col,0.,1.);
    //a=dot(col,vec3(1.))/3.;
    return vec4(col,a);
}

// data
// [0,0] [zoom,speed_scale,posx,posy]
// [1,0] [iResolution.x*3.,iResolution.y,is_reset,is_clean] //sign of [x,y] x for noUI flag, y for click once
// [1,1] [focus_posx,focus_posy,is_focus,n/f/s]
// [0,1] [grav_x,grav_y,last_mouse.x,last_mouse.y] //sign of [z,w] w for floor0/1

vec4 init(ivec2 io){
    if(io==ivec2(0,0)){
        float z=.42;
        float s=.4;
        float px=res.x/2.;
        float py=0.01;
        return vec4(z,s,px,py);
    }
    if(io==ivec2(1,0)){
        float irx=-iResolution.x*SSIZE; //size of board //bug float
        float iry=-iResolution.y; //only for init/reset
        float a=-1.;
        float b=-1.;
        return vec4(irx,iry,a,b);
    }
    if(io==ivec2(1,1)){
        float fpx=0.;
        float fpy=0.;
        float a=-1.;
        float b=0.;
        return vec4(fpx,fpy,a,b);
    }
    if(io==ivec2(0,1)){
        float gx=0.0;
        float gy=-0.5;
        float a=0.;
        float b=0.;
        return vec4(gx,gy,a,b);
    }	
    return vec4(0.);
}

vec4 store_data(vec2 fc){
    vec4 col=vec4(0.);
    ivec2 io=ivec2(fc);
    if(iFrame<10){
        col=init(io);
        return col;
    }
    
    vec4 focus_dat=loadval(ivec2(1,1));
    vec2 ifp=focus_dat.xy/iResolution.y-res;
    bool is_nuion=loadval(ivec2(1,0)).x<0.;
    
    if(io==ivec2(0,0)){
        vec4 self_dat=loadval(ivec2(0,0));
        float z=self_dat.x;
        float s=self_dat.y;
        float px=self_dat.z;
        float py=self_dat.w;
        if(focus_dat.z>0.){
            vec2 im=iMouse.xy/iResolution.y-res;
            if(is_scrolly(ifp)&&is_nuion){
                py=im.y+res.y;
            }
            if(is_scrollx(ifp)&&is_nuion){
                px=im.x+res.x;
            }
            if(is_m_scroll(ifp)||(!is_nuion)){
                vec4 px_dat=loadval(ivec2(0,1));
                vec4 px_dat2=loadval(ivec2(1,1));
                if(px_dat2.w<0.5){
                vec2 iom=abs(px_dat.zw)/iResolution.y-res;
                px+=(-im.x+iom.x)*max(0.001,SCALE_size_non_linear(z));
                py+=(-im.y+iom.y)*max(0.001,SCALE_size_non_linear(z));
                }
                
            }
            if(is_zoom(ifp)){
                z=((im.x+0.26994*(res.x/0.5))+0.15)/(0.15*2.);
                z=clamp(z,0.001,1.);
            }
            if(is_speed(ifp)){
                s=((im.x-0.16994*(res.x/0.5))+0.15)/(0.15*2.);
                s=clamp(s,0.,1.);
            }
        }
        px=clamp(px,-0.01,iResolution.x/iResolution.y+0.01);
        py=clamp(py,-0.005,1.005);
        col=vec4(z,s,px,py);
        return col;
    }
    
    if(io==ivec2(1,0)){
        vec4 self_dat=loadval(ivec2(1,0));
        float irx=self_dat.x;
        float iry=self_dat.y;
        float a=-1.;
        float b=-1.;
        
        if(focus_dat.z>0.){
            if(is_reset(ifp)&&is_nuion){
                
                irx=my_sign(irx)*iResolution.x*SSIZE;
                iry=my_sign(iry)*iResolution.y;
                a=1.;
            }
            if(is_clean(ifp)&&is_nuion){
                b=1.;
            }
            if(is_nui(ifp)&&(iry<0.)){
                irx=-irx;
            }
            iry=abs(iry);
        }
        else{
            iry=-abs(iry);
        }
        
        col = vec4(irx,iry,a,b);
        return col;
    }
    
    if(io==ivec2(1,1)){
        vec4 self_dat=loadval(ivec2(1,1));
        float fpx=self_dat.x;
        float fpy=self_dat.y;
        float a=self_dat.z;
        float b=self_dat.w;
        
        if(focus_dat.z>0.)
            if(is_n(ifp)&&is_nuion)b=0.;
            if(is_f(ifp)&&is_nuion)b=1.;
            if(is_s(ifp)&&is_nuion)b=2.;
        
        if(iMouse.z>0.){
            if(a<0.){
                fpx=iMouse.x;
                fpy=iMouse.y;
            }
            a=1.;
        }
        else{
            a=-1.;
        }
        col = vec4(fpx,fpy,a,b);
        return col;
    }
    
    if(io==ivec2(0,1)){
        vec4 self_dat=loadval(ivec2(0,1));
        float gx=self_dat.x;
        float gy=self_dat.y;
        float a=self_dat.z;
        float b=self_dat.w;
        
        if(focus_dat.z>0.){
            if(is_grav(ifp)){
                vec2 im=iMouse.xy/iResolution.y-res;
                im+=-vec2(0.3937*(res.x/0.5),0.28);
                
                im*=7.5;
                im=normalize(im)*min(length(im),1.);
                //im=clamp(im,-1.,1.);
                gx=im.x;
                gy=im.y;
            }
            if(is_floor(ifp)){
                b=abs(b);
            }
            if(is_floor2(ifp)){
                b=-abs(b);
            }
        }
        a=my_sign(a)*iMouse.x;
        b=my_sign(b)*iMouse.y;
        col = vec4(gx,gy,a,b);
        return col;
    }
    
    return vec4(col);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    if(any(greaterThan(fragCoord,vec2(2.))))
        fragColor=draw_ui(fragCoord);
    else
        fragColor=store_data(fragCoord);
}
