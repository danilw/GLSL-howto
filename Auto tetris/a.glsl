// Created by Danil (2019+) https://github.com/danilw
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

// logic (bit display)

// data

// tetris board need 10*22=220 bits to store data(1/0 block free/non)
// 1 pixel can store 24*4=96bits
// to save full board used
// 2*96(two pixels) + 24(1 component of third pixel)+4( four bits second component third pixel)

// [pixel 1] [pixel 2] [x (24bit), 4 bit of y, z unused, w unused,]
// AI logic saved in unused blocks


// unused blocks [pixel3].zw (3 values in each compoinent)

// z used for player board and AI
// z [a,b,c] a = position of current block(as id in map array)
// b = time to live left for block animation(move down animation) (time to live in frames)
// c = ID of current block (0=random new)

// w [a,b,c]  a = action(look define actions)
// [b,c] (0xffff) = score, and sign(+- of whole pixel) for game over for this board

// logic
// on the "every 3-rd pixel" and "data" pixels execute saved action

ivec2 ipx;

//no unrol loops, disabled it make shader work much slower and comile same slow
//#define alp min(0, iFrame)
#define alp 0

int bits2Int(int start);
void rotate_la(inout int el_ID);

int gai() {
#if AI > 0
    return AI;
#endif
    return int((iResolution.x * iResolution.y)) / 3;
}

int index_idx() {
    return (ipx.y * int(iResolution.x) + ipx.x) / 3;
}

vec4 loadval(ivec2 ipx) {
    return texelFetch(iChannel0, ipx, 0);
}

vec4 loadval2(ivec2 ipx) {
    return texelFetch(iChannel1, ipx, 0);
}

vec4 lgs2() {
    return loadval2(ivec2(0., 1.));
}

vec4 lll() {
    return loadval2(ivec2(iResolution.xy - 1.));
}

void init_globals(vec2 fragCoord) {
    ipx = ivec2(fragCoord - 0.5);
}

//save state
vec4 save_map() {
    int exidx = index_idx();
#ifdef debug
    //show that pixels on "screen edge" is okey (where pixel line go to next line on heigh)
    if (exidx >= int(iResolution.x) / 3)if (((exidx) % (int(iResolution.x) / 3)) == 0)return vec4(0xffffff);
#endif
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;
    vec4 retc = vec4(0.);
    for (int i = 0 + alp; i < 4; i++) {
        ivec3 packme = ivec3(bits2Int(imidx * 4 * 24 + i * 24), bits2Int(imidx * 4 * 24 + i * 24 + 8), bits2Int(imidx * 4 * 24 + i * 24 + 16));
        retc[i] = float(encodeval16(packme));
    }
    return retc;
}

//logic pixels
ivec3 logicz = ivec3(0);
ivec3 logicw = ivec3(0);
bool is_end = false;
bool is_end_lg = false;

void save_logic(inout vec4 fragColor) {
    int exidx = index_idx();
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;
    if (imidx != 2)return;
    fragColor.zw = vec2(encodeval16(logicz), encodeval16(logicw));
    if(is_end||is_end_lg)fragColor.z=-100.;
}

//load map[array] on init(first frame or reset
void init_tablepx(out vec4 fragColor) {
    fragColor=vec4(0.);
    if (index_idx() >= gai()) {
        fragColor = vec4(0.);
        return;
    }
    fragColor = save_map();
    save_logic(fragColor);
}

// only data logic
//-----------------------------

//same as in Image
ivec4 loadat(int itt, int midg) {
    int midy = (3 * midg) / int(iResolution.x);
    int midx = (midg * 3 - (midy) * int(iResolution.x));
    midx += itt;
    if (midx >= int(iResolution.x)) {
        midx = midx - int(iResolution.x);
        midy += 1;
    }
    return ivec4(loadval(ivec2(midx, midy)));
}

void loadlogic() {
    int midg = index_idx();
    ivec2 tpx = loadat(2, midg).zw;
    logicz = decodeval16(tpx[0]);
    logicw = decodeval16(tpx[1]);
    if(tpx.x<0)is_end=true;
}

