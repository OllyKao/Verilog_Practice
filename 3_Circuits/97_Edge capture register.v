module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_old;
    
    always @(posedge clk) begin
        in_old <= in;
        if(reset == 1)
            out <= 0;
        else
            out <= (in_old & ~in) | out;
    end
    
endmodule
