module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire [2:0] in0 = {{LEDR[1] ^ LEDR[2]}, LEDR[0], LEDR[2]};
    
    mux mux [2:0] (KEY[0], in0, SW, KEY[1], LEDR);

endmodule

module mux (
    input clk,
    input a,b,
    input sel,
    output q
);
    
    always @(posedge clk) begin
        q <= sel? b : a;
    end
    
endmodule
