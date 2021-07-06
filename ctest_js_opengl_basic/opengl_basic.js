
function createArray(length) {
    var arr = new Array(length || 0),
            i = length;

    if (arguments.length > 1) {
        var args = Array.prototype.slice.call(arguments, 1);
        while (i--)
            arr[length - 1 - i] = createArray.apply(this, args);
    }

    return arr;
}




var M_PI = Math.PI;
var WIDTH = 1920;
var HEIGHT = 1080;
var oncept = 0;
var dotsscale = 1000; // dots array scale, 100^(x), example 100 1000 10000 1000000 etc
var dots = (M_PI * dotsscale) | 0; // Pi*1000=3142
var rotateradius = 1;
var fps = 0;
var frameRateSmoothing = 1.0;
var numFrames = 0;
var lastFpsTime = 0;
var persp = 45.0;
var stateof = [true, true, true];
var stateofdir = [true, true, true];
var mainrot = [false, false];
var scale = 0.5;

var isgen = false;
var angle = 0;
var axis = new THREE.Vector3(0, 0, 0);
var func_vectordata = createArray((1 + ((360) / rotateradius) | 0), dots);

var scene = new THREE.Scene();


js_function.funcid;
js_function.lastfuncid;
js_function.datax;
js_function.datay;
js_function.rotatex;
js_function.rotatey;
js_function.rotatez;



p_and_d.dotsscale = 100;
p_and_d.dots = (M_PI * p_and_d.dotsscale) | 0;
p_and_d.isgen = false;

p_and_d.datavert1x;
p_and_d.datavert1y;
p_and_d.datavert2x;
p_and_d.datavert2y;
p_and_d.datavert3x;
p_and_d.datavert3y;
p_and_d.datavert4x;
p_and_d.datavert4y;
p_and_d.datavert5x;
p_and_d.datavert5y;

p_and_d.datahotizont1x;
p_and_d.datahotizont1y;
p_and_d.datahotizont2x;
p_and_d.datahotizont2y;
p_and_d.datahotizont3x;
p_and_d.datahotizont3y;
p_and_d.datahotizont4x;
p_and_d.datahotizont4y;
p_and_d.datahotizont5x;
p_and_d.datahotizont5y;
p_and_d.p_and_d_vectordata1 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata2 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata3 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata4 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata5 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata6 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata7 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata8 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata9 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);
p_and_d.p_and_d_vectordata10 = createArray(2, 1 + (((360) / rotateradius) | 0), p_and_d.dots);

function p_and_d() {

    p_and_d.datavert1x = new Array(p_and_d.dots);
    p_and_d.datavert1y = new Array(p_and_d.dots);
    p_and_d.datavert2x = new Array(p_and_d.dots);
    p_and_d.datavert2y = new Array(p_and_d.dots);
    p_and_d.datavert3x = new Array(p_and_d.dots);
    p_and_d.datavert3y = new Array(p_and_d.dots);
    p_and_d.datavert4x = new Array(p_and_d.dots);
    p_and_d.datavert4y = new Array(p_and_d.dots);
    p_and_d.datavert5x = new Array(p_and_d.dots);
    p_and_d.datavert5y = new Array(p_and_d.dots);

    p_and_d.datahotizont1x = new Array(p_and_d.dots);
    p_and_d.datahotizont1y = new Array(p_and_d.dots);
    p_and_d.datahotizont2x = new Array(p_and_d.dots);
    p_and_d.datahotizont2y = new Array(p_and_d.dots);
    p_and_d.datahotizont3x = new Array(p_and_d.dots);
    p_and_d.datahotizont3y = new Array(p_and_d.dots);
    p_and_d.datahotizont4x = new Array(p_and_d.dots);
    p_and_d.datahotizont4y = new Array(p_and_d.dots);
    p_and_d.datahotizont5x = new Array(p_and_d.dots);
    p_and_d.datahotizont5y = new Array(p_and_d.dots);
}
;

