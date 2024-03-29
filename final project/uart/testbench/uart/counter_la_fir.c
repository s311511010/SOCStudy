/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

//extern int* fir();
extern int* fir_HW();

// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void main()
{
	int j;

	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	// reg_spi_enable = 1;
	// reg_spimaster_cs = 0x00000;

	// reg_spimaster_control = 0x0801;

	// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

	// The upper GPIO pins are configured to be output
	// and accessble to the management SoC.
	// Used to flad the start/end of a test 
	// The lower GPIO pins are configured to be output
	// and accessible to the user project.  They show
	// the project count value, although this test is
	// designed to read the project count through the
	// logic analyzer probes.
	// I/O 6 is configured for the UART Tx line

        reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
        reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

        reg_mprj_io_15 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_14 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_13 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_12 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_11 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_10 = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_9  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_8  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_7  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_5  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_4  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_3  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_2  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_1  = GPIO_MODE_USER_STD_OUTPUT;
        reg_mprj_io_0  = GPIO_MODE_USER_STD_OUTPUT;

        reg_mprj_io_6  = GPIO_MODE_MGMT_STD_OUTPUT;

	// Set UART clock to 64 kbaud (enable before I/O configuration)
	// reg_uart_clkdiv = 625;
	reg_uart_enable = 1;
	
	// Now, apply the configuration
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

        // Configure LA probes [31:0], [127:64] as inputs to the cpu 
	// Configure LA probes [63:32] as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// Set Counter value to zero through LA probes [63:32]
	reg_la1_data = 0x00000000;

	// Configure LA probes from [63:32] as inputs to disable counter write
	reg_la1_oenb = reg_la1_iena = 0x00000000;    

	
	/*
	// Flag start of the test 
	reg_mprj_datal = 0xAB400000;

	int* tmp = fir();
	reg_mprj_datal = *tmp << 16;
	reg_mprj_datal = *(tmp+1) << 16;
	reg_mprj_datal = *(tmp+2) << 16;
	reg_mprj_datal = *(tmp+3) << 16;
	reg_mprj_datal = *(tmp+4) << 16;
	reg_mprj_datal = *(tmp+5) << 16;
	reg_mprj_datal = *(tmp+6) << 16;
	reg_mprj_datal = *(tmp+7) << 16;
	reg_mprj_datal = *(tmp+8) << 16;
	reg_mprj_datal = *(tmp+9) << 16;
	reg_mprj_datal = *(tmp+10) << 16;	
	*/

	int* tmp;
	int i;
	for (i=1; i<=3; i=i+1){
		tmp = fir_HW(i);
		//int* tmp = fir_RTL();
		/*
		reg_mprj_datal = *tmp << 16;
		reg_mprj_datal = *(tmp+1) << 16;
		reg_mprj_datal = *(tmp+2) << 16;
		reg_mprj_datal = *(tmp+3) << 16;
		reg_mprj_datal = *(tmp+4) << 16;
		reg_mprj_datal = *(tmp+5) << 16;
		reg_mprj_datal = *(tmp+6) << 16;
		reg_mprj_datal = *(tmp+7) << 16;
		reg_mprj_datal = *(tmp+8) << 16;
		reg_mprj_datal = *(tmp+9) << 16;
		reg_mprj_datal = *(tmp+10) << 16;
		reg_mprj_datal = *(tmp+11) << 16;
		reg_mprj_datal = *(tmp+12) << 16;
		reg_mprj_datal = *(tmp+13) << 16;
		reg_mprj_datal = *(tmp+14) << 16;
		*/
		//reg_mprj_datal = (reg_mprj_datal << 8) + 0x5A0000; // To match the requirement: write final Y[7:0] output to mprj[31:24], and end mark (8'h5A) to mprj[23:16]
		reg_mprj_datal = (*(tmp+14) << 24) + 0x5A0000; // To match the requirement: write final Y[7:0] output to mprj[31:24], and end mark (8'h5A) to mprj[23:16]
	}

	reg_mprj_datal = 0xAB510000;



/*
	int read;
	int *tap;
	tap = (int *)0x30000020;
	int tap_data[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

	//send tap_coef
	for(int i=0; i <11;i++){
		tap[i] = tap_data[i];
	}

	//check tap_coef
	for(int i=0; i <11;i++){
		tap = (int *)(0x30000020 + 0x4*i);
		if(*tap != tap_data[i]) {
			reg_mprj_datal = 0xabc00000;
			break;
		}
		if(i == 10) reg_mprj_datal = 0xaba00000;
	}

	//send ap_start
	int *ap_signal;
	ap_signal = (int *)0x30000000;
	*ap_signal = *ap_signal | 1;
	reg_mprj_datal = 0x00a50000;
	//send input stream
	int *x; int *y;
	x = (int *)0x30000080;
	y = (int *)0x30000084;
	int Y_value; int X_ready; int Y_ready;
	X_ready = 0;
	Y_ready = 0;
	for(int i=0; i <64;i++){
		X_ready = *ap_signal & 16;
		while(!X_ready) {
			X_ready = *ap_signal & 16;
		}
		*x = i;
		//Y is ready
		*ap_signal = *ap_signal | 32; 
		Y_value = *y;
		if(tmp[i] != Y_value)
			reg_mprj_datal = 0xabd00000;
	}


	reg_mprj_datal = 0xAB510000;
*/

}

