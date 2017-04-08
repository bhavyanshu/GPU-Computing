# Location of the CUDA Toolkit
CUDA_PATH ?= /usr/local/cuda-8.0

# Common includes and paths for CUDA
INCLUDES := -I $(CUDA_PATH)/include
LIBRARIES := -L $(CUDA_PATH)/lib64  -lcudart

# Compilers
CC = gcc
NVCC := $(CUDA_PATH)/bin/nvcc -arch sm_37

# Objects
OBJS = GPUInfo.o DeviceProperty.o

# Target rules
GPUInfo: $(OBJS)
	 $(CC) -o $@  $^  $(INCLUDES) $(LIBRARIES)

GPUInfo.o: DeviceProperty.cu GPUInfo.cu
	$(NVCC) -c $^

clean:
	rm -f GPUInfo $(OBJS)
