module Equalizer_8_band
(
    input clk,
    input rst_p, 
    input signed [15:0] x_in,
    output signed [31:0] y_out,
    input ena
);
   Filter_block_1 filter1(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_2 filter2(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_3 filter3(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_4 filter4(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_5 filter5(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_6 filter6(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_7 filter7(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
   Filter_block_8 filter8(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out), .ena(ena));
endmodule




