# CUDA GPU Batch Image Processing

A CUDA C++ project that processes multiple images using GPU kernels. It creates grayscale images and Sobel edge-detection images for each input.

## Features
- Batch processing of images from a folder
- CUDA GPU grayscale conversion kernel
- CUDA GPU Sobel edge-detection kernel
- OpenCV for image reading and output writing
- Command-line input/output folder arguments
- Per-image processing time output

## Requirements
- NVIDIA GPU with CUDA toolkit (`nvcc`)
- OpenCV 4 development libraries
- `pkg-config`

## Build
```bash
make
```

## Run
```bash
./image_processor images output
```
Or:
```bash
chmod +x run.sh
./run.sh
```

## Input
Place `.jpg`, `.jpeg`, `.png`, or `.bmp` images inside `images/`.

## Output
Each input produces:
- `<name>_gray.png`: grayscale image
- `<name>_edges.png`: Sobel edge map

## Algorithms
Grayscale conversion uses weighted RGB luminance:
`Gray = 0.299 R + 0.587 G + 0.114 B`

Sobel uses horizontal and vertical 3x3 gradient masks and combines them to estimate edge strength. Pixels near the image border are set to zero.

## CUDA implementation
The kernels use 2D thread blocks (16x16). Each CUDA thread is responsible for one pixel. Bounds checks prevent access beyond image dimensions.

## Notes
Timing includes data transfer and kernel execution, but excludes image loading and saving. Use a CUDA-capable system to compile and run. A CPU-only environment without `nvcc` or an NVIDIA GPU cannot run this CUDA program.
