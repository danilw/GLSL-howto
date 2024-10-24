
**what is it** random GLSL tests and ~~basic-step-by-step tutorials/examples~~ (no, this is just mess of code, and some my templates) that I write or use while codding it GLSL
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

**dummy_nanogui_min_wasm** minimal template for WASM Shadertoy-like Shader-Viewer using nanogui(and GLFW) and C++ [live link](https://danilw.github.io/GLSL-howto/dummy_nanogui_min/glsl_v2.html). To build download *dummy_nanogui_min_wasm.zip* and use *build.sh* script there.

**glsl_to_cuda** simple from GLSL to CUDA, very basic example

**ocean** OpenGL to wasm/WebGL ocean rendering(source code in .zip archive), [live link](https://danilw.github.io/GLSL-howto/ocean/ocean.html)

**terra** OpenGL to wasm/WebGL terra/planet rendering(source code in .zip archive), [live link](https://danilw.github.io/GLSL-howto/terra/terra.html)

**font demo** [live link](https://danilw.github.io/GLSL-howto/font_demo/glsl_v2.html)

**shadertoy-render** render video from Shadertoy shaders to video [link to repo](https://github.com/danilw/shadertoy-to-video)

**light_box_rt** [live link](https://www.shadertoy.com/view/tsfGW4) using intersection/RayTracing in GLSL

**vulkan_shader_launcher** [link to repo](https://github.com/danilw/vulkan_shader_launcher)

**Auto tetris** copy from my shadertoy [shadertoy link](https://www.shadertoy.com/view/3dlSzs) more [win64](https://danilw.github.io/GLSL-howto/Auto_tetris/AutoTetris.zip) [web](https://danilw.github.io/GLSL-howto/Auto_tetris/web/glsl_v2.html)

**Godot_shadertoy** [live link](https://danilw.github.io/GLSL-howto/Godot_shadertoy/shadertoy.html) very simple "play Shadertoy logic to Godot" [video](https://youtu.be/v48O7Nk_n4g) used [this shader](https://www.shadertoy.com/view/wlX3zn)

**Cubemap to panorama** convertor [live link](https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/cubemap_to_panorama.html) 

Related to **Cubemap to panorama** - **example_glsl_to_c_panorama_lX2BDm** - look [TEMPLATE cubemap tools](https://www.shadertoy.com/view/NttGWr) - and **example_glsl_to_c_panorama_lX2BDm** is just example of projection textures on sphere-panorama, and this is C-CPU-code port from shader, shader linked in code.

**Thousands of indexed particles** copy from my shadertoy https://www.shadertoy.com/view/tstSz7

**More likes GLSL** copy from my shadertoy https://www.shadertoy.com/view/3syXDD or [itch](https://danilw.itch.io/we-need-more-likes)

**Sgame** copy of [original](https://github.com/danilw/cputests) sgame(single shader game) with removing twgl library from JS code [live link](https://danilw.github.io/GLSL-howto/sgame_ntwgl/sgame.html) 

**Transform feedback WASM template (particles GLES3/WebGL2)** using SDL2 C++ 500 lines code, to launch vertexshaderart.com like shaders, particles with feedback support.

Source minimal [transorm_feedback_template.zip](https://danilw.github.io/GLSL-howto/transorm_feedback_template/transorm_feedback_template.zip), test [live link](https://danilw.github.io/GLSL-howto/transorm_feedback_template/web/test.html) 

Source advansed, for web only, loading shaders from html file without recompiling source [template_feedback_advanced.zip](https://danilw.github.io/GLSL-howto/transorm_feedback_template/template_feedback_advanced.zip), test [live feedback and uniforms and depth](https://danilw.github.io/GLSL-howto/transorm_feedback_template/web_test_adv/feedback_advanced.html) other [live vertex cube march shader](https://danilw.github.io/GLSL-howto/transorm_feedback_template/vertex_voxels_web/voxels_march.html). And [vertexshaderart link](https://www.vertexshaderart.com/art/TFXxrMbQQXNqtcTE8) to compare with [live minimal test](https://danilw.github.io/GLSL-howto/transorm_feedback_template/web_test_adv_minimal/feedback_advanced.html).

**Shader wallpaper for Linux** for Gnome [link](https://www.gnome-look.org/p/1505898/) [mirror link](https://danilw.github.io/GLSL-howto/shader_wallpapers/cube_lines_live_wallpaper_gnome.zip), for KDE [link](https://store.kde.org/p/1505365) [mirror link](https://danilw.github.io/GLSL-howto/shader_wallpapers/cube_lines_live_wallpaper.zip). There script with example shader. 

**gnome_gjs** Gnome Shell 3 Extension that display shader on Wallpaper in Gnome, *these extensions can not be uploaded to Gnome extensions website* because of the bugs in gjs and Gnome Shell there no method to free VRAM  (because of bugs - my extension dont recreate self, it just hide self on disabling), [**lineclock**](https://github.com/danilw/GLSL-howto/tree/master/gnome_gjs/extensions/lineclock%40morimea.shadertoy.com) extension can be used as *minimal example code to display Shaders in Gnome gjs Javascript using Clutter API*. More info: [medium blogpost](https://arugl.medium.com/live-dynamic-wallpaper-in-linux-using-extensions-and-python-with-shaders-4d656a31600f).

[*ctest_js_opengl_basic*](https://danilw.github.io/GLSL-howto/ctest_js_opengl_basic/opengl_basic.html) update of old [js_opengl_basic](https://github.com/danilw/cputests) because threejs [removed geometry](https://discourse.threejs.org/t/three-geometry-will-be-removed-from-core-with-r125/22401?fbclid=IwAR1IOA5w7__0rsliPSCo0STmy95JF3ewQqIsy9cWsNWEB539K96nVCjf2Ug). Just to have it working in 2021+.

**Float precision on GPU, bugs/features** [medium blog post link](https://arugl.medium.com/float-precision-on-gpu-bugs-features-178ddd030f), info about float bits on GPU.

**List of my shader templates** - [useful shader templates](https://github.com/danilw/danilw.github.io/blob/master/blog/my_shader_templates_list/README.md)


### Contact: [**Join discord server**](https://discord.gg/JKyqWgt)

### Graphic

**Shader wallpaper for Linux and gnome_gjs**

![terra](https://danilw.github.io/GLSL-howto/gnome_ext_cl.png)


**Cubemap to panorama**

[![ctop](https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/ctop_scr.png)](https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/cubemap_to_panorama.html)

**light box**

[![light_box](https://danilw.github.io/GLSL-howto/light_box_rt/yt.png)](https://www.shadertoy.com/view/NslGRN)

**terra**

[![terra](https://danilw.github.io/GLSL-howto/terra/scr2.jpg)](https://danilw.github.io/GLSL-howto/terra/terra.html)

**ocean**

[![ocean](https://danilw.github.io/GLSL-howto/ocean/ocean.png)](https://danilw.github.io/GLSL-howto/ocean/ocean.html)

**space_ship_obj**

[![ship_obj](https://danilw.github.io/GLSL-howto/space_ship_obj/yt.png)](https://youtu.be/q00V55R6oGM)

**goglsl**

[![goglsl](https://danilw.github.io/GLSL-howto/goglsl/goglsl.png)](https://danilw.itch.io/goglsl)
