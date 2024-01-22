#include "fir.h"
#include <defs.h>

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial fir
	for (int i = 0; i < DATA_LENGTH; i++) {
		x[i] = i;
	}
	for (int i = 0; i < DATA_LENGTH; i++) {
		outputsignal[i] = 0;
	}
}


int __attribute__ ( ( section ( ".mprjram" ) ) ) WB_read(int* WB_address){
	return *(WB_address);
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) WB_write(int* WB_address, int write_data){
	*(WB_address)=write_data;
}


int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir_HW(int iteration){
	initfir();

	int* WB_address;
	int WB_return_data;

	// Check if FIR is idle
	WB_address=(int*)(0x30000000);
	WB_return_data = *(WB_address);
	while (((WB_return_data >> 2) & 1)==0){
		WB_return_data = *(WB_address);
	}

	//int WB_return_data;
	int WB_return_data_last_one;
	int i;
	int output_data_count = 0;
	int input_data_count = 0;

	// Check if FIR is idle
	WB_return_data = WB_read((int*)FIR_BASE_ADDRESS);
	while (((WB_return_data >> 2) & 1) == 0){ // which means "ap_idle==0"
		WB_return_data = WB_read((int*)FIR_BASE_ADDRESS);
	}


	// Start the coefficient input(AXI-lite);
	WB_write((int*)(FIR_BASE_ADDRESS+0x10), DATA_LENGTH);
	for(i=0; i<N; i=i+1){
		WB_write((int*)(FIR_BASE_ADDRESS+0x20+4*i), taps[i]);
	}
	
	// Check Coefficient
	// Check data_length
	WB_return_data = WB_read((int*)(FIR_BASE_ADDRESS+0x10));
	if(WB_return_data != DATA_LENGTH){
		outputsignal[0]=-2;
		return outputsignal;
	}
	// Check tap
	for(i=0; i<N; i=i+1){
		WB_return_data = WB_read((int*)(FIR_BASE_ADDRESS+0x20+4*i));
		if(WB_return_data != taps[i]){
			outputsignal[0]=-2;
			return outputsignal;
		}
	}

	// ap_start = 1
	WB_write((int*)(FIR_BASE_ADDRESS), 1);
	reg_mprj_datal = 0x00A50000; // start mark on mprj[23:16]


    while(input_data_count < DATA_LENGTH){
		// axi-stream input (x)
		if(input_data_count == DATA_LENGTH){
			outputsignal[0] = -3;
			return outputsignal;
		}
		WB_write((int*)(FIR_BASE_ADDRESS+0x80), x[input_data_count]);
		input_data_count = input_data_count + 1;

		//axi-stream output (y)
		WB_return_data = WB_read((int*)(FIR_BASE_ADDRESS+0x84));
		outputsignal[output_data_count] = WB_return_data;
		output_data_count = output_data_count + 1;
	}

	// check ap_done==1 && ap_idle==1
	WB_return_data = WB_read((int*)FIR_BASE_ADDRESS);
	if(((WB_return_data >> 1) & 3) != 3){  
		outputsignal[0] = -3;
		return outputsignal;
	}

	return outputsignal;
}