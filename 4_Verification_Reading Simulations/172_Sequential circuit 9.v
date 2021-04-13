module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    wire [3:0] cnt;
    
    always @(posedge clk)
        cnt <= a? 4'h4 : ((cnt == 4'h6)? 4'h0 : (cnt + 4'h1));
    
    assign q = cnt;

endmodule
