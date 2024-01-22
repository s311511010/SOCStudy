`timescale 1ns / 1ps
module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(

    //config_reg(ap, data_length, tap_coeffient)
    //write
    output  reg                      awready,
    output  reg                      wready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,

    //read
    output  reg                      arready,
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    output  reg                      rvalid,
    output  reg  [(pDATA_WIDTH-1):0] rdata,
    
    // x
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
    output  reg                      ss_tready, 

    // y
    input   wire                     sm_tready, 
    output  reg                      sm_tvalid, 
    output  reg  [(pDATA_WIDTH-1):0] sm_tdata, 
    output  reg                      sm_tlast, 
    
    /*
    // bram for tap RAM
    output  reg  [3:0]               tap_WE,
    output  reg                      tap_EN,
    output  reg  [(pDATA_WIDTH-1):0] tap_wdi,
    output  reg  [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_rdo,

    // bram for data RAM
    output  reg  [3:0]               data_WE,
    output  reg                      data_EN,
    output  reg  [(pDATA_WIDTH-1):0] data_wdi,
    output  reg  [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_rdo,
    */

    // bram for tap RAM
    output  reg                      tap_we,
    output  reg                      tap_re,
    output  reg  [(pADDR_WIDTH-1):0] tap_waddr,
    output  reg  [(pADDR_WIDTH-1):0] tap_raddr,
    output  reg  [(pDATA_WIDTH-1):0] tap_wdi,
    input   wire [(pDATA_WIDTH-1):0] tap_rdo,

    // bram for data RAM
    output  reg                      data_we,
    output  reg                      data_re,
    output  reg  [(pADDR_WIDTH-1):0] data_waddr,
    output  reg  [(pADDR_WIDTH-1):0] data_raddr,
    output  reg  [(pDATA_WIDTH-1):0] data_wdi,
    input   wire [(pDATA_WIDTH-1):0] data_rdo,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);


//================================================================
// wire & registers 
//================================================================

//configuration register
/*
reg [(pDATA_WIDTH-1):0] config_reg [0:4096-1]; //2^pADDR_WIDTH, but only addr under FF is used, so maybe only [0:255] is needed?
assign ap_start = config_reg[12'h00][0];
assign ap_done = config_reg[12'h00][1];
assign ap_idle = config_reg[12'h00][2];
assign data_length = config_reg[12'h10];
*/

reg ap_start, ap_done, ap_idle;
reg [31:0] data_length;


//==============================================//
//            FSM State Declaration             //
//==============================================//
//FSM states
parameter S_IDLE = 'd0;
parameter S_TAP = 'd1;
parameter S_DATA = 'd2;
parameter S_SUM = 'd3;

reg [1:0] current_state, next_state;

always @(posedge axis_clk or negedge axis_rst_n) begin
	if(!axis_rst_n) 
		current_state <= S_IDLE;
	else
		current_state <= next_state;
end

always @(*) begin
    case(current_state)
        S_IDLE: begin
            if(wready && (awaddr > 12'h0F && awaddr < 12'h15))  next_state = S_TAP;
            else                                                next_state = current_state;
        end
        S_TAP: begin
            if(ap_start & ap_idle)     next_state = S_DATA;
            else                       next_state = current_state;
        end
        S_DATA: begin
            if(ss_tvalid & ss_tready)     next_state = S_SUM;    // data in
            else                          next_state = current_state;
        end
        S_SUM: begin
            if(sm_tvalid && sm_tready)  next_state = (sm_tlast) ? S_IDLE: S_DATA;  // data out
            else                        next_state = current_state;
        end
	    default : next_state = S_IDLE;
    endcase
end


//==============================================//
//                  design                      //
//==============================================//

// AXI-lite write

// addr or data flag
/*
reg awaddr_received;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        awaddr_received <= 0;
    else
        if(awvalid && awready)
            awaddr_received <= 1;  //waiting for data
        else if(wvalid && wready)
            awaddr_received <= 0;  //data received
end
*/

/*
// addr record
reg [pADDR_WIDTH-1:0] waddr;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        waddr <= 0;
    else
        if(wready && wvalid)
            waddr <= awaddr;
end
*/



// axi-lite read channel ready
always @(*) begin
    if(arvalid) begin  
        arready = (awvalid && (araddr == awaddr)) ? 0: 1; // in this case, the priority of write is higher than read
    end
    else begin
        arready = 0;
    end
end

// indicate the tap ram has been read, so rdata and rvalid can be sent out at next clk
reg read_request;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        read_request <= 0;
    else
        if(arready)
            read_request <= 1;
        else if(rready)
            read_request <= 0;
end

/*
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n) begin
        rvalid <= 0;
        rdata <= 0;
    end
    else begin
        if(rvalid) begin
            rvalid <= 0;
            rdata <= 0;
        end
        else if(read_request) begin
            rvalid <= 1;
            rdata <= tap_rdo;
        end
        else begin
            rvalid <= 0;
            rdata <= 0;
        end
    end
end
*/

reg [pADDR_WIDTH-1:0] araddr_reg;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        araddr_reg <= 0;
    else
        araddr_reg <= araddr;
end

always @(*) begin
    if(read_request) begin
        rvalid = 1;
        /*
        if(current_state == S_TAP)
            rdata = tap_rdo;
        else
            if(araddr_reg == 12'h00)
                rdata = {{29{1'b0}}, ap_idle, ap_done, ap_start};
            else
                rdata = tap_rdo;
        */
        case(araddr_reg)
            12'h00:  rdata = {{29{1'b0}}, ap_idle, ap_done, ap_start};
            12'h10:  rdata = data_length;
            default: rdata = tap_rdo;
        endcase
    end
    else begin
        rvalid = 0;
        rdata = 0;
    end
end

/*
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n) begin
        rvalid = 0;
        rdata = 0;
    end
    else begin
        if(arready) begin
            rvalid = 1;
            rdata = tap_rdo;
        end
        else begin
            rvalid = 0;
            rdata = 0;
        end
    end
end
*/

// axi-lite write channel ready
// two ready pull up only if both addr and data are valid
always @(*) begin
    if(awvalid && wvalid) begin
        awready = 1;
        wready = 1;
    end
    else begin
        awready = 0;
        wready = 0;
    end
end

// config_reg write

// data_length
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n) begin
        data_length <= 0;
    end
    else
        if(wready && (awaddr > 12'h0F && awaddr < 12'h15))
            data_length <= wdata;
        else if(current_state == S_IDLE)
            data_length <= 0;
end


// ap_start
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n) begin
        ap_start <= 0;
    end
    else
        if(wready && awaddr == 12'h00)
            ap_start <= wdata[0];
        else
            ap_start <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        ap_idle <= 1;
    else
        if(ap_start)
            ap_idle <= 0;
        else if(sm_tlast)
            ap_idle <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        ap_done <= 0;
    else
        if(sm_tvalid && sm_tready && sm_tlast)
            ap_done <= 1;
        else if(current_state == S_IDLE && read_request && araddr_reg == 12'h00)
            ap_done <= 0;
        //else if(read_request && araddr_reg == 12'h00)   // reset ap_done when tb read ap_done, but delay a cycle for tb test
        //    ap_done <= 0;
end

always @(*) begin
    case(current_state)
        S_TAP: begin
            // write
            if(wready && (awaddr > 12'h1F && awaddr < 12'h100)) begin
                //tap_EN = 1;
                //tap_WE = 4'b1111;
                tap_we = 1;
                tap_re = 0;
                tap_wdi = wdata;
            end
            // read
            else if(rready && (araddr > 12'h1F && araddr < 12'h100)) begin
                //tap_EN = 1;
                //tap_WE = 0;
                tap_we = 0;
                tap_re = 1;
                tap_wdi = 0;
            end
            else begin
                //tap_EN = 0;
                //tap_WE = 0;
                tap_we = 0;
                tap_re = 0;
                tap_wdi = 0;
            end
        end
        // read
        S_DATA: begin
            //tap_EN = 1;
            //tap_WE = 0;
            tap_we = 0;
            tap_re = 1;
            tap_wdi = 0;
        end
        S_SUM: begin
            //tap_EN = 1;
            //tap_WE = 0;
            tap_we = 0;
            tap_re = 1;
            tap_wdi = 0;
        end
        default: begin
            //tap_EN = 0;
            //tap_WE = 0;
            tap_we = 0;
            tap_re = 0;
            tap_wdi = 0;
        end
    endcase
end

// tap_ram addr control
always @(*) begin
    case(current_state)
        S_TAP: begin
            // write
            if(wready && (awaddr > 12'h1F && awaddr < 12'h100)) begin
                //tap_A = (awaddr - 12'h20);
                tap_waddr = (awaddr - 12'h20) >> 2;
                tap_raddr = (awaddr - 12'h20) >> 2;
            end
            //read
            else if(arready && (araddr > 12'h1F && araddr < 12'h100)) begin
                //tap_A = (araddr - 12'h20);
                tap_waddr = (araddr - 12'h20) >> 2;
                tap_raddr = (araddr - 12'h20) >> 2;
            end
            else begin
                //tap_A = 0;
                tap_waddr = 0;
                tap_raddr = 0;
            end
        end
        // read
        S_SUM: begin
            if(arready && (araddr > 12'h1F && araddr < 12'h100)) begin
                //tap_A = (araddr - 12'h20);
                tap_waddr = (araddr - 12'h20) >> 2;
                tap_raddr = (araddr - 12'h20) >> 2;
            end
            else begin
                //tap_A = tap_idx << 2;
                tap_waddr = (tap_idx < 12) ? tap_idx : 0;  // to prevent unknown output on tap_rdo
                tap_raddr = (tap_idx < 12) ? tap_idx : 0;
            end
        end
        default: begin
            //tap_A = 0;
            tap_waddr = 0;
            tap_raddr = 0;
        end
    endcase
    
end


// to count sum times
//reg [3:0] sum_count;
// how many y have been calculated, finish the process when t == data_length-1
reg [31:0] t;
reg signed [4:0] t_mod11;

/*
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        sum_count <= 0;
    else begin
        if(current_state == S_SUM) begin
            if(t < 'd11)
                sum_count <= (sum_count > t) ? 0: sum_count + 1;
            else
                sum_count <= (sum_count > 10) ? 0: sum_count + 1;
        end
        else
            sum_count <= 0;
    end
end
*/

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        t <= 0;
    else begin
        if(current_state == S_SUM) begin
            if(sm_tvalid & sm_tready)
                t <= t + 1;
        end
        else if(current_state == S_IDLE)
            t <= 0;
    end
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        t_mod11 <= 0;
    else begin
        if(current_state == S_SUM) begin
            if(sm_tvalid & sm_tready)
                t_mod11 <= (t_mod11 + 1 < 11) ? (t_mod11 + 1): 0;
        end
        else if(current_state == S_IDLE)
            t_mod11 <= 0;
    end
end

reg signed [4:0] tap_idx;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        tap_idx <= 0;
    else
        if((current_state == S_SUM) && (tap_idx < 12))
            tap_idx <= tap_idx + 1;
        else if(current_state == S_DATA || current_state == S_IDLE)
            tap_idx <= 0;
end

// ss
// take just 1 data a time
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        ss_tready <= 0;
    else
        //if(next_state == S_DATA && current_state != S_DATA)
        if(next_state == S_DATA)
            ss_tready <= 1;
        else
            ss_tready <= 0;
end

// data_ram
always @(*) begin
    case (current_state)
        S_TAP: begin
            // reset data_ram while tap_ram is writtening
            if(wready && (awaddr > 12'h1F && awaddr < 12'h100)) begin
                //data_EN = 1;
                //data_WE = 4'b1111;
                data_we = 1;
                data_re = 0;
                data_wdi = 0;
            end
            else begin
                //data_EN = 0;
                //data_WE = 0;
                data_we = 0;
                data_re = 0;
                data_wdi = 0;
            end
        end
        S_DATA: begin
            // write
            if(ss_tready & ss_tvalid) begin
                //data_EN = 1;
                //data_WE = 4'b1111;
                data_we = 1;
                data_re = 0;
                data_wdi = ss_tdata;
            end
            else begin
                //data_EN = 0;
                //data_WE = 0;
                data_we = 0;
                data_re = 0;
                data_wdi = 0;
            end
        end
        // read
        S_SUM: begin
            //data_EN = 1;
            //data_WE = 0;
            data_we = 0;
            data_re = 1;
            data_wdi = 0;
        end
        default: begin
            //data_EN = 0;
            //data_WE = 0;
            data_we = 0;
            data_re = 0;
            data_wdi = 0;
        end
    endcase
end

always @(*) begin
    case(current_state)
        // reset data_ram
        S_TAP: begin
            if(wready && (awaddr > 12'h1F && awaddr < 12'h100)) begin
                //data_A = (awaddr - 12'h20);
                data_waddr = (awaddr - 12'h20) >> 2;
                data_raddr = (awaddr - 12'h20) >> 2;
            end
            else begin
                //data_A = 0;
                data_waddr = 0;
                data_raddr = 0;
            end
        end
        S_DATA: begin
            //data_A = t_mod11 << 2;
            data_waddr = t_mod11;
            data_raddr = t_mod11;
        end
        S_SUM: begin
            //data_A = data_idx << 2;
            data_waddr = data_idx;
            data_raddr = data_idx;
        end
        default: begin
            //data_A = 0;
            data_waddr = 0;
            data_raddr = 0;
        end
    endcase
end

wire signed [4:0] data_idx;
assign data_idx = (t_mod11 - tap_idx < 0) ? t_mod11 - tap_idx + 11: t_mod11 - tap_idx;

wire signed [31:0] tap_value, data_value;
assign tap_value = tap_rdo;
assign data_value = data_rdo;

reg signed [31:0] temp;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        temp <= 0;
    else begin
        if(current_state == S_SUM && tap_idx > 0 && tap_idx < 12)
            temp <= temp + tap_value * data_value;
        else if(current_state == S_DATA || current_state == S_IDLE)
            temp <= 0;
    end
end

reg temp_done;
always @(posedge axis_clk or negedge axis_rst_n) begin
    if(!axis_rst_n)
        temp_done <= 0;
    else begin
        if(current_state == S_SUM && tap_idx == 11)
            temp_done <= 1;
        else if(current_state == S_DATA || current_state == S_IDLE)
            temp_done <= 0;
    end
end

always @(*) begin
    if(current_state == S_SUM && temp_done) begin
        sm_tvalid = 1;
        sm_tdata = temp;
    end
    else begin
        sm_tvalid = 0;
        sm_tdata = 0;
    end
end

always @(*) begin
    if(current_state == S_SUM && temp_done && t == data_length-1)
        sm_tlast = 1;
    else
        sm_tlast = 0;
end

endmodule