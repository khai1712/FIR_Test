module Amplifier (
    input clk, rst_n,
    input [0:31] y_out_1, y_out_2, y_out_3, y_out_4, y_out_5, y_out_6, y_out_7, y_out_8,
    input [0:2] amp_coef_1, amp_coef_2, amp_coef_3, amp_coef_4, amp_coef_5, amp_coef_6, amp_coef_7, amp_coef_8,
    output reg [0:15] sig_out_1, sig_out_2, sig_out_3, sig_out_4, sig_out_5, sig_out_6, sig_out_7, sig_out_8
);
    reg [0:31] sig_tmp_1, sig_tmp_2, sig_tmp_3, sig_tmp_4, sig_tmp_5, sig_tmp_6, sig_tmp_7, sig_tmp_8;
    // Scale xuống theo giá trị của hệ số bộ lọc đã nhân lên (2^10)
    assign sig_tmp_1 = (y_out_1[0] == 1'b1) ? (32'hFFC00000 + (y_out_1 >> 10)) : (y_out_1 >> 10);
    assign sig_tmp_2 = (y_out_2[0] == 1'b1) ? (32'hFFC00000 + (y_out_2 >> 10)) : (y_out_2 >> 10);
    assign sig_tmp_3 = (y_out_3[0] == 1'b1) ? (32'hFFC00000 + (y_out_3 >> 10)) : (y_out_3 >> 10);
    assign sig_tmp_4 = (y_out_4[0] == 1'b1) ? (32'hFFC00000 + (y_out_4 >> 10)) : (y_out_4 >> 10);
    assign sig_tmp_5 = (y_out_5[0] == 1'b1) ? (32'hFFC00000 + (y_out_5 >> 10)) : (y_out_5 >> 10);
    assign sig_tmp_6 = (y_out_6[0] == 1'b1) ? (32'hFFC00000 + (y_out_6 >> 10)) : (y_out_6 >> 10);
    assign sig_tmp_7 = (y_out_7[0] == 1'b1) ? (32'hFFC00000 + (y_out_7 >> 10)) : (y_out_7 >> 10);
    assign sig_tmp_8 = (y_out_8[0] == 1'b1) ? (32'hFFC00000 + (y_out_8 >> 10)) : (y_out_8 >> 10);
    // Nhân với hệ số khuếch đại
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            sig_out_1 <= 0;
            sig_out_2 <= 0;
            sig_out_3 <= 0;
            sig_out_4 <= 0;
            sig_out_5 <= 0;
            sig_out_6 <= 0;
            sig_out_7 <= 0;
            sig_out_8 <= 0;
        end
        else begin
            sig_out_1 <= sig_tmp_1 * amp_coef_1;
            sig_out_2 <= sig_tmp_2 * amp_coef_2;
            sig_out_3 <= sig_tmp_3 * amp_coef_3;
            sig_out_4 <= sig_tmp_4 * amp_coef_4;
            sig_out_5 <= sig_tmp_5 * amp_coef_5;
            sig_out_6 <= sig_tmp_6 * amp_coef_6;
            sig_out_7 <= sig_tmp_7 * amp_coef_7;
            sig_out_8 <= sig_tmp_8 * amp_coef_8;
        end
    end
endmodule