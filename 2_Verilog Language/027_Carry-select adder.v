module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout1, cout2, cout3;
    wire [15:0] sum2, sum3;
    add16 add16_1(a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 add16_2(a[31:16], b[31:16], 1'b0, sum2, cout2);
    add16 add16_3(a[31:16], b[31:16], 1'b1, sum3, cout3);
    
    assign sum[31:16] = cout1? sum3 : sum2;
    
endmodule
