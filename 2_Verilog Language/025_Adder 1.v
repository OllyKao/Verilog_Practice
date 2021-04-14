module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire carry, carry1;
    add16 add160(a[15:0], b[15:0], 1'b0, sum[15:0], carry);
    add16 add161(a[31:16], b[31:16], carry, sum[31:16], carry1);
    
endmodule
