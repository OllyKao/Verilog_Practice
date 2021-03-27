module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
     
    bcd10 bcd0(clk, reset, 1, q[3:0]);
    bcd10 bcd1(clk, reset, ena[1], q[7:4]);
    bcd10 bcd2(clk, reset, ena[2], q[11:8]);
    bcd10 bcd3(clk, reset, ena[3], q[15:12]);
    
    assign ena[1] = (q[3:0] == 4'h9);
    assign ena[2] = (q[3:0] == 4'h9 && q[7:4] == 4'h9);
    assign ena[3] = (q[3:0] == 4'h9 && q[7:4] == 4'h9 && q[11:8] == 4'h9);
        
endmodule

module bcd10 (
    input clk,
    input reset,
    input ena,
    output reg [3:0 ] q);
    
    always @(posedge clk) begin
        if(reset == 1)
            q <= 4'h0;
        else if(ena == 1'b1)
            q <= (q == 4'h9)? 0 : q + 1;
    end        
    
endmodule