// little optimized
void load_mapbits() {
    int exidx = index_idx();
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;
    // load only single pixel(96bits) for data logic, and full map for player(AI) logic(every 3-rd pixel)
    // load 2 pixels if action afc_e (burn lines)
    int iml = 1;
    if(logicw[0]==afc_e)iml=2;
#ifndef debug
    if (imidx == 2) {
        iml = 3;
        imidx = 0;
    }
#endif
    for (int jji = 0 + alp; jji < iml; jji++) {
        int nBits = 8;
        ivec4 pixeldata = loadat(imidx, exidx);
        vec4 unppixeldata[3];
        vec3 val1 = vec3(decodeval16(pixeldata[0]));
        vec3 val2 = vec3(decodeval16(pixeldata[1]));
        vec3 val3 = vec3(decodeval16(pixeldata[2]));
        vec3 val4 = vec3(decodeval16(pixeldata[3]));
        unppixeldata[0] = vec4(val1, val2.x);
        unppixeldata[1] = vec4(val2.yz, val3.xy);
        unppixeldata[2] = vec4(val3.z, val4);
        int gidx = 96 * imidx;
        for (int ii = 0 + alp; ii < 3; ii++)
            for (int jj = 0 + alp; jj < 4; jj++) {
                int n = int(unppixeldata[ii][jj]);
#ifndef debug
                if (n == 0) {gidx += 8;continue;} //work only on free map array
#endif
                for (int i = 0 + alp; i < nBits; ++i, n /= 2) {
                    if (gidx >= msize.x * msize.y)break;
                    switch (n % 2) {
                        case 0:map[gidx] = 0;break;
                        case 1:map[gidx] = 1;break;
                    }
                    gidx++;
                }
            }
        imidx++;
    }
}
//-----------------------------


void debug_draw() {
    //exidx is bord id, you can debug draw anything to any board for debug
    //set map[index]=0 or 1;
    int exidx = index_idx();
    //debug draw, anim bits
    //frame
    int imid = int(mod(float(iFrame) / 3. + float(exidx), float(msize.x * msize.y)));
    //time
    //int imid=int(mod(iTime*10.+mod(float(exidx),float(msize.x*msize.y)),float(msize.x*msize.y)));
    map[imid] = 1;
    imid = imid - 3 >= 0 ? imid - 3 : msize.x * msize.y + (imid - 3);
    map[imid] = 0;
    // look save_map() function also
}


// rest is player/AI logic
//-----------------------------

int block_it[bsize*bsize];

void block_byid(int id){
    switch (id) {
        case 0:block_it=block_I0;break;
        case 1:block_it=block_I1;break;
        case 2:block_it=block_T0;break;
        case 3:block_it=block_T1;break;
        case 4:block_it=block_T2;break;
        case 5:block_it=block_T3;break;
        case 6:block_it=block_L0;break;
        case 7:block_it=block_L1;break;
        case 8:block_it=block_L2;break;
        case 9:block_it=block_L3;break;
        case 10:block_it=block_Lr0;break;
        case 11:block_it=block_Lr1;break;
        case 12:block_it=block_Lr2;break;
        case 13:block_it=block_Lr3;break;
        case 14:block_it=block_O0;break;
        case 15:block_it=block_Z0;break;
        case 16:block_it=block_Z1;break;
        case 17:block_it=block_Zr0;break;
        case 18:block_it=block_Zr1;break;
    }
}

void draw_block_at(int el_pos, int el_ID) {
    block_byid(el_ID);
    int gid = el_pos;
    for (int i = 0 + alp; i < b_sizes[el_ID][1]; i++) {
        for (int j = 0 + alp; j < b_sizes[el_ID][0]; j++) {
            if ((gid >= msize.x * msize.y) || (gid < 0))break;
            if (block_it[i * bsize + j] == 1)map[gid] = 1;
            gid++;
        }
        gid += 10 - b_sizes[el_ID][0];
    }
}

