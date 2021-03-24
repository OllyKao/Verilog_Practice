module top_module (
    input clk,
    input x,
    output z
); 
    
    wire [2:0] d, q;
    
    assign d = {{x | ~q[2]}, {x & ~q[1]}, {x ^ q[0]}};
    
    dff dff0 [2:0] (d, clk, q);

    assign z = ~(q[0] | q[1] | q[2]);

endmodule

module dff (
    input d,
    input clk,
    output reg Q);
    
    always @(posedge clk) begin
        Q <= d;
    end
        
endmodule
