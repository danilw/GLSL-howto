precision mediump float;
varying vec4 color;
uniform float u_time;
uniform vec2 u_resolution;
uniform sampler2D u_texture1;
uniform sampler2D u_texture2;
uniform sampler2D u_texture3;

uniform bool u_load0;
uniform bool u_load1;
uniform bool u_load2;
uniform bool u_playback;
uniform bool u_playnext;
uniform float u_FadeSpeed;

#define iTime u_time
#define iResolution u_resolution
#define iChannel0 u_texture1
#define iChannel1 u_texture2
#define iChannel2 u_texture3

#define PI (4.0 * atan(1.0))
#define TWO_PI PI*2.
#define MD(a) mat2(cos(a), -sin(a), sin(a), cos(a))

float global_zoom = 1.;

float shape(vec2 uv, int N, float radius_in, float radius_out) {

    float color = 0.0;
    float d = 0.0;
    float a = atan(uv.x, uv.y) + PI;
    float rx = TWO_PI / float(N);
    d = cos(floor(.5 + a / rx) * rx - a) * length(uv);
    color = smoothstep(.415, .425, abs(d - radius_in) + radius_out);
    return (1. - color);
}

float circle(vec2 uv, float r1, float r2, bool disk, float zoom) {
    uv *= zoom;
    float w = (1.0 * zoom) / iResolution.y;
    float t = r1 - r2;
    float r = r1;

    if (!disk)
        return smoothstep(-w, w, abs(length(uv) - r) - t / 2.0);
    else
        return smoothstep(-w, w, (length(uv) - r));

}

float testCross(vec2 a, vec2 b, vec2 p) {
    return sign((b.y - a.y) * (p.x - a.x) - (b.x - a.x) * (p.y - a.y));
}

// https://www.shadertoy.com/view/ltXSDB

float signBezier(vec2 A, vec2 B, vec2 C, vec2 p) {
    vec2 a = C - A, b = B - A, c = p - A;
    vec2 bary = vec2(c.x * b.y - b.x * c.y, a.x * c.y - c.x * a.y) / (a.x * b.y - b.x * a.y);
    vec2 d = vec2(bary.y * 0.5, 0.0) + 1.0 - bary.x - bary.y;
    return mix(sign(d.x * d.x - d.y), mix(-1.0, 1.0,
            step(testCross(A, B, p) * testCross(B, C, p), 0.0)),
            step((d.x - d.y), 0.0)) * testCross(A, C, B);
}

vec3 solveCubic(float a, float b, float c) {
    float p = b - a * a / 3.0, p3 = p * p*p;
    float q = a * (2.0 * a * a - 9.0 * b) / 27.0 + c;
    float d = q * q + 4.0 * p3 / 27.0;
    float offset = -a / 3.0;
    if (d >= 0.0) {
        float z = sqrt(d);
        vec2 x = (vec2(z, -z) - q) / 2.0;
        vec2 uv = sign(x) * pow(abs(x), vec2(1.0 / 3.0));
        return vec3(offset + uv.x + uv.y);
    }
    float v = acos(-sqrt(-27.0 / p3) * q / 2.0) / 3.0;
    float m = cos(v), n = sin(v)*1.732050808;
    return vec3(m + m, -n - m, n - m) * sqrt(-p / 3.0) + offset;
}

float sdBezier(vec2 A, vec2 B, vec2 C, vec2 p) {
    B = mix(B + vec2(1e-4), B, abs(sign(B * 2.0 - A - C)));
    vec2 a = B - A, b = A - B * 2.0 + C, c = a * 2.0, d = A - p;
    vec3 k = vec3(3. * dot(a, b), 2. * dot(a, a) + dot(d, b), dot(d, a)) / dot(b, b);
    vec3 t = clamp(solveCubic(k.x, k.y, k.z), 0.0, 1.0);
    vec2 pos = A + (c + b * t.x) * t.x;
    float dis = length(pos - p);
    pos = A + (c + b * t.y) * t.y;
    dis = min(dis, length(pos - p));
    pos = A + (c + b * t.z) * t.z;
    dis = min(dis, length(pos - p));
    return dis * signBezier(A, B, C, p);
}

float segment1(vec2 uv) {
    vec2 A = vec2(-0.8, -0.36);
    vec2 C = vec2(0.8, +0.37);
    float q = 0.02 + global_zoom * 0.002;
    vec2 B = (4.0 * vec2(0.1, -0.25) - A - C) / 2.0;
    float d = sdBezier(A, B, C, uv);
    float ret = 1.0 - smoothstep(0.0, q, (d));
    return ret;
}

