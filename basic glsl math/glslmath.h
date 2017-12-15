// (c) by Stefan Roettger, licensed under MIT license
// glslmath: header-only single-module library that simulates glsl math

//! \file
//! GLSLmath header
#ifndef GLSLMATH_H
#define GLSLMATH_H

#include <math.h>
#include <float.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include <string>
#include <iostream>
#include <iomanip>
#include <vector>
#include <limits>

#ifndef PI
#   define PI (3.14159265358979323846264338327950288)
#endif

#ifndef NAN
#   define NAN (std::numeric_limits<double>::quiet_NaN())
#endif

#ifdef _WIN32
#define drand48() ((double)rand()/RAND_MAX)
#define srand48(s) srand(s)
#endif

#ifdef _MSC_VER
#   define snprintf _snprintf
#endif

#define GLSLMATH_PRECISION 7

namespace glslmath {

inline std::string to_space(int space=0)
   {
   std::string s;
   for (int i=0; i<space; i++) s += " ";
   return(s);
   }

inline std::string to_string(int v, int space=0)
   {
   char buf[32];
   snprintf(buf, sizeof(buf), "%i", v);
   std::string s(buf);

   if ((unsigned int)space > s.size())
      {
      int pad_left = (space-s.size())/2;
      int pad_right = space-pad_left-s.size();

      return(to_space(pad_left) + s + to_space(pad_right));
      }

   return(s);
   }

inline std::string to_string(unsigned int v, int space=0)
   {
   char buf[32];
   snprintf(buf, sizeof(buf), "%u", v);
   std::string s(buf);

   if ((unsigned int)space > s.size())
      {
      int pad_left = (space-s.size())/2;
      int pad_right = space-pad_left-s.size();

      return(to_space(pad_left) + s + to_space(pad_right));
      }

   return(s);
   }

inline std::string to_string(double v, int space=0)
   {
   char buf[32];
   snprintf(buf, sizeof(buf), "%.7g", v);
   std::string s(buf);

   if ((unsigned int)space > s.size())
      {
      int pad_left = (space-s.size())/2;
      int pad_right = space-pad_left-s.size();

      return(to_space(pad_left) + s + to_space(pad_right));
      }

   return(s);
   }

}

//! 2D double vector
//! * definition of components via constructor vec2(x,y)
//! * access to components x/y via . component selector
//! * supplies vector operators + - * and dot product
//! * supplies getters for length and normalization
class vec2
   {
   public:

   //! default constructor
   vec2() {}

   //! copy constructor
   vec2(const vec2 &v) {x=v.x; y=v.y;}

   //! component-wise constructor
   vec2(const double vx,const double vy) {x=vx; y=vy;}

   //! single-component constructor
   vec2(const double v) {x=y=v;}

   //! const pointer to linear array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const double *() const
      {return(pointer);}

   //! destructor
   ~vec2() {}

   //! get vector length
   double length() const {return(sqrt(x*x+y*y));}

   //! get squared vector length
   double norm() const {return(x*x+y*y);}

   //! normalize vector to unit length
   vec2 normalize() const;

   //! inner product
   double dot(const vec2 &v) const
      {return(x*v.x+y*v.y);}

   //! test for approximate equality
   bool approx(const vec2 &v,const double e=1E-10) const
      {return((v.x-x)*(v.x-x)+(v.y-y)*(v.y-y)<e*e);}

   //! inplace addition
   vec2& operator += (const vec2 &v)
      {x+=v.x; y+=v.y; return(*this);}

   //! inplace subtraction
   vec2& operator -= (const vec2 &v)
      {x-=v.x; y-=v.y; return(*this);}

   //! inplace multiplication
   vec2& operator *= (double v)
      {x*=v; y*=v; return(*this);}

   //! inplace multiplication
   vec2& operator *= (const vec2 &v)
      {x*=v.x; y*=v.y; return(*this);}

   //! swizzeling operator
   vec2 yx() const
      {return(vec2(y,x));}

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space));}

   //! vector components
   union {
      struct {double x,y;};
      double pointer[2];
      };
   };

//! addition of two vectors
inline vec2 operator + (const vec2 &a,const vec2 &b)
   {return(vec2(a.x+b.x,a.y+b.y));}

//! subtraction of two vectors
inline vec2 operator - (const vec2 &a,const vec2 &b)
   {return(vec2(a.x-b.x,a.y-b.y));}

//! negation of a vector
inline vec2 operator - (const vec2 &v)
   {return(vec2(-v.x,-v.y));}

//! left-hand side scalar multiplication
inline vec2 operator * (const double a,const vec2 &b)
   {return(vec2(a*b.x,a*b.y));}

//! right-hand side scalar multiplication
inline vec2 operator * (const vec2 &a,const double b)
   {return(vec2(a.x*b,a.y*b));}

//! right-hand side scalar division
inline vec2 operator / (const vec2 &a,const double b)
   {return(vec2(a.x/b,a.y/b));}

//! component-wise multiplication
inline vec2 operator * (const vec2 &a,const vec2 &b)
   {return(vec2(a.x*b.x,a.y*b.y));}

//! comparison
inline bool operator == (const vec2 &a,const vec2 &b)
   {return(a.x==b.x && a.y==b.y);}

//! negated comparison
inline bool operator != (const vec2 &a,const vec2 &b)
   {return(a.x!=b.x || a.y!=b.y);}

//! get vector length
inline double length(const vec2 &v)
   {return(v.length());}

//! get squared vector length
inline double norm(const vec2 &v)
   {return(v.norm());}

//! normalization to unit length
inline vec2 vec2::normalize() const
   {
   double l2=norm();
   if (l2>0.0 && l2!=1.0) return(*this/sqrt(l2));
   return(*this);
   }

//! normalization to unit length
inline vec2 normalize(const vec2 &v)
   {return(v.normalize());}

//! inner product
inline double dot(const vec2 &a,const vec2 &b)
   {return(a.dot(b));}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec2 &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ")");}

//! 2D float vector
//! * definition of components via constructor vec2f(x,y)
//! * access to components x/y via . component selector
//! * this vector type is designed for compact storage purposes
//! * primarily use vec2 for linear math calulations
class vec2f
   {
   public:

   //! default constructor
   vec2f() {}

   //! copy constructor
   vec2f(const vec2f &v) {x=v.x; y=v.y;}

   //! copy constructor
   vec2f(const vec2 &v) {x=(float)v.x; y=(float)v.y;}

   //! component-wise constructor
   vec2f(const float vx,const float vy) {x=vx; y=vy;}

   //! single-component constructor
   vec2f(const float v) {x=y=v;}

   //! cast operator
   operator vec2() const
      {return(vec2(x,y));}

   //! const pointer to linear array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const float *() const
      {return(pointer);}

   //! destructor
   ~vec2f() {}

   //! inplace addition
   vec2f& operator += (const vec2f &v)
      {x+=v.x; y+=v.y; return(*this);}

   //! inplace subtraction
   vec2f& operator -= (const vec2f &v)
      {x-=v.x; y-=v.y; return(*this);}

   //! inplace multiplication
   vec2f& operator *= (float v)
      {x*=v; y*=v; return(*this);}

   //! inplace multiplication
   vec2f& operator *= (const vec2f &v)
      {x*=v.x; y*=v.y; return(*this);}

   //! swizzeling operator
   vec2f yx() const
      {return(vec2f(y,x));}

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space));}

   //! vector components
   union {
      struct {float x,y;};
      float pointer[2];
      };
   };

//! addition of two vectors
inline vec2f operator + (const vec2f &a,const vec2f &b)
   {return(vec2f(a.x+b.x,a.y+b.y));}

//! subtraction of two vectors
inline vec2f operator - (const vec2f &a,const vec2f &b)
   {return(vec2f(a.x-b.x,a.y-b.y));}

//! negation of a vector
inline vec2f operator - (const vec2f &v)
   {return(vec2f(-v.x,-v.y));}

//! left-hand side scalar multiplication
inline vec2f operator * (const float a,const vec2f &b)
   {return(vec2f(a*b.x,a*b.y));}

//! right-hand side scalar multiplication
inline vec2f operator * (const vec2f &a,const float b)
   {return(vec2f(a.x*b,a.y*b));}

//! right-hand side scalar division
inline vec2f operator / (const vec2f &a,const float b)
   {return(vec2f(a.x/b,a.y/b));}

//! component-wise multiplication
inline vec2f operator * (const vec2f &a,const vec2f &b)
   {return(vec2f(a.x*b.x,a.y*b.y));}

//! comparison
inline bool operator == (const vec2f &a,const vec2f &b)
   {return(a.x==b.x && a.y==b.y);}

//! negated comparison
inline bool operator != (const vec2f &a,const vec2f &b)
   {return(a.x!=b.x || a.y!=b.y);}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec2f &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ")");}

//! 3D double vector
//! * definition of components via constructor vec3(x,y,z)
//! * access to components x/y/z via . component selector
//! * supplies vector operators + - * dot and cross product
//! * supplies getters for length and normalization
class vec3
   {
   public:

   //! default constructor
   vec3() {}

   //! copy constructor
   vec3(const vec3 &v) {x=v.x; y=v.y; z=v.z;}

   //! copy constructor
   vec3(const vec2 &v,const double vz=0.0) {x=v.x; y=v.y; z=vz;}

   //! component-wise constructor
   vec3(const double vx,const double vy,const double vz) {x=vx; y=vy; z=vz;}

   //! single-component constructor
   vec3(const double v) {x=y=z=v;}

   //! cast operator
   operator vec2() const
      {return(vec2(x,y));}

   //! const pointer to linear array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const double *() const
      {return(pointer);}

   //! destructor
   ~vec3() {}

   //! inplace addition
   vec3& operator += (const vec3 &v)
      {x+=v.x; y+=v.y; z+=v.z; return(*this);}

   //! inplace subtraction
   vec3& operator -= (const vec3 &v)
      {x-=v.x; y-=v.y; z-=v.z; return(*this);}

   //! inplace multiplication
   vec3& operator *= (double v)
      {x*=v; y*=v; z*=v; return(*this);}

   //! inplace multiplication
   vec3& operator *= (const vec3 &v)
      {x*=v.x; y*=v.y; z*=v.z; return(*this);}

   //! get vector length
   double length() const {return(sqrt(x*x+y*y+z*z));}

   //! get squared vector length
   double norm() const {return(x*x+y*y+z*z);}

   //! normalize vector to unit length
   vec3 normalize() const;

   //! inner product
   double dot(const vec3 &v) const
      {return(x*v.x+y*v.y+z*v.z);}

   //! cross product (0,0,-1)/(-1,0,0)=(0,1,0)
   vec3 cross(const vec3 &v) const
      {return(vec3(y*v.z-z*v.y,z*v.x-x*v.z,x*v.y-y*v.x));}

   //! reflect incidental vector at normalized surface normal
   vec3 reflect(const vec3 &n) const;

   //! calculate triangle normal
   static vec3 normal(const vec3 &a,const vec3 &b,const vec3 &c);

   //! calculate triangle area
   static double area(const vec3 &a,const vec3 &b,const vec3 &c);

   //! test for approximate equality
   bool approx(const vec3 &v,const double e=1E-10) const
      {return((v.x-x)*(v.x-x)+(v.y-y)*(v.y-y)+(v.z-z)*(v.z-z)<e*e);}

   //! swizzeling operator
   vec2 xy() const
      {return(vec2(x,y));}

   //! swizzeling operator
   vec3 zyx() const
      {return(vec3(z,y,x));}

   //! swizzeling operator
   vec3 bgr() const
      {return(vec3(b,g,r));}

   //! blending operator
   vec3 blend(const vec3 &rgb,double alpha) const;

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ", " + glslmath::to_string(z) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space) + delimiter + glslmath::to_string(z, space));}

   //! vector components
   union {
      struct {
         union {double x; double r;};
         union {double y; double g;};
         union {double z; double b;};
         };
      double pointer[3];
      };
   };

//! addition of two vectors
inline vec3 operator + (const vec3 &a,const vec3 &b)
   {return(vec3(a.x+b.x,a.y+b.y,a.z+b.z));}

//! subtraction of two vectors
inline vec3 operator - (const vec3 &a,const vec3 &b)
   {return(vec3(a.x-b.x,a.y-b.y,a.z-b.z));}

//! negation of a vector
inline vec3 operator - (const vec3 &v)
   {return(vec3(-v.x,-v.y,-v.z));}

//! left-hand side scalar multiplication
inline vec3 operator * (const double a,const vec3 &b)
   {return(vec3(a*b.x,a*b.y,a*b.z));}

//! right-hand side scalar multiplication
inline vec3 operator * (const vec3 &a,const double b)
   {return(vec3(a.x*b,a.y*b,a.z*b));}

//! right-hand side scalar division
inline vec3 operator / (const vec3 &a,const double b)
   {return(vec3(a.x/b,a.y/b,a.z/b));}

//! component-wise multiplication
inline vec3 operator * (const vec3 &a,const vec3 &b)
   {return(vec3(a.x*b.x,a.y*b.y,a.z*b.z));}

//! comparison
inline bool operator == (const vec3 &a,const vec3 &b)
   {return(a.x==b.x && a.y==b.y && a.z==b.z);}

//! negated comparison
inline bool operator != (const vec3 &a,const vec3 &b)
   {return(a.x!=b.x || a.y!=b.y || a.z!=b.z);}

//! get vector length
inline double length(const vec3 &v)
   {return(v.length());}

//! get squared vector length
inline double norm(const vec3 &v)
   {return(v.norm());}

//! normalization to unit length
inline vec3 vec3::normalize() const
   {
   double l2=norm();
   if (l2>0.0 && l2!=1.0) return(*this/sqrt(l2));
   return(*this);
   }

//! normalization to unit length
inline vec3 normalize(const vec3 &v)
   {return(v.normalize());}

//! inner product
inline double dot(const vec3 &a,const vec3 &b)
   {return(a.dot(b));}

//! cross product
inline vec3 cross(const vec3 &a,const vec3 &b)
   {return(a.cross(b));}

//! reflect incidental vector at normalized surface normal
inline vec3 vec3::reflect(const vec3 &n) const
   {return((*this)-2*n*dot(n));}

//! reflect incident vector at normalized surface normal
inline vec3 reflect(const vec3 &v,const vec3 &n)
   {return(v.reflect(n));}

//! calculate triangle normal
inline vec3 vec3::normal(const vec3 &a,const vec3 &b,const vec3 &c)
   {return((b-a).cross(c-a).normalize());}

//! calculate triangle area
inline double vec3::area(const vec3 &a,const vec3 &b,const vec3 &c)
   {return(fabs((b-a).cross(c-a).length()/2));}

//! blending operator
inline vec3 vec3::blend(const vec3 &rgb,double alpha) const
   {return((1-alpha)*(*this)+alpha*rgb);}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec3 &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ", " << v.z << ")");}

