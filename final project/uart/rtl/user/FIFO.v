module FIFO (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [31:0] wr_data,
    output reg [31:0] rd_data,
    output full,
    output empty
);
    reg [31:0] mem[0:511];
    reg [8:0] wr_ptr, rd_ptr, count;
    always @(posedge clk) begin
        if (reset) begin
            mem[0] <= 32'd0;
            mem[1] <= 32'd0;
            mem[2] <= 32'd0;
            mem[3] <= 32'd0;
            mem[4] <= 32'd0;
        end else if (wr_en & ~full) begin
            mem[wr_ptr] <= wr_data;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            wr_ptr <= 9'd0;
        end else if (wr_en & ~full) begin
            wr_ptr <= wr_ptr + 9'd1;
        end
    end
    
    always @(posedge clk) begin
        if (reset) begin
            rd_data <= 32'd0;
        end else if (rd_en & ~empty) begin
            rd_data <= mem[rd_ptr];
        end
    end
    
    always @(posedge clk) begin
        if (reset) begin
            rd_ptr <= 9'd0;
        end else if (rd_en & ~empty) begin
            rd_ptr <= rd_ptr + 9'd1;
        end
    end
    
    always @(posedge clk) begin
        if (reset) begin
            count <= 9'd0;
        end else if (wr_en & ~rd_en & ~full) begin
            count <= count + 9'd1;
        end else if (rd_en & ~wr_en & ~empty) begin
            count <= count - 9'd1;
        end
    end
    
    assign full = (count == 9'd511) ? 1'b1 : 1'b0;
    assign empty = (count == 9'd0) ? 1'b1 : 1'b0;

endmodule
