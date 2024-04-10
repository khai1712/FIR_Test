`timescale 1ps/1ps

module test_bench #(parameter delay = 499) ();
    reg clk, rst_p, ena;
    reg signed [15:0] x_in;
    wire signed [15:0] x_out_1;
    wire signed [15:0] y_out_1;
    wire signed [15:0] x_out_2;
    wire signed [15:0] y_out_2;
    wire signed [15:0] x_out_3;
    wire signed [15:0] y_out_3;
    reg signed [15:0] y_in;
    reg signed [15:0] sig_in [7999:0];
    reg [12:0] address;
    initial begin
        $readmemb("sig_in.txt", sig_in);
    end
    initial begin
        clk = 0;
        x_in = 0;
        y_in = 0;
        ena = 1;
        rst_p = 1;
        #1
        rst_p = 0;
    end
    always #5 clk = ~clk;
    Filter_block_1 filter1(.clk(clk), .rst_p(rst_p), .x_in(x_in), .x_out(x_out_1), .y_in(y_in), .y_out(y_out_1));
    Filter_block_2 filter2(.clk(clk), .rst_p(rst_p), .x_in(x_out_1), .x_out(x_out_2), .y_in(y_out_1), .y_out(y_out_2));
    Filter_block_3 filter3(.clk(clk), .rst_p(rst_p), .x_in(x_out_2), .x_out(x_out_3), .y_in(y_out_2), .y_out(y_out_3));
    always @(posedge clk or posedge rst_p) begin
        if(address == 7999 || rst_p) begin
            address <= 0;
        end 
        else begin
            address <= address + 1;
        end
    end
    always @(address) begin
        x_in <= sig_in[address];
    end
    always @(x_in) begin
        $display("y_out = %b", y_out_1);
    end

endmodule