//! 3D float vector
//! * definition of components via constructor vec3f(x,y,z)
//! * access to components x/y/z via . component selector
//! * this vector type is designed for compact storage purposes
//! * primarily use vec3 for linear math calulations
class vec3f
   {
   public:

   //! default constructor
   vec3f() {}

   //! copy constructor
   vec3f(const vec3f &v) {x=v.x; y=v.y; z=v.z;}

   //! copy constructor
   vec3f(const vec3 &v) {x=(float)v.x; y=(float)v.y; z=(float)v.z;}

   //! copy constructor
   vec3f(const vec2f &v,const float vz=0.0f) {x=v.x; y=v.y; z=vz;}

   //! copy constructor
   vec3f(const vec2 &v,const float vz=0.0f) {x=(float)v.x; y=(float)v.y; z=vz;}

   //! component-wise constructor
   vec3f(const float vx,const float vy,const float vz) {x=vx; y=vy; z=vz;}

   //! single-component constructor
   vec3f(const float v) {x=y=z=v;}

   //! cast operator
   operator vec3() const
      {return(vec3(x,y,z));}

   //! const pointer to linear array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const float *() const
      {return(pointer);}

   //! destructor
   ~vec3f() {}

   //! inplace addition
   vec3f& operator += (const vec3f &v)
      {x+=v.x; y+=v.y; z+=v.z; return(*this);}

   //! inplace subtraction
   vec3f& operator -= (const vec3f &v)
      {x-=v.x; y-=v.y; z-=v.z; return(*this);}

   //! inplace multiplication
   vec3f& operator *= (float v)
      {x*=v; y*=v; z*=v; return(*this);}

   //! inplace multiplication
   vec3f& operator *= (const vec3f &v)
      {x*=v.x; y*=v.y; z*=v.z; return(*this);}

   //! swizzeling operator
   vec2f xy() const
      {return(vec2f(x,y));}

   //! swizzeling operator
   vec3f zyx() const
      {return(vec3f(z,y,x));}

   //! swizzeling operator
   vec3f bgr() const
      {return(vec3f(b,g,r));}

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ", " + glslmath::to_string(z) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space) + delimiter + glslmath::to_string(z, space));}

   //! vector components
   union {
      struct {
         union {float x; float r;};
         union {float y; float g;};
         union {float z; float b;};
         };
      float pointer[3];
      };
   };

//! addition of two vectors
inline vec3f operator + (const vec3f &a,const vec3f &b)
   {return(vec3f(a.x+b.x,a.y+b.y,a.z+b.z));}

//! subtraction of two vectors
inline vec3f operator - (const vec3f &a,const vec3f &b)
   {return(vec3f(a.x-b.x,a.y-b.y,a.z-b.z));}

//! negation of a vector
inline vec3f operator - (const vec3f &v)
   {return(vec3f(-v.x,-v.y,-v.z));}

//! left-hand side scalar multiplication
inline vec3f operator * (const float a,const vec3f &b)
   {return(vec3f(a*b.x,a*b.y,a*b.z));}

//! right-hand side scalar multiplication
inline vec3f operator * (const vec3f &a,const float b)
   {return(vec3f(a.x*b,a.y*b,a.z*b));}

//! right-hand side scalar division
inline vec3f operator / (const vec3f &a,const float b)
   {return(vec3f(a.x/b,a.y/b,a.z/b));}

//! component-wise multiplication
inline vec3f operator * (const vec3f &a,const vec3f &b)
   {return(vec3f(a.x*b.x,a.y*b.y,a.z*b.z));}

//! comparison
inline bool operator == (const vec3f &a,const vec3f &b)
   {return(a.x==b.x && a.y==b.y && a.z==b.z);}

//! negated comparison
inline bool operator != (const vec3f &a,const vec3f &b)
   {return(a.x!=b.x || a.y!=b.y || a.z!=b.z);}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec3f &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ", " << v.z << ")");}

//! 4D double vector
//! * definition of components via constructor vec4(x,y,z,w)
//! * access to components x/y/z/w via . component selector
//! * supplies vector operators + - * and dot product
//! * supplies getter for length
class vec4
   {
   public:

   //! default constructor
   vec4() {}

   //! copy constructor
   vec4(const vec4 &v) {x=v.x; y=v.y; z=v.z; w=v.w;}

   //! copy constructor
   vec4(const vec3 &v,const double vw=1.0) {x=v.x; y=v.y; z=v.z; w=vw;}

   //! copy constructor
   vec4(const vec2 &v,const double vz=0.0,const double vw=1.0) {x=v.x; y=v.y; z=vz; w=vw;}

   //! copy constructor
   vec4(const vec2 &xy,const vec2 &zw) {x=xy.x; y=xy.y; z=zw.x; w=zw.y;}

   //! component-wise constructor
   vec4(const double vx,const double vy,const double vz,const double vw=1.0) {x=vx; y=vy; z=vz; w=vw;}

   //! single-component constructor
   vec4(const double v,const double vw=1.0) {x=y=z=v; w=vw;}

   //! cast operator with homogenization
   operator vec3() const
      {
      double c;

      if (w!=0.0)
         if (w!=1.0)
            {
            c=1.0/w;
            return(vec3(x*c,y*c,z*c));
            }

      return(vec3(x,y,z));
      }

   //! const pointer to linear array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const double *() const
      {return(pointer);}

   //! destructor
   ~vec4() {}

   //! inplace addition
   vec4& operator += (const vec4 &v)
      {x+=v.x; y+=v.y; z+=v.z; w+=v.w; return(*this);}

   //! inplace subtraction
   vec4& operator -= (const vec4 &v)
      {x-=v.x; y-=v.y; z-=v.z; w-=v.w; return(*this);}

   //! inplace multiplication
   vec4& operator *= (double v)
      {x*=v; y*=v; z*=v; w*=v; return(*this);}

   //! inplace multiplication
   vec4& operator *= (const vec4 &v)
      {x*=v.x; y*=v.y; z*=v.z; w*=v.w; return(*this);}

   //! get vector length
   double length() const {return(sqrt(x*x+y*y+z*z+w*w));}

   //! get squared vector length
   double norm() const {return(x*x+y*y+z*z+w*w);}

   //! normalize vector to unit length
   vec4 normalize() const;

   //! inner product
   double dot(const vec4 &v) const
      {return(x*v.x+y*v.y+z*v.z+w*v.w);}

   //! cross product (0,0,-1,0)/(-1,0,0,0)=(0,1,0,0)
   vec4 cross(const vec4 &v) const
      {
      assert(w==0.0 && v.w==0.0);
      return(vec4(y*v.z-z*v.y,z*v.x-x*v.z,x*v.y-y*v.x,0.0));
      }

   //! reflect incident vector at normalized surface normal
   vec4 reflect(const vec4 &n) const;

   //! calculate triangle normal
   static vec4 normal(const vec4 &a,const vec4 &b,const vec4 &c);

   //! calculate triangle area
   static double area(const vec4 &a,const vec4 &b,const vec4 &c);

   //! test for approximate equality
   bool approx(const vec4 &v,const double e=1E-10) const
      {return((v.x-x)*(v.x-x)+(v.y-y)*(v.y-y)+(v.z-z)*(v.z-z)+(v.w-w)*(v.w-w)<e*e);}

   //! swizzeling operator
   vec2 xy() const
      {return(vec2(x,y));}

   //! swizzeling operator
   vec2 zw() const
      {return(vec2(z,w));}

   //! swizzeling operator
   vec3 xyz() const
      {return(vec3(x,y,z));}

   //! swizzeling operator
   vec3 rgb() const
      {return(vec3(r,g,b));}

   //! swizzeling operator
   vec4 wzyx() const
      {return(vec4(w,z,y,x));}

   //! swizzeling operator
   vec4 bgra() const
      {return(vec4(b,g,r,a));}

   //! blending operator
   vec4 blend(const vec4 &rgba) const;

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ", " + glslmath::to_string(z) + ", " + glslmath::to_string(w) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space) + delimiter + glslmath::to_string(z, space) + delimiter + glslmath::to_string(w, space));}

   //! vector components
   union {
      struct {
         union {double x; double r;};
         union {double y; double g;};
         union {double z; double b;};
         union {double w; double a;};
         };
      double pointer[4];
      };
   };

//! addition of two vectors
inline vec4 operator + (const vec4 &a,const vec4 &b)
   {return(vec4(a.x+b.x,a.y+b.y,a.z+b.z,a.w+b.w));}

//! subtraction of two vectors
inline vec4 operator - (const vec4 &a,const vec4 &b)
   {return(vec4(a.x-b.x,a.y-b.y,a.z-b.z,a.w-b.w));}

//! negation of a vector
inline vec4 operator - (const vec4 &v)
   {return(vec4(-v.x,-v.y,-v.z,-v.w));}

//! left-hand side scalar multiplication
inline vec4 operator * (const double a,const vec4 &b)
   {return(vec4(a*b.x,a*b.y,a*b.z,a*b.w));}

//! right-hand side scalar multiplication
inline vec4 operator * (const vec4 &a,const double b)
   {return(vec4(a.x*b,a.y*b,a.z*b,a.w*b));}

//! right-hand side scalar division
inline vec4 operator / (const vec4 &a,const double b)
   {return(vec4(a.x/b,a.y/b,a.z/b,a.w/b));}

//! component-wise multiplication
inline vec4 operator * (const vec4 &a,const vec4 &b)
   {return(vec4(a.x*b.x,a.y*b.y,a.z*b.z,a.w*b.w));}

//! comparison
inline bool operator == (const vec4 &a,const vec4 &b)
   {return(a.x==b.x && a.y==b.y && a.z==b.z && a.w==b.w);}

//! negated comparison
inline bool operator != (const vec4 &a,const vec4 &b)
   {return(a.x!=b.x || a.y!=b.y || a.z!=b.z || a.w!=b.w);}

//! get vector length
inline double length(const vec4 &v)
   {return(v.length());}

//! get squared vector length
inline double norm(const vec4 &v)
   {return(v.norm());}

//! normalization to unit length
inline vec4 vec4::normalize() const
   {
   double l2=norm();
   if (l2>0.0 && l2!=1.0) return(*this/sqrt(l2));
   return(*this);
   }

//! normalization to unit length
inline vec4 normalize(const vec4 &v)
   {return(v.normalize());}

//! inner product
inline double dot(const vec4 &a,const vec4 &b)
   {return(a.dot(b));}

//! cross product
inline vec4 cross(const vec4 &a,const vec4 &b)
   {return(a.cross(b));}

//! reflect incident vector at normalized surface normal
inline vec4 vec4::reflect(const vec4 &n) const
   {
   assert(w==0.0 && n.w==0.0);
   return((*this)-2*n*dot(n));
   }

//! reflect incident vector at normalized surface normal
inline vec4 reflect(const vec4 &v,const vec4 &n)
   {return(v.reflect(n));}

//! calculate triangle normal
inline vec4 vec4::normal(const vec4 &a,const vec4 &b,const vec4 &c)
   {return((b-a).cross(c-a).normalize());}

//! calculate triangle area
inline double vec4::area(const vec4 &a,const vec4 &b,const vec4 &c)
   {return(fabs((b-a).cross(c-a).length()/2));}

//! blending operator
inline vec4 vec4::blend(const vec4 &rgba) const
   {return(vec4((1-rgba.a)*this->rgb()+rgba.a*rgba.rgb(),1-(1-rgba.a)*(1-a)));}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec4 &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ", " << v.z << ", " << v.w << ")");}

//! 4D float vector
//! * definition of components via constructor vec2f(x,y,z,w)
//! * access to components x/y/z/w via . component selector
//! * this vector type is designed for compact storage purposes
//! * primarily use vec4 for linear math calulations
class vec4f
   {
   public:

   //! default constructor
   vec4f() {}

   //! copy constructor
   vec4f(const vec4f &v) {x=v.x; y=v.y; z=v.z; w=v.w;}

   //! copy constructor
   vec4f(const vec4 &v) {x=(float)v.x; y=(float)v.y; z=(float)v.z; w=(float)v.w;}

   //! copy constructor
   vec4f(const vec3f &v,const float vw=1.0f) {x=v.x; y=v.y; z=v.z; w=vw;}

   //! copy constructor
   vec4f(const vec3 &v,const float vw=1.0f) {x=(float)v.x; y=(float)v.y; z=(float)v.z; w=vw;}

   //! copy constructor
   vec4f(const vec2f &v,const float vz=0.0f,const float vw=1.0f) {x=v.x; y=v.y; z=vz; w=vw;}

   //! copy constructor
   vec4f(const vec2 &v,const float vz=0.0f,const float vw=1.0f) {x=(float)v.x; y=(float)v.y; z=vz; w=vw;}

   //! copy constructor
   vec4f(const vec2f &xy,const vec2f &zw) {x=xy.x; y=xy.y; z=zw.x; w=zw.y;}

   //! copy constructor
   vec4f(const vec2 &xy,const vec2 &zw) {x=(float)xy.x; y=(float)xy.y; z=(float)zw.x; w=(float)zw.y;}

   //! component-wise constructor
   vec4f(const float vx,const float vy,const float vz,const float vw=1.0f) {x=vx; y=vy; z=vz; w=vw;}

   //! single-component constructor
   vec4f(const float v,const float vw=1.0f) {x=y=z=v; w=vw;}

   //! cast operator
   operator vec4() const
      {return(vec4(x,y,z,w));}

   //! cast operator with homogenization
   operator vec3f() const
      {
      float c;

      if (w!=0.0f)
         if (w!=1.0f)
            {
            c=1.0f/w;
            return(vec3f(x*c,y*c,z*c));
            }

      return(vec3f(x,y,z));
      }

   //! const pointer to linear array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to linear array
   operator const float *() const
      {return(pointer);}

   //! destructor
   ~vec4f() {}

   //! inplace addition
   vec4f& operator += (const vec4f &v)
      {x+=v.x; y+=v.y; z+=v.z; w+=v.w; return(*this);}

   //! inplace subtraction
   vec4f& operator -= (const vec4f &v)
      {x-=v.x; y-=v.y; z-=v.z; w-=v.w; return(*this);}

   //! inplace multiplication
   vec4f& operator *= (float v)
      {x*=v; y*=v; z*=v; w*=v; return(*this);}

   //! inplace multiplication
   vec4f& operator *= (const vec4f &v)
      {x*=v.x; y*=v.y; z*=v.z; w*=v.w; return(*this);}

   //! swizzeling operator
   vec2f xy() const
      {return(vec2f(x,y));}

   //! swizzeling operator
   vec2f zw() const
      {return(vec2f(z,w));}

   //! swizzeling operator
   vec3f xyz() const
      {return(vec3f(x,y,z));}

   //! swizzeling operator
   vec3f rgb() const
      {return(vec3f(r,g,b));}

   //! swizzeling operator
   vec4f wzyx() const
      {return(vec4f(w,z,y,x));}

   //! swizzeling operator
   vec4f bgra() const
      {return(vec4f(b,g,r,a));}

   //! string cast operator
   operator std::string()
      {return("(" + glslmath::to_string(x) + ", " + glslmath::to_string(y) + ", " + glslmath::to_string(z) + ", " + glslmath::to_string(w) + ")");}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return(glslmath::to_string(x, space) + delimiter + glslmath::to_string(y, space) + delimiter + glslmath::to_string(z, space) + delimiter + glslmath::to_string(w, space));}

   //! vector components
   union {
      struct {
         union {float x; float r;};
         union {float y; float g;};
         union {float z; float b;};
         union {float w; float a;};
         };
      float pointer[4];
      };
   };

