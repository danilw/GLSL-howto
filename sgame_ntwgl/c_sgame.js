
function  program() {

}

function  Keyboard() {

}

function addMethod(object, name, fn) {
    var old = object[ name ];
    object[ name ] = function () {
        if (fn.length == arguments.length)
            return fn.apply(this, arguments);
        else if (typeof old == 'function')
            return old.apply(this, arguments);
    };
}
var uniforms = {};
function cleanu() {
    uniforms = {};
}


var keys = {keyCode: 0};
addMethod(Keyboard, "isKeyDown", function (e) {
    return keys.keyCode == e.charCodeAt(0);
})


addMethod(program, "setUniform", function (e, a) {
    uniforms[e] = a;
    if (isNaN(a)) {
        console.log(e);
    }
})
var br = true;
addMethod(program, "setUniform", function (e, a, b) {
    if (Array.isArray(b))
        uniforms[e] = b;
    else {
        uniforms[e] = [a, b];
        if (isNaN(a) && br) {
            console.log(e);
            br = false;
        }
        if (isNaN(b) && br) {
            console.log(e);
            br = false;
        }
    }



})

addMethod(program, "setUniform", function (e, a, b, c) {
    uniforms[e] = [a, b, c];

})




addMethod(program, "setUniform", function (e, a, b, c, d) {

    uniforms[e] = [a, b, c, d];
})

var maxbullets = 50; //50 best 25 non
var maxen = 50; //25 non best 50 best


function initen() {
    var ret = [];
    for (var i = 0; i < maxen; i++) {
        ret[i] = 0;
    }
    return ret;
}

function initbul() {
    var ret = [];
    for (var i = 0; i < maxbullets; i++) {
        ret[i] = 0;
    }
    return ret;
}


var angle; //ship rotation angle
var radius; //ship radius
var shippos = [0, 0]; //ship coordinates
var animlamp; //sin parameter for laser anim
var zoom; //zoom of game board
var speedx, speedy; //max speed of ship in pizel per sec
var lpower; //laser power 20 low to 1 max
var bulletposx = initbul(); //bullets pos
var bulletposy = initbul(); //bullets pos
var bullethdx = initbul(); //bullets speed
var bullethdy = initbul(); //bullets speed
var bullettimer = initbul(); //bullets
var bulletexpl = initbul(); //bullets
var bulletcounter; //bullets
var enradius;
var bulletanimtimer; //0 to 1.4, 0.7 mid
var fast; //graphic
var best; //graphic

var planetpos1 = [0, 0]; //planets
var planetpos2 = [0, 0]; //planets
var planetpos3 = [0, 0]; //planets
var planetpos4 = [0, 0]; //planets
var planetpos5 = [0, 0]; //planets
var planetpos6 = [0, 0]; //planets
var starpos1 = [0, 0]; //stars
var starpos2 = [0, 0]; //stars
var nebulapos = [0, 0]; //nebula
var en3pos = [0, 0]; //enemy
var lhitpos = [0, 0]; //laser
var wwh; //laser
var en3hit;

var en1counter;
var en2counter;
var en1posx = initen(); //enemy pos
var en1posy = initen(); //enemy pos
var en2posx = initen(); //enemy pos
var en2posy = initen(); //enemy pos
var en1thdx = initen();
var en1thdy = initen();
var en2thdx = initen();
var en2thdy = initen();
var en1timer = initen();
var en2timer = initen();
var en2extimer = initen();

var en1lval = initen(); //1 min .1 max
var en1exval = initen(); //0 min 1 max
var en1llisex = initen();

var en1llisexb = initen();
var en1llishit = initen();
var en2llishit = initen();
var shua;

var tmpen1llisex = initen();
var tmpen1lval = initen();
var tmpen1exval = initen();
var tmpen2llishit = initen();

//needed vars
var zoomtrig;
var animlcounter;
var animlampbtn;
var animbulletbtn;
var paused;
var shifttime = 0;
var shiftpos = [0, 0];
var shspeedx, shspeedy;
var slowmpos = [0, 0];
var camerapos = [0, 0];
var scrcenter = [0, 0];
var bulletalive = initbul();
var en1alive = initen();
var en2alive = initen();
var bulletexplctrl = initbul();
var tmpbulletexplctrl = initbul();
var playzoom;
var playzoomtrig;
var tmpbulletposx = initbul();
var tmpbulletposy = initbul();
var en2dd = initen();
var isnew = initbul();
var tmpen1posx = initen();
var tmpen1posy = initen();
var tmpen2posx = initen();
var tmpen2posy = initen();
var tmpen1timer = initen();
var tmpen2timer = initen();
var tmpen2extimer = initen();
var tmpbulletexpl = initbul();
var tmpbullettimer = initbul();
var exltimer = initbul();
var ta, ta2, ta3;
var shipthwgr = [0, 0];
var shipthwgrt = [0, 0];
var fullscreen;

//speed/mov control
var shipth = [0, 0];
var maxth = 20;
var slowfact = 1.1;
var movcontrolxy = 0.2;

function startposxx() {

    shspeedx = 0;
    shspeedy = 0;
    //most of it UNUSED I keep it only for game map understanding
    planetpos2[0] = -65000.; //r 15k
    planetpos2[1] = -10000.;
    planetpos1[0] = planetpos2[0] + 8000 + 7500 - 2500; //r 5k
    planetpos1[1] = planetpos2[1] + 8000 + 7500 - 2500;

    planetpos3[0] = -40000.; //r 20k
    planetpos3[1] = 10000.;
    planetpos5[0] = planetpos3[0] + 12000 + 10000 - 4000; //r 8k
    planetpos5[1] = planetpos3[1] + 12000 + 10000 - 4000;

    planetpos4[0] = -85000; //r 25k
    planetpos4[1] = 10000;
    planetpos6[0] = planetpos4[0] + 12000 + 12500 - 5250; //r 10500
    planetpos6[1] = planetpos4[1] + 12000 + 12500 - 5250;
    en3pos[0] = planetpos6[0] + 5250. - 450.; //r 900
    en3pos[1] = planetpos6[1] + 10500 - 1090.;

    shippos[0] = planetpos1[0];
    shippos[1] = planetpos1[1];

    starpos1[0] = -65000.; //r 250k
    starpos1[1] = -45000.;

    starpos2[0] = -180000; //r 200k
    starpos2[1] = 8000;
    nebulapos[0] = -200000; //r 200k
    nebulapos[1] = 45000.;
}

function initglslvals(timexxx) {
    fast = false;
    best = true;
    fullscreen = false;
    en3hit = false;
    wwh = false;
    shua = false;
    ta = ta2 = ta3 = 0;
    angle = 0;
    radius = 500;
    enradius = 250;
    animlamp = 1.5;
    animlampbtn = animbulletbtn = false;
    animlcounter = 0;
    zoom = 1.;
    zoomtrig = 0;
    speedx = speedy = 0;
    paused = false;
    shifttime = 0;
    lpower = 20;
    bulletanimtimer = 0;
    bulletcounter = en1counter = en2counter = 0;
    playzoom = 1.;
    playzoomtrig = 0;

    shifttime = timexxx * 0.001;

    startposxx();
    my_setup();

}

var PI = 3.14159265358979323;

var keystates = [0, 0];

//-------------
//logic
class Point {
    constructor(xx, yy) {
        this.x = xx;
        this.y = yy;
    }

    distance(p) {
        var x1 = this.x;
        var x2 = p.x;
        var y1 = this.y;
        var y2 = p.y;

        return parseFloat(Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2)));
    }

}

class vec2 {

    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
}

class body {
    //int orbitslowdown=0; //% slowdown on orbit 0-100%
    //int velslowdown=0; //% slowdown on movement 0-100% (if maxheading>0)

    constructor(massx, radiusx, positionx, headingx) {
        this.mass = massx;
        this.radiusin = radiusx;
        this.origin = positionx;//position
        this.heading = headingx;//velocity 
        this.maxll = 0;
        this.islon = false;
        this.miilive = false;
        this.iterator = 0; //element id, 0 player, 1-2 stars, 3-9 planets, 10-maxbulets+10 bullet,  maxbulets+10-maxenemy+.. enemy1,  maxenemy+..-maxenemy+.. enemy2 
        this.llhitpos = [0, 0];
        this.llhitid = 0; //bind to LinkedList ID
        this.llhit = false;
        this.maxvel = 0; //max speed
        this.orbitpos = 0; //+% orbit radius
        this.isstatic = false; //object dont need to be moved
        this.hit = false; //hit with other object
        this.hitid = 0; //bind to LinkedList ID
    }

