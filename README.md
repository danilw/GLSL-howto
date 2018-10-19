**what is it** random GLSL tests and basic-step-by-step tutorials/examples that I write or use while codding it GLSL
___
*list:*

**basic glsl math** - very basic glsl math to C code translation, C code return step by step GLSL color for pixel-coordinates

**basic hit perf** - faster way to detect "rendering zone" if this hit you position

**art** using TWGL (javascript webgl) fragment shader with textures, [live](https://danilw.github.io/GLSL-howto/anart/glsl/art.html)

**art2** plain with 3d in fragment shader [live](https://danilw.github.io/GLSL-howto/anart2/art2.html)

**nanogui**  [nanogui](https://github.com/wjakob/nanogui) fork I make build for WASM (GLES port with fixes) [live](https://danilw.github.io/GLSL-howto/nanogui/nanogui.html) [source](https://github.com/danilw/nanogui-GLES-wasm) 

**goglsl**  [live](https://danilw.github.io/GLSL-howto/goglsl/goglsl.html) game project (Getting Over ...GLSL?) using many shaders and frame buffers at same time [source](https://github.com/danilw/getting-over-glsl)

**space_ship_obj** creating very simple object in GLSL, on shadertoy [mask](https://www.shadertoy.com/view/XdGBWy) [colored](https://www.shadertoy.com/view/4dGBWy)

**vbo**  [live](https://danilw.github.io/GLSL-howto/vbo/vbo.html) testing some bug in OpenGL

**minimal_webgl_glsl**  [live_mini](https://danilw.github.io/GLSL-howto/minimal_webgl_glsl/mini_glsl_viewer.html) and [live_ext](https://danilw.github.io/GLSL-howto/minimal_webgl_glsl/ext_glsl_texture/mini_glsl_texture.html) minimal GLSL viewer for WebGL without using any js-lib, *ext* version with texture loader and shader file loader

**WebGL-image-slider** [link to repo](https://github.com/danilw/WebGL-image-slider/)

**GLSL random codding** emblem [animated](https://danilw.github.io/GLSL-howto/emblem_ax/ani_3/ani_y.html)

**dummy_nanogui_min_wasm** minimal nanogui C++ code/example  to use many GLSL shaders with framebuffers, build with this command [live link](https://danilw.github.io/GLSL-howto/dummy_nanogui_min/glsl_v2.html)
```
em++ -DNANOVG_GLES3_IMPLEMENTATION -DGLFW_INCLUDE_ES3 -DGLFW_INCLUDE_GLEXT -DNANOGUI_LINUX -Iinclude/ -Iext/Box2D/ -Iext/nanovg/ -Iext/eigen/ box2d.bc nanogui.bc dummy.cpp --std=c++11 -O3 -lGL -lGLU -lm -lGLEW -s USE_GLFW=3 -s FULL_ES3=1 -s USE_WEBGL2=1 -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -o build/glsl_v2.html --shell-file shell_minimal.html --no-heap-copy --preload-file  ./textures --preload-file ./shaders

```

**glsl_to_cuda** simple from GLSL to CUDA, very basic example

**ocean** OpenGL to wasm/WebGL ocean rendering(source code in .zip archive), live https://danilw.github.io/GLSL-howto/ocean/ocean.html



### Graphic

**space_ship_obj**

[![ship_obj](https://danilw.github.io/GLSL-howto/space_ship_obj/yt.png)](https://youtu.be/q00V55R6oGM)

**goglsl**

![goglsl](https://danilw.github.io/GLSL-howto/goglsl/goglsl.png)