//! addition of two vectors
inline vec4f operator + (const vec4f &a,const vec4f &b)
   {return(vec4f(a.x+b.x,a.y+b.y,a.z+b.z,a.w+b.w));}

//! subtraction of two vectors
inline vec4f operator - (const vec4f &a,const vec4f &b)
   {return(vec4f(a.x-b.x,a.y-b.y,a.z-b.z,a.w-b.w));}

//! negation of a vector
inline vec4f operator - (const vec4f &v)
   {return(vec4f(-v.x,-v.y,-v.z,-v.w));}

//! left-hand side scalar multiplication
inline vec4f operator * (const float a,const vec4f &b)
   {return(vec4f(a*b.x,a*b.y,a*b.z,a*b.w));}

//! right-hand side scalar multiplication
inline vec4f operator * (const vec4f &a,const float b)
   {return(vec4f(a.x*b,a.y*b,a.z*b,a.w*b));}

//! right-hand side scalar division
inline vec4f operator / (const vec4f &a,const float b)
   {return(vec4f(a.x/b,a.y/b,a.z/b,a.w/b));}

//! component-wise multiplication
inline vec4f operator * (const vec4f &a,const vec4f &b)
   {return(vec4f(a.x*b.x,a.y*b.y,a.z*b.z,a.w*b.w));}

//! comparison
inline bool operator == (const vec4f &a,const vec4f &b)
   {return(a.x==b.x && a.y==b.y && a.z==b.z && a.w==b.w);}

//! negated comparison
inline bool operator != (const vec4f &a,const vec4f &b)
   {return(a.x!=b.x || a.y!=b.y || a.z!=b.z || a.w!=b.w);}

//! output operator
inline std::ostream& operator << (std::ostream &out,const vec4f &v)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << v.x << ", " << v.y << ", " << v.z << ", " << v.w << ")");}

class mat2f;

//! 2x2 double matrix
//! * definition of matrix via constructor taking two row vectors
//! * supplies matrix operators + and *
class mat2
   {
   public:

   //! default constructor
   mat2(double diag=1.0)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag;
      }

   //! custom constructor
   mat2(const vec2 &diag)
      {
      mtx[0][0]=diag.x;
      mtx[0][1]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag.y;
      }

   //! custom constructor
   mat2(const vec2 &r1,
        const vec2 &r2)
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      }

   //! copy constructor
   mat2(const mat2f &m);

   //! construct matrix from column vectors
   static mat2 columns(const vec2 &c1,const vec2 &c2)
      {
      return(mat2(vec2(c1.x,c2.x),
                  vec2(c1.y,c2.y)));
      }

   //! construct matrix from column vectors
   static mat2 columns(double a,double b,
                       double c,double d)
      {
      return(mat2(vec2(a,c),
                  vec2(b,d)));
      }

   //! construct matrix from row vectors
   static mat2 rows(const vec2 &r1,const vec2 &r2)
      {
      return(mat2(r1,
                  r2));
      }

   //! construct matrix from row vectors
   static mat2 rows(double a,double b,
                    double c,double d)
      {
      return(mat2(vec2(a,b),
                  vec2(c,d)));
      }

   //! subscript operator (column getter)
   vec2 operator[] (const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2(mtx[i][0],mtx[i][1]));
      }

   //! row getter
   vec2 row(const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2(mtx[0][i],mtx[1][i]));
      }

   //! column getter
   vec2 col(const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2(mtx[i][0],mtx[i][1]));
      }

   //! const pointer to column-major array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const double *() const
      {return(pointer);}

   //! convert from 4-element column-major OpenGL matrix
   void fromOpenGL(const double m[4])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];

      mtx[1][0]=m[2];
      mtx[1][1]=m[3];
      }

   //! calculate determinant of 2x2 matrix
   double det() const
      {return(mtx[0][0]*mtx[1][1]-mtx[0][1]*mtx[1][0]);}

   //! static version of determinant operation
   static double det(const mat2 &m)
      {return(m.det());}

   //! transpose 2x2 matrix
   mat2 transpose() const
      {return(mat2(col(0),col(1)));}

   //! static version of transpose operation
   static mat2 transpose(const mat2 &m)
      {return(m.transpose());}

   //! invert 2x2 matrix
   mat2 invert() const
      {
      mat2 m;
      double d;

      // calculate determinant
      d=det();

      // check determinant
      if (d==0.0) return(mat2(0));

      // calculate inverse
      d=1.0/d;
      m.mtx[0][0]=d*mtx[1][1];
      m.mtx[1][0]=-d*mtx[1][0];
      m.mtx[0][1]=-d*mtx[0][1];
      m.mtx[1][1]=d*mtx[0][0];

      return(m);
      }

   //! static version of invert operation
   static mat2 invert(const mat2 &m)
      {return(m.invert());}

   //! create scaling matrix
   static mat2 scale(double s,double t)
      {
      return(mat2(vec2(s,0),
                  vec2(0,t)));
      }

   //! create scaling matrix
   static mat2 scale(const vec2 &c)
      {
      return(mat2(vec2(c.x,0),
                  vec2(0,c.y)));
      }

   //! create rotation matrix
   //! * rotation angle is specified clockwise
   static mat2 rotate(double angle)
      {
      double c,s;

      angle*=PI/180;

      c=cos(angle);
      s=sin(angle);

      return(mat2(vec2(c,s),
                  vec2(-s,c)));
      }

   //! inplace addition
   mat2& operator += (const mat2 &m);

   //! inplace multiplication
   mat2& operator *= (const mat2 &m);

   //! inplace multiplication (left-hand side)
   mat2& operator <<= (const mat2 &m);

   //! inplace multiplication (right-hand side)
   mat2& operator >>= (const mat2 &m);

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ")");}

   protected:

   //! matrix elements
   union {
      double mtx[2][2];
      double pointer[4];
      };
   };

//! addition of two matrices
inline mat2 operator + (const mat2 &m1,const mat2 &m2)
   {
   return(mat2(m1[0]+m2[0],
               m1[1]+m2[1]));
   }

//! multiplication of two matrices
inline mat2 operator * (const mat2 &m1,const mat2 &m2)
   {
   return(mat2(vec2(m1.row(0).dot(m2[0]),m1.row(0).dot(m2[1])),
               vec2(m1.row(1).dot(m2[0]),m1.row(1).dot(m2[1]))));
   }

//! inplace addition
inline mat2& mat2::operator += (const mat2 &m)
   {
   *this = (*this)+m;
   return(*this);
   }

//! inplace multiplication
inline mat2& mat2::operator *= (const mat2 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! inplace multiplication (left-hand side)
inline mat2& mat2::operator <<= (const mat2 &m)
   {
   *this = m*(*this);
   return(*this);
   }

//! inplace multiplication (right-hand side)
inline mat2& mat2::operator >>= (const mat2 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! comparison
inline bool operator == (const mat2 &a,const mat2 &b)
   {
   unsigned int i;

   for (i=0; i<4; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(false);

   return(true);
   }

//! negated comparison
inline bool operator != (const mat2 &a,const mat2 &b)
   {
   unsigned int i;

   for (i=0; i<4; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(true);

   return(false);
   }

//! right-hand side vector multiplication
inline vec2 operator * (const mat2 &m,const vec2 &v)
   {return(vec2(m.row(0).dot(v),m.row(1).dot(v)));}

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat2 &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ")");}

//! 2x2 float matrix
//! * this matrix type is not designed for calculations
//! * it is designed for compact storage and transfer purposes only
class mat2f
   {
   public:

   //! default constructor
   mat2f(float diag=1.0f)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0f;

      mtx[1][0]=0.0f;
      mtx[1][1]=diag;
      }

   //! custom constructor
   mat2f(const vec2f &r1,
         const vec2f &r2)
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      }

   //! copy constructor
   mat2f(const mat2 &m)
      {
      mtx[0][0]=(float)m[0][0];
      mtx[0][1]=(float)m[0][1];

      mtx[1][0]=(float)m[1][0];
      mtx[1][1]=(float)m[1][1];
      }

   //! construct matrix from column vectors
   static mat2f columns(const vec2f &c1,const vec2f &c2)
      {
      return(mat2f(vec2f(c1.x,c2.x),
                   vec2f(c1.y,c2.y)));
      }

   //! construct matrix from column vectors
   static mat2f columns(float a,float b,
                        float c,float d)
      {
      return(mat2f(vec2f(a,c),
                   vec2f(b,d)));
      }

   //! construct matrix from row vectors
   static mat2f rows(const vec2f &r1,const vec2f &r2)
      {
      return(mat2f(r1,
                   r2));
      }

   //! construct matrix from row vectors
   static mat2f rows(float a,float b,
                     float c,float d)
      {
      return(mat2f(vec2f(a,b),
                   vec2f(c,d)));
      }

   //! subscript operator (column getter)
   vec2f operator[] (const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2f(mtx[i][0],mtx[i][1]));
      }

   //! row getter
   vec2f row(const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2f(mtx[0][i],mtx[1][i]));
      }

   //! column getter
   vec2f col(const int i) const
      {
      assert(i>=0 && i<2);
      return(vec2f(mtx[i][0],mtx[i][1]));
      }

   //! const pointer to column-major array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const float *() const
      {return(pointer);}

   //! convert from 4-element column-major OpenGL matrix
   void fromOpenGL(const float m[4])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];

      mtx[1][0]=m[2];
      mtx[1][1]=m[3];
      }

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ")");}

   protected:

   //! matrix elements
   union {
      float mtx[2][2];
      float pointer[4];
      };
   };

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat2f &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ")");}

//! copy constructor
inline mat2::mat2(const mat2f &m)
   {
   mtx[0][0]=m[0][0];
   mtx[0][1]=m[0][1];

   mtx[1][0]=m[1][0];
   mtx[1][1]=m[1][1];
   }

class mat3f;

//! 3x3 double matrix
//! * definition of matrix via constructor taking three row vectors
//! * supplies matrix operators + and *
class mat3
   {
   public:

   //! default constructor
   mat3(double diag=1.0)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0;
      mtx[0][2]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag;
      mtx[1][2]=0.0;

      mtx[2][0]=0.0;
      mtx[2][1]=0.0;
      mtx[2][2]=diag;
      }

   //! custom constructor
   mat3(const vec3 &diag)
      {
      mtx[0][0]=diag.x;
      mtx[0][1]=0.0;
      mtx[0][2]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag.y;
      mtx[1][2]=0.0;

      mtx[2][0]=0.0;
      mtx[2][1]=0.0;
      mtx[2][2]=diag.z;
      }

   //! custom constructor
   mat3(const vec3 &r1,
        const vec3 &r2,
        const vec3 &r3=vec3(0,0,1))
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;
      mtx[0][2]=r3.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      mtx[1][2]=r3.y;

      mtx[2][0]=r1.z;
      mtx[2][1]=r2.z;
      mtx[2][2]=r3.z;
      }

   //! copy constructor
   mat3(const mat2 &m)
      {
      mtx[0][0]=m[0][0];
      mtx[0][1]=m[0][1];
      mtx[0][2]=0.0;

      mtx[1][0]=m[1][0];
      mtx[1][1]=m[1][1];
      mtx[1][2]=0.0;

      mtx[2][0]=0.0;
      mtx[2][1]=0.0;
      mtx[2][2]=1.0;
      }

   //! copy constructor
   mat3(const mat3f &m);

   //! construct matrix from column vectors
   static mat3 columns(const vec3 &c1,const vec3 &c2,const vec3 &c3)
      {
      return(mat3(vec3(c1.x,c2.x,c3.x),
                  vec3(c1.y,c2.y,c3.y),
                  vec3(c1.z,c2.z,c3.z)));
      }

   //! construct matrix from column vectors
   static mat3 columns(double a,double b,double c,
                       double d,double e,double f,
                       double g,double h,double i)
      {
      return(mat3(vec3(a,d,g),
                  vec3(b,e,h),
                  vec3(c,f,i)));
      }

   //! construct matrix from row vectors
   static mat3 rows(const vec3 &r1,const vec3 &r2,const vec3 &r3)
      {
      return(mat3(r1,
                  r2,
                  r3));
      }

   //! construct matrix from row vectors
   static mat3 rows(double a,double b,double c,
                    double d,double e,double f,
                    double g,double h,double i)
      {
      return(mat3(vec3(a,b,c),
                  vec3(d,e,f),
                  vec3(g,h,i)));
      }

   //! subscript operator (column getter)
   vec3 operator[] (const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3(mtx[i][0],mtx[i][1],mtx[i][2]));
      }

   //! row getter
   vec3 row(const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3(mtx[0][i],mtx[1][i],mtx[2][i]));
      }

   //! column getter
   vec3 col(const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3(mtx[i][0],mtx[i][1],mtx[i][2]));
      }

   //! down cast operator
   operator mat2() const
      {return(mat2(row(0).xy(),row(1).xy()));}

   //! const pointer to column-major array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const double *() const
      {return(pointer);}

   //! convert from 9-element column-major OpenGL matrix
   void fromOpenGL(const double m[9])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];
      mtx[0][2]=m[2];

      mtx[1][0]=m[3];
      mtx[1][1]=m[4];
      mtx[1][2]=m[5];

      mtx[2][0]=m[6];
      mtx[2][1]=m[7];
      mtx[2][2]=m[8];
      }

   //! calculate determinant of 3x3 matrix
   double det() const
      {
      return(mtx[0][0]*(mtx[1][1]*mtx[2][2]-mtx[2][1]*mtx[1][2])+
             mtx[0][1]*(mtx[2][0]*mtx[1][2]-mtx[1][0]*mtx[2][2])+
             mtx[0][2]*(mtx[1][0]*mtx[2][1]-mtx[2][0]*mtx[1][1]));
      }

   //! static version of determinant operation
   static double det(const mat3 &m)
      {return(m.det());}

   //! transpose 3x3 matrix
   mat3 transpose() const
      {return(mat3(col(0),col(1),col(2)));}

   //! static version of transpose operation
   static mat3 transpose(const mat3 &m)
      {return(m.transpose());}

   //! invert 3x3 matrix
   mat3 invert() const
      {
      mat3 m;
      double d;

      // calculate determinant
      d=det();

      // check determinant
      if (d==0.0) return(mat3(0));

      // calculate inverse
      d=1.0/d;
      m.mtx[0][0]=d*(mtx[1][1]*mtx[2][2]-mtx[2][1]*mtx[1][2]);
      m.mtx[1][0]=d*(mtx[2][0]*mtx[1][2]-mtx[1][0]*mtx[2][2]);
      m.mtx[2][0]=d*(mtx[1][0]*mtx[2][1]-mtx[2][0]*mtx[1][1]);
      m.mtx[0][1]=d*(mtx[2][1]*mtx[0][2]-mtx[0][1]*mtx[2][2]);
      m.mtx[1][1]=d*(mtx[0][0]*mtx[2][2]-mtx[2][0]*mtx[0][2]);
      m.mtx[2][1]=d*(mtx[2][0]*mtx[0][1]-mtx[0][0]*mtx[2][1]);
      m.mtx[0][2]=d*(mtx[0][1]*mtx[1][2]-mtx[1][1]*mtx[0][2]);
      m.mtx[1][2]=d*(mtx[1][0]*mtx[0][2]-mtx[0][0]*mtx[1][2]);
      m.mtx[2][2]=d*(mtx[0][0]*mtx[1][1]-mtx[1][0]*mtx[0][1]);

      return(m);
      }

   //! static version of invert operation
   static mat3 invert(const mat3 &m)
      {return(m.invert());}

   //! create scaling matrix
   static mat3 scale(double s,double t,double r)
      {
      return(mat3(vec3(s,0,0),
                  vec3(0,t,0),
                  vec3(0,0,r)));
      }

   //! create scaling matrix
   static mat3 scale(const vec3 &c)
      {
      return(mat3(vec3(c.x,0,0),
                  vec3(0,c.y,0),
                  vec3(0,0,c.z)));
      }

   //! create rotation matrix
   //! * rotation angle is specified clockwise in OpenGL coordinates
   static mat3 rotate(double angle,const vec3 &v)
      {
      vec3 axis;
      double c,s;
      double c1;

      double x,y,z;

      angle*=PI/180;

      axis=v.normalize();

      c=cos(angle);
      s=sin(angle);

      x=axis.x;
      y=axis.y;
      z=axis.z;

      c1=1.0-c;

      return(mat3(vec3(x*x*c1+c,x*y*c1-z*s,x*z*c1+y*s),
                  vec3(y*x*c1+z*s,y*y*c1+c,y*z*c1-x*s),
                  vec3(z*x*c1-y*s,z*y*c1+x*s,z*z*c1+c)));
      }

   //! inplace addition
   mat3& operator += (const mat3 &m);

   //! inplace multiplication
   mat3& operator *= (const mat3 &m);

   //! inplace multiplication (left-hand side)
   mat3& operator <<= (const mat3 &m);

   //! inplace multiplication (right-hand side)
   mat3& operator >>= (const mat3 &m);

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ", " + std::string(row(2)) + ")");}

   protected:

   //! matrix elements
   union {
      double mtx[3][3];
      double pointer[9];
      };
   };