    collides(p) {
        if ((this.iterator < 10) || ((this.iterator >= 10) && (p.iterator != 0) && ((this.iterator < maxbullets + 10) || (p.iterator < maxbullets + 10)))) {

            var temp = new Point(this.origin.x + this.heading.x, this.origin.y + this.heading.y);
            var distance = temp.distance(p.origin);
            if (distance < this.radiusin + p.radiusin * (1 + this.orbitpos / 100)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    velocityCheck() {
        if (this.maxvel > 0) {
            if (Math.abs(this.heading.x) + Math.abs(this.heading.y) > this.maxvel) {
                var pers = parseFloat((((Math.abs(this.heading.x) + Math.abs(this.heading.y)) - this.maxvel) / this.maxvel));

                this.heading.x = (this.heading.x) / (1 + pers);
                this.heading.y = (this.heading.y) / (1 + pers);
            }
        }
    }

    onOrbit(p) {

        var deltaX = (this.origin.x + this.heading.x) - p.origin.x;
        var deltaY = (this.origin.y + this.heading.y) - p.origin.y;
        var rad = parseFloat(Math.atan2(deltaY, deltaX));
        var posx = parseFloat((p.radiusin * (1 + this.orbitpos / 100) * Math.cos(rad)));
        var posy = parseFloat((p.radiusin * (1 + this.orbitpos / 100) * Math.sin(rad)));

        var deltaX1 = (this.origin.x) - p.origin.x;
        var deltaY1 = (this.origin.y) - p.origin.y;
        var rad1 = parseFloat(Math.atan2(deltaY1, deltaX1));
        var posx1 = parseFloat((p.radiusin * (1 + this.orbitpos / 100) * Math.cos(rad1)));
        var posy1 = parseFloat((p.radiusin * (1 + this.orbitpos / 100) * Math.sin(rad1)));

        this.heading.x = posx - posx1;
        this.heading.y = posy - posy1;
        this.origin.x = (posx + p.origin.x);
        this.origin.y = (posy + p.origin.y);

    }

    distance(p) {
        var horizontalDistance = p.origin.x - this.origin.x;
        var verticalDistance = p.origin.y - this.origin.y;
        var ret = [horizontalDistance, verticalDistance];
        return ret;

    }

    calculateGravity(p) {
        var mass1 = this.mass;
        var mass2 = p.mass;
        var distanceBetween = this.origin.distance(p.origin);

        return parseFloat(((mass1 * mass2) / Math.pow(distanceBetween, 2)));
    }

    findVector(p) {
        var forceBetween = this.calculateGravity(p);

        var red = this.distance(p);
        var horizontalDistance = red[0];
        var verticalDistance = red[1];

        var totalDistance = Math.abs(horizontalDistance) + Math.abs(verticalDistance);

        var xComponent = (forceBetween / totalDistance) * horizontalDistance;
        var yComponent = (forceBetween / totalDistance) * verticalDistance;

        var toReturn = new vec2(xComponent, yComponent);

        return toReturn;
    }

    sumVector(dq) {

        if (!this.miilive) {
            return;
        }
        var tmplhitx = [0, 0];
        var tmplhity = [0, 0];
        var tmpishit = [0, 0];
        var tmphitid = [0, 0];
        this.llhit = false;
        if (this.islon) {
            for (var i = 0; i < dq.toArray().length; i++) {
                if (this.origin.x != dq.get(i).origin.x && this.origin.y != dq.get(i).origin.y && dq.get(i).miilive) {
                    if (!((dq.get(i).iterator >= 10) && (dq.get(i).iterator < maxbullets + 10))) {

                        var ret = [0, 0];
                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        var an = angle;
                        tm[0] = -this.maxll;
                        ret = rotate2d(tm2, tm, an);
                        var p1 = [shippos[0], shippos[1]];
                        var p2 = [shippos[0] + ret[0], shippos[1] + ret[1]];
                        var fixx = 0;
                        if ((dq.get(i).iterator < 10))
                            fixx = 125;
                        if ((dq.get(i).iterator > 10))
                            fixx = 125 - 17;
                        if ((dq.get(i).iterator == -1))
                            fixx = 250;
                        var c = [dq.get(i).origin.x - fixx, dq.get(i).origin.y - fixx];
                        var r = dq.get(i).radiusin;
                        var ret1 = [0, 0];
                        var ret2 = [0, 0];
                        var axx = interceptOnCircle(p1, p2, c, r);
                        var rr = axx.ret0;
                        ret1 = axx.ret1;
                        ret2 = axx.ret2;

                        if (rr) {
                            if (Math.abs(an) > PI / 2) {
                                tmplhitx[i] = ret1[0] - shippos[0];
                                tmplhity[i] = ret1[1] - shippos[1];
                            } else {
                                tmplhitx[i] = ret2[0] - shippos[0];
                                tmplhity[i] = ret2[1] - shippos[1];
                            }
                        } else {
                            tmplhitx[i] = 0;
                            tmplhity[i] = this.maxll;
                        }
                        var yyy, zzz, fff;

                        //after fix
                        if (rr) {
                            yyy = angle2d(dq.get(i).origin.x - fixx, dq.get(i).origin.y - fixx, shippos[0], shippos[1]);

                            var cx = false;
                            if ((yyy > -PI / 2) && (yyy < PI / 2)) {
                                zzz = an - yyy;
                                if ((zzz > PI / 2)) {
                                    cx = true;
                                } else if ((zzz < -PI / 2)) {
                                    cx = true;
                                }
                            } else {
                                zzz = an + PI - yyy;
                                if (yyy < 0) {
                                    zzz = -PI - yyy + an;
                                }
                                if ((zzz > 0) && (zzz < PI / 2)) {
                                    cx = true;
                                } else if ((zzz < 0) && (zzz > -PI / 2)) {
                                    cx = true;
                                }
                            }
                            if (!cx) {
                                tmplhitx[i] = 0;
                                tmplhity[i] = this.maxll;

                            } else {
                                if (Math.sqrt(Math.abs(tmplhitx[i]) * Math.abs(tmplhitx[i]) + Math.abs(tmplhity[i]) * Math.abs(tmplhity[i])) > this.maxll) {
                                    tmplhitx[i] = 0;
                                    tmplhity[i] = this.maxll;
                                } else {
                                    tmpishit[i] = true;
                                    tmphitid[i] = i;
                                }
                            }

                        }

                    }
                }
            }
            var lmax = this.maxll;
            for (var i = 0; i < dq.toArray().length; i++) {
                if (tmpishit[i]) {
                    var tlm = parseFloat(Math.sqrt(Math.abs(tmplhitx[i]) * Math.abs(tmplhitx[i]) + Math.abs(tmplhity[i]) * Math.abs(tmplhity[i])));
                    if (tlm < lmax) {
                        lmax = tlm;
                        this.llhit = true;
                        this.llhitid = tmphitid[i];
                        this.llhitpos[0] = tmplhitx[i];
                        this.llhitpos[1] = tmplhity[i];
                    }
                }
            }

        }
        if (this.isstatic) {
            return;
        }
        var finalx = new vec2(this.heading.x, this.heading.y);

        var temp = new vec2(0, 0);

        if (this.hit) {

            if (dq.get(this.hitid).miilive) {
                this.velocityCheck();
                this.onOrbit(dq.get(this.hitid));
                return;
            }
            this.hit = false;
        }

        for (var i = 0; i < dq.toArray().length; i++) {
            if (this.origin.x != dq.get(i).origin.x && this.origin.y != dq.get(i).origin.y) {
                //collides hit check
                if (!((dq.get(i).iterator >= 10) && (dq.get(i).iterator < maxbullets + 10))) {
                    if ((this.iterator == 0) && (dq.get(i).iterator > 10)) {
                        continue;
                    }
                    if ((this.iterator >= maxbullets + 10) && (dq.get(i).iterator >= maxbullets + 10)) {
                        continue;
                    }
                    if (((this.iterator < 10) || (this.iterator >= maxbullets + 10)) && (dq.get(i).iterator == -1)) {
                        continue;
                    }
                    if (dq.get(i).miilive) {
                        if (this.collides(dq.get(i))) {

                            this.velocityCheck();
                            this.onOrbit(dq.get(i));
                            this.hitid = i;
                            this.hit = true;
                            finalx.x = 0;
                            finalx.y = 0;
                            break;
                        }
                        temp = this.findVector(dq.get(i));
                        finalx.x = finalx.x + temp.x;
                        finalx.y = finalx.y + temp.y;
                    }
                }
            }
        }

        if (this.hit) {
            return;
        }
        this.heading = finalx;

        this.velocityCheck();
        this.origin.x += this.heading.x;
        this.origin.y += this.heading.y;
        return;
    }

}
;

var shouldRotate;
var bds = new Deque();
var bds2 = new Deque();
var bds3 = new Deque();

function my_setup() {
    //some of it unused
    shouldRotate = false;
    var mass = 150;
    var mass11 = 0;
    var radiusx = 1;
    var origin = new Point(shippos[0], shippos[1]);
    var heading = new vec2(0, 0);
    var maxheading = 40;

    var player = new body(mass, radiusx, origin, heading);
    var player1 = new body(mass11, radiusx, origin, heading);
    player1.isstatic = true;
    player1.iterator = 0;
    player1.maxll = radius * 15;
    player1.miilive = true;
    player.maxvel = maxheading;
    player.orbitpos = 0.5;
    player.iterator = 0;
    player.maxll = radius * 15;
    player.miilive = true;

    var mass1 = 5000000;
    var radius1 = 75000;
    var origin1 = new Point(starpos1[0] + 125000 - 250, starpos1[1] + 125000 - 250);
    var origin11 = new Point(starpos1[0] + 125000 - 17, starpos1[1] + 125000 - 17);
    var heading1 = new vec2(0, 0);

    var sun1 = new body(mass1, radius1, origin1, heading1);
    sun1.isstatic = true;
    sun1.iterator = 1;
    sun1.miilive = true;
    var sun11 = new body(mass1, radius1, origin11, heading1);
    sun11.isstatic = true;
    sun11.miilive = true;
    sun11.iterator = 1;

    var mass2 = 1000000;
    var radius2 = 25000;
    var origin2 = new Point(starpos2[0] + 50000 - 250, starpos2[1] + 50000 - 250);
    var origin22 = new Point(starpos2[0] + 50000 - 17, starpos2[1] + 50000 - 17);
    var heading2 = new vec2(0, 0);

    var sun2 = new body(mass2, radius2, origin2, heading2);
    sun2.isstatic = true;
    sun2.iterator = 2;
    sun2.miilive = true;
    var sun22 = new body(mass2, radius2, origin22, heading2);
    sun22.isstatic = true;
    sun22.iterator = 2;
    sun22.miilive = true;

    var mass4 = 10000;
    var radius4 = 2500;
    var origin4 = new Point(planetpos1[0] + 2500 - 250, planetpos1[1] + 2500 - 250);
    var heading4 = new vec2(0, 0);

    var planet1 = new body(mass4, radius4, origin4, heading4);
    planet1.isstatic = true;
    planet1.iterator = 3;
    planet1.miilive = true;

    var mass5 = 60000;
    var radius5 = 7500;
    var origin5 = new Point(planetpos2[0] + 7500 - 250, planetpos2[1] + 7500 - 250);
    var heading5 = new vec2(0, 0);

    var planet2 = new body(mass5, radius5, origin5, heading5);
    planet2.isstatic = true;
    planet2.iterator = 4;
    planet2.miilive = true;

    var mass6 = 70000;
    var radius6 = 10000;
    var origin6 = new Point(planetpos3[0] + 10000 - 250, planetpos3[1] + 10000 - 250);
    var heading6 = new vec2(0, 0);

    var planet3 = new body(mass6, radius6, origin6, heading6);
    planet3.isstatic = true;
    planet3.iterator = 5;
    planet3.miilive = true;

    var mass7 = 80000;
    var radius7 = 12500;
    var origin7 = new Point(planetpos4[0] + 12500 - 250, planetpos4[1] + 12500 - 250);
    var heading7 = new vec2(0, 0);

    var planet4 = new body(mass7, radius7, origin7, heading7);
    planet4.isstatic = true;
    planet4.iterator = 6;
    planet4.miilive = true;

    var mass8 = 15000;
    var radius8 = 4000;
    var origin8 = new Point(planetpos5[0] + 4000 - 250, planetpos5[1] + 4000 - 250);
    var heading8 = new vec2(0, 0);

    var planet5 = new body(mass8, radius8, origin8, heading8);
    planet5.isstatic = true;
    planet5.iterator = 7;
    planet5.miilive = true;

    var mass9 = 15000;
    var radius9 = 4250;
    var origin9 = new Point(planetpos6[0] + 5250 - 250, planetpos6[1] + 5250 - 250);

    var heading9 = new vec2(0, 0);

    var planet6 = new body(mass9, radius9, origin9, heading9);
    planet6.isstatic = true;
    planet6.iterator = 8;
    planet6.miilive = true;
    var mass111 = 1;
    var radius11 = 500;
    var origin111 = new Point(en3pos[0] - 250, en3pos[1] - 250);
    var heading11 = new vec2(0, 0);

    var en3x = new body(mass111, radius11, origin111, heading11);
    en3x.isstatic = true;
    en3x.iterator = -1;
    en3x.miilive = true;

    bds.push(sun1);
    bds.push(sun2);
    bds.push(player);
    bds.push(en3x);
    bds.push(planet1);
    bds.push(planet2);
    bds.push(planet3);
    bds.push(planet4);
    bds.push(planet5);
    bds.push(planet6);

    bds2.push(sun11);
    bds2.push(sun22);
    bds2.push(player1);
    bds2.push(en3x);

    bds2.push(planet1);
    bds2.push(planet2);
    bds2.push(planet3);
    bds2.push(planet4);
    bds2.push(planet5);
    bds2.push(planet6);

    bds3.push(sun11);
    bds3.push(sun22);
    bds3.push(en3x);
    bds3.push(planet1);
    bds3.push(planet2);
    bds3.push(planet3);
    bds3.push(planet4);
    bds3.push(planet5);
    bds3.push(planet6);

    for (var i = 0; i < maxbullets; i++) {
        var mass10 = 100;
        var radius10 = 1;
        var origin10 = new Point(0, 0);
        var heading10 = new vec2(0, 0);

        var bulletx = new body(mass10, radius10, origin10, heading10);
        bulletx.iterator = i + 10;
        bulletx.isstatic = true;
        bulletx.miilive = false;

        bds2.push(bulletx);
    }

    for (var i = 0; i < maxen; i++) {
        var mass10 = 50;
        var radius10 = 105;
        var radius101 = 1;
        var origin10 = new Point(0, 0);
        var heading10 = new vec2(0, 0);

        var enx = new body(mass10, radius10, origin10, heading10);
        var enxx = new body(mass10, radius101, origin10, heading10);
        enx.iterator = i + 10 + maxbullets;
        enx.isstatic = true;
        enx.miilive = false;
        enxx.iterator = i + 10 + maxbullets;
        enxx.isstatic = true;
        enxx.miilive = false;

        bds2.push(enx);
        bds.push(enx);
        bds3.push(enxx);

        var mass12 = 100;
        var radius12 = 95;
        var radius121 = 1;
        var origin12 = new Point(0, 0);
        var heading12 = new vec2(0, 0);

        var en2x = new body(mass12, radius12, origin12, heading12);
        var en2xx = new body(mass12, radius121, origin12, heading12);
        en2x.iterator = i + 10 + maxbullets + maxen;
        en2x.isstatic = true;
        en2x.miilive = false;
        en2xx.iterator = i + 10 + maxbullets + maxen;
        en2xx.isstatic = true;
        en2xx.miilive = false;

        bds2.push(en2x);
        bds.push(en2x);
        bds3.push(en2xx);

    }
}

//----------
function rotate2d(origin, point, radian) {

    var s = parseFloat(Math.sin(radian));
    var c = parseFloat(Math.cos(radian));
    point[0] -= origin[0];
    point[1] -= origin[1];
    var xnew = point[0] * c - point[1] * s;
    var ynew = point[0] * s + point[1] * c;
    var retval = [0, 0];
    retval[0] = xnew + origin[0];
    retval[1] = ynew + origin[1];
    return retval;

}

function angle2d(cx, cy, ex, ey) {
    var dy = ey - cy;
    var dx = ex - cx;
    var theta = parseFloat(Math.atan2(dy, dx));
    return theta;
}

class reta {

    constructor() {
        this.ret0 = false;
        this.ret1 = [0, 0];
        this.ret2 = [0, 0];
    }

}

function interceptOnCircle(p1, p2, c, r) {

    var p3 = [p1[0] - c[0], p1[1] - c[1]];
    var p4 = [p2[0] - c[0], p2[1] - c[1]];
    var retx = new reta();
    var m = (p4[0] - p3[0]) == 0 ? 1000000 : (p4[1] - p3[1]) / (p4[0] - p3[0]);
    //float m = (p4[1] - p3[1]) / (p4[0] - p3[0]);
    var b = p3[1] - m * p3[0];

    var underRadical = parseFloat((Math.pow(r, 2) * Math.pow(m, 2) + Math.pow(r, 2) - Math.pow(b, 2)));

    if (underRadical < 0) {
        retx.ret0 = false;
        return retx;
    } else {
        var t1 = parseFloat(((-m * b + Math.sqrt(underRadical)) / (Math.pow(m, 2) + 1)));
        var t2 = parseFloat(((-m * b - Math.sqrt(underRadical)) / (Math.pow(m, 2) + 1)));
        var i1 = [t1 + c[0], m * t1 + b + c[1]];
        var i2 = [t2 + c[0], m * t2 + b + c[1]];
        retx.ret1[0] = i1[0];
        retx.ret1[1] = i1[1];
        retx.ret2[0] = i2[0];
        retx.ret2[1] = i2[1];
        retx.ret0 = true;
        return retx;
    }
}

//---------
//draw
/* x, y, x_press, y_press  (in target coords) */
var mouse = [0, 0, 0, 0];

function mouse_press_handler(lbm, rbm) {


    // Wheel reports as button 3(scroll up) and button 4(scroll down)
    /* var mwh=Mouse.getDWheel();
     
     if ((mwh > 0) || (mwh < 0)) { // It's a wheel event
     if (paused) {
     zoomtrig = parseFloat( ((mwh > 0) ? 0.01 * zoom + zoom / 200 : -(0.01 * zoom + zoom / 200)));
     } else {
     playzoomtrig = parseFloat( ((mwh > 0) ? 0.01 * playzoom + playzoom / 200 : -(0.01 * playzoom + playzoom / 200)));
     
     }
     
     }*/
    animbulletbtn = false;
    animlampbtn = false;
    if (lbm) {
        animbulletbtn = true;
        animlampbtn = false;

    } else {
        if (rbm) {
            animlampbtn = true;
            animbulletbtn = false;

        }
    }
}



function
        mouse_move_handler(mousePos, gl) {

    var height;
    height = gl.canvas.height;
    if (animlampbtn) {
        mouse[0] = slowmpos[0] = isNaN(mousePos.x) ? mouse[0] : mousePos.x;
        mouse[1] = slowmpos[1] = isNaN(mousePos.x) ? mouse[1] : height - mousePos.y;
    } else {
        mouse[0] = slowmpos[0] = isNaN(mousePos.x) ? mouse[0] : mousePos.x;
        mouse[1] = slowmpos[1] = isNaN(mousePos.x) ? mouse[1] : height - mousePos.y;
    }

}



function
        keyboard_up_handler(keyss, timex) {
    keys = keyss;
    var keyx = -1;
    keyx = Keyboard.isKeyDown('A') ? 'A' : Keyboard.isKeyDown('W') ? 'W' : Keyboard.isKeyDown('D') ? 'D' : Keyboard.isKeyDown('S') ? 'S' : -1;
    keyx = Keyboard.isKeyDown('P') ? 'P' : Keyboard.isKeyDown('R') ? 'R' : Keyboard.isKeyDown('F') ? 'F' : keyx;

    switch (keyx) {
        case 'A':
            if (keystates['d'] || keystates['d']) {
                keystates['d'] = keystates['D'] = false;
            }
            keystates['a'] = keystates['A'] = true;
            break;
        case 'D':
            if (keystates['a'] || keystates['A']) {
                keystates['a'] = keystates['A'] = false;
            }
            keystates['d'] = keystates['D'] = true;
            break;
        case 'W':
            if (keystates['s'] || keystates['S']) {
                keystates['s'] = keystates['S'] = false;
            }
            keystates['w'] = keystates['W'] = true;
            break;
        case 'S':
            if (keystates['w'] || keystates['W']) {
                keystates['w'] = keystates['W'] = false;
            }
            keystates['s'] = keystates['S'] = true;
            break;
        case 'R':
            playzoom = zoom = 1;
            shiftpos[0] = shiftpos[1] = 0;
            shspeedx = 0;
            shspeedx = 0;
            zoomtrig = 0;
            playzoomtrig = 0;
            break;

        case 'F':
            //glutFullScreenToggle();
            break;
        case 'P':
            paused = !paused;

            if (paused) {
                shifttime = (timex - shifttime);
            } else {
                shifttime = (timex - shifttime);
            }
            ;
            break;

        default:
            keystates['w'] = keystates['W'] = keystates['s'] = keystates['S'] = keystates['a'] = keystates['A'] = keystates['d'] = keystates['D'] = false;
            break;
    }
}

function cameraposs(width, height) {
    if (!paused) {

        if (shipth[0] <= 0) {
            camerapos[0] = -scrcenter[0] * (parseFloat(shipth[0]) / maxth);
        }
        if (shipth[0] > 0) {
            camerapos[0] = -scrcenter[0] * (parseFloat(shipth[0]) / maxth);
        }
        if (shipth[1] <= 0) {
            camerapos[1] = -scrcenter[1] * (parseFloat(shipth[1]) / maxth);
        }
        if (shipth[1] > 0) {
            camerapos[1] = -scrcenter[1] * (parseFloat(shipth[1]) / maxth);
        }
        camerapos[0] -= shippos[0];
        camerapos[1] -= shippos[1];
    } else {
        camerapos[0] = -shippos[0];
        camerapos[1] = -shippos[1];
    }
    /*if(!paused){
     if(mouse[0]<width/2){camerapos[0]=scrcenter[0]-scrcenter[0]*((float)mouse[0]/(width/2));}
     if(mouse[0]>width/2){camerapos[0]=-scrcenter[0]*((float)(mouse[0]-width/2)/(width/2));}
     if(mouse[1]<height/2){camerapos[1]=scrcenter[1]-scrcenter[1]*((float)mouse[1]/(height/2));}
     if(mouse[1]>height/2){camerapos[1]=-scrcenter[1]*((float)(mouse[1]-height/2)/(height/2));}
     camerapos[0]-=shippos[0];
     camerapos[1]-=shippos[1];
     }*/
}

var cd;
var lasttime;
var laspam;
var lewfe1 = initen();
var lewfe2 = initen();
var lewtimen1 = initen();
var lewtimen2 = initen();

function spawnenemy(pass) {

    if (!paused) {
        //if ((ta < PI / 3.)&&(ta > 0.10))
        {
            lasttime += pass;
            if (lasttime > pass * 120) {
                cd = false;
            }
            for (var ii = 0; ii < maxen; ii++) {
                if (cd) {
                    break;
                }
                if (laspam) {

                    if (!en2alive[ii]) {

                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        tm[0] = planetpos4[0] + 12000 + 12500;
                        tm[1] = planetpos4[1] + 12000 + 12500;
                        tm2[0] = planetpos4[0] + 12500;
                        tm2[1] = planetpos4[1] + 12500;
                        var ret = [0, 0];
                        ret = rotate2d(tm2, tm, ta - PI / 2.5);
                        en2posx[ii] = ret[0];
                        en2posy[ii] = ret[1];
                        if ((Math.sqrt(Math.pow(Math.abs(en2posx[ii] - shippos[0]) + Math.abs(en2posy[ii] - shippos[1]), 2)) > 35000)) {
                            cd = true;
                            break;
                        }

                        en2thdx[ii] = 0;
                        en2thdy[ii] = 0;
                        en2alive[ii] = true;
                        en2timer[ii] = 0;
                        lewtimen2[ii] = 0;
                        lewfe2[ii] = false;
                        en2dd[ii] = false;
                        en2extimer[ii] = 0;
                        cd = true;
                        lasttime = 0;
                        en2llishit[ii] = false ? 1 : 0;

                        laspam = !laspam;
                    }
                } else if (!en1alive[ii]) {
                    var tm = [0, 0];
                    var tm2 = [0, 0];
                    tm[0] = planetpos4[0] + 12000 + 12500;
                    tm[1] = planetpos4[1] + 12000 + 12500;
                    tm2[0] = planetpos4[0] + 12500;
                    tm2[1] = planetpos4[1] + 12500;
                    var ret = [0, 0];
                    ret = rotate2d(tm2, tm, ta - PI / 2.5);
                    en1posx[ii] = ret[0];
                    en1posy[ii] = ret[1];
                    if ((Math.sqrt(Math.pow(Math.abs(en1posx[ii] - shippos[0]) + Math.abs(en1posy[ii] - shippos[1]), 2)) > 35000)) {
                        cd = true;
                        break;
                    }

                    en1thdx[ii] = 0;
                    en1thdy[ii] = 0;
                    en1alive[ii] = true;
                    en1timer[ii] = 0;
                    cd = true;
                    lasttime = 0;
                    en1lval[ii] = 1;
                    en1exval[ii] = 0;
                    en1llishit[ii] = false;
                    lewtimen1[ii] = 0;
                    en1llisex[ii] = false;
                    en1llisexb[ii] = false;
                    lewfe1[ii] = false;
                    laspam = !laspam;

                }
                if (ii == maxen - 1) {
                    laspam = !laspam;
                    cd = true;
                }
            }
        }
    }

    if (!paused) {
        en1counter = 0;
        en2counter = 0;
        for (var ii = 0; ii < maxen; ii++) {
            if (en2alive[ii]) {
                en2timer[ii] += pass;
                tmpen2timer[en2counter] = en2timer[ii];
                var ret = [0, 0];
                var tm = [0, 0];
                var tm2 = [0, 0];
                var an = angle2d(shippos[0], shippos[1], en2posx[ii] - 125, en2posy[ii] - 125);

                var tf = parseFloat(Math.sqrt(Math.pow(Math.abs(en2posx[ii] - shippos[0] - 125) + Math.abs(en2posy[ii] - shippos[1] - 125), 2)));
                tm[0] = -25;
                if (tf < 800) {
                    lewfe2[ii] = true;
                }
                if (!lewfe2[ii]) {
                    ret = rotate2d(tm2, tm, an);
                    en2thdx[ii] += ret[0] / 250;
                    en2thdy[ii] += ret[1] / 250;
                } else {
                    en2thdx[ii] = en2thdx[ii] / 1.01;
                    en2thdy[ii] = en2thdy[ii] / 1.01;
                    lewtimen2[ii] += pass;
                    if (lewtimen2[ii] > pass * 10) {
                        lewtimen2[ii] = 0;
                        lewfe2[ii] = tf < 100;

                    }
                }
                if (en2dd[ii]) {
                    en2thdx[ii] = 0;
                    en2thdy[ii] = 0;
                }
                tmpen2posx[en2counter] = en2posx[ii] = en2posx[ii] + en2thdx[ii];
                tmpen2posy[en2counter] = en2posy[ii] = en2posy[ii] + en2thdy[ii];
                tmpen2posx[en2counter] += -shippos[0];
                tmpen2posy[en2counter] += -shippos[1];
                tmpen2llishit[en2counter] = en2llishit[ii];
                tmpen2extimer[en2counter] = en2extimer[ii];
                if (en2dd[ii]) {
                    en2extimer[ii] += 0.016;
                    if (en2extimer[ii] > 1.25) {
                        en2alive[ii] = false;
                        //fprintf(stderr, "mii dead\n");
                    }

                }
                if ((en2llishit[ii] == 1) || (tf < 1500)) {

                    if (en2llishit[ii] == 1) {
                        en2thdx[ii] = en2thdx[ii] / 1.1;
                        en2thdy[ii] = en2thdy[ii] / 1.1;
                    } else {
                        en2thdx[ii] = en2thdx[ii] / 1.01;
                        en2thdy[ii] = en2thdy[ii] / 1.01;
                    }

                }
                if ((tf > 35000)) {
                    en2dd[ii] = true;
                }
                en2llishit[ii] = false ? 1 : 0;

                en2counter++;
            }

            if (en1alive[ii]) {
                en1timer[ii] += pass;
                tmpen1timer[en1counter] = en1timer[ii];

                var ret = [0, 0];
                var tm = [0, 0];
                var tm2 = [0, 0];
                var an = angle2d(shippos[0], shippos[1], en1posx[ii] - 125, en1posy[ii] - 125);

                var tf = parseFloat(Math.sqrt(Math.pow(Math.abs(en1posx[ii] - shippos[0] - 125) + Math.abs(en1posy[ii] - shippos[1] - 125), 2)));
                tm[0] = -25;
                if (tf < 800) {
                    lewfe1[ii] = true;
                }
                if (!lewfe1[ii]) {
                    ret = rotate2d(tm2, tm, an);
                    en1thdx[ii] += ret[0] / 150;
                    en1thdy[ii] += ret[1] / 150;
                } else {
                    lewtimen1[ii] += pass;
                    if (lewtimen1[ii] > pass * 10) {
                        lewtimen1[ii] = 0;
                        lewfe1[ii] = tf < 800;

                    }
                }
                if (en1llisex[ii]) {
                    en1thdx[ii] = 0;
                    en1thdy[ii] = 0;

                }
                tmpen1posx[en1counter] = en1posx[ii] = en1posx[ii] + en1thdx[ii];
                tmpen1posy[en1counter] = en1posy[ii] = en1posy[ii] + en1thdy[ii];
                tmpen1posx[en1counter] += -shippos[0];
                tmpen1posy[en1counter] += -shippos[1];
                if (en1llishit[ii] || (tf > 35000) || (tf < 1500)) {
                    if (en1llishit[ii]) {
                        en1thdx[ii] = en1thdx[ii] / 1.1;
                        en1thdy[ii] = en1thdy[ii] / 1.1;
                    } else {
                        en1thdx[ii] = en1thdx[ii] / 1.01;
                        en1thdy[ii] = en1thdy[ii] / 1.01;
                    }

                    if (!en1llisex[ii]) {
                        if (en1lval[ii] > 0.1) {
                            en1lval[ii] -= 0.006;
                        } else {
                            en1llisex[ii] = true;

                        }
                    }

                }
                if (en1llisex[ii]) {
                    if (!en1llisexb[ii]) {
                        en1exval[ii] += 0.1;
                        if (en1exval[ii] > 8) {
                            en1llisexb[ii] = true;
                        }
                    } else {
                        en1exval[ii] -= 0.15 - 0.145 * (en1exval[ii] / 8);
                        if (en1exval[ii] < 0.05) {
                            en1alive[ii] = false;
                        }
                    }
                }
                tmpen1lval[en1counter] = en1lval[ii];
                tmpen1exval[en1counter] = en1exval[ii];
                tmpen1llisex[en1counter] = en1llisexb[ii] ? 1 : 0;
                en1llishit[ii] = false;

                en1counter++;
            }
        }
    }

}

function staticplanetsmov() {
    if (!paused) {
        var ret = [0, 0];
        var tm = [0, 0];
        var tm2 = [0, 0];
        tm[0] = planetpos2[0] + 8000 + 7500;
        tm[1] = planetpos2[1] + 8000 + 7500;
        tm2[0] = planetpos2[0] + 7500;
        tm2[1] = planetpos2[1] + 7500;

        ta += ta > 2 * PI ? -2 * PI + PI / 8000 : PI / 8000;
        ret = rotate2d(tm2, tm, ta);
        planetpos1[0] = ret[0] - 2500;
        planetpos1[1] = ret[1] - 2500;

        tm[0] = planetpos3[0] + 12000 + 10000;
        tm[1] = planetpos3[1] + 12000 + 10000;
        tm2[0] = planetpos3[0] + 10000;
        tm2[1] = planetpos3[1] + 10000;
        ta2 += ta2 > 2 * PI ? -2 * PI + PI / 10000 : PI / 10000;
        ret = rotate2d(tm2, tm, -ta2);
        planetpos5[0] = ret[0] - 4000;
        planetpos5[1] = ret[1] - 4000;

        tm[0] = planetpos4[0] + 12000 + 12500;
        tm[1] = planetpos4[1] + 12000 + 12500;
        tm2[0] = planetpos4[0] + 12500;
        tm2[1] = planetpos4[1] + 12500;
        ret = rotate2d(tm2, tm, ta - PI / 2);
        planetpos6[0] = ret[0] - 5250;
        planetpos6[1] = ret[1] - 5250;

        tm[0] = parseFloat(planetpos6[0] + 5250 + 2625 + 450 - 150.);
        tm[1] = parseFloat(planetpos6[1] + 5250 + 2625 + 450 - 150.);
        tm2[0] = parseFloat(planetpos6[0] + 5250);
        tm2[1] = parseFloat(planetpos6[1] + 5250);

        ret = rotate2d(tm2, tm, -ta - PI / 2.25);
        en3pos[0] = ret[0];
        en3pos[1] = ret[1];

        tm[0] = parseFloat(planetpos6[0] + 5250 + 2625 + 450 - 150. + 300);
        tm[1] = parseFloat(planetpos6[1] + 5250 + 2625 + 450 - 150. + 300);
        tm2[0] = planetpos6[0] + 5250;
        tm2[1] = planetpos6[1] + 5250;

        ret = rotate2d(tm2, tm, -ta - PI / 2.25 - 0.11);

        var txxx = [0, 0];
        txxx[0] = ret[0];
        txxx[1] = ret[1];

        for (var i = 0; i < bds.toArray().length; i++) {
            if (bds.get(i).iterator == -1) {
                bds.get(i).origin.x = txxx[0] - 250;
                bds.get(i).origin.y = txxx[1] - 250;
            }
            ;
            if (bds.get(i).iterator == 3) {
                bds.get(i).origin.x = planetpos1[0] + 2500 - 250;
                bds.get(i).origin.y = planetpos1[1] + 2500 - 250;
            }
            ;
            if (bds.get(i).iterator == 4) {
                bds.get(i).origin.x = planetpos2[0] + 7500 - 250;
                bds.get(i).origin.y = planetpos2[1] + 7500 - 250;
            }
            ;
            if (bds.get(i).iterator == 5) {
                bds.get(i).origin.x = planetpos3[0] + 10000 - 250;
                bds.get(i).origin.y = planetpos3[1] + 10000 - 250;
            }
            ;
            if (bds.get(i).iterator == 6) {
                bds.get(i).origin.x = planetpos4[0] + 12500 - 250;
                bds.get(i).origin.y = planetpos4[1] + 12500 - 250;
            }
            ;
            if (bds.get(i).iterator == 7) {
                bds.get(i).origin.x = planetpos5[0] + 4000 - 250;
                bds.get(i).origin.y = planetpos5[1] + 4000 - 250;
            }
            ;
            if (bds.get(i).iterator == 8) {
                bds.get(i).origin.x = planetpos6[0] + 5250 - 250;
                bds.get(i).origin.y = planetpos6[1] + 5250 - 250;
            }
            ;
        }

        for (var i = 0; i < bds2.toArray().length; i++) {
            if (bds2.get(i).iterator == 0) {
                bds2.get(i).origin.x = shippos[0] + 125;
                bds2.get(i).origin.y = shippos[1] + 125;
            }
            ;
            if (bds2.get(i).iterator == 3) {
                bds2.get(i).origin.x = planetpos1[0] + 2500 - 17;
                bds2.get(i).origin.y = planetpos1[1] + 2500 - 17;
            }
            ;
            if (bds2.get(i).iterator == 4) {
                bds2.get(i).origin.x = planetpos2[0] + 7500 - 17;
                bds2.get(i).origin.y = planetpos2[1] + 7500 - 17;
            }
            ;
            if (bds2.get(i).iterator == 5) {
                bds2.get(i).origin.x = planetpos3[0] + 10000 - 17;
                bds2.get(i).origin.y = planetpos3[1] + 10000 - 17;
            }
            ;
            if (bds2.get(i).iterator == 6) {
                bds2.get(i).origin.x = planetpos4[0] + 12500 - 17;
                bds2.get(i).origin.y = planetpos4[1] + 12500 - 17;
            }
            ;
            if (bds2.get(i).iterator == 7) {
                bds2.get(i).origin.x = planetpos5[0] + 4000 - 17;
                bds2.get(i).origin.y = planetpos5[1] + 4000 - 17;
            }
            ;
            if (bds2.get(i).iterator == 8) {
                bds2.get(i).origin.x = planetpos6[0] + 5250 - 17;
                bds2.get(i).origin.y = planetpos6[1] + 5250 - 17;
            }
            ;
            if (bds2.get(i).iterator == -1) {
                bds2.get(i).origin.x = txxx[0] - 17;
                bds2.get(i).origin.y = txxx[1] - 17;
            }
            ;
        }

        for (var i = 0; i < bds3.toArray().length; i++) {

            if (bds3.get(i).iterator == 3) {
                bds3.get(i).origin.x = planetpos1[0] + 2500 - 125;
                bds3.get(i).origin.y = planetpos1[1] + 2500 - 125;
            }
            ;
            if (bds3.get(i).iterator == 4) {
                bds3.get(i).origin.x = planetpos2[0] + 7500 - 125;
                bds3.get(i).origin.y = planetpos2[1] + 7500 - 125;
            }
            ;
            if (bds3.get(i).iterator == 5) {
                bds3.get(i).origin.x = planetpos3[0] + 10000 - 125;
                bds3.get(i).origin.y = planetpos3[1] + 10000 - 125;
            }
            ;
            if (bds3.get(i).iterator == 6) {
                bds3.get(i).origin.x = planetpos4[0] + 12500 - 125;
                bds3.get(i).origin.y = planetpos4[1] + 12500 - 125;
            }
            ;
            if (bds3.get(i).iterator == 7) {
                bds3.get(i).origin.x = planetpos5[0] + 4000 - 125;
                bds3.get(i).origin.y = planetpos5[1] + 4000 - 125;
            }
            ;
            if (bds3.get(i).iterator == 8) {
                bds3.get(i).origin.x = planetpos6[0] + 5250 - 125;
                bds3.get(i).origin.y = planetpos6[1] + 5250 - 125;
            }
            ;
            if (bds3.get(i).iterator == -1) {
                bds3.get(i).origin.x = txxx[0] - 17;
                bds3.get(i).origin.y = txxx[1] - 17;
            }
            ;
        }

    }
}

function allkeys_movement() {
    var x = 0;
    var y = 0;
    var maxx = 10;

    if (Keyboard.isKeyDown('1')||gscrolldown>0.0001) {//Keyboard.KEY_1
        gscrolldown=gscrolldown-1.0/10.0>0?gscrolldown-1.0/10.0:0;
        if (paused) {
            zoomtrig += 0.0005 * zoom + zoom / 200;
        } else {
            playzoomtrig += 0.0005 * zoom + playzoom / 200;
        }
    }
    if (Keyboard.isKeyDown('2')||gscrollup>0.0001) {//Keyboard.KEY_2
      gscrollup=gscrollup-1.0/10.0>0?gscrollup-1.0/10.0:0;
        if (paused) {
            zoomtrig -= 0.0005 * zoom + 0.1 * zoom / 200;
        } else {
            playzoomtrig -= 0.0005 * zoom + 0.1 * playzoom / 200;
        }
    }
    if (keystates['d'] || keystates['D']) {
        x += movcontrolxy;
    }
    if (keystates['a'] || keystates['A']) {
        x -= movcontrolxy;
    }
    if (!((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A']))) {
        speedx /= slowfact;
        shspeedx /= 1.1;
    }
    ;
    if (keystates['w'] || keystates['W']) {
        y += movcontrolxy;
    }
    if (keystates['s'] || keystates['S']) {
        y -= movcontrolxy;
    }
    if (!((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S']))) {
        speedy /= slowfact;
        shspeedy /= 1.1;
    }
    ;
    if (!paused) {
        zoomtrig = 0;
        playzoomtrig /= 1.1;
        var lt = playzoom;
        playzoom += ((playzoom + playzoomtrig > 0.02) && (playzoom + playzoomtrig < 2)) ? playzoomtrig : 0;
        if (!((lt + playzoomtrig > 0.02) && (lt + playzoomtrig < 2))) {
            playzoomtrig = 0;
        }
        zoom = playzoom;
        shiftpos[0] = shiftpos[1] = 0;
        shspeedx = 0;
        shspeedx = 0;
        if (Math.abs(speedx + x) < maxx) {
            speedx += x / 10;
        }
        if (Math.abs(speedy + y) < maxx) {
            speedy += y / 10;
        }
        shipth[0] += speedx;
        shipth[1] += speedy;
        animlamp += (animlampbtn) ? ((animlamp < 5.5) ? 0.2 : 0 * (animlcounter += 0.2)) : (animlamp > 1.5) ? -0.2 : 0 * (animlcounter += 0.2);
        animlcounter = (animlcounter > (0.87901 * PI) * PI) ? 0 : animlcounter;
        lpower = parseFloat((animlampbtn) ? ((lpower > 5) ? lpower - 1 : 5) : ((lpower < 19) ? lpower + 1.5 : 20));

    } else {
        playzoomtrig = 0;
        playzoom = parseFloat(((zoom > 0.02) && (zoom < 2)) ? zoom : (zoom >= 1 ? 2 : 0.02));
        var tvalx = 1;
        if (zoom > 1) {
            tvalx = 4 / zoom;
        } else {
            tvalx = 300 / zoom;
        }

        if (Math.abs(shspeedx + x * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx) {
            shspeedx += x * (zoom) * tvalx;
        }
        if (Math.abs(shspeedy + y * (zoom) * tvalx) < maxx * (zoom) + zoom * tvalx) {
            shspeedy += y * (zoom) * tvalx;
        }
        shiftpos[0] += shspeedx;
        shiftpos[1] += shspeedy;
        zoomtrig /= 1.1;
        var lt = zoom;
        zoom += ((zoom + zoomtrig > 0.005) && (zoom + zoomtrig < 20)) ? zoomtrig : 0;
        if (!((lt + zoomtrig > 0.005) && (lt + zoomtrig < 20))) {
            zoomtrig = 0;
        }

    }

}

function shipmovwithgrav() {
    if (!paused) {
        if (Math.abs(shipth[0]) > maxth) {
            shipth[0] = maxth * (shipth[0] > 0 ? 1 : -1);
        }
        if (Math.abs(shipth[1]) > maxth) {
            shipth[1] = maxth * (shipth[1] > 0 ? 1 : -1);
        }

        for (var i = 0; i < bds3.toArray().length; i++) {
            if ((bds3.get(i).iterator >= maxbullets + 10) && (bds3.get(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds3.get(i).iterator - 10 - maxbullets]) {

                    bds3.get(i).origin.x = en1posx[bds3.get(i).iterator - 10 - maxbullets] + 125 - 125 - 17;
                    bds3.get(i).origin.y = en1posy[bds3.get(i).iterator - 10 - maxbullets] + 125 - 125 - 17;
                    bds3.get(i).heading.x = en1thdx[bds3.get(i).iterator - 10 - maxbullets];
                    bds3.get(i).heading.y = en1thdy[bds3.get(i).iterator - 10 - maxbullets];
                    bds3.get(i).isstatic = en1llisex[bds3.get(i).iterator - 10 - maxbullets];
                    bds3.get(i).miilive = true;

                } else {
                    bds3.get(i).isstatic = true;
                    bds3.get(i).miilive = false;
                }

            }
            if ((bds3.get(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds3.get(i).iterator - 10 - maxbullets - maxen]) {

                    bds3.get(i).origin.x = en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] + 125 - 125 - 17;
                    bds3.get(i).origin.y = en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] + 125 - 125 - 17;
                    bds3.get(i).heading.x = en2thdx[bds3.get(i).iterator - 10 - maxbullets - maxen];
                    bds3.get(i).heading.y = en2thdy[bds3.get(i).iterator - 10 - maxbullets - maxen];
                    bds3.get(i).isstatic = false;
                    bds3.get(i).miilive = true;

                } else {
                    bds3.get(i).isstatic = true;
                    bds3.get(i).miilive = false;
                }

            }
            bds3.get(i).sumVector(bds3);
        }
        shua = false;
        for (var i = 0; i < bds3.toArray().length; i++) {
            if ((bds3.get(i).iterator >= maxbullets + 10) && (bds3.get(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds3.get(i).iterator - 10 - maxbullets]) {

                    if ((bds3.get(i).hit)) {
                        bds3.get(i).hit = false;
                        var ret = [0, 0];
                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        var an = angle2d(bds3.get(i).origin.x, bds3.get(i).origin.y, bds3.get(bds3.get(i).hitid).origin.x, bds3.get(bds3.get(i).hitid).origin.y);
                        tm[0] = -5;
                        ret = rotate2d(tm2, tm, an);
                        bds3.get(i).heading.x += ret[0];
                        bds3.get(i).heading.y += ret[1];
                    }

                    en1posx[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).origin.x - 125 + 125 + 17;
                    en1posy[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).origin.y - 125 + 125 + 17;
                    en1thdx[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).heading.x;
                    en1thdy[bds3.get(i).iterator - 10 - maxbullets] = bds3.get(i).heading.y;

                }
            }

            if ((bds3.get(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds3.get(i).iterator - 10 - maxbullets - maxen]) {

                    if ((bds3.get(i).hit)) {
                        bds3.get(i).hit = false;
                        var ret = [0, 0];
                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        var an = angle2d(bds3.get(i).origin.x, bds3.get(i).origin.y, bds3.get(bds3.get(i).hitid).origin.x, bds3.get(bds3.get(i).hitid).origin.y);
                        tm[0] = -5;
                        ret = rotate2d(tm2, tm, an);
                        bds3.get(i).heading.x += ret[0];
                        bds3.get(i).heading.y += ret[1];
                    }

                    en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).origin.x - 125 + 125 + 17;
                    en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).origin.y - 125 + 125 + 17;
                    en2thdx[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).heading.x;
                    en2thdy[bds3.get(i).iterator - 10 - maxbullets - maxen] = bds3.get(i).heading.y;
                    if (!shua) {
                        shua = (Math.sqrt(Math.abs(Math.pow(en2posx[bds3.get(i).iterator - 10 - maxbullets - maxen] - shippos[0] - 125, 2)) + Math.abs(Math.pow(en2posy[bds3.get(i).iterator - 10 - maxbullets - maxen] - shippos[1] - 125, 2)))) < 1500;
                    }

                }
            }

        }

        for (var i = 0; i < bds2.toArray().length; i++) {
            /*if (bds2.get(i).iterator == 0) {
             bds2.get(i).islon = (lpower < 20);
             }*/

            if ((bds2.get(i).iterator >= 10) && (bds2.get(i).iterator < maxbullets + 10)) {
                if (bulletalive[bds2.get(i).iterator - 10]) {
                    if (isnew[bds2.get(i).iterator - 10]) {
                        isnew[bds2.get(i).iterator - 10] = bds2.get(i).hit = false;
                    }
                    bds2.get(i).origin.x = bulletposx[bds2.get(i).iterator - 10] - 125;
                    bds2.get(i).origin.y = bulletposy[bds2.get(i).iterator - 10] - 125;
                    bds2.get(i).heading.x = bullethdx[bds2.get(i).iterator - 10];
                    bds2.get(i).heading.y = bullethdy[bds2.get(i).iterator - 10];
                    bds2.get(i).isstatic = (bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI));
                    bds2.get(i).miilive = true;
                } else {
                    bds2.get(i).isstatic = true;
                    bds2.get(i).miilive = false;
                }

            }

            if ((bds2.get(i).iterator >= maxbullets + 10) && (bds2.get(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds2.get(i).iterator - 10 - maxbullets]) {
                    bds2.get(i).origin.x = en1posx[bds2.get(i).iterator - 10 - maxbullets] - 17;
                    bds2.get(i).origin.y = en1posy[bds2.get(i).iterator - 10 - maxbullets] - 17;
                    bds2.get(i).heading.x = en1thdx[bds2.get(i).iterator - 10 - maxbullets];
                    bds2.get(i).heading.y = en1thdy[bds2.get(i).iterator - 10 - maxbullets];
                    bds2.get(i).miilive = true;
                } else {
                    bds2.get(i).miilive = false;
                }

            }
            if ((bds2.get(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds2.get(i).iterator - 10 - maxbullets - maxen]) {
                    bds2.get(i).origin.x = en2posx[bds2.get(i).iterator - 10 - maxbullets - maxen] - 17;
                    bds2.get(i).origin.y = en2posy[bds2.get(i).iterator - 10 - maxbullets - maxen] - 17;
                    bds2.get(i).heading.x = en2thdx[bds2.get(i).iterator - 10 - maxbullets - maxen];
                    bds2.get(i).heading.y = en2thdy[bds2.get(i).iterator - 10 - maxbullets - maxen];
                    bds2.get(i).miilive = true;
                } else {
                    bds2.get(i).miilive = false;
                }
            }

            bds2.get(i).sumVector(bds2);
        }

        for (var i = 0; i < bds2.toArray().length; i++) {
            if ((bds2.get(i).iterator >= 10) && (bds2.get(i).iterator < maxbullets + 10)) {
                if (bulletalive[bds2.get(i).iterator - 10]) {
                    bulletposx[bds2.get(i).iterator - 10] = bds2.get(i).origin.x + 125;
                    bulletposy[bds2.get(i).iterator - 10] = bds2.get(i).origin.y + 125;
                    if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator == -1)) {
                        bds2.get(i).hit = false;
                        var ret = [0, 0];
                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        var an = angle2d(bds2.get(i).origin.x, bds2.get(i).origin.y, bds2.get(bds2.get(i).hitid).origin.x, bds2.get(bds2.get(i).hitid).origin.y);
                        tm[0] = -10;
                        ret = rotate2d(tm2, tm, an);
                        bds2.get(i).heading.x += ret[0];
                        bds2.get(i).heading.y += ret[1];
                    }
                    if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10) && (bds2.get(bds2.get(i).hitid).iterator < maxen + maxbullets + 10)) {
                        bds2.get(i).hit = false;
                    }

                    if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10 + maxen) && (!bulletexpl[bds2.get(i).iterator - 10])) {
                        bulletexpl[bds2.get(i).iterator - 10] = true;
                        bulletexplctrl[bds2.get(i).iterator - 10] = 0.;
                        exltimer[bds2.get(i).iterator - 10] = 0;
                        bullettimer[bds2.get(i).iterator - 10] = 4 * PI + bullettimer[bds2.get(i).iterator - 10] - (parseInt((bullettimer[bds2.get(i).iterator - 10]) / (4 * PI))) * 4 * PI;
                    }
                    if ((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI))) {
                        if ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10 + maxen)) {
                            en2dd[bds2.get(bds2.get(i).hitid).iterator - maxbullets - 10 - maxen] = true;
                        }
                    }
                    bullethdx[bds2.get(i).iterator - 10] = parseFloat((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10)) ? bds2.get(i).heading.x + 0.5 * bds2.get(bds2.get(i).hitid).heading.x : bds2.get(i).heading.x);
                    bullethdy[bds2.get(i).iterator - 10] = parseFloat((bulletexpl[bds2.get(i).iterator - 10] && (exltimer[bds2.get(i).iterator - 10] > 4 * PI)) ? 0 : ((bds2.get(i).hit) && (bds2.get(bds2.get(i).hitid).iterator >= maxbullets + 10)) ? bds2.get(i).heading.y + 0.5 * bds2.get(bds2.get(i).hitid).heading.y : bds2.get(i).heading.y);
                    //bullethdx[bds2.get(i).iterator - 10] = bds2.get(i).heading.x;
                    //bullethdy[bds2.get(i).iterator - 10] = bds2.get(i).heading.y;

                }
            }

            /*if (bds2.get(i).iterator == 0) {
             if (bds2.get(i).llhit) {
             lhitpos[0] = bds2.get(i).llhitpos[0];
             lhitpos[1] = bds2.get(i).llhitpos[1];
             } else {
             lhitpos[0] = 0;
             lhitpos[1] = bds2.get(i).maxll;
             }
             }*/
        }

        for (var i = 0; i < bds.toArray().length; i++) {
            if ((bds.get(i).iterator >= maxbullets + 10) && (bds.get(i).iterator < maxbullets + 10 + maxen)) {
                if (en1alive[bds.get(i).iterator - 10 - maxbullets]) {
                    bds.get(i).origin.x = en1posx[bds.get(i).iterator - 10 - maxbullets] + 125 - 250;
                    bds.get(i).origin.y = en1posy[bds.get(i).iterator - 10 - maxbullets] + 125 - 250;
                    bds.get(i).heading.x = en1thdx[bds.get(i).iterator - 10 - maxbullets];
                    bds.get(i).heading.y = en1thdy[bds.get(i).iterator - 10 - maxbullets];
                    bds.get(i).miilive = true;
                } else {
                    bds.get(i).miilive = false;
                }

            }

            if ((bds.get(i).iterator >= maxbullets + 10 + maxen)) {
                if (en2alive[bds.get(i).iterator - 10 - maxbullets - maxen]) {
                    bds.get(i).origin.x = en2posx[bds.get(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                    bds.get(i).origin.y = en2posy[bds.get(i).iterator - 10 - maxbullets - maxen] + 125 - 250;
                    bds.get(i).heading.x = en2thdx[bds.get(i).iterator - 10 - maxbullets - maxen];
                    bds.get(i).heading.y = en2thdy[bds.get(i).iterator - 10 - maxbullets - maxen];
                    bds.get(i).miilive = true;
                } else {
                    bds.get(i).miilive = false;
                }
            }

            if (bds.get(i).iterator == 0) {
                bds.get(i).islon = (lpower < 20);
            }
            bds.get(i).sumVector(bds);

        }
        wwh = false;
        en3hit = false;
        for (var i = 0; i < bds.toArray().length; i++) {
            if (bds.get(i).iterator == 0) {

                if ((keystates['d'] || keystates['D']) || (keystates['a'] || keystates['A'])) {
                    bds.get(i).heading.x += shipth[0] - shipthwgr[0];
                }
                if ((keystates['w'] || keystates['W']) || (keystates['s'] || keystates['S'])) {
                    bds.get(i).heading.y += shipth[1] - shipthwgr[1];
                }
                shippos[0] = bds.get(i).origin.x - 125;
                shippos[1] = bds.get(i).origin.y - 125;
                shipthwgr[0] = parseFloat(Math.abs(shipth[0]) > 19.9 ? (shipth[0] > 0 ? shipth[0] - 0.25 : shipth[0] + 0.25) : shipth[0]);
                shipthwgr[1] = parseFloat(Math.abs(shipth[1]) > 19.9 ? (shipth[1] > 0 ? shipth[1] - 0.25 : shipth[1] + 0.25) : shipth[1]);
                shipthwgrt[0] = bds.get(i).heading.x;
                shipthwgrt[1] = bds.get(i).heading.y;
                /*if ((keystates['k'] || keystates['K'])) {
                 bds.get(i).heading.x = 0;
                 bds.get(i).heading.y = 0;
                 }*/

                if (Keyboard.isKeyDown(' ')) {//Keyboard.KEY_SPACE
                    if (bds.get(i).hit) {
                        bds.get(i).hit = false;
                        var ret = [0, 0];
                        var tm = [0, 0];
                        var tm2 = [0, 0];
                        var an = angle2d(shippos[0], shippos[1], bds.get(bds.get(i).hitid).origin.x, bds.get(bds.get(i).hitid).origin.y);
                        tm[0] = -40;
                        ret = rotate2d(tm2, tm, an);
                        bds.get(i).heading.x += ret[0] / 2;
                        bds.get(i).heading.y += ret[1] / 2;
                    }
                }

                if (bds.get(i).llhit) {

                    if ((bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10) && (bds.get(bds.get(i).llhitid).iterator < maxbullets + 10 + maxen)) {
                        en1llishit[bds.get(bds.get(i).llhitid).iterator - maxbullets - 10] = true;
                    }
                    if ((bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10 + maxen)) {
                        en2llishit[bds.get(bds.get(i).llhitid).iterator - maxbullets - 10 - maxen] = true ? 1 : 0;
                    }
                    lhitpos[0] = bds.get(i).llhitpos[0];
                    lhitpos[1] = bds.get(i).llhitpos[1];
                    en3hit = (bds.get(bds.get(i).llhitid).iterator == -1);
                    wwh = (bds.get(bds.get(i).llhitid).iterator >= maxbullets + 10) || en3hit;

                } else {
                    lhitpos[0] = 0;
                    lhitpos[1] = bds.get(i).maxll;
                }
                break;
            }
            ;
        }
        shipth[0] /= slowfact;
        shipth[1] /= slowfact;

    }
}

