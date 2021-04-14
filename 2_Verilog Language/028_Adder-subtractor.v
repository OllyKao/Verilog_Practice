module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cout1, cout2;
    wire [31:0] b_xor;
    
    assign b_xor = sub? ~b : b;
    
    add16 add16_1(a[15:0], b_xor[15:0], sub, sum[15:0], cout1);
    add16 add16_2(a[31:16], b_xor[31:16], cout1, sum[31:16], cout2);
 
    
endmodule
