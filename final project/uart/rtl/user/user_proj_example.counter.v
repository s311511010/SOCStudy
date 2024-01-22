// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire
`define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */
`define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)
//`include "../../rtl/user/fir.v"
//`include "../../rtl/user/bram11.v"
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    // design below
/*
    // write back data from verilog and exmem
    wire [31:0] rdata_r; 
    wire [31:0] rdata_e; 
   
    wire valid;
    wire [3:0] wstrb;

    wire v_flag;
    wire e_flag;

    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    //assign rstrb = wbs_sel_i & {4{!wbs_we_i}};

    // 判斷 flag ，因為裡面已經有valid訊號，所以sub module 皆會以flag去判斷
    assign v_flag =(valid && wbs_adr_i[31:24] == 8'h38)? 1:0;
    assign e_flag =(valid && wbs_adr_i[31:24] == 8'h30)? 1:0;


    // 本次lab 沒有 la_data_in 因此只有wb clk & rst
    assign clk =  wb_clk_i;
    assign rst =  wb_rst_i;	



    //sub module for axi 

    wb_axi wb_axi(
        // input
        .clk(clk),
        .rst_n(~rst),  
        .wb_valid(v_flag),
        .wb_wdata(wbs_dat_i),
        .wstrb(wstrb),
        .wb_addr(wbs_adr_i),

        // output
        .wb_rdata(wbs_dat_o),
        .wb_ack(wbs_ack_o)

    );
*/

    // 4-1
    wire [31:0] bram_rdata, fir_rdata;
    wire [31:0] wdata;
    wire [BITS-1:0] count;

    wire [1:0] addr_decode;
    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
    wire fir_ready;

    reg [3:0] delayed_count;
    reg bram_ready;


    // WB_Decode
    // 1: user_bram(4-1) 0: verilog_fir(4-2)
    assign addr_decode = (wbs_adr_i[31:20] == 12'h380) ? 2'b01:  // 4-1
                         (wbs_adr_i[31:20] == 12'h300) ? 2'b10:  // 4-2
                                                         2'b00;  // outside of user_project

    // wb_valid, has to be used with addr_decode
    assign valid = wbs_cyc_i && wbs_stb_i; 

    // read: wstrb=4'b0000 (wbs_we_i=0), write: wstrb=wbs_sel_i
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};

    // counter_wdata, CPU sends a wb write transaction to set the count value of the counter
    assign wdata = wbs_dat_i;

    // muxed output
    assign wbs_ack_o = (addr_decode == 'd1)? bram_ready:
                       (addr_decode == 'd2)? fir_ready:
                                             1'b0;
    assign wbs_dat_o = (addr_decode == 'd1)? bram_rdata:
                       (addr_decode == 'd2)? fir_rdata:
                                             1'b0;
    

    // IO
    assign io_out = count;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, count};

    // Assuming LA probes [63:32] are for controlling the count register
    // CPU can write count value to counter through accessing LA module
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};

    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    
    /*
    always @(posedge clk) begin
        if (rst) begin
            bram_ready <= 1'b0;
            delayed_count <= 0;
        end
        else begin
            // exmem
            if (valid && (addr_decode == 'd1) && !bram_ready) begin
                if(delayed_count == DELAYS) begin
                    delayed_count <= 0;
                    bram_ready <= 1;
                end
                else
                    delayed_count <= delayed_count + 1;
            end
            else
                bram_ready <= 1'b0;
        end
    end
    */

    always @(posedge clk) begin
        if (rst) begin
            bram_ready <= 1'b0;
        end
        else begin
            if (valid && (addr_decode == 'd1) && !bram_ready)
                bram_ready <= 1'b1;
            else
                bram_ready <= 1'b0;
        end
    end

    // WB Decode by addr_decode

    // 4-1
    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid && (addr_decode == 'd1)),
        .Di0(wdata),
        .Do0(bram_rdata),
        .A0(wbs_adr_i)
    );

    // 4-2
    wb_axi u_wb_axi(
        .clk(clk),
        .rst_n(~rst),
        .wb_valid(valid && (addr_decode == 'd2)),
        .wb_we(wbs_we_i),
        .wb_wdata(wdata),
        .wb_addr(wbs_adr_i[11:0]),
        .wb_ack(fir_ready),
        .wb_rdata(fir_rdata)
    );

endmodule




module wb_axi #(
    parameter BITS = 32,
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)(
    input clk,
    input rst_n,
    input wb_valid,
    input wb_we,
    input signed[pDATA_WIDTH-1:0] wb_wdata,
    input [pADDR_WIDTH-1:0] wb_addr,  // Configuration Register Address map, least 12 bits

    output reg wb_ack,
    output reg signed [pDATA_WIDTH-1:0] wb_rdata
);

    // axi lite
    wire                             awready;
    wire                             wready;
    reg                              awvalid;
    reg        [(pADDR_WIDTH-1): 0]  awaddr;
    reg                              wvalid;
    reg signed [(pDATA_WIDTH-1) : 0] wdata;
    wire                             arready;
    reg                              rready;
    reg                              arvalid;
    reg         [(pADDR_WIDTH-1): 0] araddr;
    wire                             rvalid;
    wire signed [(pDATA_WIDTH-1): 0] rdata;

    // axi stream
    reg                               ss_tvalid;
    reg signed [(pDATA_WIDTH-1) : 0]  ss_tdata;
    reg                               ss_tlast;
    wire                              ss_tready;
    reg                               sm_tready;
    wire                              sm_tvalid;
    wire signed [(pDATA_WIDTH-1) : 0] sm_tdata;
    wire                              sm_tlast;

    // bram for tap RAM
    wire                      tap_we;
    wire                      tap_re;
    wire  [(pADDR_WIDTH-1):0] tap_waddr;
    wire  [(pADDR_WIDTH-1):0] tap_raddr;
    wire  [(pDATA_WIDTH-1):0] tap_wdi;
    wire  [(pDATA_WIDTH-1):0] tap_rdo;

    // bram for data RAM
    wire                      data_we;
    wire                      data_re;
    wire  [(pADDR_WIDTH-1):0] data_waddr;
    wire  [(pADDR_WIDTH-1):0] data_raddr;
    wire  [(pDATA_WIDTH-1):0] data_wdi;
    wire  [(pDATA_WIDTH-1):0] data_rdo;

    // design

    // axi-lite write
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            awvalid <= 0;
            awaddr <= 0;
        end
        else begin
            if(wb_valid && wb_we && (wb_addr < 12'h80)) begin
                if((awvalid && awready) || wb_ack) begin
                    awvalid <= 0;
                    awaddr <= 0;
                end
                else begin
                    awvalid <= 1;
                    awaddr <= wb_addr;
                end
            end
            else begin
                awvalid <= 0;
                awaddr <= 0;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            wvalid <= 0;
            wdata  <= 0;
        end
        else begin
            if(wb_valid && wb_we && (wb_addr < 12'h80)) begin
                if((wvalid && wready) || wb_ack) begin
                    wvalid <= 0;
                    wdata  <= 0;
                end
                else begin
                    wvalid <= 1;
                    wdata  <= wb_wdata;
                end
            end
            else begin
                wvalid <= 0;
                wdata  <= 0;
            end
        end
    end

    //axi-lite read
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            arvalid <= 0;
            araddr <= 0;
        end
        else begin
            if(wb_valid && ~wb_we && (wb_addr < 12'h80)) begin
                if((arvalid && arready) || rready || wb_ack) begin
                    arvalid <= 0;
                    araddr <= 0;
                end
                else begin
                    arvalid <= 1;
                    araddr <= wb_addr;
                end
            end
            else begin
                arvalid <= 0;
                araddr <= 0;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            rready <= 0;
        end
        else begin
            if(wb_valid && ~wb_we && (wb_addr < 12'h80)) begin
                if((rvalid && rready) || wb_ack) begin
                    rready <= 0;
                end
                //else if(arvalid && arready) begin
                else begin
                    rready <= 1;
                end
            end
            else begin
                rready <= 0;
            end
        end
    end

    // axi-stream wb to fir (x)
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            ss_tvalid <= 0;
            ss_tdata <= 0;
            //ss_tlast <= 0;
        end
        else begin
            if(wb_valid && wb_we && (wb_addr > 12'h79) && (wb_addr < 12'h84)) begin
                if((ss_tvalid && ss_tready) || wb_ack) begin
                    ss_tvalid <= 0;
                    ss_tdata  <= 0;
                end
                else begin
                    ss_tvalid <= 1; 
                    ss_tdata  <= wb_wdata;
                end
            end
            else begin
                ss_tvalid <= 0;
                ss_tdata  <= 0;
            end
        end
    end

    // axi-stream fir to wb (y)
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            sm_tready <= 0;
        end
        else begin
            if(wb_valid && ~wb_we && (wb_addr > 12'h83) && (wb_addr < 12'h88)) begin
                if((sm_tvalid & sm_tready) || wb_ack) begin
                    sm_tready <= 0;
                end
                else begin
                    sm_tready <= 1;
                end
            end
            else begin
                sm_tready <= 0;
            end
        end
    end

    // ack
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            wb_ack <= 0;
            wb_rdata <= 0;
        end
        else begin
            // check !wb_ack to create a pulse signal
            if(wb_valid && !wb_ack) begin
                case(wb_we)
                    // read
                    0: begin
                        // axi-lite
                        if(rvalid && rready) begin
                            wb_ack <= 1;
                            wb_rdata <= rdata;
                        end
                        // axi-stream read
                        else if(sm_tvalid && sm_tready) begin
                            wb_ack <= 1;
                            wb_rdata <= sm_tdata;
                        end
                    end
                    // write
                    1: begin
                        // axi-lite or axi-stream
                        if((awvalid && awready) || (ss_tvalid && ss_tready)) begin
                            wb_ack <= 1;
                            wb_rdata <= 0;
                        end
                    end
                    default: begin
                        wb_ack <= 0;
                        wb_rdata <= 0;
                    end
                endcase
            end
            else begin
                wb_ack <= 0;
                wb_rdata <= 0;
            end
        end
    end


    // call modules
    fir
    #(  .pADDR_WIDTH(12),
        .pDATA_WIDTH(32),
        .Tape_Num(11)
    )
    u_fir
    (
        // AXI-Lite
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),
        // ram for tap
        .tap_we(tap_we),
        .tap_re(tap_re),
        .tap_waddr(tap_waddr),
        .tap_raddr(tap_raddr),
        .tap_wdi(tap_wdi),
        .tap_rdo(tap_rdo),

        // ram for data
        .data_we(data_we),
        .data_re(data_re),
        .data_waddr(data_waddr),
        .data_raddr(data_raddr),
        .data_wdi(data_wdi),
        .data_rdo(data_rdo),

        .axis_clk(clk),
        .axis_rst_n(rst_n)
    );

    bram11 tap_RAM (
        .clk(clk),
        .we(tap_we),
        .re(tap_re),
        .waddr(tap_waddr),
        .raddr(tap_raddr),
        .wdi(tap_wdi),
        .rdo(tap_rdo)
    );

    bram11 data_RAM (
        .clk(clk),
        .we(data_we),
        .re(data_re),
        .waddr(data_waddr),
        .raddr(data_raddr),
        .wdi(data_wdi),
        .rdo(data_rdo)
    );

endmodule

`default_nettype wire