float segment11(vec2 uv) {
    uv = -uv;
    vec2 A = vec2(-0.2, -0.36);
    vec2 C = vec2(0.8, +0.36);
    vec2 B = (4.0 * vec2(0.39, -0.17) - A - C) / 2.0;
    float d = sdBezier(A, B, C, uv);
    float q = 0.02 + global_zoom * 0.002;
    float v1 = smoothstep(-q, 0., (uv.y - A.y));
    float v2 = smoothstep(q, 0., abs(uv.y - A.y)) * min(smoothstep(A.x + q, A.x, uv.x), smoothstep(-C.x - q, -C.x, uv.x));
    float ret = 1.0 - (smoothstep(0.0, q, (d)))*(1.);
    ret = (min(max(ret, v2), v1));
    return ret;
}

float segment2(vec2 uv) {
    vec2 A = vec2(-0.8, -0.36);
    vec2 C = vec2(0.8, +0.37);
    float q = 0.02 + global_zoom * 0.002;
    vec2 B = (4.0 * vec2(0.12, -0.2) - A - C) / 2.0;
    float d = sdBezier(A, B, C, uv);
    float ret = 1.0 - smoothstep(0.0, q, (d));
    return ret;
}

float segment21(vec2 uv) {
    uv = -uv;
    vec2 A = vec2(-0.2, -0.28);
    vec2 C = vec2(0.8, +0.37);
    vec2 B = (4.0 * vec2(0.39, -0.07) - A - C) / 2.0;
    float d = sdBezier(A, B, C, uv);
    float q = 0.02 + global_zoom * 0.002;
    uv *= MD(-0.102);
    uv.y -= 0.025;
    float v1 = smoothstep(-q, 0., (uv.y - A.y));

    float v2 = smoothstep(q, 0., abs(uv.y - A.y)) * min(smoothstep(A.x + q, A.x, uv.x), smoothstep(-C.x - q, -C.x, uv.x));
    float ret = 1.0 - (smoothstep(0.0, q, (d)))*(1.);
    ret = (min(max(ret, v2), v1));
    return ret;
}
float xx = -0.15;
float yy = -0.25;

float linexs1(vec2 uv) {
    float q = 0.02 + global_zoom * 0.002;
    vec2 tuv = uv - vec2(xx, yy) * global_zoom;
    tuv *= MD(PI / 4.);
    float d = 1. - shape(tuv, 4, 04.1070, -02.40);
    uv.y += 0.01399 * global_zoom;
    float dx = smoothstep(q / 1.5, 0. + q / 3., abs(uv.y)) * step(((uv * MD(0.65)).x + global_zoom * 0.1051), q);
    uv.y += -0.1;
    dx += 0.25 * smoothstep(q / 1.5, 0. + q / 3., abs(uv.y)) * step(((uv * MD(0.65)).x + global_zoom * 0.1051), q);
    return d*dx;
}

float segments(vec2 uv) {
    global_zoom = 22.;
    float d = 0.;
    uv.x += xx;
    uv.y += yy;
    vec2 tuv = uv*global_zoom;
    tuv.x += -xx / 7. * global_zoom;
    float d1 = segment1(tuv);
    d1 = min(d1, segment11(tuv));
    global_zoom = 27.;
    tuv = uv*global_zoom;
    tuv.x += 0.1 * global_zoom;
    tuv *= MD(-0.102);
    float d2 = segment2(tuv);
    d2 = min(d2, segment21(tuv));
    d = (d1 + d2);
    global_zoom = 4.;

    tuv = uv*global_zoom;
    d = max(d, linexs1(tuv));
    return d;
}

float skullpos(vec2 uv) {
    return circle(uv, 0.0316, 0.4, true, 1.);
}

