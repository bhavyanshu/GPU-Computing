#include <cuda_runtime.h>
#include <stdio.h>

#define CHECK(call)                                \
{  const cudaError_t error = call;                 \
   if (error != cudaSuccess)                       \
  {                                                \
    printf("Error: %s:%d, ", __FILE__, __LINE__);  \
    printf("code:%d, reason: %s\n", error,         \
                     cudaGetErrorString(error));   \
    exit(1);                                       \
  }                                                \
}

int getDeviceProperty() {

  int device;

  const float KILO = 1000.f;
  const float MEGA = 1000.f*1000.f;
  const float GIGA = 1000.f*1000.f*1000.f;

  CHECK(cudaGetDeviceCount(&device));

  for (int i = 0; i < device; i++) {
    /* Get device properties function call */
    cudaDeviceProp property;
    CHECK(cudaGetDeviceProperties(&property, i));

    printf("<~~~~~~~~~ Device ~~~~~~~~~>\n");
    printf("ID: %d\n", device);
    printf("Name %s\n", property.name);
    printf("Compute Capability %d.%d\n", property.major, property.minor);
    printf("Clock Rate %.2f Mhz\n", (property.clockRate)/(KILO));
    printf("Memory Clock Rate %.2f Ghz\n", (property.memoryClockRate)/(MEGA));
    printf("Total Global Memory %.2f GB\n", property.totalGlobalMem/(GIGA));
    printf("Total Const Memory %.2f KB\n", property.totalConstMem/(KILO));
    printf("Shared Memory Per Block %.2f KB\n", property.sharedMemPerBlock/(KILO));
  }

  return 0;
}