//! addition of two matrices
inline mat3 operator + (const mat3 &m1,const mat3 &m2)
   {
   return(mat3(m1[0]+m2[0],
               m1[1]+m2[1],
               m1[2]+m2[2]));
   }

//! multiplication of two matrices
inline mat3 operator * (const mat3 &m1,const mat3 &m2)
   {
   return(mat3(vec3(m1.row(0).dot(m2[0]),m1.row(0).dot(m2[1]),m1.row(0).dot(m2[2])),
               vec3(m1.row(1).dot(m2[0]),m1.row(1).dot(m2[1]),m1.row(1).dot(m2[2])),
               vec3(m1.row(2).dot(m2[0]),m1.row(2).dot(m2[1]),m1.row(2).dot(m2[2]))));
   }

//! inplace addition
inline mat3& mat3::operator += (const mat3 &m)
   {
   *this = (*this)+m;
   return(*this);
   }

//! inplace multiplication
inline mat3& mat3::operator *= (const mat3 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! inplace multiplication (left-hand side)
inline mat3& mat3::operator <<= (const mat3 &m)
   {
   *this = m*(*this);
   return(*this);
   }

//! inplace multiplication (right-hand side)
inline mat3& mat3::operator >>= (const mat3 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! comparison
inline bool operator == (const mat3 &a,const mat3 &b)
   {
   unsigned int i;

   for (i=0; i<9; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(false);

   return(true);
   }

//! negated comparison
inline bool operator != (const mat3 &a,const mat3 &b)
   {
   unsigned int i;

   for (i=0; i<9; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(true);

   return(false);
   }

//! right-hand side vector multiplication
inline vec3 operator * (const mat3 &m,const vec3 &v)
   {return(vec3(m.row(0).dot(v),m.row(1).dot(v),m.row(2).dot(v)));}

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat3 &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ", " << m.row(2) << ")");}

//! 3x3 float matrix
//! * this matrix type is not designed for calculations
//! * it is designed for compact storage and transfer purposes only
//!  * use mat3 for linear math calulations, then copy to mat3f and
//!  * cast to const float * to transfer via glUniform:
//!   * glUniformMatrix3fv(location, 1, GL_FALSE, (const float *)mat3f(M));
class mat3f
   {
   public:

   //! default constructor
   mat3f(float diag=1.0f)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0f;
      mtx[0][2]=0.0f;

      mtx[1][0]=0.0f;
      mtx[1][1]=diag;
      mtx[1][2]=0.0f;

      mtx[2][0]=0.0f;
      mtx[2][1]=0.0f;
      mtx[2][2]=diag;
      }

   //! custom constructor
   mat3f(const vec3f &r1,
         const vec3f &r2,
         const vec3f &r3=vec3f(0,0,1))
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;
      mtx[0][2]=r3.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      mtx[1][2]=r3.y;

      mtx[2][0]=r1.z;
      mtx[2][1]=r2.z;
      mtx[2][2]=r3.z;
      }

   //! copy constructor
   mat3f(const mat3 &m)
      {
      mtx[0][0]=(float)m[0][0];
      mtx[0][1]=(float)m[0][1];
      mtx[0][2]=(float)m[0][2];

      mtx[1][0]=(float)m[1][0];
      mtx[1][1]=(float)m[1][1];
      mtx[1][2]=(float)m[1][2];

      mtx[2][0]=(float)m[2][0];
      mtx[2][1]=(float)m[2][1];
      mtx[2][2]=(float)m[2][2];
      }

   //! construct matrix from column vectors
   static mat3f columns(const vec3f &c1,const vec3f &c2,const vec3f &c3)
      {
      return(mat3f(vec3f(c1.x,c2.x,c3.x),
                   vec3f(c1.y,c2.y,c3.y),
                   vec3f(c1.z,c2.z,c3.z)));
      }

   //! construct matrix from column vectors
   static mat3f columns(float a,float b,float c,
                        float d,float e,float f,
                        float g,float h,float i)
      {
         return(mat3f(vec3f(a,d,g),
                      vec3f(b,e,h),
                      vec3f(c,f,i)));
      }

   //! construct matrix from row vectors
   static mat3f rows(const vec3f &r1,const vec3f &r2,const vec3f &r3)
      {
      return(mat3f(r1,
                   r2,
                   r3));
      }

   //! construct matrix from row vectors
   static mat3f rows(float a,float b,float c,
                     float d,float e,float f,
                     float g,float h,float i)
      {
      return(mat3f(vec3f(a,b,c),
                   vec3f(d,e,f),
                   vec3f(g,h,i)));
      }

   //! subscript operator (column getter)
   vec3f operator[] (const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3f(mtx[i][0],mtx[i][1],mtx[i][2]));
      }

   //! row getter
   vec3f row(const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3f(mtx[0][i],mtx[1][i],mtx[2][i]));
      }

   //! column getter
   vec3f col(const int i) const
      {
      assert(i>=0 && i<3);
      return(vec3f(mtx[i][0],mtx[i][1],mtx[i][2]));
      }

   //! down cast operator
   operator mat2f() const
      {return(mat2f(row(0).xy(),row(1).xy()));}

   //! const pointer to column-major array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const float *() const
      {return(pointer);}

   //! convert from 9-element column-major OpenGL matrix
   void fromOpenGL(const float m[9])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];
      mtx[0][2]=m[2];

      mtx[1][0]=m[3];
      mtx[1][1]=m[4];
      mtx[1][2]=m[5];

      mtx[2][0]=m[6];
      mtx[2][1]=m[7];
      mtx[2][2]=m[8];
      }

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ", " + std::string(row(2)) + ")");}

   protected:

   //! matrix elements
   union {
      float mtx[3][3];
      float pointer[9];
      };
   };

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat3f &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ", " << m.row(2) << ")");}

//! copy constructor
inline mat3::mat3(const mat3f &m)
   {
   mtx[0][0]=m[0][0];
   mtx[0][1]=m[0][1];
   mtx[0][2]=m[0][2];

   mtx[1][0]=m[1][0];
   mtx[1][1]=m[1][1];
   mtx[1][2]=m[1][2];

   mtx[2][0]=m[2][0];
   mtx[2][1]=m[2][1];
   mtx[2][2]=m[2][2];
   }

class mat4f;

