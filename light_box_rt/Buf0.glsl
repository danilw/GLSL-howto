//using https://www.shadertoy.com/view/ldlBWf

//tree buffer, because they realy slow
//draw five trees

/**
 * Created by Steven Sell (ssell) / 2017
 * License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
 *
 * Basic algorithm outline:
 *
 *     * Tree consists of branches, with the root branch being the trunk.
 *     * Each branch has one less segment than it's parent branch.
 *     * Each segment has a new branch.
 *     * Each branch has half the total thickness and length of it's parent branch.
 *     * Each branch has an adjusted angle of +/- MajorBranchAngle
 *     * Each segment has an adjusted angle of +/- MinorBranchAngle
 *
 * Not sure if this is the best way to generate a tree, but it's what popped into my head.
 * Implemented using a stack since recursive functions are not allowed.
 */

//------------------------------------------------------------------------------------------
// Global Properties
//------------------------------------------------------------------------------------------

// Tree Properties

      float Seed              = 337.0;     // Seed used for PRNG hash
const int   TrunkSegments     = 5;         // Number of segments in the trunk branch
const float TrunkLength       = 0.7;       // Length of the trunk branch
const float TrunkThickness    = 0.025;     // Thickness of the trunk branch
const float MajorBranchAngle  = 0.125;     // +/- angle deviation of branches
const float MinorBranchAngle  = 0.0625;    // +/- angle deviation of segments
const int   StackDepth        = 16;        // Maximum stack depth

// Math Constants

const float PI                = 3.14156;
const float E                 = 2.71828;

//------------------------------------------------------------------------------------------
// Math Functions
//------------------------------------------------------------------------------------------

float StepValue(float a, float b, float ra, float rb)
{
    float s = step(a, b);
    return (ra * abs(s - 1.0)) + (rb * s);
}

float hash11(float p)
{
    // Credit Dave_Haskins
	vec3 p3  = fract(vec3(p) * 443.8975);
    p3 += dot(p3, p3.yzx + 19.19);
    return fract((p3.x + p3.y) * p3.z);
}

float Noise(float s, float m)
{
    float r = (hash11((s + Seed)) * 2.0) - 1.0;
	return (r * m);   
}

vec2 Rotate(vec2 v, float a)
{
    float cosa = cos(a);
    float sina = sin(a);
    
    return vec2((v.x * cosa) - (v.y * sina), (v.x * sina) + (v.y * cosa));
}

float Factorial(float n)
{
	float v = 1.0;
    for(; n > 1.0+float(min(0,iFrame)); --n) { v *= n; }
    return v;
}

float CalcNumSegments(int trunkSegments)
{
    // http://oeis.org/A007526
    // Example: Trunk has 3 segments, each Branch0 has 2 segments, each Branch1 has 1 segment for 15 total.

	return floor(E * Factorial(float(trunkSegments)) - 1.0);
}

//------------------------------------------------------------------------------------------
// Line Drawing
//------------------------------------------------------------------------------------------

vec2 DistToLine(vec2 p, vec2 a, vec2 b)
{
    vec2 pa = p - a;
    vec2 ba = b - a;
    
    float frac = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    
    return vec2(length(pa - (ba * frac)), frac);
}

float Sharpen(in float dist, in float thickness, float blur)
{
    float r = (1.0 / min(iResolution.y, iResolution.x)) * blur;
    return smoothstep(r, -r, dist - thickness);
}

float LineTaper(vec2 uv, vec2 a, vec2 b, float thickness0, float thickness1, float blur)
{
    vec2 d = DistToLine(uv, a, b);
    return Sharpen(d.x, mix(thickness0, thickness1, d.y), blur);
}

//------------------------------------------------------------------------------------------
// Tree Structure
//------------------------------------------------------------------------------------------

struct Segment
{
    vec2 o;      // Origin
    vec2 d;      // Normal / Direction
    
    float bl;    // Total length of the Branch the segment is part of
    float sl;    // Length of the individual segment
    float t0;    // Starting thickness of the segment
    float t1;    // Ending thickness of the segment
    
