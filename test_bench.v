module test_bench();
    reg clk, rst_n, ena;
    reg signed [15:0] x_in;
    reg ena_1, ena_2, ena_3, ena_4, ena_5, ena_6, ena_7, ena_8;
    reg signed [15:0] sig_in [7999:0];
    reg [12:0] address_1;
    reg [12:0] address_2;
    wire signed [0:15] sig_out_1, sig_out_2, sig_out_3, sig_out_4, sig_out_5, sig_out_6, sig_out_7, sig_out_8;
    reg [0:2] amp_coef_1, amp_coef_2, amp_coef_3, amp_coef_4, amp_coef_5, amp_coef_6, amp_coef_7, amp_coef_8;
    initial begin
        $readmemb("sig_in.txt", sig_in);
    end

    initial begin
        amp_coef_1 = 1;
        amp_coef_2 = 1;
        amp_coef_3 = 1;
        amp_coef_4 = 1;
        amp_coef_5 = 1;
        amp_coef_6 = 1;
        amp_coef_7 = 1;
        amp_coef_8 = 1;
    end
    initial begin
        clk = 0;
        rst_n = 1; #20;
        rst_n = 0; #50;
        ena_1 = 1;
        ena_2 = 1;
        ena_3 = 1;
        ena_4 = 1;
        ena_5 = 1;
        ena_6 = 1;
        ena_7 = 1;
        ena_8 = 1;
        rst_n = 1; #20;
        address_2 = 0;
        #20000
        ena_3 = 0;
        ena_7 = 0;
        
    end
    always #5 clk = ~clk;
    Equalizer equalizer(
        .clk(clk),
        .rst_n(rst_n),
        .x_in(x_in),
        .ena_1(ena_1), .ena_2(ena_2), .ena_3(ena_3), .ena_4(ena_4), .ena_5(ena_5), .ena_6(ena_6), .ena_7(ena_7), .ena_8(ena_8),
        .sig_out_1(sig_out_1), .sig_out_2(sig_out_2), .sig_out_3(sig_out_3), .sig_out_4(sig_out_4), .sig_out_5(sig_out_5), .sig_out_6(sig_out_6), .sig_out_7(sig_out_7), .sig_out_8(sig_out_8),
        .amp_coef_1(amp_coef_1), .amp_coef_2(amp_coef_2), .amp_coef_3(amp_coef_3), .amp_coef_4(amp_coef_4), .amp_coef_5(amp_coef_5), .amp_coef_6(amp_coef_6), .amp_coef_7(amp_coef_7), .amp_coef_8(amp_coef_8)
    );
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            address_1 <= 0;
        end
        else begin
            if(address_1 == 7999) begin
            address_1 <= 0;
            end 
        else begin
            address_1 <= address_1 + 1;
            end
        end
    end
    always @(address_1) begin
        x_in <= sig_in[address_1];
    end
endmodule