p_and_d.FunctionList = function () {
    for (var n = 0; n < p_and_d.dots; n++) {
        var t = p_and_d.gettm(1, n);
        p_and_d.datavert1x [n] = -3 + (t * 0.98) / 3;
        p_and_d.datavert1y [n] = t * 0.98;
        p_and_d.datavert2x [n] = -2 - 2 / 3.0 + (t / M_PI) / 3;
        p_and_d.datavert2y [n] = (t / M_PI) - 2;
        p_and_d.datavert3x [n] = -1 - 2.0 / 3 + (t / M_PI) / 3;
        p_and_d.datavert3y [n] = (t / M_PI) + 1;
        p_and_d.datavert4x [n] = -2.0 / 3 + (t / M_PI) / 3;
        p_and_d.datavert4y [n] = 1 + (t / M_PI);
        p_and_d.datavert5x [n] = 1.0 / 3 + ((t / M_PI) * 2) / 3;
        p_and_d.datavert5y [n] = 1 + (t / M_PI) * 2;


        p_and_d.datahotizont1x [n] = -3.5 + t / 7;
        p_and_d.datahotizont1y [n] = -3;
        p_and_d.datahotizont2x [n] = -1 - 1.0 / 3 + (t / M_PI);
        p_and_d.datahotizont2y [n] = -1;
        p_and_d.datahotizont3x [n] = -1.5 + (t / M_PI) / 2;
        p_and_d.datahotizont3y [n] = 0;
        p_and_d.datahotizont4x [n] = -0.8 + (t / M_PI) / 2;
        p_and_d.datahotizont4y [n] = 2;
        p_and_d.datahotizont5x [n] = -1.0 / 2 + (t / M_PI) * (2 - 1.0 / 2);
        p_and_d.datahotizont5y [n] = 3;

    }
}


//t=[-pi*xpi, pi*xpi]

p_and_d.gettm = function (xpi, n) {
    return xpi * (-1 * M_PI) + xpi * 2 * (n / p_and_d.dotsscale);
}



function js_function() {

    js_function.funcid = 0;
    js_function.rotatex = 0;
    js_function.rotatey = 0;
    js_function.rotatez = 0;

    js_function.datax = new Array(dots);
    js_function.datay = new Array(dots);
    js_function.calculate();
    js_function.findaxis();
}

//t=[0, pi*xpi]

js_function.gett = function (xpi, n) {
    return xpi * (n / dotsscale);
}

//t=[-pi*xpi, pi*xpi]

js_function.gettm = function (xpi, n) {
    return xpi * (-1 * M_PI) + xpi * 2 * (n / dotsscale);
}


