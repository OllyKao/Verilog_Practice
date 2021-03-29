module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    
    MUXDFF MUXDFF3(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], LEDR[3]);
    MUXDFF MUXDFF2(KEY[0], LEDR[3], SW[2], KEY[1], KEY[2], LEDR[2]);
    MUXDFF MUXDFF1(KEY[0], LEDR[2], SW[1], KEY[1], KEY[2], LEDR[1]);
    MUXDFF MUXDFF0(KEY[0], LEDR[1], SW[0], KEY[1], KEY[2], LEDR[0]);

endmodule

module MUXDFF (
    input clk,
    input in1, in2,
    input sel1, sel2,
    output q
);   
    
    wire w1, w2;
    
    assign w1 = sel1? in1 : q;
    assign w2 = sel2? in2 : w1;
    
    always @(posedge clk) begin
        q = w2;
    end

endmodule
