# Location of the CUDA Toolkit
CUDA_PATH ?= /usr/local/cuda-8.0

# Common includes and paths for CUDA
INCLUDES := -I $(CUDA_PATH)/include
LIBRARIES := -L $(CUDA_PATH)/lib64  -lcudart

# Compilers
CC = gcc
NVCC := $(CUDA_PATH)/bin/nvcc -arch sm_37

# Program Specific Folders
BINDIR = ./bin/
SRCDIR = ./src/
SOURCES = $(wildcard $(SRCDIR)*.cu)
OBJS = $(SOURCES:$(SRCDIR)%.cu=$(SRCDIR)%.o)
TARGET = gpuinfo

# Target rules
$(BINDIR)$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) -o $@  $^  $(INCLUDES) $(LIBRARIES)

$(OBJS): $(SRCDIR)%.o: $(SRCDIR)%.cu
	$(NVCC) -c $< -o $@

clean:
	rm -r $(BINDIR) $(OBJS)