js_function.FunctionList = function () {


    switch (js_function.funcid) {
        case 0:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = t;
                js_function.datay [n] = Math.tan(t);
            }
            return;
        case 1:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = t;
                js_function.datay [n] = t * t * t;
            }
            return;
        case 2:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(2, n);
                js_function.datax [n] = t;
                js_function.datay [n] = (6 * Math.sin(t)) / 2;

            }
            return;
        case 3:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = t;
                js_function.datay [n] = 1 / Math.tan(t);
            }
            return;
        case 4:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(2, n);
                js_function.datax [n] = t;
                js_function.datay [n] = Math.abs(t) * Math.sin(t);

            }
            return;
        case 5:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(2, n);
                js_function.datax [n] = t;
                js_function.datay [n] = t / (t * t);
            }
            return;
        case 6:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(2, n);
                js_function.datax [n] = t;
                js_function.datay [n] = t * Math.sin(t);
            }
            return;
        case 7:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(2, n);
                js_function.datax [n] = 2 * Math.cos(t) + Math.cos(2 * t);
                js_function.datay [n] = 2 * Math.sin(t) - Math.sin(2 * t);
            }
            return;
        case 8:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(2, n);
                js_function.datax [n] = 4 * (Math.cos(t) + Math.cos(5 * t) / 5);

                js_function.datay [n] = 4 * (Math.sin(t) - Math.sin(5 * t) / 5);

            }
            return;
        case 9:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(20, n);
                js_function.datax [n] = 2.8 * (Math.cos(t) + Math.cos(1.1 * t) / 1.1);

                js_function.datay [n] = 2.8 * (Math.sin(t) - Math.sin(1.1 * t) / 1.1);
            }
            return;
        case 10:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(2, n);
                js_function.datax [n] = 3 * (1 + Math.cos(t)) * Math.cos(t);

                js_function.datay [n] = 3 * (1 + Math.cos(t)) * Math.sin(t);

            }
            return;
        case 11:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(2, n);
                js_function.datax [n] = 3 * Math.sin(t + M_PI / 2);

                js_function.datay [n] = 3 * Math.sin(2 * t);
            }
            return;
            //Butterfly
        case 12:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(12, n);
                js_function.datax [n] = Math.sin(t) * (Math.exp(Math.cos(t)) - 2 * Math.cos(4 * t) + Math.pow(Math.sin(t / 12), 5));

                js_function.datay [n] = Math.cos(t) * (Math.exp(Math.cos(t)) - 2 * Math.cos(4 * t) + Math.pow(Math.sin(t / 12), 5));

            }
            return;
            //heart <3
        case 13:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gett(2, n);
                js_function.datax [n] = (16 * Math.pow(Math.sin(t), 3)) / 4;
                js_function.datay [n] = (13 * Math.cos(t) - 5 * Math.cos(2 * t) - 2 * Math.cos(3 * t) - Math.cos(4 * t)) / 4;

            }
            return;
        case 14:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = 5 * Math.sin(t);
                js_function.datay [n] = 5 * Math.cos(t);
            }
            return;
        case 15:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = (Math.cos(t) + Math.pow(Math.cos(80 * t), 3)) * 3;
                js_function.datay [n] = (Math.sin(80 * t) + Math.pow(Math.sin(t), 4)) * 2.5;
            }
            return;
        case 16:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = Math.cos(t) * Math.sqrt((2 * 2 * Math.pow(Math.sin(t), 2) - 5 * 5 * Math.pow(Math.cos(t), 2)) / (Math.pow(Math.sin(t), 2) - Math.pow(Math.cos(t), 2)));
                js_function.datay [n] = Math.sin(t) * Math.sqrt((2 * 2 * Math.pow(Math.sin(t), 2) - 5 * 5 * Math.pow(Math.cos(t), 2)) / (Math.pow(Math.sin(t), 2) - Math.pow(Math.cos(t), 2)));
            }
            return;
        case 17:
            for (var n = 0; n < dots; n++) {
                var t = js_function.gettm(1, n);
                js_function.datax [n] = 3 * Math.cos(t) * (1 - 2 * Math.pow(Math.sin(t), 2));
                js_function.datay [n] = 3 * Math.sin(t) * (1 - 2 * Math.pow(Math.cos(t), 2));
            }
            return;
            //18 p and d cahrs
        default:
            js_function.funcid = 18;
            persp = 50;
            p_and_d.FunctionList();

            return;
            return;
    }

}

js_function.calculate = function () {
    js_function.FunctionList();

}

js_function.findaxis = function () {


    if (!mainrot[0]) {
        if (stateof[0] && stateof[1] && stateof[2]) {

            if (stateofdir[0]) {
                js_function.rotatey += 0.05;
                stateofdir[0] = js_function.rotatey < 7;
            } else {
                stateof[0] = stateofdir[0];
            }
        } else if (stateof[1] && (!stateof[0]) && stateof[2]) {
            if (js_function.rotatey > 0)
                js_function.rotatey -= 0.05;
            if (stateofdir[1]) {
                js_function.rotatex += 0.05;
                stateofdir[1] = js_function.rotatex < 7;
            } else {
                stateof[1] = stateofdir[1];
            }
        }
        if ((!stateof[1]) && (!stateof[0]) && stateof[2]) {
            if (js_function.rotatex > 0)
                js_function.rotatex -= 0.05;
            if (stateofdir[2]) {
                js_function.rotatez += 0.05;
                stateofdir[2] = js_function.rotatez < 7;
            } else {
                stateof[2] = stateofdir[2];
                mainrot[0] = !stateofdir[2];
            }
        }
    } else {
        if (!mainrot[1]) {
            if (stateofdir[0]) {
                js_function.rotatey += 0.05;
                stateofdir[0] = js_function.rotatey < 7;

                if (stateofdir[2]) {
                    js_function.rotatez += 0.05;
                    stateofdir[2] = js_function.rotatez < 7;
                } else {
                    js_function.rotatez -= 0.05;
                    stateofdir[2] = js_function.rotatez < -7;
                }
            } else {
                if (stateofdir[1]) {
                    js_function.rotatex += 0.05;
                    stateofdir[1] = js_function.rotatex < 7;
                    if (stateofdir[2]) {
                        js_function.rotatez += 0.05;
                        stateofdir[2] = js_function.rotatez < 7;
                    } else {
                        js_function.rotatez -= 0.05;
                        stateofdir[2] = js_function.rotatez < -7;
                    }
                } else {
                    js_function.rotatex -= 0.05;
                    stateofdir[1] = js_function.rotatex < -7;
                    if (stateofdir[2]) {
                        js_function.rotatez += 0.05;
                        stateofdir[2] = js_function.rotatez < 7;
                        if (js_function.funcid != 18)
                            mainrot[1] = !stateofdir[2]; //end this and turn next
                    } else {
                        js_function.rotatez -= 0.05;
                        stateofdir[2] = js_function.rotatez < -7;
                    }
                }
                js_function.rotatey -= 0.05;
                stateofdir[0] = js_function.rotatey < -7;
            }
        }
    }
    if (mainrot[0] && mainrot[1]) {
        if (js_function.rotatez > 0) {
            js_function.rotatez -= 0.1;
        } else {
            js_function.rotatez = 0;
            js_function.rotatex = 0;
            js_function.rotatey = 0;
            stateof[0] = stateof[1] = stateof[2] = true;
            stateofdir[0] = stateofdir[1] = stateofdir[2] = true;
            mainrot[0] = mainrot[1] = false;
            js_function.funcid += 1;

        }
    }

}