//! 4x4 double matrix
//! * definition of matrix via constructor taking four row vectors
//! * supplies matrix operators + and *
class mat4
   {
   public:

   //! default constructor
   mat4(double diag=1.0)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0;
      mtx[0][2]=0.0;
      mtx[0][3]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag;
      mtx[1][2]=0.0;
      mtx[1][3]=0.0;

      mtx[2][0]=0.0;
      mtx[2][1]=0.0;
      mtx[2][2]=diag;
      mtx[2][3]=0.0;

      mtx[3][0]=0.0;
      mtx[3][1]=0.0;
      mtx[3][2]=0.0;
      mtx[3][3]=diag;
      }

   //! custom constructor
   mat4(const vec4 &diag)
      {
      mtx[0][0]=diag.x;
      mtx[0][1]=0.0;
      mtx[0][2]=0.0;
      mtx[0][3]=0.0;

      mtx[1][0]=0.0;
      mtx[1][1]=diag.y;
      mtx[1][2]=0.0;
      mtx[1][3]=0.0;

      mtx[2][0]=0.0;
      mtx[2][1]=0.0;
      mtx[2][2]=diag.z;
      mtx[2][3]=0.0;

      mtx[3][0]=0.0;
      mtx[3][1]=0.0;
      mtx[3][2]=0.0;
      mtx[3][3]=diag.w;
      }

   //! custom constructor
   mat4(const vec4 &r1,
        const vec4 &r2,
        const vec4 &r3,
        const vec4 &r4=vec4(0,0,0,1))
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;
      mtx[0][2]=r3.x;
      mtx[0][3]=r4.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      mtx[1][2]=r3.y;
      mtx[1][3]=r4.y;

      mtx[2][0]=r1.z;
      mtx[2][1]=r2.z;
      mtx[2][2]=r3.z;
      mtx[2][3]=r4.z;

      mtx[3][0]=r1.w;
      mtx[3][1]=r2.w;
      mtx[3][2]=r3.w;
      mtx[3][3]=r4.w;
      }

   //! copy constructor
   mat4(const mat3 &m)
      {
      mtx[0][0]=m[0][0];
      mtx[0][1]=m[0][1];
      mtx[0][2]=m[0][2];
      mtx[0][3]=0.0;

      mtx[1][0]=m[1][0];
      mtx[1][1]=m[1][1];
      mtx[1][2]=m[1][2];
      mtx[1][3]=0.0;

      mtx[2][0]=m[2][0];
      mtx[2][1]=m[2][1];
      mtx[2][2]=m[2][2];
      mtx[2][3]=0.0;

      mtx[3][0]=0.0;
      mtx[3][1]=0.0;
      mtx[3][2]=0.0;
      mtx[3][3]=1.0;
      }

   //! copy constructor
   mat4(const mat4f &m);

   //! construct matrix from column vectors
   static mat4 columns(const vec4 &c1,const vec4 &c2,const vec4 &c3,const vec4 &c4)
      {
      return(mat4(vec4(c1.x,c2.x,c3.x,c4.x),
                  vec4(c1.y,c2.y,c3.y,c4.y),
                  vec4(c1.z,c2.z,c3.z,c4.z),
                  vec4(c1.w,c2.w,c3.w,c4.w)));
      }

   //! construct matrix from column vectors
   static mat4 columns(double a,double b,double c,double d,
                       double e,double f,double g,double h,
                       double i,double j,double k,double l,
                       double m,double n,double o,double p)
      {
      return(mat4(vec4(a,e,i,m),
                  vec4(b,f,j,n),
                  vec4(c,g,k,o),
                  vec4(d,h,l,p)));
      }

   //! construct matrix from row vectors
   static mat4 rows(const vec4 &r1,const vec4 &r2,const vec4 &r3,const vec4 &r4)
      {
      return(mat4(r1,
                  r2,
                  r3,
                  r4));
      }

   //! construct matrix from row vectors
   static mat4 rows(double a,double b,double c,double d,
                    double e,double f,double g,double h,
                    double i,double j,double k,double l,
                    double m,double n,double o,double p)
      {
      return(mat4(vec4(a,b,c,d),
                  vec4(e,f,g,h),
                  vec4(i,j,k,l),
                  vec4(m,n,o,p)));
      }

   //! subscript operator (column getter)
   vec4 operator[] (const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4(mtx[i][0],mtx[i][1],mtx[i][2],mtx[i][3]));
      }

   //! row getter
   vec4 row(const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4(mtx[0][i],mtx[1][i],mtx[2][i],mtx[3][i]));
      }

   //! column getter
   vec4 col(const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4(mtx[i][0],mtx[i][1],mtx[i][2],mtx[i][3]));
      }

   //! down cast operator
   operator mat3() const
      {return(mat3(row(0).xyz(),row(1).xyz(),row(2).xyz()));}

   //! const pointer to column-major array
   const double *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const double *() const
      {return(pointer);}

   //! convert from 16-element column-major OpenGL matrix
   void fromOpenGL(const double m[16])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];
      mtx[0][2]=m[2];
      mtx[0][3]=m[3];

      mtx[1][0]=m[4];
      mtx[1][1]=m[5];
      mtx[1][2]=m[6];
      mtx[1][3]=m[7];

      mtx[2][0]=m[8];
      mtx[2][1]=m[9];
      mtx[2][2]=m[10];
      mtx[2][3]=m[11];

      mtx[3][0]=m[12];
      mtx[3][1]=m[13];
      mtx[3][2]=m[14];
      mtx[3][3]=m[15];
      }

   //! calculate determinant of 4x4 matrix
   double det() const
      {
      return(mtx[0][3]*mtx[1][2]*mtx[2][1]*mtx[3][0]-
             mtx[0][2]*mtx[1][3]*mtx[2][1]*mtx[3][0]-
             mtx[0][3]*mtx[1][1]*mtx[2][2]*mtx[3][0]+
             mtx[0][1]*mtx[1][3]*mtx[2][2]*mtx[3][0]+
             mtx[0][2]*mtx[1][1]*mtx[2][3]*mtx[3][0]-
             mtx[0][1]*mtx[1][2]*mtx[2][3]*mtx[3][0]-
             mtx[0][3]*mtx[1][2]*mtx[2][0]*mtx[3][1]+
             mtx[0][2]*mtx[1][3]*mtx[2][0]*mtx[3][1]+
             mtx[0][3]*mtx[1][0]*mtx[2][2]*mtx[3][1]-
             mtx[0][0]*mtx[1][3]*mtx[2][2]*mtx[3][1]-
             mtx[0][2]*mtx[1][0]*mtx[2][3]*mtx[3][1]+
             mtx[0][0]*mtx[1][2]*mtx[2][3]*mtx[3][1]+
             mtx[0][3]*mtx[1][1]*mtx[2][0]*mtx[3][2]-
             mtx[0][1]*mtx[1][3]*mtx[2][0]*mtx[3][2]-
             mtx[0][3]*mtx[1][0]*mtx[2][1]*mtx[3][2]+
             mtx[0][0]*mtx[1][3]*mtx[2][1]*mtx[3][2]+
             mtx[0][1]*mtx[1][0]*mtx[2][3]*mtx[3][2]-
             mtx[0][0]*mtx[1][1]*mtx[2][3]*mtx[3][2]-
             mtx[0][2]*mtx[1][1]*mtx[2][0]*mtx[3][3]+
             mtx[0][1]*mtx[1][2]*mtx[2][0]*mtx[3][3]+
             mtx[0][2]*mtx[1][0]*mtx[2][1]*mtx[3][3]-
             mtx[0][0]*mtx[1][2]*mtx[2][1]*mtx[3][3]-
             mtx[0][1]*mtx[1][0]*mtx[2][2]*mtx[3][3]+
             mtx[0][0]*mtx[1][1]*mtx[2][2]*mtx[3][3]);
      }

   //! static version of determinant operation
   static double det(const mat4 &m)
      {return(m.det());}

   //! transpose 4x4 matrix
   mat4 transpose() const
      {return(mat4(col(0),col(1),col(2),col(3)));}

   //! static version of transpose operation
   static mat4 transpose(const mat4 &m)
      {return(m.transpose());}

   //! invert 4x4 matrix
   mat4 invert() const
      {
      mat4 m;
      double d;

      // calculate determinant
      d=det();

      // check determinant
      if (d==0.0) return(mat4(0));

      // calculate inverse
      d=1.0/d;
      m.mtx[0][0]=d*(mtx[1][2]*mtx[2][3]*mtx[3][1]-mtx[1][3]*mtx[2][2]*mtx[3][1]+mtx[1][3]*mtx[2][1]*mtx[3][2]-mtx[1][1]*mtx[2][3]*mtx[3][2]-mtx[1][2]*mtx[2][1]*mtx[3][3]+mtx[1][1]*mtx[2][2]*mtx[3][3]);
      m.mtx[0][1]=d*(mtx[0][3]*mtx[2][2]*mtx[3][1]-mtx[0][2]*mtx[2][3]*mtx[3][1]-mtx[0][3]*mtx[2][1]*mtx[3][2]+mtx[0][1]*mtx[2][3]*mtx[3][2]+mtx[0][2]*mtx[2][1]*mtx[3][3]-mtx[0][1]*mtx[2][2]*mtx[3][3]);
      m.mtx[0][2]=d*(mtx[0][2]*mtx[1][3]*mtx[3][1]-mtx[0][3]*mtx[1][2]*mtx[3][1]+mtx[0][3]*mtx[1][1]*mtx[3][2]-mtx[0][1]*mtx[1][3]*mtx[3][2]-mtx[0][2]*mtx[1][1]*mtx[3][3]+mtx[0][1]*mtx[1][2]*mtx[3][3]);
      m.mtx[0][3]=d*(mtx[0][3]*mtx[1][2]*mtx[2][1]-mtx[0][2]*mtx[1][3]*mtx[2][1]-mtx[0][3]*mtx[1][1]*mtx[2][2]+mtx[0][1]*mtx[1][3]*mtx[2][2]+mtx[0][2]*mtx[1][1]*mtx[2][3]-mtx[0][1]*mtx[1][2]*mtx[2][3]);
      m.mtx[1][0]=d*(mtx[1][3]*mtx[2][2]*mtx[3][0]-mtx[1][2]*mtx[2][3]*mtx[3][0]-mtx[1][3]*mtx[2][0]*mtx[3][2]+mtx[1][0]*mtx[2][3]*mtx[3][2]+mtx[1][2]*mtx[2][0]*mtx[3][3]-mtx[1][0]*mtx[2][2]*mtx[3][3]);
      m.mtx[1][1]=d*(mtx[0][2]*mtx[2][3]*mtx[3][0]-mtx[0][3]*mtx[2][2]*mtx[3][0]+mtx[0][3]*mtx[2][0]*mtx[3][2]-mtx[0][0]*mtx[2][3]*mtx[3][2]-mtx[0][2]*mtx[2][0]*mtx[3][3]+mtx[0][0]*mtx[2][2]*mtx[3][3]);
      m.mtx[1][2]=d*(mtx[0][3]*mtx[1][2]*mtx[3][0]-mtx[0][2]*mtx[1][3]*mtx[3][0]-mtx[0][3]*mtx[1][0]*mtx[3][2]+mtx[0][0]*mtx[1][3]*mtx[3][2]+mtx[0][2]*mtx[1][0]*mtx[3][3]-mtx[0][0]*mtx[1][2]*mtx[3][3]);
      m.mtx[1][3]=d*(mtx[0][2]*mtx[1][3]*mtx[2][0]-mtx[0][3]*mtx[1][2]*mtx[2][0]+mtx[0][3]*mtx[1][0]*mtx[2][2]-mtx[0][0]*mtx[1][3]*mtx[2][2]-mtx[0][2]*mtx[1][0]*mtx[2][3]+mtx[0][0]*mtx[1][2]*mtx[2][3]);
      m.mtx[2][0]=d*(mtx[1][1]*mtx[2][3]*mtx[3][0]-mtx[1][3]*mtx[2][1]*mtx[3][0]+mtx[1][3]*mtx[2][0]*mtx[3][1]-mtx[1][0]*mtx[2][3]*mtx[3][1]-mtx[1][1]*mtx[2][0]*mtx[3][3]+mtx[1][0]*mtx[2][1]*mtx[3][3]);
      m.mtx[2][1]=d*(mtx[0][3]*mtx[2][1]*mtx[3][0]-mtx[0][1]*mtx[2][3]*mtx[3][0]-mtx[0][3]*mtx[2][0]*mtx[3][1]+mtx[0][0]*mtx[2][3]*mtx[3][1]+mtx[0][1]*mtx[2][0]*mtx[3][3]-mtx[0][0]*mtx[2][1]*mtx[3][3]);
      m.mtx[2][2]=d*(mtx[0][1]*mtx[1][3]*mtx[3][0]-mtx[0][3]*mtx[1][1]*mtx[3][0]+mtx[0][3]*mtx[1][0]*mtx[3][1]-mtx[0][0]*mtx[1][3]*mtx[3][1]-mtx[0][1]*mtx[1][0]*mtx[3][3]+mtx[0][0]*mtx[1][1]*mtx[3][3]);
      m.mtx[2][3]=d*(mtx[0][3]*mtx[1][1]*mtx[2][0]-mtx[0][1]*mtx[1][3]*mtx[2][0]-mtx[0][3]*mtx[1][0]*mtx[2][1]+mtx[0][0]*mtx[1][3]*mtx[2][1]+mtx[0][1]*mtx[1][0]*mtx[2][3]-mtx[0][0]*mtx[1][1]*mtx[2][3]);
      m.mtx[3][0]=d*(mtx[1][2]*mtx[2][1]*mtx[3][0]-mtx[1][1]*mtx[2][2]*mtx[3][0]-mtx[1][2]*mtx[2][0]*mtx[3][1]+mtx[1][0]*mtx[2][2]*mtx[3][1]+mtx[1][1]*mtx[2][0]*mtx[3][2]-mtx[1][0]*mtx[2][1]*mtx[3][2]);
      m.mtx[3][1]=d*(mtx[0][1]*mtx[2][2]*mtx[3][0]-mtx[0][2]*mtx[2][1]*mtx[3][0]+mtx[0][2]*mtx[2][0]*mtx[3][1]-mtx[0][0]*mtx[2][2]*mtx[3][1]-mtx[0][1]*mtx[2][0]*mtx[3][2]+mtx[0][0]*mtx[2][1]*mtx[3][2]);
      m.mtx[3][2]=d*(mtx[0][2]*mtx[1][1]*mtx[3][0]-mtx[0][1]*mtx[1][2]*mtx[3][0]-mtx[0][2]*mtx[1][0]*mtx[3][1]+mtx[0][0]*mtx[1][2]*mtx[3][1]+mtx[0][1]*mtx[1][0]*mtx[3][2]-mtx[0][0]*mtx[1][1]*mtx[3][2]);
      m.mtx[3][3]=d*(mtx[0][1]*mtx[1][2]*mtx[2][0]-mtx[0][2]*mtx[1][1]*mtx[2][0]+mtx[0][2]*mtx[1][0]*mtx[2][1]-mtx[0][0]*mtx[1][2]*mtx[2][1]-mtx[0][1]*mtx[1][0]*mtx[2][2]+mtx[0][0]*mtx[1][1]*mtx[2][2]);

      return(m);
      }

   //! static version of invert operation
   static mat4 invert(const mat4 &m)
      {return(m.invert());}

   //! create scaling matrix
   static mat4 scale(double s,double t,double r,double w=1.0)
      {
      return(mat4(vec4(s,0,0,0),
                  vec4(0,t,0,0),
                  vec4(0,0,r,0),
                  vec4(0,0,0,w)));
      }

   //! create scaling matrix
   static mat4 scale(const vec4 &c)
      {
      return(mat4(vec4(c.x,0,0,0),
                  vec4(0,c.y,0,0),
                  vec4(0,0,c.z,0),
                  vec4(0,0,0,c.w)));
      }

   //! create translation matrix
   static mat4 translate(double x,double y,double z)
      {
      return(mat4(vec4(1,0,0,x),
                  vec4(0,1,0,y),
                  vec4(0,0,1,z),
                  vec4(0,0,0,1)));
      }

   //! create translation matrix
   static mat4 translate(const vec4 &v)
      {
      return(mat4(vec4(1,0,0,v.x),
                  vec4(0,1,0,v.y),
                  vec4(0,0,1,v.z),
                  vec4(0,0,0,v.w)));
      }

   //! create rotation matrix
   //! * rotation angle is specified clockwise in OpenGL coordinates
   static mat4 rotate(double angle,const vec3 &v)
      {return(mat3::rotate(angle,v));}

   //! create affine transformation matrix
   static mat4 transform(const mat3 &m, const vec3 &v);

   //! create affine transformation matrix
   static mat4 transform(const vec3 &o,const vec3 &x,const vec3 &y,const vec3 &z);

   //! create orthographic matrix
   static mat4 ortho(double l,double r,double b,double t,double n=-1,double f=1);

   //! create frustum matrix
   static mat4 frustum(double l,double r,double b,double t,double n,double f);

   //! create parallel projection matrix
   static mat4 parallel(const vec3 &p,const vec3 &n,const vec3 &d);

   //! create perspective matrix
   static mat4 perspective(double fovy,double aspect,double znear,double zfar);

   //! create lookat matrix
   static mat4 lookat(const vec3 &eye,const vec3 &center,const vec3 &up);

   //! inplace addition
   mat4& operator += (const mat4 &m);

   //! inplace multiplication
   mat4& operator *= (const mat4 &m);

   //! inplace multiplication (left-hand side)
   mat4& operator <<= (const mat4 &m);

   //! inplace multiplication (right-hand side)
   mat4& operator >>= (const mat4 &m);

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ", " + std::string(row(2)) + ", " + std::string(row(3)) + ")");}

   protected:

   //! matrix elements
   union {
      double mtx[4][4];
      double pointer[16];
      };
   };

//! addition of two matrices
inline mat4 operator + (const mat4 &m1,const mat4 &m2)
   {
   return(mat4(m1[0]+m2[0],
               m1[1]+m2[1],
               m1[2]+m2[2],
               m1[3]+m2[3]));
   }

//! multiplication of two matrices
inline mat4 operator * (const mat4 &m1,const mat4 &m2)
   {
   return(mat4(vec4(m1.row(0).dot(m2[0]),m1.row(0).dot(m2[1]),m1.row(0).dot(m2[2]),m1.row(0).dot(m2[3])),
               vec4(m1.row(1).dot(m2[0]),m1.row(1).dot(m2[1]),m1.row(1).dot(m2[2]),m1.row(1).dot(m2[3])),
               vec4(m1.row(2).dot(m2[0]),m1.row(2).dot(m2[1]),m1.row(2).dot(m2[2]),m1.row(2).dot(m2[3])),
               vec4(m1.row(3).dot(m2[0]),m1.row(3).dot(m2[1]),m1.row(3).dot(m2[2]),m1.row(3).dot(m2[3]))));
   }

//! inplace addition
inline mat4& mat4::operator += (const mat4 &m)
   {
   *this = (*this)+m;
   return(*this);
   }

//! inplace multiplication
inline mat4& mat4::operator *= (const mat4 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! inplace multiplication (left-hand side)
inline mat4& mat4::operator <<= (const mat4 &m)
   {
   *this = m*(*this);
   return(*this);
   }

//! inplace multiplication (right-hand side)
inline mat4& mat4::operator >>= (const mat4 &m)
   {
   *this = (*this)*m;
   return(*this);
   }

//! comparison
inline bool operator == (const mat4 &a,const mat4 &b)
   {
   unsigned int i;

   for (i=0; i<16; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(false);

   return(true);
   }

//! negated comparison
inline bool operator != (const mat4 &a,const mat4 &b)
   {
   unsigned int i;

   for (i=0; i<16; i++)
      if (((const double *)a)[i]!=((const double *)b)[i]) return(true);

   return(false);
   }

//! inline scale
inline mat4 scale(const mat4 &m,const vec4 &c)
   {return(m*mat4::scale(c));}

//! inline scale
inline mat4 scale(const mat4 &m,double s,double t,double r,double w=1)
   {return(scale(m,vec4(s,t,r,w)));}

//! inline scale
inline mat4 scale(const mat4 &m,double s,double w=1)
   {return(scale(m,vec4(s,s,s,w)));}

//! inline translate
inline mat4 translate(const mat4 &m,const vec4 &v)
   {return(m*mat4::translate(v));}

//! inline translate
inline mat4 translate(const mat4 &m,double x,double y,double z,double w=1)
   {return(translate(m,vec4(x,y,z,w)));}

//! inline rotate
inline mat4 rotate(const mat4 &m,double angle,const vec3 &v)
   {return(m*mat4::rotate(angle,v));}

//! inline rotate
inline mat4 rotate(const mat4 &m,double angle,double vx,double vy,double vz)
   {return(rotate(m,angle,vec3(vx,vy,vz)));}

//! inline determinant
inline double det(const mat4 &m)
   {return(m.det());}

//! inline transpose
inline mat4 transpose(const mat4 &m)
   {return(m.transpose());}

//! inline inverse
inline mat4 inverse(const mat4 &m)
   {return(m.invert());}

//! inline inverse transpose
inline mat4 inverse_transpose(const mat4 &m)
   {return(m.invert().transpose());}

//! right-hand side vector multiplication
inline vec4 operator * (const mat4 &m,const vec4 &v)
   {return(vec4(m.row(0).dot(v),m.row(1).dot(v),m.row(2).dot(v),m.row(3).dot(v)));}

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat4 &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ", " << m.row(2) << ", " << m.row(3) << ")");}

