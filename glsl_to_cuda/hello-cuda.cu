#include <stdio.h>

//
// very simple GLSL to CUDA importing
// look for EXAMPLE 1 and EXAMPLE 2 in code

// build
// nvcc hello-cuda.cu -o hello-cuda
//

const unsigned xSize = 1024, ySize = 768; //out image size
//https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#features-and-technical-specifications__technical-specifications-per-compute-capability
//to support "big image resolution" need use loop for cuda_kernel calls, base on cudaOccupancyMaxPotentialBlockSize
//if you have black image output, set block size to 16,16 and 256x256 image resolution

// for cuda error checking
#define cudaCheckErrors(msg) \
    do { \
        cudaError_t __err = cudaGetLastError(); \
        if (__err != cudaSuccess) { \
            fprintf(stderr, "Fatal error: %s (%s at %s:%d)\n", \
                msg, cudaGetErrorString(__err), \
                __FILE__, __LINE__); \
            fprintf(stderr, "*** FAILED - ABORTING\n"); \
            return 1; \
        } \
    } while (0)

__host__ __device__ inline int index(const int x, const int y) {
    return y * xSize + x;
}

//bmp image

void write_bmp(float *R, float *G, float *B) {
    FILE *f;
    unsigned char *img = NULL;
    unsigned int w = xSize, h = ySize, x, y;
    unsigned char r, g, b;
    int filesize = 54 + 3 * w*h; //w is your image width, h is image height, both int

    img = (unsigned char *) malloc(3 * w * h);
    memset(img, 0, 3 * w * h);

    for (int i = 0; i < w; i++) {
        for (int j = 0; j < h; j++) {
            x = i;
            y = (h - 1) - j;
            r = (unsigned char) (R[index(i, j)]*255);
            g = (unsigned char) (G[index(i, j)]*255);
            b = (unsigned char) (B[index(i, j)]*255);
            img[(x + y * w)*3 + 2] = r;
            img[(x + y * w)*3 + 1] = g;
            img[(x + y * w)*3 + 0] = b;
        }
    }

    unsigned char bmpfileheader[14] = {'B', 'M', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0, 0};
    unsigned char bmpinfoheader[40] = {40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 24, 0};
    unsigned char bmppad[3] = {0, 0, 0};

    bmpfileheader[ 2] = (unsigned char) (filesize);
    bmpfileheader[ 3] = (unsigned char) (filesize >> 8);
    bmpfileheader[ 4] = (unsigned char) (filesize >> 16);
    bmpfileheader[ 5] = (unsigned char) (filesize >> 24);

    bmpinfoheader[ 4] = (unsigned char) (w);
    bmpinfoheader[ 5] = (unsigned char) (w >> 8);
    bmpinfoheader[ 6] = (unsigned char) (w >> 16);
    bmpinfoheader[ 7] = (unsigned char) (w >> 24);
    bmpinfoheader[ 8] = (unsigned char) (h);
    bmpinfoheader[ 9] = (unsigned char) (h >> 8);
    bmpinfoheader[10] = (unsigned char) (h >> 16);
    bmpinfoheader[11] = (unsigned char) (h >> 24);

    f = fopen("img.bmp", "wb");
    fwrite(bmpfileheader, 1, 14, f);
    fwrite(bmpinfoheader, 1, 40, f);
    for (int i = 0; i < h; i++) {
        fwrite(img + (w * (h - i - 1)*3), 3, w, f);
        fwrite(bmppad, 1, (4 - (w * 3) % 4) % 4, f);
    }

    free(img);
    fclose(f);
}

//--------------------------------
//EXAMPLE 1

//base on https://www.shadertoy.com/view/llXSD8
//shader source
/*
void mainImage(out vec4 f, vec2 u) {
    f -= f;
    u *= 3. / iResolution.y;
    for (float i = -2.; i <= 1.; i += .1)
        f += (i * i + i + 1.) / 3e2 / abs(i * (u.y - u.x - i) - u.x + 2.);
    f *= abs(sin(u.y * 1e2));
    f.rb *= 0.;
}
 */

