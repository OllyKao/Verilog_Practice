module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire d0 = E? w : Q;
    wire d1 = L? R : d0;
    
    always @(posedge clk)
        Q <= d1;

endmodule
