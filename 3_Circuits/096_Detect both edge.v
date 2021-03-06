module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] in_old;
    
    always @(posedge clk) begin
        in_old <= in;
        anyedge <= in_old ^ in;
    end

endmodule
