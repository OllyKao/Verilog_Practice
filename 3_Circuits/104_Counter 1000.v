module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    
    wire [3:0] out0, out1, out2;
    wire [3:0] out [2:0];
    
    bcdcount counter[2:0] (clk, reset, c_enable, out);
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (out[0] == 4'h9)? 1'b1 : 1'b0;
    assign c_enable[2] = (out[1] == 4'h9 && out[0] == 4'h9)? 1'b1 : 1'b0;
    
    assign OneHertz = (out[2] == 4'h9) && (out[1] == 4'h9) && (out[0] == 4'h9);

endmodule
