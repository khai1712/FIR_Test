module multiply
(
    input [0:15] delay_x, coef,
    output [0:31] acc
);
    wire [0:15] mul_1, mul_2;
    wire [0:31] num;
    assign mul_1 = (delay_x[0] == 1'b1) ? (~delay_x + 1'b1) : delay_x;
    assign mul_2 = (coef[0] == 1'b1) ? (~coef + 1'b1) : coef;
    assign num = mul_1 * mul_2;
    assign acc = (delay_x[0] ^ coef[0] == 1) ? (~num + 1'b1) : num;
endmodule

module addition
(

);
endmodule