//! create affine transformation matrix
inline mat4 mat4::transform(const mat3 &m, const vec3 &v)
   {
   return(mat4(vec4(m.row(0),v[0]),
               vec4(m.row(1),v[1]),
               vec4(m.row(2),v[2]),
               vec4(0,0,0,1)));
   }

//! create affine transformation matrix
inline mat4 mat4::transform(const vec3 &o,const vec3 &x,const vec3 &y,const vec3 &z)
   {
   return(mat4(vec4(x,0),
               vec4(y,0),
               vec4(z,0),
               vec4(o,1)).transpose());
   }

//! create orthographic matrix
inline mat4 mat4::ortho(double l,double r,double b,double t,double n,double f)
   {
   assert(r>l && t>b && f>n);

   return(mat4(vec4(2.0/(r-l),0,0,-(r+l)/(r-l)),
               vec4(0,2.0/(t-b),0,-(t+b)/(t-b)),
               vec4(0,0,-2.0/(f-n),-(f+n)/(f-n))));
   }

//! create frustum matrix
inline mat4 mat4::frustum(double l,double r,double b,double t,double n,double f)
   {
   assert(r>l && t>b && f>n && n>0 && f>0);

   return(mat4(vec4(2.0*n/(r-l),0,(r+l)/(r-l),0),
               vec4(0,2.0*n/(t-b),(t+b)/(t-b),0),
               vec4(0,0,-(f+n)/(f-n),-2.0*f*n/(f-n)),
               vec4(0,0,-1,0)));
   }

//! create parallel projection matrix
inline mat4 mat4::parallel(const vec3 &p,const vec3 &n,const vec3 &d)
   {
   double A = n.x;
   double B = n.y;
   double C = n.z;
   double D = -p.dot(n);

   return(mat4(vec4(B*d.y+C*d.z,-B*d.x     ,-C*d.x     ,-D*d.x),
               vec4(-A*d.y     ,A*d.x+C*d.z,-C*d.y     ,-D*d.y),
               vec4(-A*d.z     ,-B*d.z     ,A*d.x+B*d.y,-D*d.z),
               vec4(0          ,0          ,0          ,A*d.x+B*d.y+C*d.z)));
   }

//! create perspective matrix
inline mat4 mat4::perspective(double fovy,double aspect,double znear,double zfar)
   {
   double f;

   fovy*=PI/180;

   assert(fovy>0.0 && fovy<PI);
   assert(znear>0.0 && zfar>znear);
   assert(aspect>0.0);

   f=1.0/tan(0.5*fovy);

   return(mat4(vec4(f/aspect,0,0,0),
               vec4(0,f,0,0),
               vec4(0,0,(zfar+znear)/(znear-zfar),(2*zfar*znear)/(znear-zfar)),
               vec4(0,0,-1,0)));
   }

//! create lookat matrix
inline mat4 mat4::lookat(const vec3 &eye,const vec3 &center,const vec3 &up)
   {
   vec3 dir,right,top;

   dir=(center-eye).normalize();
   top=up.normalize();

   if (dir==vec3(0) || top==vec3(0)) return(mat4(1));

   right=dir.cross(top).normalize();
   top=right.cross(dir);

   return(mat4(vec4(right,0),vec4(top,0),vec4(-dir,0))*translate(-eye));
   }

//! 4x4 float matrix
//! * this matrix type is not designed for calculations
//! * it is designed for compact storage and transfer purposes only
//!  * use mat4 for linear math calulations, then copy to mat4f and
//!  * cast to const float * to transfer via glUniform:
//!   * glUniformMatrix4fv(location, 1, GL_FALSE, (const float *)mat4f(M));
class mat4f
   {
   public:

   //! default constructor
   mat4f(float diag=1.0f)
      {
      mtx[0][0]=diag;
      mtx[0][1]=0.0f;
      mtx[0][2]=0.0f;
      mtx[0][3]=0.0f;

      mtx[1][0]=0.0f;
      mtx[1][1]=diag;
      mtx[1][2]=0.0f;
      mtx[1][3]=0.0f;

      mtx[2][0]=0.0f;
      mtx[2][1]=0.0f;
      mtx[2][2]=diag;
      mtx[2][3]=0.0f;

      mtx[3][0]=0.0f;
      mtx[3][1]=0.0f;
      mtx[3][2]=0.0f;
      mtx[3][3]=diag;
      }

   //! custom constructor
   mat4f(const vec4f &r1,
         const vec4f &r2,
         const vec4f &r3,
         const vec4f &r4=vec4f(0,0,0,1))
      {
      mtx[0][0]=r1.x;
      mtx[0][1]=r2.x;
      mtx[0][2]=r3.x;
      mtx[0][3]=r4.x;

      mtx[1][0]=r1.y;
      mtx[1][1]=r2.y;
      mtx[1][2]=r3.y;
      mtx[1][3]=r4.y;

      mtx[2][0]=r1.z;
      mtx[2][1]=r2.z;
      mtx[2][2]=r3.z;
      mtx[2][3]=r4.z;

      mtx[3][0]=r1.w;
      mtx[3][1]=r2.w;
      mtx[3][2]=r3.w;
      mtx[3][3]=r4.w;
      }

   //! copy constructor
   mat4f(const mat4 &m)
      {
      mtx[0][0]=(float)m[0][0];
      mtx[0][1]=(float)m[0][1];
      mtx[0][2]=(float)m[0][2];
      mtx[0][3]=(float)m[0][3];

      mtx[1][0]=(float)m[1][0];
      mtx[1][1]=(float)m[1][1];
      mtx[1][2]=(float)m[1][2];
      mtx[1][3]=(float)m[1][3];

      mtx[2][0]=(float)m[2][0];
      mtx[2][1]=(float)m[2][1];
      mtx[2][2]=(float)m[2][2];
      mtx[2][3]=(float)m[2][3];

      mtx[3][0]=(float)m[3][0];
      mtx[3][1]=(float)m[3][1];
      mtx[3][2]=(float)m[3][2];
      mtx[3][3]=(float)m[3][3];
      }

   //! construct matrix from column vectors
   static mat4f columns(const vec4f &c1,const vec4f &c2,const vec4f &c3,const vec4f &c4)
      {
      return(mat4f(vec4f(c1.x,c2.x,c3.x,c4.x),
                   vec4f(c1.y,c2.y,c3.y,c4.y),
                   vec4f(c1.z,c2.z,c3.z,c4.z),
                   vec4f(c1.w,c2.w,c3.w,c4.w)));
      }

   //! construct matrix from column vectors
   static mat4f columns(float a,float b,float c,float d,
                        float e,float f,float g,float h,
                        float i,float j,float k,float l,
                        float m,float n,float o,float p)
      {
      return(mat4f(vec4f(a,e,i,m),
                   vec4f(b,f,j,n),
                   vec4f(c,g,k,o),
                   vec4f(d,h,l,p)));
      }

   //! construct matrix from row vectors
   static mat4f rows(const vec4f &r1,const vec4f &r2,const vec4f &r3,const vec4f &r4)
      {
      return(mat4f(r1,
                   r2,
                   r3,
                   r4));
      }

   //! construct matrix from row vectors
   static mat4f rows(float a,float b,float c,float d,
                     float e,float f,float g,float h,
                     float i,float j,float k,float l,
                     float m,float n,float o,float p)
      {
      return(mat4f(vec4f(a,b,c,d),
                   vec4f(e,f,g,h),
                   vec4f(i,j,k,l),
                   vec4f(m,n,o,p)));
      }

   //! subscript operator (column getter)
   vec4f operator[] (const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4f(mtx[i][0],mtx[i][1],mtx[i][2],mtx[i][3]));
      }

   //! row getter
   vec4f row(const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4f(mtx[0][i],mtx[1][i],mtx[2][i],mtx[3][i]));
      }

   //! column getter
   vec4f col(const int i) const
      {
      assert(i>=0 && i<4);
      return(vec4f(mtx[i][0],mtx[i][1],mtx[i][2],mtx[i][3]));
      }

   //! down cast operator
   operator mat3f() const
      {return(mat3f(row(0).xyz(),row(1).xyz(),row(2).xyz()));}

   //! const pointer to column-major array
   const float *c_ptr() const
      {return(pointer);}

   //! cast operator to column-major array
   operator const float *() const
      {return(pointer);}

   //! convert from 16-element column-major OpenGL matrix
   void fromOpenGL(const float m[16])
      {
      mtx[0][0]=m[0];
      mtx[0][1]=m[1];
      mtx[0][2]=m[2];
      mtx[0][3]=m[3];

      mtx[1][0]=m[4];
      mtx[1][1]=m[5];
      mtx[1][2]=m[6];
      mtx[1][3]=m[7];

      mtx[2][0]=m[8];
      mtx[2][1]=m[9];
      mtx[2][2]=m[10];
      mtx[2][3]=m[11];

      mtx[3][0]=m[12];
      mtx[3][1]=m[13];
      mtx[3][2]=m[14];
      mtx[3][3]=m[15];
      }

   //! string cast operator
   operator std::string()
      {return("(" + std::string(row(0)) + ", " + std::string(row(1)) + ", " + std::string(row(2)) + ", " + std::string(row(3)) + ")");}

   protected:

   //! matrix elements
   union {
      float mtx[4][4];
      float pointer[16];
      };
   };

//! output operator
inline std::ostream& operator << (std::ostream &out,const mat4f &m)
   {return(out << "(" << m.row(0) << ", " << m.row(1) << ", " << m.row(2) << ", " << m.row(3) << ")");}

//! copy constructor
inline mat4::mat4(const mat4f &m)
   {
   mtx[0][0]=m[0][0];
   mtx[0][1]=m[0][1];
   mtx[0][2]=m[0][2];
   mtx[0][3]=m[0][3];

   mtx[1][0]=m[1][0];
   mtx[1][1]=m[1][1];
   mtx[1][2]=m[1][2];
   mtx[1][3]=m[1][3];

   mtx[2][0]=m[2][0];
   mtx[2][1]=m[2][1];
   mtx[2][2]=m[2][2];
   mtx[2][3]=m[2][3];

   mtx[3][0]=m[3][0];
   mtx[3][1]=m[3][1];
   mtx[3][2]=m[3][2];
   mtx[3][3]=m[3][3];
   }

//! quaternion
class quat
   {
   public:

   //! default constructor
   quat(const vec4 &v=vec4(0,0,0,1))
      : q(v)
      {}

   //! custom constructor
   quat(double x, double y, double z, double w)
      : q(vec4(x,y,z,w))
      {}

   //! custom constructor
   quat(const vec3 &v, double w)
      : q(vec4(v,w))
      {}

   //! inner product
   double dot(const quat &r) const
      {return(q.dot(r.q));}

   //! get quaternion length
   double length() const {return(q.length());}

   //! get quaternion norm
   double norm() const {return(q.norm());}

   //! normalization
   quat normalize() const
      {return(q.normalize());}

   //! conjugation
   quat conjugate() const
      {return(vec4(-vec3(q.x,q.y,q.z),q.w));}

   //! invert normalized quaternion
   quat invert() const
      {return(normalize().conjugate());}

   //! cast operator
   operator vec4() const
      {return(q);}

   //! cast operator
   operator mat3() const
      {
      double a=q.w;
      double b=q.x;
      double c=q.y;
      double d=q.z;
      double a2=a*a;
      double b2=b*b;
      double c2=c*c;
      double d2=d*d;

      return(mat3(vec3(a2+b2-c2-d2, 2*(b*c-a*d), 2*(b*d+a*c)),
                  vec3(2*(b*c+a*d), a2-b2+c2-d2, 2*(c*d-a*b)),
                  vec3(2*(b*d-a*c), 2*(c*d+a*b), a2-b2-c2+d2)));
      }

   //! create rotating quaternion
   //! * rotation angle is specified clockwise in OpenGL coordinates
   static quat rotate(double angle,const vec3 &v)
      {
      angle*=PI/360;
      return(vec4(sin(angle)*v,cos(angle)));
      }

   //! create rotating quaternion from two vectors
   static quat rotate(const vec3 &from, const vec3 &to)
      {
      vec3 v1=from.normalize();
      vec3 v2=to.normalize();
      vec3 half=(v1+v2).normalize();
      return(quat(v1.cross(half), v1.dot(half)));
      }

   //! inplace multiplication
   quat& operator *= (const quat &q);

   //! string cast operator
   operator std::string()
      {return("quat" + std::string(q));}

   //! conversion to string
   std::string to_string(std::string delimiter = ", ", int space=0)
      {return("quat" + q.to_string(delimiter, space));}

   friend quat operator + (const quat &a,const quat &b);
   friend quat operator - (const quat &a,const quat &b);
   friend quat operator * (const quat &a,const quat &b);
   friend quat operator * (double a,const quat &b);
   friend quat operator * (const quat &a,double b);
   friend quat operator - (const quat &r);
   friend vec3 operator * (const quat &r,const vec3 &v);

   protected:

   vec4 q;
   };

//! addition of two quaternions
inline quat operator + (const quat &a,const quat &b)
   {return(a.q+b.q);}

//! subtraction of two quaternions
inline quat operator - (const quat &a,const quat &b)
   {return(a.q-b.q);}

//! left-hand side scalar multiplication
inline quat operator * (const double a,const quat &b)
   {return(a*b.q);}

//! right-hand side scalar multiplication
inline quat operator * (const quat &a,const double b)
   {return(a.q*b);}

//! conjugation of a quaternion
inline quat operator - (const quat &r)
   {return(vec4(-vec3(r.q.x,r.q.y,r.q.z),r.q.w));}

