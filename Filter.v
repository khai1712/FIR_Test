module Filter
(
    input clk,
    input rst_n,
    input signed [0:15] x_in,
    input ena_1, ena_2, ena_3, ena_4, ena_5, ena_6, ena_7, ena_8,
    output signed [0:31] y_out_1, y_out_2, y_out_3, y_out_4, y_out_5, y_out_6, y_out_7, y_out_8

);
   Filter_block_1 filter1(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_1), .ena(ena_1));
   Filter_block_2 filter2(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_2), .ena(ena_2));
   Filter_block_3 filter3(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_3), .ena(ena_3));
   Filter_block_4 filter4(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_4), .ena(ena_4));
   Filter_block_5 filter5(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_5), .ena(ena_5));
   Filter_block_6 filter6(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_6), .ena(ena_6));
   Filter_block_7 filter7(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_7), .ena(ena_7));
   Filter_block_8 filter8(.clk(clk), .rst_n(rst_n), .x_in(x_in), .y_out(y_out_8), .ena(ena_8));
endmodule