    int s;       // # of Segments a child branch of the segment would have
    int si;      // Index  of the segment along it's branch
};

Segment Segments[StackDepth];

void Push(inout int i, Segment s)
{
    i = min(i + 1, StackDepth);
    Segments[i] = s;
}

Segment Pop(inout int i)
{
    Segment s = Segments[i];
    i = max(i - 1, 0);
    
    return s;
}
    
//------------------------------------------------------------------------------------------
// Tree Drawing
//------------------------------------------------------------------------------------------

float DrawSegment(vec2 uv, Segment s)
{
    return LineTaper(uv, s.o, (s.o + (s.d * s.sl)), s.t0, s.t1, 1.0);
}

void AddBranch(inout int si, vec2 origin, vec2 dir, float lngth, float thickness, int segments)
{
    float tstep = thickness / float(segments);
    float lstep = lngth / float(segments);

    vec2 sorigin    = origin;
    vec2 sdirection = dir;

    float t0   = thickness;
    float t1   = t0 - tstep;
    float rand = 0.0;
    
    for(int j = 0+(min(0,iFrame)); j < segments; ++j)
    {
        Push(si, Segment(sorigin, sdirection, lngth, lstep, t0, t1, (segments - 1), j));

       	rand       = float(si + j + 1);
        sorigin    = sorigin + (sdirection * lstep);
        sdirection = Rotate(sdirection, Noise(rand, PI * MinorBranchAngle * StepValue(rand, 0.0, 1.0, -1.0)));
        
        t0 = t1;
        t1 = t0 - tstep;
    }
}

float Tree(vec2 uv, vec2 origin, vec2 direction, float lngth, int segments, float thickness)
{
    float f = 0.0;
    
    int totalSegments = int(CalcNumSegments(segments));
    int si = -1;
    
    AddBranch(si, origin, direction, lngth, thickness, segments);
    
    for(int i = 0+(min(0,iFrame)); i < totalSegments; ++i)
    {
        Segment root = Pop(si);                // Root segment of this branch
        f = max(f, DrawSegment(uv, root));     // Draw the root segment
        
  		if(root.s > 0 && root.si > 0)          // Add a branch to this segment if valid
        {
            AddBranch(si, root.o,  Rotate(root.d, Noise(float(i + root.s), PI * MajorBranchAngle)), root.bl * 0.5, root.t0, root.s);
        }
    }
    
    return f;
}

vec4 mi(in vec2 fragCoord, float vz)
{
    Seed = 337.0 + floor(vz * 1.5); //val
    
	vec2 uv = (fragCoord.xy / iResolution.xy);
    uv.x *= iResolution.x / iResolution.y;
    
    float f = Tree(uv, vec2(0.5, -0.03), vec2(0.0, 1.0), TrunkLength, TrunkSegments, TrunkThickness);
    
    return  vec4(vec3(f),1.);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec4 ret_col=vec4(0.);
    if(ivec2(fragCoord.xy)==ivec2(iResolution.xy-1.)){
        ret_col=vec4(-1.);//-1.
        fragColor = ret_col;
        return;
    }
    //repaint on resolution change
    if(texelFetch(iChannel0,ivec2(iResolution.xy-1.),0).x>=0.){
        if(fragCoord.x<iResolution.x/3.7)
        ret_col=mi(fragCoord+vec2(iResolution.x/9.,0.),1.);
        else if(fragCoord.x<iResolution.x/2.1)ret_col=mi(fragCoord-vec2(iResolution.x/11.5,0.),2.);
            else if(fragCoord.x<iResolution.x/1.5)ret_col=mi(fragCoord-vec2(iResolution.x/3.85,0.),11.);
                else if(fragCoord.x<iResolution.x/1.18)ret_col=mi(fragCoord-vec2(iResolution.x/1.98,0.),7.);
                else ret_col=mi(fragCoord-vec2(iResolution.x/1.47,0.),37.);
    }
    else
        ret_col=texture(iChannel0,fragCoord.xy / iResolution.xy);
    
    fragColor = ret_col;
}
