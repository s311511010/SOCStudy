#ifndef __FIR_H__
#define __FIR_H__

#define N 11

#define DATA_LENGTH 15
#define FIR_BASE_ADDRESS 0x30000000

int taps[N] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[N];
//int inputsignal[N] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[DATA_LENGTH];
int x[DATA_LENGTH];
#endif
