module top_module (
    input clk,
    input d,
    output q
);
    
    reg [1:0] tmp;

    always @(posedge clk)
        tmp[0] <= d;
    
    always @(negedge clk)
        tmp[1] <= d;
    
    assign q = clk? tmp[0] : tmp[1];
    
endmodule
