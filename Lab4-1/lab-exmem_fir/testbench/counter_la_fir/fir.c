#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	for (int i = 0; i < N; i++) {
        inputbuffer[i] = 0;
        outputsignal[i] = 0;
    }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//write down your fir
	// Apply the FIR filter to the input signal
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i - j >= 0) {
                outputsignal[i] += taps[j] * inputsignal[i - j];
            }
        }
    }
	return outputsignal;
}
		
