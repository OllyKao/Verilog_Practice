module top_module ();
    
    reg reset;
    reg t;
    reg q;
    
    reg clk;
    parameter period = 10;
    
    always begin
        #(period / 2)	clk = ~clk;
    end
    
    initial begin
        	clk = 1'b0;
        	reset = 1'b0;
        	t = 1'b0;
        #10	reset = 1'b1;
        #10 reset = 1'b0;
        #10 t = 1'b1;
    end
    
    tff tff0(clk, reset, t, q);

endmodule