var frames = 0;
var last_time = 0;
var pass = 1 / 60;
var fps = 60;
var cdx = false;

function display(timexx, Display) {
    var x0, y0, width, height, ticks;
    //GLint uindex;

    // glUseProgram(prog);
    width = Display.canvas.width;
    height = Display.canvas.height;


    ticks = timexx;

    if (frames == 0) {
        last_time = ticks;
    }

    frames++;
    //need pass first sec of time
    if (ticks - last_time >= 1000) {
        fps = 1000.0 * frames / (ticks - last_time);
        //document.getElementById("fps").innerHTML = "FPS: " + Number((fps).toFixed(1));
        ;
        pass = (ticks - last_time) / (1000. * frames);
        frames = 0;
    }
    scrcenter[0] = width / 2 - (radius * zoom) / 2;
    scrcenter[1] = height / 2 - (radius * zoom) / 2;
    allkeys_movement();
    shipmovwithgrav();
    cameraposs(parseInt(width), parseInt(height));
    staticplanetsmov();
    spawnenemy(pass);
    if (paused) {
        program.setUniform("time", parseFloat(shifttime / 1000.0));
    } else {
        program.setUniform("time", parseFloat((ticks - shifttime) / 1000.0));

    }
    program.setUniform("iResolution", parseFloat(width), parseFloat(height), parseFloat(1.0));

    program.setUniform("iMouse", parseInt(mouse[0]), parseInt(mouse[1]), parseInt(mouse[2]), parseInt(mouse[3]));

    program.setUniform("resolution", width, height);

    if (!paused) {
        if (animlampbtn) {
            var lastangle = angle;
            var nang = 0.02;
            angle = parseFloat(Math.atan2((mouse[1] - (shippos[1] + scrcenter[1] + camerapos[1] + ((radius * zoom) / 2))) / (radius), (mouse[0] - (shippos[0] + scrcenter[0] + camerapos[0] + ((radius * zoom) / 2))) / (radius)));
            angle = lastangle + ((Math.abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
            angle = (angle > PI) ? angle - 2 * PI : (angle < -PI) ? 2 * PI + angle : angle;

        } else {
            var lastangle = angle;
            var nang = 0.06;
            if (lpower < 20) {
                nang = 0.02;
            }
            angle = parseFloat(Math.atan2((mouse[1] - (shippos[1] + scrcenter[1] + camerapos[1] + ((radius * zoom) / 2))) / (radius), (mouse[0] - (shippos[0] + scrcenter[0] + camerapos[0] + ((radius * zoom) / 2))) / (radius)));
            angle = lastangle + ((Math.abs(angle - lastangle) > nang) ? (((angle - lastangle) > 0) ? (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? -nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? -nang : nang) : (((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? nang : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? nang : -nang)) : ((angle > (PI / 2)) && (lastangle < (-PI / 2))) ? angle - lastangle : ((angle < (-PI / 2)) && (lastangle > (PI / 2))) ? angle - lastangle : angle - lastangle);
            angle = (angle > PI) ? angle - 2 * PI : (angle < -PI) ? 2 * PI + angle : angle;
        }
    }
    program.setUniform("angle", PI / 2 - angle);

    program.setUniform("radius", radius * zoom);

    program.setUniform("shippos", (shippos[0] + shiftpos[0] * zoom + camerapos[0] + scrcenter[0]), (shippos[1] + shiftpos[1] * zoom + camerapos[1] + scrcenter[1]));
    program.setUniform("shua", shua ? 1 : 0);

    program.setUniform("animlamp", animlamp);

    program.setUniform("animlcounter", animlcounter);

    program.setUniform("lpower", lpower);

    program.setUniform("zoom", zoom);

    if (!paused) {
        if (animbulletbtn) {
            bulletanimtimer += pass;
            if (bulletanimtimer > 1) {
                for (var ii = 0; ii < maxbullets; ii++) {
                    if (cdx) {
                        break;
                    }
                    if (!bulletalive[ii]) {
                        //wdrt
                        var tm = [137.5 + shippos[0] - shipthwgrt[0], 137.5 + shippos[1] - shipthwgrt[1]];
                        var tm2 = [238.5 + shippos[0] - shipthwgrt[0], 238.5 + shippos[1] - shipthwgrt[1]];
                        var ret = [0, 0];
                        ret = rotate2d(tm2, tm, angle + PI / 1.3335);
                        bulletposx[ii] = 12.5 + -35 / 2. + ret[0];
                        bulletposy[ii] = 12.5 + -35 / 2. + ret[1];
                        bulletalive[ii] = isnew[ii] = true;

                        bullettimer[ii] = 0;
                        var rOffputX = parseFloat(Math.sin(angle));
                        var rOffputY = parseFloat(Math.cos(angle));
                        bullethdx[ii] = rOffputY * 2. + shipthwgrt[0];
                        bullethdy[ii] = rOffputX * 2. + shipthwgrt[1];
                        bulletexpl[ii] = false;
                        cdx = true;
                    }

                }
            }
        } else {
            bulletcounter = 0;
            if (bulletanimtimer > 0.7) {
                bulletanimtimer += pass;
            } else {
                bulletanimtimer -= pass;
            }
            if (bulletanimtimer < 0) {
                bulletanimtimer = 0;
            }
        }
        if (bulletanimtimer > 1.4) {
            bulletanimtimer = 0;
            cdx = false;
        }
        ;
    }
    program.setUniform("bulletanimtimer", bulletanimtimer);

    bulletcounter = 0;
    for (var ii = 0; ii < maxbullets; ii++) {
        if (bulletalive[ii]) {
            if ((!paused) && (!bulletexpl[ii])) {
                tmpbulletexpl[bulletcounter] = false ? 1 : 0;
                if ((bullettimer[ii] > maxbullets - 15)) {
                    bulletexpl[ii] = true;
                    bulletexplctrl[ii] = 0.;
                    exltimer[ii] = 0;
                    bullettimer[ii] = 4 * PI + bullettimer[ii] - (parseInt((bullettimer[ii]) / (4 * PI))) * 4 * PI; //glsl

                    bullettimer[ii] += -pass;
                }

                bullettimer[ii] += pass;
                tmpbullettimer[bulletcounter] = bullettimer[ii];
                tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                tmpbulletposx[bulletcounter] += -shippos[0];
                tmpbulletposy[bulletcounter] += -shippos[1];
            } else {
                tmpbulletposx[bulletcounter] = bulletposx[ii] - shippos[0];
                tmpbulletposy[bulletcounter] = bulletposy[ii] - shippos[1];
            }
            if (!paused) {
                if (bulletexpl[ii]) {
                    tmpbulletposx[bulletcounter] = bulletposx[ii] = bulletposx[ii];
                    tmpbulletposy[bulletcounter] = bulletposy[ii] = bulletposy[ii];
                    tmpbulletposx[bulletcounter] += -shippos[0];
                    tmpbulletposy[bulletcounter] += -shippos[1];
                    if (exltimer[ii] < 4 * PI) {//glsl

                        bullettimer[ii] += pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                        exltimer[ii] += pass / 1.5;
                        bulletexplctrl[ii] = tmpbulletexplctrl[bulletcounter] = bulletexplctrl[ii] + pass + 2 * (pass * ((exltimer[ii]) / (4 * PI)));
                        if (exltimer[ii] >= 4 * PI - pass) {
                            exltimer[ii] = 100;
                            bullettimer[ii] = 0;

                        }
                        tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                        tmpbullettimer[bulletcounter] = bullettimer[ii];

                    } else {

                        if (bullettimer[ii] > PI * 1.24) //glsl
                        {
                            bulletalive[ii] = false;
                            tmpbulletexpl[bulletcounter] = false ? 1 : 0;
                            bulletexpl[ii] = false;
                            continue;
                        }

                        tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                        bullettimer[ii] += pass;
                        tmpbullettimer[bulletcounter] = bullettimer[ii];
                        tmpbulletexpl[bulletcounter] = bulletexpl[ii] ? 1 : 0;
                        tmpbullettimer[bulletcounter] = bullettimer[ii];

                    }

                }
            }

            bulletcounter++;
        }
    }
    program.setUniform("bulletposx", maxbullets, (tmpbulletposx));

    program.setUniform("bulletposy", maxbullets, (tmpbulletposy));

    program.setUniform("bullettimer", maxbullets, (tmpbullettimer));

    program.setUniform("bulletcounter", bulletcounter);

    program.setUniform("paused", paused ? 1 : 0);

    program.setUniform("fast", fast ? 1 : 0);

    program.setUniform("bulletexpl", maxbullets, (tmpbulletexpl));

    program.setUniform("bulletexplctrl", maxbullets, (tmpbulletexplctrl));

    program.setUniform("planetpos1", planetpos1[0] - shippos[0], planetpos1[1] - shippos[1]);

    program.setUniform("planetpos2", planetpos2[0] - shippos[0], planetpos2[1] - shippos[1]);

    program.setUniform("planetpos3", planetpos3[0] - shippos[0], planetpos3[1] - shippos[1]);

    program.setUniform("planetpos4", planetpos4[0] - shippos[0], planetpos4[1] - shippos[1]);

    program.setUniform("planetpos5", planetpos5[0] - shippos[0], planetpos5[1] - shippos[1]);

    program.setUniform("planetpos6", planetpos6[0] - shippos[0], planetpos6[1] - shippos[1]);

    program.setUniform("best", best ? 1 : 0);

    program.setUniform("starpos1", starpos1[0] - shippos[0], starpos1[1] - shippos[1]);

    program.setUniform("starpos2", starpos2[0] - shippos[0], starpos2[1] - shippos[1]);

    program.setUniform("nebulapos", nebulapos[0] - shippos[0], nebulapos[1] - shippos[1]);

    program.setUniform("en3pos", en3pos[0] - shippos[0], en3pos[1] - shippos[1]);

    program.setUniform("tax", ta);

    program.setUniform("en1timer", maxen, (tmpen1timer));

    program.setUniform("en1posx", maxen, (tmpen1posx));

    program.setUniform("en1posy", maxen, (tmpen1posy));

    program.setUniform("en1counter", en1counter);

    program.setUniform("en2timer", maxen, (tmpen2timer));

    program.setUniform("en2posx", maxen, (tmpen2posx));

    program.setUniform("en2posy", maxen, (tmpen2posy));

    program.setUniform("en2counter", en2counter);

    program.setUniform("lhitpos", lhitpos[0], lhitpos[1]);

    program.setUniform("wwh", wwh ? 1 : 0);

    program.setUniform("en3hit", en3hit ? 1 : 0);

    program.setUniform("en1lval", maxen, (tmpen1lval));

    program.setUniform("en1exval", maxen, (tmpen1exval));

    program.setUniform("en1llisex", maxen, (tmpen1llisex));

    program.setUniform("en2llishit", maxen, (tmpen2llishit));

    program.setUniform("en2extimer", maxen, (tmpen2extimer));

    /*
     glClear(GL_COLOR_BUFFER_BIT);
     glRectf(-1.0, -1.0, 1.0, 1.0);
     
     glutSwapBuffers();*/
}