//uncomment this to use
/*
__global__ void mainImage(float* R, float* G, float* B) {

    //i,j its fragCoord.xy
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    float u[2];
    float iResolution[2];
    u[0] = i;
    u[1] = j;
    iResolution[0] = xSize;
    iResolution[1] = ySize;

    u[0] *= 3. / iResolution[1];
    u[1] *= 3. / iResolution[1];
    float f; //single channel color
    for (float i_ = -2.; i_ <= 1.; i_ += .1)
        f += (i_ * i_ + i_ + 1.) / 3e2 / abs(i_ * (u[1] - u[0] - i_) - u[0] + 2.);
    f=min(max(f,0.),1.); //for image, max color 1
    f *= abs(sin(u[1] * 1e2));

    R[index(i, j)] = 0.;
    G[index(i, j)] = f;
    B[index(i, j)] = 0.;

}
 */
//--------------------------------


//--------------------------------
//EXAMPLE 2

//base on https://www.shadertoy.com/view/lsd3zr
//shader source
/*
#define L    +u ; v = 1.- v*v; f += .02/min(v.x,v.y);
#define S(c) v = c.5 L    v = vec2(u.x c-2.,c 1.-u.x) L

void mainImage( out vec4 f, vec2 u ) {
    f-=f;
    vec2 v = iResolution.xy;
    u = (u+u-v)/v.y/.5;
    S() S(-)
}
 */
/**/
#define device_vec(val) for (int j_ = 0; j_ < val; j_++)
#define L    +u[j_] ; device_vec(2)v[j_] = 1.- v[j_]*v[j_]; f += .02/min(v[0],v[1]);
#define S(c) device_vec(2)v[j_] = c.5 L v[0] = u[0] c-2.;v[1]=c 1.-u[0] ; device_vec(2)v[j_] +=L

__global__ void mainImage(float* R, float* G, float* B) {

    //i,j its fragCoord.xy
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    float u[4];
    float v[2];
    u[0] = i;
    u[1] = j;
    v[0] = xSize;
    v[1] = ySize;
    float f = 0.; //single channel color
    device_vec(2) u[j_] = (u[j_] + u[j_] - v[j_]) / v[1] / .5;
    S() S(-)

    f = min(max(f, 0.), 1.); //for image, max color 1

    R[index(i, j)] = f;
    G[index(i, j)] = f;
    B[index(i, j)] = f;

}

//--------------------------------

int main() {
    const dim3 blockSize(16, 16); //16,16 for 256x256 image, can be 32,32 for 1024x768
    const dim3 gridSize(xSize / 16, ySize / 16);

    float *R_host, *G_host, *B_host;
    float *R_dev, *G_dev, *B_dev;
    cudaMallocHost((void**) &R_host, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate host buffer.");
    cudaMallocHost((void**) &G_host, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate host buffer.");
    cudaMallocHost((void**) &B_host, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate host buffer.");


    cudaMalloc((void**) &R_dev, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate device buffer.");
    cudaMalloc((void**) &G_dev, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate device buffer.");
    cudaMalloc((void**) &B_dev, xSize * ySize * sizeof (float));
    cudaCheckErrors("Failed to allocate device buffer.");



    cudaMemcpy(R_dev, R_host, xSize * ySize * sizeof (float), cudaMemcpyHostToDevice);
    cudaCheckErrors("CUDA memcpy failure");
    cudaMemcpy(G_dev, G_host, xSize * ySize * sizeof (float), cudaMemcpyHostToDevice);
    cudaCheckErrors("CUDA memcpy failure");

    mainImage << <gridSize, blockSize>>>(R_dev, G_dev, B_dev);
    cudaCheckErrors("Kernel launch failure");


    cudaMemcpy(R_host, R_dev, xSize * ySize * sizeof (float), cudaMemcpyDeviceToHost);
    cudaCheckErrors("CUDA memcpy failure");
    cudaMemcpy(G_host, G_dev, xSize * ySize * sizeof (float), cudaMemcpyDeviceToHost);
    cudaCheckErrors("CUDA memcpy failure");
    cudaMemcpy(B_host, B_dev, xSize * ySize * sizeof (float), cudaMemcpyDeviceToHost);
    cudaCheckErrors("CUDA memcpy failure");

    write_bmp(R_host, G_host, B_host);

    cudaFree(R_dev);
    cudaCheckErrors("cudaFree fail");
    cudaFree(G_dev);
    cudaCheckErrors("cudaFree fail");
    cudaFree(B_dev);
    cudaCheckErrors("cudaFree fail");
}