function display() {
    var ii = 0;
    if((js_function.funcid==18)&&!p_and_d.isgen)rotateradius=2*rotateradius;//or too slow in javascript
    for (var r = 0; r < 360; r += (rotateradius)) {

        var angle = 2 * (((r / (100 / rotateradius)))); //2* because tree.js "circle"=720deg (or 2*PI) when opengl 360deg

        drawfunction(ii, angle);
        ii++;
    }
    drawfunction(ii, (0 / (100 / rotateradius)));
    isgen = true;
    if (js_function.funcid == 18)
        p_and_d.isgen = true;
    PointsF.material.color.setHex(((((js_function.rotatex > 0 ? js_function.rotatex : -1 * js_function.rotatex) / 7.1) * 255) << 16) +
            ((((js_function.rotatey > 0 ? js_function.rotatey : -1 * js_function.rotatey) / 7.1) * 255) << 8) +
            (((js_function.rotatez > 0 ? js_function.rotatez : -1 * js_function.rotatez) / 7.1)) * 255);

}


function drawfunction(ii, angle) {

    for (var n = 0; n < dots; n++) {
        if (js_function.funcid == 18) {
            if (n >= p_and_d.dots) {
                return;
            }
            if (!p_and_d.isgen) {
                for (var ij = 0; ij < 2; ij++) {
                    p_and_d.p_and_d_vectordata1[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata2[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata3[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata4[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata5[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata6[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata7[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata8[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata9[ij][ii][n] = new THREE.Vector3();
                    p_and_d.p_and_d_vectordata10[ij][ii][n] = new THREE.Vector3();
                }
            }
            for (var ij = 0; ij < 2; ij++) {
                var tm = (ij == 1) ? 1 : -1;
                p_and_d.p_and_d_vectordata1[ij][ii][n].x = p_and_d.datahotizont1x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata2[ij][ii][n].x = p_and_d.datahotizont2x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata3[ij][ii][n].x = p_and_d.datahotizont3x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata4[ij][ii][n].x = p_and_d.datahotizont4x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata5[ij][ii][n].x = p_and_d.datahotizont5x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata1[ij][ii][n].y = p_and_d.datahotizont1y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata2[ij][ii][n].y = p_and_d.datahotizont2y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata3[ij][ii][n].y = p_and_d.datahotizont3y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata4[ij][ii][n].y = p_and_d.datahotizont4y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata5[ij][ii][n].y = p_and_d.datahotizont5y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata6[ij][ii][n].x = p_and_d.datavert1x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata7[ij][ii][n].x = p_and_d.datavert2x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata8[ij][ii][n].x = p_and_d.datavert3x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata9[ij][ii][n].x = p_and_d.datavert4x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata10[ij][ii][n].x = p_and_d.datavert5x[n] * scale * tm - ij;
                p_and_d.p_and_d_vectordata6[ij][ii][n].y = p_and_d.datavert1y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata7[ij][ii][n].y = p_and_d.datavert2y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata8[ij][ii][n].y = p_and_d.datavert3y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata9[ij][ii][n].y = p_and_d.datavert4y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata10[ij][ii][n].y = p_and_d.datavert5y[n] * scale * tm - 1 * (ij);
                p_and_d.p_and_d_vectordata1[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata2[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata3[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata4[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata5[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata6[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata7[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata8[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata9[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata10[ij][ii][n].z = 0;
                p_and_d.p_and_d_vectordata1[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata2[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata3[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata4[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata5[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata6[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata7[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata8[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata9[ij][ii][n].applyAxisAngle(axis, angle);
                p_and_d.p_and_d_vectordata10[ij][ii][n].applyAxisAngle(axis, angle);
                if (!p_and_d.isgen) {
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata1[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata2[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata3[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata4[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata5[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata6[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata7[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata8[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata9[ij][ii][n]);
                    PointGPD.vertices.push(p_and_d.p_and_d_vectordata10[ij][ii][n]);
                }
            }

        } else {
            if (!isgen) {
                func_vectordata[ii][n] = new THREE.Vector3();
            }
            func_vectordata[ii][n].x = ((js_function.datax[n] * scale));
            func_vectordata[ii][n].y = ((js_function.datay[n] * scale));
            func_vectordata[ii][n].z = 0;
            func_vectordata[ii][n].applyAxisAngle(axis, angle);

            if (!isgen)
                PointG.vertices.push(func_vectordata[ii][n]);
        }
    }


}

function idle_func() {
    js_function.calculate();
    js_function.findaxis();
    display();

}

p_and_d();
js_function();



///////////////



var camera = new THREE.PerspectiveCamera(persp, WIDTH / HEIGHT, 0.1, 100);


var renderer = new THREE.WebGLRenderer();
renderer.setSize(WIDTH, HEIGHT);
document.body.appendChild(renderer.domElement);

camera.position.z = 6.5;
camera.position.y = 0;
camera.position.x = 0;
camera.lookAt(scene.position);

var PointG = new THREE.Geometry();


var PointM = new THREE.PointsMaterial({color: 0xffffff, size: 0.000000001, transparent: true, opacity: 0.55});


var PointsF = new THREE.Points(PointG, PointM);

var PointGPD = new THREE.Geometry();
var PointsFPD = new THREE.Points(PointGPD, PointM);
PointsFPD.visible = false;
scene.add(PointsFPD);

scene.add(PointsF);


var render = function () {
    requestAnimationFrame(render);
    if (isgen) {

        if (js_function.funcid < 18) {
            PointG.verticesNeedUpdate = true;
            PointG.elementsNeedUpdate = true;
            PointG.morphTargetsNeedUpdate = true;
            PointG.uvsNeedUpdate = true;
            PointG.normalsNeedUpdate = true;
            PointG.colorsNeedUpdate = true;
            PointG.tangentsNeedUpdate = true;
        } else {
            PointGPD.verticesNeedUpdate = true;
            PointGPD.elementsNeedUpdate = true;
            PointGPD.morphTargetsNeedUpdate = true;
            PointGPD.uvsNeedUpdate = true;
            PointGPD.normalsNeedUpdate = true;
            PointGPD.colorsNeedUpdate = true;
            PointGPD.tangentsNeedUpdate = true;
        }
        PointsF.visible = js_function.funcid < 18;
        PointsFPD.visible = js_function.funcid == 18;

        axis = new THREE.Vector3((js_function.rotatex / 7), (js_function.rotatey / 7), (js_function.rotatez / 7));
        axis.normalize();
        idle_func();
        renderer.render(scene, camera);
        stats.update();
        /*numFrames++;
        var delta = (Date.now() - lastFpsTime) / 1000;
        if (delta > frameRateSmoothing) {
            fps = Math.round(numFrames / delta);
            numFrames = 0;
            lastFpsTime = Date.now();
        }*/
    }

};

    var container = document.createElement('div');
        document.body.appendChild(container);
        document.body.style.margin = 0;
        document.body.style.overflow = 'hidden';
        var stats = new Stats();
        stats.domElement.style.position = 'absolute';
        stats.domElement.style.top = '0px';
        stats.domElement.style.right = '0px';
        container.appendChild(stats.domElement);

display();

render();
