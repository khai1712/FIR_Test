module Equalizer
(
    input clk, rst_n,
    input [0:15] x_in,
    input ena_1, ena_2, ena_3, ena_4, ena_5, ena_6, ena_7, ena_8,
    input [0:2] amp_coef_1, amp_coef_2, amp_coef_3, amp_coef_4, amp_coef_5, amp_coef_6, amp_coef_7, amp_coef_8,
    output wire [0:15] sig_out_1, sig_out_2, sig_out_3, sig_out_4, sig_out_5, sig_out_6, sig_out_7, sig_out_8
);
    wire signed [0:31] y_out_1, y_out_2, y_out_3, y_out_4, y_out_5, y_out_6, y_out_7, y_out_8;
    Filter filter
    (
        .clk(clk),
        .rst_n(rst_n),
        .x_in(x_in), 
        .y_out_1(y_out_1), .y_out_2(y_out_2), .y_out_3(y_out_3), .y_out_4(y_out_4), .y_out_5(y_out_5), .y_out_6(y_out_6), .y_out_7(y_out_7), .y_out_8(y_out_8),
        .ena_1(ena_1), .ena_2(ena_2), .ena_3(ena_3), .ena_4(ena_4), .ena_5(ena_5), .ena_6(ena_6), .ena_7(ena_7), .ena_8(ena_8)
    );

    Amplifier amp
    (
        .clk(clk),
        .rst_n(rst_n),
        .amp_coef_1(amp_coef_1), .amp_coef_2(amp_coef_2), .amp_coef_3(amp_coef_3), .amp_coef_4(amp_coef_4), .amp_coef_5(amp_coef_5), .amp_coef_6(amp_coef_6), .amp_coef_7(amp_coef_7), .amp_coef_8(amp_coef_8),
        .y_out_1(y_out_1), .y_out_2(y_out_2), .y_out_3(y_out_3), .y_out_4(y_out_4), .y_out_5(y_out_5), .y_out_6(y_out_6), .y_out_7(y_out_7), .y_out_8(y_out_8),
        .sig_out_1(sig_out_1), .sig_out_2(sig_out_2), .sig_out_3(sig_out_3), .sig_out_4(sig_out_4), .sig_out_5(sig_out_5), .sig_out_6(sig_out_6), .sig_out_7(sig_out_7), .sig_out_8(sig_out_8)
    );
endmodule