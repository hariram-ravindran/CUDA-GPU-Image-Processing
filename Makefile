NVCC ?= nvcc
CXXFLAGS = -O2
OPENCV_FLAGS = $(shell pkg-config --cflags --libs opencv4)

all: image_processor

image_processor: src/main.cu
	$(NVCC) $(CXXFLAGS) src/main.cu -o image_processor $(OPENCV_FLAGS)

clean:
	rm -f image_processor
