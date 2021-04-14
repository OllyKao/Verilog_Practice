module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] cmp1, cmp2;
    assign cmp1 = a > b? b : a;
    assign cmp2 = c > d? d : c;
    assign min = cmp1 > cmp2? cmp2 : cmp1;

endmodule
