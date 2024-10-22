
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>
#include <stdbool.h>


// !!!!!!!!!!!!!
// BMP is O_N_L_Y RGBA
// !!!!!!!!!!!!!

// support open/write BMP in GIMP-software (GIMP 2.10.38), nothing else tested
// edit bmp in GIMP - save - load here

// RGBA BMP from https://en.wikipedia.org/wiki/BMP_file_format
// parts of code based on https://github.com/vallentin/LoadBMP
// rememebr to free(rgba)

// example usage:
/*
// gcc test_rgba.c -o bmp_rw_test

#include "C_bmp_rw_header.h"

// rgba_gimp.bmp - image from gimp
int main() {
  uint8_t *rgba = NULL;
  int width, height;
  if(read_bmp("rgba_gimp.bmp", &width, &height, &rgba)){
    printf("loaded img width height %d %d\n", width, height);
    write_bmp("rgba_gimp_save.bmp", width, height, rgba);
    free(rgba);
  }
  return 0;
}
*/

bool read_bmp(const char *filename, int *wo, int *ho, uint8_t **rgba) {
    FILE *f;
    int width, height;
    f = fopen(filename, "rb");
    if (f == NULL) {
        printf("Error opening file %s\n", filename);
        return false;
    }
    
    unsigned char bmp_file_header[14];
    
    memset(bmp_file_header, 0, sizeof(bmp_file_header));
    
    if (fread(bmp_file_header, sizeof(bmp_file_header), 1, f) == 0) {
      fclose(f);
      printf("ERROR Wrong file header %s\n", filename);
      return false;
    }

    if ((bmp_file_header[0] != 'B') || (bmp_file_header[1] != 'M')) {
      /*
      fclose(f);
      printf("ERROR Bad signature %s\n", filename);
      return false;
      */
      printf("Warning bad signature, continue %s\n", filename);
    }
    
    uint8_t ifh_sz = bmp_file_header[10]-14;
    if(ifh_sz>124||ifh_sz<40){
      fclose(f);
      printf("ERROR Wrong file header file info size %s\n", filename);
      return false;
    }
    
    unsigned char bmp_info_header[ifh_sz];
    memset(bmp_info_header, 0, sizeof(bmp_info_header));
    if (fread(bmp_info_header, sizeof(bmp_info_header), 1, f) == 0) {
      fclose(f);
      printf("ERROR Wrong file format %s\n", filename);
      return false;
    }
    
    if ((bmp_info_header[14] != 24) && (bmp_info_header[14] != 32)) {
      fclose(f);
      printf("ERROR Wrong bits per pixel %s\n", filename);
      return false;
    }
    
    width = (bmp_info_header[4] + (bmp_info_header[5] << 8) + (bmp_info_header[6] << 16) + (bmp_info_header[7] << 24));
    height = (bmp_info_header[8] + (bmp_info_header[9] << 8) + (bmp_info_header[10] << 16) + (bmp_info_header[11] << 24));
    bool flip = height<0;
    if(flip){
      height = -height;
      printf("Warning img height is negative, flip %s\n", filename);
    }
    
    if ((width > 0) && (height > 0))
    {
      uint8_t *data = NULL;
      data = (uint8_t*)malloc(width * height * 4);
      
      if (!data)
      {
        fclose(f);
        printf("Error out of memory.\n");
        return false;
      }
      
      unsigned char bmp_pad[3];
      unsigned int x, y, i, padding;
      
      for (y = (height - 1); y != -1; y--){
        for (x = 0; x < width; x++){
          if(!flip){i = (x + y * width) * 4;}
          else{i = (x + (height-1-y) * width) * 4;}
          
          if (fread(data + i, 4, 1, f) == 0){
            free(data);
            fclose(f);
            printf("ERROR file format error %s\n", filename);
            return false;
          }
          
          // BGR -> RGB
          if(!flip){uint8_t tmp = data[i]; data[i] = data[i+2];data[i+2] = tmp;}
          else{
            uint8_t tmp = data[i+3]; data[i+3] = data[i];data[i] = tmp;
                    tmp = data[i+2]; data[i+2] = data[i+1];data[i+1] = tmp;
          }
        }

        padding = ((4 - (width * 4) % 4) % 4);
        if (fread(bmp_pad, 1, padding, f) != padding){
          free(data);
          fclose(f);
          printf("ERROR file format error in padding %s\n", filename);
          return false;
        }
      }
    
      fclose(f);
      
      (*wo) = width;
      (*ho) = height;
      (*rgba) = data;
      return true;
    }
    else{
      fclose(f);
      printf("ERROR width or height is 0 %s\n", filename);
      return false;
    }
    
    
    fclose(f);
    return false;
    
}



unsigned char ev(int32_t v) {
  static uint32_t counter = 0;
  return (unsigned char)((v) >> ((8*(counter++))%32));
}
void write_bmp(const char *filename, int w, int h, uint8_t *rgba) {
    FILE *f;
    unsigned char *img = NULL;
    uint32_t filesize = 108 + 14 + 4 * w*h;

    img = (unsigned char *) malloc(4 * w * h);
    memset(img, 0, 4 * w * h);
    
    for (int x = 0; x < w; x++) {
        for (int y = 0; y < h; y++) {
            img[(x + y * w)*4 + 3] = rgba[(x+(h-1-y)*w)*4+0];
            img[(x + y * w)*4 + 2] = rgba[(x+(h-1-y)*w)*4+1];
            img[(x + y * w)*4 + 1] = rgba[(x+(h-1-y)*w)*4+2];
            img[(x + y * w)*4 + 0] = rgba[(x+(h-1-y)*w)*4+3];
        }
    }
    
    unsigned char bmpfileheader[14] = {'B','M', ev(filesize),ev(filesize),ev(filesize),ev(filesize), 0,0,0,0, 108+14,0,0,0};

    unsigned char bmpinfoheader[108] = {108,0,0,0, 
                                        ev(w),ev(w),ev(w),ev(w), ev(-((int32_t)h)),ev(-((int32_t)h)),ev(-((int32_t)h)),ev(-((int32_t)h)), 1,0, 32,0, 3,0,0,0, ev(w*h*4),ev(w*h*4),ev(w*h*4),ev(w*h*4),
                                        ev(0x0b13),ev(0x0b13),ev(0x0b13),ev(0x0b13), ev(0x0b13),ev(0x0b13),ev(0x0b13),ev(0x0b13),
                                        0,0,0,0, 0,0,0,0, 
                                        0,0,0,0xff, 0,0,0xff,0, 0,0xff,0,0, 0xff,0,0,0,
                                        ev(0x57696E20),ev(0x57696E20),ev(0x57696E20),ev(0x57696E20), 
                                        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, 
      };
    
    char file_name[80] = {0};
    sprintf(file_name, "%s", filename);
    
    f = fopen(file_name, "wb");
    fwrite(bmpfileheader, 1, 14, f);
    fwrite(bmpinfoheader, 1, 108, f);
    for (int i = 0; i < h; i++) {
        fwrite(img + (w * (h - i - 1) * 4), 4, w, f);
    }

    free(img);
    fclose(f);
}