float swordpos(vec2 uv) {
    uv *= MD(PI / 4.);
    uv.y += 0.01 + 0.032;
    uv.x *= 1.25;
    vec2 tuv = uv;
    tuv.y += 0.015;
    tuv.x *= 2.;
    tuv *= 3.;
    float d = shape(tuv, 3, 0.0, 0.1);
    tuv = uv;
    d = min(d, smoothstep(0.014 + 2. / iResolution.y, 0.014, abs(tuv.x)));
    if (tuv.y < 0.014) {
        tuv.y += 0.045;
        tuv *= 5.;
        float dx = smoothstep(-0.034, -0.034 + 2. / iResolution.y, uv.y);
        d = max(d, shape(tuv, 4, 0.0, 0.29) * dx);
        d = d * dx + (1. - dx) * min(d, smoothstep(0.007 + 2. / iResolution.y, 0.007, abs(uv.x)));
        vec2 tuv2 = abs(uv);
        tuv2 *= MD(0.83);
        dx = smoothstep(-0.032 + 2. / iResolution.y, -0.032, uv.y) * smoothstep(0.012 + 2. / iResolution.y, 0.012, tuv2.x);
        vec2 tuv3 = uv;
        tuv3.x = abs(tuv3.x);
        tuv3 *= MD(-0.13);
        dx *= smoothstep(-0.0462, -0.0462 + 2. / iResolution.y, (tuv3.y));
        float adx = min(1., dx + smoothstep(0.012, 0.012 + 2. / iResolution.y, tuv2.x));
        tuv3 *= MD(0.3);
        tuv3.y += -0.018;
        adx = adx * smoothstep(-0.0462, -0.0462 + 2. / iResolution.y, (tuv3.y));
        tuv3 = uv;
        tuv3.x = abs(tuv3.x);
        tuv3 *= MD(0.35);
        tuv3.y += -0.034;
        adx = adx * smoothstep(-0.0462 + 2. / iResolution.y, -0.0462, (tuv3.y));
        d = max(d, dx + adx);
        tuv.y += 0.07 * 5.;
        dx = smoothstep(-0.113, -0.113 + 2. / iResolution.y, uv.y);
        tuv2 = uv * 5.;
        tuv2.y += -0.0299 * 5.;
        tuv2 *= MD(PI);
        tuv2.x *= .5;
        d = max(d * shape(tuv2, 3, 0.0, 0.051), shape(tuv, 4, 0.0, 0.355) * dx);
    }
    return d;
}

float squareseg(vec2 uv) {
    float d = 0.0;
    float a = atan(uv.x, uv.y) + PI;
    float rx = TWO_PI / float(4);
    d = cos(floor(.5 + a / rx) * rx - a) * length(uv);
    d = smoothstep(.415, .417, abs(d - 0.) + 0.3718);
    return 1. - d;
}

vec3 col1 = vec3(0xc1, 0xc0, 0xc0) / float(0xff);
vec3 col2 = vec3(0xad, 0x2d, 0x26) / float(0xff);
vec3 col3 = vec3(0xb7, 0x11, 0x2c) / float(0xff);
vec3 col4 = vec3(0xff, 0xff, 0xff) / float(0xff);

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 res = iResolution.xy / iResolution.y;
    vec2 uv = (fragCoord.xy) / iResolution.y - res / 2.0;
    //uv *= MD(iTime);
    uv *= MD(-PI / 4.);
    vec2 tuv = uv;
    vec3 d = vec3(0.);
    if ((tuv.x<-0.2)&&(tuv.y < 0.23)) {
        d = max(d, col1 * segments(vec2(-tuv.y, -tuv.x)));
    } else if ((tuv.x>-0.3)&&(tuv.y > 0.23)) {
        d = max(d, col1 * segments(vec2(uv.x, uv.y)));
    } else if ((tuv.x>-0.3)&&(tuv.y<-0.23)) {
        d = max(d, col1 * segments(vec2(-uv.x, -uv.y)));
    } else if ((tuv.x > 0.2)&&(tuv.y>-0.23)) {
        d = max(d, col1 * segments(vec2(uv.y, uv.x)));
    }

    global_zoom = 4.;
    tuv = uv*global_zoom;
    d = max(d, col2 * shape(tuv, 4, 0.750, 0.4));
    tuv = uv;

    tuv *= MD(PI / 4.);
    tuv.y += 0.032;
    d = max(d, col4 * (1. - circle(tuv, 01.6, 1.5, false, 16.)) * smoothstep(0.023, 0.023 + 2. / iResolution.y, abs(tuv.x) + 1. * step(0., -tuv.y)));
    float dx = squareseg(uv);
    d = max(d, col3 * dx);
    d = max(d, col4 * swordpos(uv)*(1. - dx));

    float tz=14.;
    vec2 tres=((fragCoord.xy) / iResolution.y);
    tres.y=1.-tres.y;
    tres+=-res/2.;
    //tres *= MD(-iTime);
    tres*=vec2(9./16.,1.);
    tres+=0.5/tz;
    tres*=tz;
    vec4 tcol = texture2D(iChannel0,tres);
    //d+=tcol.a*vec4(0.,0.,1.,1.).xyz*(1.-skullpos(uv));
    fragColor = vec4(d, 1.);
    fragColor += tcol;
}

void main(void) {
    vec4 fragColor = vec4(0.);
    mainImage(fragColor,gl_FragCoord.xy);
    gl_FragColor = fragColor;
}