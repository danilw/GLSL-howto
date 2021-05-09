#!/bin/sh

source ../emsdk_env.sh

mkdir build

em++ -DNANOVG_GLES3_IMPLEMENTATION -DGLFW_INCLUDE_ES3 -DGLFW_INCLUDE_GLEXT -DNANOGUI_LINUX -Inanogui_mod/include/ -Inanogui_mod/ext/nanovg/ -Inanogui_mod/ext/eigen/ nanogui_mod/nanogui.bc dummy.cpp --std=c++11 -O3 -lGL -lm -lGLEW -s USE_GLFW=3 -s FULL_ES3=1 -s USE_WEBGL2=1 -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -o build/glsl_v2.html --shell-file shell_minimal.html --no-heap-copy --preload-file  ./textures --preload-file ./shaders