//! multiplication of two quaternions
inline quat operator * (const quat &a,const quat &b)
   {
   double v=a.q.w,w=b.q.w;
   vec3 p(a.q.x,a.q.y,a.q.z),q(b.q.x,b.q.y,b.q.z);

   return(vec4(p*w+q*v-p.cross(q),v*w-p.dot(q)));
   }

//! inplace multiplication
inline quat& quat::operator *= (const quat &q)
   {
   *this = (*this)*q;
   return(*this);
   }

//! right-hand side vector multiplication with normalized quaternion
inline vec3 operator * (const quat &r,const vec3 &v)
   {
   quat w=r.normalize();
   w=-w*quat(vec4(v,0.0))*w;

   return(vec3(w.q.x,w.q.y,w.q.z));
   }

//! output operator
inline std::ostream& operator << (std::ostream &out,const quat &r)
   {return(out << std::setprecision(GLSLMATH_PRECISION) << "(" << vec4(r).x << ", " << vec4(r).y << ", " << vec4(r).z << ", " << vec4(r).w << ")");}

namespace glslmath {

//! pretty print
inline void print(const char *s = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   out << prefix << s << std::endl;
   }

//! pretty print
inline void print(std::string s, std::string prefix = "", std::ostream &out = std::cout)
   {
   out << prefix << s << std::endl;
   }

//! pretty print
inline void print(char c, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   if (isprint(c))
      out << name << "'" << c << "'" << std::endl;
   else
      out << std::hex << name << "0x" << (int)c << std::endl;
   }

//! pretty print
inline void print(int v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << v << std::endl;
   }

//! pretty print
inline void print(unsigned int v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << v << std::endl;
   }

//! pretty print
inline void print(double v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << std::setprecision(GLSLMATH_PRECISION) << prefix << name << v << std::endl;
   }

//! pretty print
inline void print(vec2 v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(vec2f v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(vec3 v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(vec3f v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(vec4 v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(vec4f v, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(v) << std::endl;
   }

//! pretty print
inline void print(mat2 m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(1).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(mat2f m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(1).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(mat3 m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << to_space(name.size()) << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << name << "| " << m.row(1).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(2).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(mat3f m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << to_space(name.size()) << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << name << "| " << m.row(1).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(2).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(mat4 m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << to_space(name.size()) << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << name << "| " << m.row(1).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "| " << m.row(2).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(3).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(mat4f m, std::string name = "", std::string prefix = "", int space=13, std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << to_space(name.size()) << "/ " << m.row(0).to_string(" ", space) << " \\" << std::endl;
   out << prefix << name << "| " << m.row(1).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "| " << m.row(2).to_string(" ", space) << " |" << std::endl;
   out << prefix << to_space(name.size()) << "\\ " << m.row(3).to_string(" ", space) << " /" << std::endl;
   }

//! pretty print
inline void print(quat q, std::string name = "", std::string prefix = "", std::ostream &out = std::cout)
   {
   if (name.size() > 0) name = name + " = ";
   out << prefix << name << std::string(q) << std::endl;
   }

//! hsv to rgb conversion
inline vec3 hsv(double hue,double sat,double val)
   {
   vec3 rgb;

   double hue6,r,s,t;

   if (hue<0.0) hue=0.0;
   if (sat<0.0) sat=0.0;
   else if (sat>1.0) sat=1.0;
   if (val<0.0) val=0.0;
   else if (val>1.0) val=1.0;

   hue/=60.0;
   hue=hue-6.0*floor(hue/6.0);
   hue6=hue-floor(hue);

   r=val*(1.0-sat);
   s=val*(1.0-sat*hue6);
   t=val*(1.0-sat*(1.0-hue6));

   switch ((int)floor(hue))
      {
      case 0: // red -> yellow
         rgb=vec3(val,t,r);
         break;
      case 1: // yellow -> green
         rgb=vec3(s,val,r);
         break;
      case 2: // green -> cyan
         rgb=vec3(r,val,t);
         break;
      case 3: // cyan -> blue
         rgb=vec3(r,s,val);
         break;
      case 4: // blue -> magenta
         rgb=vec3(t,r,val);
         break;
      case 5: // magenta -> red
         rgb=vec3(val,r,s);
         break;
      }

   return(rgb);
   }

}

// matrix stack
template <class T>
class scoped_push
   {
   public:

   // default constructor
   scoped_push(const T &m)
      {push_matrix(m);}

   // destructor
   ~scoped_push()
      {pop_matrix();}

   // load matrix
   static void load_matrix(const T &m=T(1))
      {
      if (stack_.begin()==stack_.end())
         stack_.push_back(m);
      else
         *(--stack_.end())=m;
      }

   // push matrix
   void push_matrix()
      {
      if (stack_.begin()==stack_.end())
         stack_.push_back(T(1));
      else
         stack_.push_back(top());
      }

   // push matrix
   void push_matrix(const T &m)
      {
      if (stack_.begin()==stack_.end())
         stack_.push_back(m);
      else
         stack_.push_back(top()*m);
      }

   // matrix multiplication
   static void mult_matrix(const T &m)
      {
      if (stack_.begin()==stack_.end())
         stack_.push_back(m);
      else
         *(--stack_.end())=top()*m;
      }

   // top stack element
   static const T top()
      {
      assert(stack_.begin()!=stack_.end());
      return(*(--stack_.end()));
      }

   // pop matrix
   void pop_matrix()
      {
      assert(stack_.begin()!=stack_.end());
      stack_.pop_back();
      }

   protected:

   static std::vector<T> stack_;
   };

// matrix stack convenience macros
#define load_matrix(m) scoped_push<mat4>::load_matrix(m)
#define push_matrix() scoped_push<mat4>::push_matrix()
#define mult_matrix(m) scoped_push<mat4>::mult_matrix(m)
#define mult_matrix_scoped(m) scoped_push<mat4> __scoped_push__(m)
#define top_matrix() scoped_push<mat4>::top()
#define pop_matrix() scoped_push<mat4>::pop_matrix()

template <class T>
std::vector<T> scoped_push<T>::stack_;

// scoped opengl matrix stack
class glScopedMatrixStack
   {
   public:

   glScopedMatrixStack()
      {
#ifdef GL_VERSION_1_2
      glPushMatrix();
#endif
      }

   ~glScopedMatrixStack()
      {
#ifdef GL_VERSION_1_2
      glPopMatrix();
#endif
      }

   };

// scoped replacement for glPushMatrix/glPopMatrix pairs
#ifndef glPushMatrixScoped
#define glPushMatrixScoped() glScopedMatrixStack __glScopedMatrixStack__
#endif

namespace glslmath {

//! greatest common divisor
inline unsigned int gcd(unsigned int a,unsigned int b)
   {
   unsigned int c;

   while (b>0)
      {
      c=a%b;
      a=b;
      b=c;
      }

   return(a);
   }

//! smallest common multiple
inline unsigned int lcm(unsigned int a,unsigned int b)
   {return(a*b/gcd(a,b));}

//! calculate the distance of a point p from a line segment between vectors a and b
inline double distance2line(vec3 p,vec3 a,vec3 b)
   {
   vec3 n=b-a;
   n=n.normalize();

   double l=(p-a).dot(n);
   vec3 h=a+l*n;

   double dh=(p-h).norm();
   double da=(p-a).norm();
   double db=(p-b).norm();

   if (dh<da && dh<db) return(sqrt(dh));
   if (da<db) return(sqrt(da));
   else return(sqrt(db));
   }

//! merge two spheres
inline void merge_spheres(vec3 &center0,double &radius0,
                          const vec3 &center1,const double radius1)
   {
   vec3 d=center1-center0;

   double r=d.length();
   d=d.normalize();

   if (radius1>radius0+r)
      {
      center0=center1;
      radius0=radius1;
      }
   else if (radius1+r>radius0)
      {
      vec3 a=center1+d*radius1;
      vec3 b=center0-d*radius0;

      center0=(a+b)/2.0;
      radius0=(a-b).length()/2.0;
      }
   }

//! ray/unitsphere intersection
inline double intersect_ray_unitsphere(vec3 p,vec3 d)
   {
   double a,b,c;
   double s,r;

   double t1,t2;
   double t;

   // compute a, b and c coefficients
   a=2*d.dot(d);
   b=2*p.dot(d);
   c=2*(p.dot(p)-1.0);

   // find discriminant
   r=b*b-a*c;

   // if discriminant is negative, ray misses sphere
   if (r<0.0) return(DBL_MAX);

   // compute real root
   s=sqrt(r);

   // compute two real solutions t1 and t2
   t1=(-b+s)/a;
   t2=(-b-s)/a;

   // make sure t1 is smaller than t2
   if (t1>t2)
      {
      t=t1;
      t1=t2;
      t2=t;
      }

   // return closest solution
   if (t2>-t1) return(t1);
   else return(t2);
   }

//! ray/ellipsoid intersection
inline double intersect_ray_ellipsoid(vec3 p,vec3 d,
                                      vec3 o,double r1,double r2,double r3)
   {
   p-=o;

   p.x/=r1;
   p.y/=r2;
   p.z/=r3;

   d.x/=r1;
   d.y/=r2;
   d.z/=r3;

   return(intersect_ray_unitsphere(p,d));
   }

//! ray/plane intersection
inline double intersect_ray_plane(vec3 p,vec3 d,
                                  vec3 o,vec3 n)
   {
   double c;

   static const double epsilon=1E-10;

   c=d.dot(n);

   if (fabs(c)<=epsilon) return(DBL_MAX);

   return(n.dot(o-p)/c);
   }

//! Moeller-Trumbore ray/triangle intersection
inline int intersect_ray_triangle(const vec3 &o,const vec3 &d,
                                  const vec3 &v0,const vec3 &v1,const vec3 &v2,
                                  vec3 &tuv)
   {
   static const double epsilon=1E-5;

   double t,u,v;
   vec3 edge1,edge2,tvec,pvec,qvec;
   double det,inv_det;

   // find vectors for two edges sharing v0
   edge1=v1-v0;
   edge2=v2-v0;

   // begin calculating determinant - also used to calculate U parameter
   pvec=d.cross(edge2);

   // if determinant is near zero, ray lies in plane of triangle
   det=edge1.dot(pvec);

   // cull triangles with determinant near zero
   if (fabs(det)<epsilon) return(0);

   // calculate inverse determinant
   inv_det=1.0/det;

   // calculate distance from v0 to ray origin
   tvec=o-v0;

   // calculate U parameter and test bounds
   u=tvec.dot(pvec)*inv_det;
   if (u<0.0 || u>1.0) return(0);

   // prepare to test V parameter
   qvec=tvec.cross(edge1);

   // calculate V parameter and test bounds
   v=d.dot(qvec)*inv_det;
   if (v<0.0 || u+v>1.0) return(0);

   // calculate t, ray intersects triangle
   t=edge2.dot(qvec)*inv_det;

   tuv=vec3(t,u,v);

   return(1);
   }

//! calculate hit distance on ray to triangle
inline double ray_triangle_dist(const vec3 &o,const vec3 &d,
                                const vec3 &v1,const vec3 &v2,const vec3 &v3)
   {
   vec3 tuv(0,0,0);

   if (intersect_ray_triangle(o,d,v1,v2,v3,tuv)==0) return(DBL_MAX);
   else return(tuv.x);
   }

//! geometric point/sphere intersection test
inline int itest_point_sphere(const vec3 &p,const vec3 &b,const double r2)
   {return((p-b).norm()<=r2);}

//! geometric ray/sphere intersection test
inline int itest_ray_sphere(const vec3 &o,const vec3 &d,
                            const vec3 &b,const double r2)
   {
   vec3 dn;

   vec3 bmo;
   double bmo2,bmod;

   dn=d.normalize();

   bmo=b-o;
   bmo2=bmo.dot(bmo);
   if (bmo2<r2) return(1);

   bmod=bmo.dot(dn);
   if (bmod<0.0) return(0);
   if (r2+bmod*bmod>bmo2) return(1);

   return(0);
   }

//! geometric cone/sphere intersection test
inline int itest_cone_sphere(const vec3 &o,const vec3 &d,double cone,
                             const vec3 &b,const double r)
   {
   vec3 dn;

   double l0,l;
   vec3 p;

   dn=d.normalize();

   l0=dn.dot(b-o);
   if (l0<-r) return(0);

   p=o+l0*dn;

   l=(b-p).length()-r*sqrt(1.0+cone*cone);

   return(l<cone*l0);
   }

//! geometric ray/bbox intersection test
inline int itest_ray_bbox(const vec3 &o,const vec3 &d,
                          const vec3 &b,const vec3 &r)
   {
   double l;
   vec3 h;

   if (d.x<0.0 && o.x<b.x-r.x) return(0);
   if (d.x>0.0 && o.x>b.x+r.x) return(0);
   if (d.y<0.0 && o.y<b.y-r.y) return(0);
   if (d.y>0.0 && o.y>b.y+r.y) return(0);
   if (d.z<0.0 && o.z<b.z-r.z) return(0);
   if (d.z>0.0 && o.z>b.z+r.z) return(0);

   if (d.x!=0.0)
      {
      if (d.x>0.0) l=(b.x-r.x-o.x)/d.x;
      else l=(b.x+r.x-o.x)/d.x;

      if (l>0.0)
         {
         h=o+d*l;
         if (h.y<b.y-r.y && o.y>b.y-r.y) return(0);
         if (h.y>b.y+r.y && o.y<b.y+r.y) return(0);
         if (h.z<b.z-r.z && o.z>b.z-r.z) return(0);
         if (h.z>b.z+r.z && o.z<b.z+r.z) return(0);
         }
      }

   if (d.y!=0.0)
      {
      if (d.y>0.0) l=(b.y-r.y-o.y)/d.y;
      else l=(b.y+r.y-o.y)/d.y;

      if (l>0.0)
         {
         h=o+d*l;
         if (h.x<b.x-r.x && o.x>b.x-r.x) return(0);
         if (h.x>b.x+r.x && o.x<b.x+r.x) return(0);
         if (h.z<b.z-r.z && o.z>b.z-r.z) return(0);
         if (h.z>b.z+r.z && o.z<b.z+r.z) return(0);
         }
      }

   if (d.z!=0.0)
      {
      if (d.z>0.0) l=(b.z-r.z-o.z)/d.z;
      else l=(b.z+r.z-o.z)/d.z;

      if (l>0.0)
         {
         h=o+d*l;
         if (h.x<b.x-r.x && o.x>b.x-r.x) return(0);
         if (h.x>b.x+r.x && o.x<b.x+r.x) return(0);
         if (h.y<b.y-r.y && o.y>b.y-r.y) return(0);
         if (h.y>b.y+r.y && o.y<b.y+r.y) return(0);
         }
      }

   return(1);
   }

//! geometric plane/sphere intersection test
inline int itest_plane_sphere(const vec3 &o,const vec3 &n,const double radius,
                              const vec3 &b,const double r2)
   {
   vec3 h;
   double l;

   h=b-o;
   l=h.dot(n);

   if (l*l>r2) return(0); // no intersection
   if (h.dot(h)>2.0*(radius*radius+r2)) return(0); // no inclusion (approximate)

   return(1);
   }

}

namespace glslnoise {

//! perlin noise
class perlinnoise
   {
   public:

   //! default constructor
   perlinnoise(int sx=64,int sy=64,int sz=64,
               int start=4,float persist=0.5f,
               float seed=0.0f)
      {
      sizex=sx;
      sizey=sy;
      sizez=sz;

      data=noise(sx,sy,sz,start,persist,seed);
      }

   //! destructor
   ~perlinnoise()
      {if (data) delete data;}

   //! cubic interpolation of perlin noise
   inline float interpolate(float c1,float c2=0.0f,float c3=0.0f)
      {
      float v;

      if (data) v=interpolate(data,sizex,sizey,sizez,c1,c2,c3);
      else v=0.0f;

      if (v<0.0f) v=0.0f;
      else if (v>1.0f) v=1.0f;

      return(v);
      }

   private:

   int sizex,sizey,sizez;
   float *data;

   inline static float get(const float *data,
                           int sx,int sy,int sz,
                           int x,int y,int z)
      {
      assert(x>=0 && x<sx && y>=0 && y<sy && z>=0 && z<sz);
      return(data[x+(y+z*sy)*sx]);
      }

   inline static void set(float *data,
                          int sx,int sy,int sz,
                          int x,int y,int z,
                          float v)
      {
      assert(x>=0 && x<sx && y>=0 && y<sy && z>=0 && z<sz);
      data[x+(y+z*sy)*sx]=v;
      }

   inline static void add(float *data,
                          int sx,int sy,int sz,
                          int x,int y,int z,
                          float v)
      {
      assert(x>=0 && x<sx && y>=0 && y<sy && z>=0 && z<sz);
      data[x+(y+z*sy)*sx]+=v;
      }

   inline static float interpolate(float v0,float v1,float v2,float v3,float x)
      {
      float p,q,r;

      p=v3-v2+v1-v0;
      q=v0-v1-p;
      r=v2-v0;

      return(((p*x+q)*x+r)*x+v1);
      }

   inline static float interpolatex(const float *data,
                                    int sx,int sy,int sz,
                                    int k1,int k2,int k3,
                                    float wx)
      {
      float v0,v1,v2,v3;

      v1=get(data,sx,sy,sz,k1,k2,k3);
      v0=(k1>0)?get(data,sx,sy,sz,k1-1,k2,k3):v1;
      v2=(k1<sx-1)?get(data,sx,sy,sz,k1+1,k2,k3):v1;
      v3=(k1<sx-2)?get(data,sx,sy,sz,k1+2,k2,k3):v2;

      return(interpolate(v0,v1,v2,v3,wx));
      }

   inline static float interpolatey(const float *data,
                                    int sx,int sy,int sz,
                                    int k1,int k2,int k3,
                                    float wx,float wy)
      {
      float v0,v1,v2,v3;

      v1=interpolatex(data,sx,sy,sz,k1,k2,k3,wx);
      v0=(k2>0)?interpolatex(data,sx,sy,sz,k1,k2-1,k3,wx):v1;
      v2=(k2<sy-1)?interpolatex(data,sx,sy,sz,k1,k2+1,k3,wx):v1;
      v3=(k2<sy-2)?interpolatex(data,sx,sy,sz,k1,k2+2,k3,wx):v2;

      return(interpolate(v0,v1,v2,v3,wy));
      }

   inline static float interpolatez(const float *data,
                                    int sx,int sy,int sz,
                                    int k1,int k2,int k3,
                                    float wx,float wy,float wz)
      {
      float v0,v1,v2,v3;

      v1=interpolatey(data,sx,sy,sz,k1,k2,k3,wx,wy);
      v0=(k3>0)?interpolatey(data,sx,sy,sz,k1,k2,k3-1,wx,wy):v1;
      v2=(k3<sz-1)?interpolatey(data,sx,sy,sz,k1,k2,k3+1,wx,wy):v1;
      v3=(k3<sz-2)?interpolatey(data,sx,sy,sz,k1,k2,k3+2,wx,wy):v2;

      return(interpolate(v0,v1,v2,v3,wz));
      }

   inline static float interpolate(const float *data,
                                   int sx,int sy,int sz,
                                   float c1,float c2,float c3)
      {
      int k1,k2,k3;
      float w1,w2,w3;

      c1=c1-(int)floorf(c1);
      c2=c2-(int)floorf(c2);
      c3=c3-(int)floorf(c3);

      k1=(int)floorf(c1*(sx-1));
      w1=c1*(sx-1)-k1;

      k2=(int)floorf(c2*(sy-1));
      w2=c2*(sy-1)-k2;

      k3=(int)floorf(c3*(sz-1));
      w3=c3*(sz-1)-k3;

      return(interpolatez(data,sx,sy,sz,k1,k2,k3,w1,w2,w3));
      }

   inline static void average(float *data,
                              int sx,int sy,int sz,
                              int x1,int y1,int z1,
                              int x2,int y2,int z2,
                              int dx,int dy,int dz)
      {
      int x,y,z;

      float v,v1,v2;

      for (x=0; x<dx; x++)
         for (y=0; y<dy; y++)
            for (z=0; z<dz; z++)
               {
               v1=get(data,sx,sy,sz,x1+x,y1+y,z1+z);
               v2=get(data,sx,sy,sz,x2+x,y2+y,z2+z);
               v=(v1+v2)/2.0f;
               set(data,sx,sy,sz,x1+x,y1+y,z1+z,v);
               set(data,sx,sy,sz,x2+x,y2+y,z2+z,v);
               }
      }

   public:

   inline static float *noise(int sx=64,int sy=64,int sz=64,
                              int start=4,float persist=0.5f,
                              float seed=0.0f)
      {
      int i;
      int x,y,z;

      int size;
      int dx,dy,dz;

      float scaling;

      float *noise,*octave;

      float v,minv,maxv;

      if ((sx&(sx-1))!=0 || sx<1) return(NULL);
      if ((sy&(sy-1))!=0 || sy<1) return(NULL);
      if ((sz&(sz-1))!=0 || sz<1) return(NULL);

      if ((start&(start-1))!=0 || start<1) return(NULL);

      if ((noise=new(std::nothrow)float[sx*sy*sz])==NULL) return(NULL);

      for (x=0; x<sx; x++)
         for (y=0; y<sy; y++)
            for (z=0; z<sz; z++) set(noise,sx,sy,sz,x,y,z,0.0f);

      if ((octave=new(std::nothrow)float[sx*sy*sz])==NULL)
         {
         delete noise;
         return(NULL);
         }

      size=sx;
      if (sy>size) size=sy;
      if (sz>size) size=sz;

      getrandom(seed);

      scaling=1.0f;

      for (i=start; i<=size; i*=2)
         {
         dx=i*sx/size;
         dy=i*sy/size;
         dz=i*sz/size;

         if (dx<1) dx=1;
         if (dy<1) dy=1;
         if (dz<1) dz=1;

         for (x=0; x<dx; x++)
            for (y=0; y<dy; y++)
               for (z=0; z<dz; z++)
                  set(octave,dx,dy,dz,x,y,z,
                      getrandom()*scaling);

         // seamless noise via octave face averaging
         if (dx>1) average(octave,dx,dy,dz,0,0,0,dx-1,0,0,1,dy,dz);
         if (dy>1) average(octave,dx,dy,dz,0,0,0,0,dy-1,0,dx,1,dz);
         if (dz>1) average(octave,dx,dy,dz,0,0,0,0,0,dz-1,dx,dy,1);

         for (x=0; x<sx; x++)
            for (y=0; y<sy; y++)
               for (z=0; z<sz; z++)
                  add(noise,sx,sy,sz,x,y,z,
                      interpolate(octave,dx,dy,dz,
                                  (sx>1)?(float)x/(sx-1):0.0f,
                                  (sy>1)?(float)y/(sy-1):0.0f,
                                  (sz>1)?(float)z/(sz-1):0.0f));

         scaling*=persist;
         }

      delete octave;

      minv=FLT_MAX;
      maxv=-FLT_MAX;

      for (x=0; x<sx; x++)
         for (y=0; y<sy; y++)
            for (z=0; z<sz; z++)
               {
               v=get(noise,sx,sy,sz,x,y,z);
               if (v<minv) minv=v;
               if (v>maxv) maxv=v;
               }

      if (minv==maxv) maxv++;

      // normalization
      for (x=0; x<sx; x++)
         for (y=0; y<sy; y++)
            for (z=0; z<sz; z++)
               set(noise,sx,sy,sz,x,y,z,
                   (get(noise,sx,sy,sz,x,y,z)-minv)/(maxv-minv));

      return(noise);
      }

   inline static float getrandom(float seed=-1.0f)
      {
      static const long long maxbits=50;
      static const long long maxnum=1ull<<maxbits;

      static long long number=0;

      if (seed>=0.0f && seed<=1.0f) number=(long long)(seed*(maxnum-1));

      number=271*(number+331);
      number=(number<<(maxbits/3))+(number>>(2*maxbits/3));
      number&=maxnum-1;

      return((float)number/(maxnum-1));
      }

   };

inline static double noise(vec3f coord,int size=64,int start=4)
   {
   static perlinnoise N(size,size,size,start);

   return(N.interpolate(coord.x,coord.y,coord.z));
   }

inline static vec3 noise3D(vec3f coord,int size=64,int start=4)
   {
   static perlinnoise Nx(size,size,size,start,0.5f,0.25f),
                      Ny(size,size,size,start,0.5f,0.5f),
                      Nz(size,size,size,start,0.5f,0.75f);

   return(vec3(Nx.interpolate(coord.x,coord.y,coord.z),
               Ny.interpolate(coord.x,coord.y,coord.z),
               Nz.interpolate(coord.x,coord.y,coord.z)));
   }

inline static vec4 noise4D(vec3f coord,int size=64,int start=4)
   {
   static perlinnoise Nx(size,size,size,start,0.5f,0.2f),
                      Ny(size,size,size,start,0.5f,0.4f),
                      Nz(size,size,size,start,0.5f,0.6f),
                      Nw(size,size,size,start,0.5f,0.8f);

   return(vec4(Nx.interpolate(coord.x,coord.y,coord.z),
               Ny.interpolate(coord.x,coord.y,coord.z),
               Nz.interpolate(coord.x,coord.y,coord.z),
               Nw.interpolate(coord.x,coord.y,coord.z)));
   }

}

namespace glslmath {

// glslmath test function
inline int test()
   {
   int errors=0;

   // test vectors
   {
      vec3 v(0,3,4);
      if (!(v.length()==5)) errors++;
      vec3 a(-10,0,10),b(10,10,10);
      if (!(0.5*(a+b)==vec3(0,5,10))) errors++;
      vec4 r=vec4(1,-1,0,0).reflect(vec4(0,1,0,0));
      if (!(r==vec4(1,1,0,0))) errors++;
      if (vec4(r.zw().yx(),r.xy().yx()).wzyx()!=r) errors++;
      vec4 c1(1,0,0),c2(0,0,1,0.25);
      if (c1.blend(c2)!=vec4(0.75,0,0.25,1)) errors++;
      if (hsv(60,1,1)!=vec3(1,1,0)) errors++;
   }

   // test matrices
   {
      mat4 M(vec4(0,1,0,0),
             vec4(-1,0,0,0),
             vec4(0,0,1,0));

      if (!(M*M.invert()==mat4())) errors++;
   }

   // test affine transformation
   {
      vec3 o=vec3(3,3,3);
      vec3 x=vec3(0,1,0);
      vec3 y=vec3(0,0,1);
      vec3 z=vec3(1,0,0);
      mat4 T=mat4::transform(o,x,y,z);
      vec4 v(1,0,0);
      v=T*v;
      if (v!=vec4(3,4,3,1)) errors++;
   }

   // test transformations
   {
      mat4 translate=mat4::translate(0,0,0);
      mat4 rotate=mat4::rotate(0,vec3(1,0,0));
      mat4 lookat=mat4::lookat(vec3(0,0,0),vec3(0,0,-1),vec3(0,1,0));
      if (!(translate==mat4() && rotate==mat4() && lookat==mat4())) errors++;
      mat4 perspective=mat4::perspective(90,1,1,2);
      if (!(fabs(1-perspective[0].x)<1E-10 && fabs(-3-perspective[2].z)<1E-10)) errors++;
      mat4 parallel=mat4::parallel(vec3(1,0,0),vec3(1,1,0),vec3(-1,0,0));
      if (vec3(parallel*vec4(1,2,3))!=vec3(-1,2,3)) errors++;
   }

   // test combined transformations
   {
      mat4 T=mat4::translate(0,0,1)*mat4::rotate(90,vec3(0,1,0));
      vec4 v(1,0,0);
      v=T*v;
      if (vec3(v).length()>1E-10) errors++;
   }

   // test matrix stack
   {
      double x1,x2;
      {
         mult_matrix_scoped(mat4::scale(0.5,1,1));
         {
            mult_matrix_scoped(mat4::translate(1,1,1));
            x1=top_matrix()[3].x;
         }
         x2=top_matrix()[3].x;
      }
      if (!(x1==0.5 && x2==0.0)) errors++;
   }

   // test quaternions
   {
      quat q;
      vec3 v(0,0,-1);
      vec3 w=q*v;
      quat a=quat::rotate(10,vec3(0,0,-1));
      quat b=quat::rotate(80,vec3(0,0,-1));
      quat r=a*b;
      vec3 p=r*vec3(1,0,0);
      if (!(v.approx(w) && p.approx(vec3(0,-1,0)))) errors++;
      quat m=quat::rotate(vec3(0,1,0),vec3(1,0,0));
      vec3 n=m*vec3(1,0,0);
      if (!n.approx(vec3(0,-1,0))) errors++;
      vec3 o=mat3(m)*vec3(1,0,0);
      if (!o.approx(vec3(0,-1,0))) errors++;
   }

   // test intersection testing
   {
      vec3 p(0,0,0),d(1,1,1);
      vec3 o(1,0,0),n(1,0,0);
      double l=glslmath::intersect_ray_plane(p,d.normalize(),o,n);
      if (fabs(l-sqrt(3.0))>1E-10) errors++;
   }

   // test perlin noise
   {
      vec3 coord(0.5,0.5,0.5);
      double noise_value=glslnoise::noise(coord,32);
      vec3 noise_vector=glslnoise::noise3D(coord,32);
      if (fabs(noise_value-0.4302484)>1E-5) errors++;
      if (!noise_vector.approx(vec3(0.4040824,0.6377566,0.6551602),1E-5)) errors++;
   }

   return(errors);
   }

}

#endif
