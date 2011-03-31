#include <stdint.h>
#include <cuda_runtime_api.h>
#ifdef DEBUG
	#include <sys/time.h>
#endif

#ifndef TX
	#define TX (__umul24(blockIdx.x,blockDim.x) + threadIdx.x)
#endif

#define _CUDA(call) {																	\
	call;				                                												\
	cudaerrno=cudaGetLastError();																	\
	if(cudaSuccess!=cudaerrno) {                                       					         						\
		if (output_verbosity!=OUTPUT_QUIET) fprintf(stderr, "Cuda error %d in file '%s' in line %i: %s.\n",cudaerrno,__FILE__,__LINE__,cudaGetErrorString(cudaerrno));	\
		exit(EXIT_FAILURE);                                                  											\
    } }

#define _CUDA_N(msg) {                                    												\
	cudaerrno=cudaGetLastError();																	\
	if(cudaSuccess!=cudaerrno) {                                                											\
		if (output_verbosity!=OUTPUT_QUIET) fprintf(stderr, "Cuda error %d in file '%s' in line %i: %s.\n",cudaerrno,__FILE__,__LINE__-3,cudaGetErrorString(cudaerrno));	\
		exit(EXIT_FAILURE);                                                  											\
    } }

#ifdef DEBUG
	#define CUDA_START_TIME \
			cudaEvent_t start, stop; \
			cudaEventCreate(&start); \
			cudaEventCreate(&stop); \
			struct timeval starttime,curtime,difference; \
			gettimeofday(&starttime, NULL); \
			cudaEventRecord(start,0);


	#define CUDA_STOP_TIME(NAME) \
			cudaEventRecord(stop,0); \
			cudaThreadSynchronize(); \
			float cu_time; \
			cudaEventElapsedTime(&cu_time,start,stop); \
			fprintf(stdout, NAME "CUDA %zu bytes, %06d usecs, %.0f Mb/s\n", nbytes, (int) (cu_time * 1000), 1000/cu_time * (unsigned int)nbytes * 8 / 1024 / 1024); \
			gettimeofday(&curtime, NULL); \
			timeval_subtract(&difference,&curtime,&starttime); \
			fprintf(stdout, NAME "CUDs %zu bytes, %06d usecs, %u Mb/s\n", nbytes, (int)difference.tv_usec, (1000000/(unsigned int)difference.tv_usec * 8 * (unsigned int)nbytes / 1024 / 1024));
#else
	#define CUDA_START_TIME
	#define CUDA_STOP_TIME(NAME)
#endif


static int __attribute__((unused)) output_verbosity;
static int __attribute__((unused)) isIntegrated;

#ifndef PAGEABLE
extern "C" void transferHostToDevice_PINNED   (const unsigned char **input, uint32_t **deviceMem, uint8_t **hostMem, size_t *size);
extern "C" void transferDeviceToHost_PINNED   (unsigned char **output, uint32_t **deviceMem, uint8_t **hostMemS, uint8_t **hostMemOUT, size_t *size);
#if CUDART_VERSION >= 2020
extern "C" void transferHostToDevice_ZEROCOPY (const unsigned char **input, uint32_t **deviceMem, uint8_t **hostMem, size_t *size);
extern "C" void transferDeviceToHost_ZEROCOPY (unsigned char **output, uint32_t **deviceMem, uint8_t **hostMemS, uint8_t **hostMemOUT, size_t *size);
#endif
#else
extern "C" void transferHostToDevice_PAGEABLE (const unsigned char **input, uint32_t **deviceMem, uint8_t **hostMem, size_t *size);
extern "C" void transferDeviceToHost_PAGEABLE (unsigned char **output, uint32_t **deviceMem, uint8_t **hostMemS, uint8_t **hostMemOUT, size_t *size);
#endif

extern "C" void (*transferHostToDevice) (const unsigned char  **input, uint32_t **deviceMem, uint8_t **hostMem, size_t *size);
extern "C" void (*transferDeviceToHost) (      unsigned char **output, uint32_t **deviceMem, uint8_t **hostMemS, uint8_t **hostMemOUT, size_t *size);

extern "C" int timeval_subtract (struct timeval *result, struct timeval *x, struct timeval *y);
extern "C" void checkCUDADevice(struct cudaDeviceProp *deviceProp, int output_verbosity);
extern "C" void cuda_device_init(int *nm, int buffer_size, int output_verbosity, uint8_t**, uint64_t**);
extern "C" void cuda_device_finish(uint8_t *host_data, uint64_t *device_data);
