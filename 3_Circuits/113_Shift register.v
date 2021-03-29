module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    wire out0in1, out1in2, out2in3;
    
    nffp nffp0(clk, ~resetn, in, out0in1);
    nffp nffp1(clk, ~resetn, out0in1, out1in2);
    nffp nffp2(clk, ~resetn, out1in2, out2in3);
    nffp nffp3(clk, ~resetn, out2in3, out);

endmodule

module nffp (
    input clk,
    input reset,
    input d,
    output q
);
    
    always @(posedge clk) begin
        q <= (reset == 1)? 1'b0 : d;
    end
    
endmodule