//same as draw
void delete_block_at(int el_pos, int el_ID) {
    block_byid(el_ID);
    int gid = el_pos;
    for (int i = 0 + alp; i < b_sizes[el_ID][1]; i++) {
        for (int j = 0 + alp; j < b_sizes[el_ID][0]; j++) {
            if ((gid >= msize.x * msize.y) || (gid < 0))break;
            if (block_it[i * bsize + j] == 1)map[gid] = 0;
            gid++;
        }
        gid += 10 - b_sizes[el_ID][0];
    }
}

//check for free blocks
bool check_block_at(int el_pos, int el_ID) {
    if(el_pos-(el_pos/10)*10>10-b_sizes[el_ID][0])return false;
    if (el_pos < 0)return false;
    block_byid(el_ID);
    int gid = el_pos;
    for (int i = 0 + alp; i < b_sizes[el_ID][1]; i++) {
        for (int j = 0 + alp; j < b_sizes[el_ID][0]; j++) {
            if (gid >= msize.x * msize.y)break;
            if ((block_it[i * bsize + j] == 1)&&(map[gid] == 1))return false;
            gid++;
        }
        gid += 10 - b_sizes[el_ID][0];
    }
    return true;
}

void delete_line_at(int el_pos) {
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;
    int gidx = 96 * imidx;
    for (int i = el_pos + alp; i < gidx+96; i++) {
        if(i>=msize.x*msize.y)break; //OpenGL bug, without this rule score(el_sc) of board ruined
        map[i] = (i+10<msize.x*msize.y)?map[i+10]:0;
    }
}

int apply_move(int el_pos, int el_act, inout int el_ID);

void data_action() {
    int exidx = index_idx();
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;

    //save modified values if this is logic pixel imidx==2
    ivec3 logicz_l = logicz;
    ivec3 logicw_l = logicw;
    if (imidx == 2)loadlogic();

    int el_pos = logicz[0];
    int el_ID = logicz[2];
    int el_act = logicw[0];
    if ((el_act == draw) || (el_act == down_e) || (el_act == left_e) || (el_act == right_e) || (el_act == rotate_e)) {
        delete_block_at(el_pos, el_ID);
        el_pos = apply_move(el_pos, el_act, el_ID);
        draw_block_at(el_pos, el_ID);
    }
    if (el_act == afc_e) {
        delete_line_at(el_pos);
    }
    //return saved logic values
    logicz = logicz_l;
    logicw = logicw_l;
}

void save_ltmp(int el_pos, int el_ttl, int el_ID, int el_act, int el_sc) {
    //save result
    logicz[0] = el_pos;
    logicz[1] = el_ttl;
    logicz[2] = el_ID;
    logicw[0] = el_act;
    logicw.yz = ivec2(el_sc >> 8, el_sc & 0xff);
}

void rotate_la(inout int el_ID);

//check for block hit and apply action
int ltoe_action(int el_pos, int el_act, int el_ID) {
    delete_block_at(el_pos, el_ID);
    if (el_act == down_l) {
        int tact = afc;
        if (el_pos - 10 >= 0)if (check_block_at(el_pos - 10, el_ID))tact = down_e;
        return tact;
    }
    if (el_act == left_l) {
        int tact = draw;
        if ((el_pos - 1 >= 0)&&((el_pos - 1) / 10 == el_pos / 10))if (check_block_at(el_pos - 1, el_ID))tact = left_e;
        return tact;
    }
    if (el_act == right_l) {
        int tact = draw;
        if ((el_pos + b_sizes[el_ID][0]) / 10 == (el_pos) / 10)if (check_block_at(el_pos + 1, el_ID))tact = right_e;
        return tact;
    }
    if (el_act == rotate_l) {
        int tact = draw;
        rotate_la(el_ID);
        if ((el_pos + b_sizes[el_ID][0] - 1) / 10 == (el_pos) / 10)if (check_block_at(el_pos, el_ID))tact = rotate_e;
        return tact;
    }
    return draw;
}

int apply_move(int el_pos, int el_act, inout int el_ID) {
    if (el_act == down_e) {
        el_ID = el_ID;
        el_pos = (el_pos - 10);
        return el_pos;
    }
    if (el_act == left_e) {
        el_ID = el_ID;
        el_pos = (el_pos - 1);
        return el_pos;
    }
    if (el_act == right_e) {
        el_ID = el_ID;
        el_pos = (el_pos + 1);
        return el_pos;
    }
    if (el_act == rotate_e) {
        rotate_la(el_ID);
        el_pos = el_pos;
        return el_pos;
    }
    return el_pos;
}

