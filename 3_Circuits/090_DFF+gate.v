module top_module (
    input clk,
    input in, 
    output out);
    
    wire d,q;
    
    assign d = in ^ q;
    assign out = q;
    
    always @(posedge clk) begin
        q = d;
    end

endmodule