//burn lines
int after_ac(inout int el_pos, int el_ID, inout int el_sc) {
    for(int k=0 + alp;k<b_sizes[el_ID][1];k++){
        int eval=(el_pos/10)*10+k*10;
        if(eval>=msize.x*msize.y)return nac;
        int gid=0;
        for(int i=eval + alp;i<eval+10;i++){if(map[i]==0){break;}else gid++;};
        if(gid==10){el_pos=eval;el_sc++;return afc_e;}
    }
    return nac;
}

// AI
//-----------------------------

// its imposible to code "good tetris AI(bot)" for GLSL
// "good bot" need too many loops for calculate all scores for al rotations on full board
// I tried... it(good AI) crash Nvidia driver at 10k bots, and very slow even on 100 bots(freez frame on calcultion)
// and ~20 sec shader compile time

// code better bot if you can, my bot is VERY bad


// this is "very bad bot" it can burn ~30 lines then it dead
// logic check only "place block to have minimal height" thats all

int AI_pos_gen(inout int el_ID) {
    int result_ID = el_ID;
    int result_pos = 20 * 10 + 0;
    
    //get max height for every line
    int maxh = 0;
    int tval_h[msize.x] = int[](0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    for (int i = msize.y - 1 + alp; i >= 0; i--) {
        for (int j = 0 + alp; j < msize.x; j++) {
            if (!bool(tval_h[j]) && bool(map[i * msize.x + j])) {
                tval_h[j] = i;
                maxh = max(maxh, i);
            }
        }
    }

    int gtth = 999;
    int bht = 999;
    int start_id = el_ID;
    const int exceptit[5] = int[](11, 12, 9, 8, 4); //list of better rotation for same height
    for (int k = 0 + alp; k < 4; k++) {
        for (int i = 0 + alp; i < msize.x - b_sizes[el_ID].x + 1; i++) {
            int tmax = tval_h[i];
            for (int lm = i + alp; (lm < i + b_sizes[el_ID].x)&&(lm < 10); lm++)tmax = max(tmax, tval_h[lm]);
            for (int j = maxh + alp; j >= tmax; j--) {
                if (check_block_at(j * 10 + i, el_ID)) {
                    if ((j < bht) || ((j == bht)&&(b_sizes[el_ID].y < gtth))) {
                        gtth = b_sizes[el_ID].y;
                        bht = j;
                        result_ID = el_ID;
                        result_pos = 20 * 10 + i;
                    } else if ((j == bht)&&(b_sizes[el_ID].y <= gtth)) {
                        bool imv = false;
                        if (b_sizes[el_ID].y == gtth)for (int op = 0; (op < 5)&&(!imv); op++)imv = exceptit[op] == el_ID;
                        if (imv) {
                            gtth = b_sizes[el_ID].y;
                            bht = j;
                            result_ID = el_ID;
                            result_pos = 20 * 10 + i;
                        }
                    }
                }
            }
        }
        rotate_la(el_ID);
        if (start_id == el_ID)break;
    }

    el_ID = result_ID;
    return result_pos;
}

//-----------------------------

//if any block(1) on 21 line then end
void isend(int el_pos){
    if(el_pos>17*10)for(int i=20*10 + alp;i<20*10+10;i++)if(map[i]==1){is_end_lg=true;return;};
    is_end_lg=false;
}

// AI and player logic work by "switching state per frame" on logic values
void player_AI_logic() {
    int exidx = index_idx();
    int imidx = (ipx.y * int(iResolution.x) + ipx.x) - index_idx()*3;
    if (imidx != 2)return;
    bool is_player=false;
    int el_pos = logicz[0]; //position in array
    int el_ttl = logicz[1]; //timer
    int el_ID = logicz[2]; //element id
    int el_act = logicw[0]; //action
    int el_sc = (logicw[1] << 8) + logicw[2]; //score
    //el_sc++; //debug
    
#ifndef no_AI
    is_player=(exidx == 0);
    if ((is_player) && (lgs2().x != 0.))return; //check for pause if player board not selected
#else
    is_player=(exidx == int(lgs2().x));
    if ((!is_player)&&(el_pos < 17 * 10)&&(el_act!=nac))return;
#endif
    
    //spawn new block
    if (el_act == nac) {
        el_act = draw;
        el_ID = int(float(barr - 1) * rand(vec2(ipx) + vec2(mod(iTime, float(0xffff)), mod(iTime, float(0xffff)) / 2.)));
        //el_ID = exidx%(barr); //debug
        el_ttl = is_player?speed:AIspeed;
#ifdef no_AI
        el_pos = 20 * 10 + 4;
#else
        el_pos = is_player?20 * 10 + 4:AI_pos_gen(el_ID);
#endif
        save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
        return;
    }
    
    //check after block is down
    if (el_act == afc) {
        el_act = after_ac(el_pos, el_ID,el_sc);
        isend(el_pos);
        save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
        return;
    }
    
    if (el_act == afc_e) {
        el_act = afc;
        save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
        return;
    }
    
//move down on timer
    el_ttl = (el_ttl - 1 > 0) ? el_ttl - 1 : 0;
    
    if(is_player){
    //key press move
    int tac = int(lgs2().z);
    if ((tac != nac)&&(el_act == draw)) {
        el_act = ltoe_action(el_pos, tac, el_ID);
        save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
        return;
    }
    if ((el_act == down_e) || (el_act == left_e) || (el_act == right_e) || (el_act == rotate_e)) {
        el_pos = apply_move(el_pos, el_act, el_ID);
        if (el_act == down_e)el_ttl = is_player?speed:AIspeed;
        el_act = draw;
        save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
        return;
    }
    }

    
    if (el_ttl == 0) {
        if (el_act == draw) {
            el_act = ltoe_action(el_pos, down_l, el_ID);
            save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
            return;
        }
        if (el_act == down_e) {
            el_pos = apply_move(el_pos, el_act, el_ID);
            el_act = draw;
            el_ttl = is_player?speed:AIspeed;
            save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
            return;
        }
    }
    save_ltmp(el_pos, el_ttl, el_ID, el_act, el_sc);
}
//-----------------------------

void table_worker(out vec4 fragColor) {
    fragColor = vec4(0.);
    loadlogic();
    if(is_end){fragColor = loadval(ipx);return;}
    load_mapbits();
#ifdef debug
    debug_draw();
#else
    player_AI_logic();
    data_action();
#endif
    fragColor = save_map();
    save_logic(fragColor);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    fragColor = vec4(0.);
    init_globals(fragCoord);
    if (lll().x >= 0.) {
        init_tablepx(fragColor);
        return;
    }
    if (index_idx() < gai()) {
        table_worker(fragColor);
        return;
    }
}

//convert bits to int
int bits2Int(int start){
    int ret = 0;
    int nBits=8;
    int ncv = 1;
    start+=7;
    for(int i=nBits-1+alp; i>=0; i--){
        int eval=0;
        if(start-i<msize.x*msize.y)eval=map[start-i];
        if(eval == 1)
            ret+=ncv;
        ncv *= 2;
    }
    return ret;
}

//rotate ID switch
void rotate_la(inout int el_ID){
        switch (el_ID) {
        case 0:el_ID=1;break;
        case 1:el_ID=0;break;
        case 2:el_ID=3;break;
        case 3:el_ID=4;break;
        case 4:el_ID=5;break;
        case 5:el_ID=2;break;
        case 6:el_ID=7;break;
        case 7:el_ID=8;break;
        case 8:el_ID=9;break;
        case 9:el_ID=6;break;
        case 10:el_ID=11;break;
        case 11:el_ID=12;break;
        case 12:el_ID=13;break;
        case 13:el_ID=10;break;
        case 14:el_ID=14;break;
        case 15:el_ID=16;break;
        case 16:el_ID=15;break;
        case 17:el_ID=18;break;
        case 18:el_ID=17;break;
    }
}
