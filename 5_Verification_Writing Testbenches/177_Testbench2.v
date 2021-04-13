`t

module top_module();
    
    reg [2:0] s;
    reg in, out;
    
    reg clk;
    parameter period = 10;
    
    always begin
        #(period / 2)	clk = ~clk;
    end
    
    initial begin
        	clk = 1'b0;
        	s = 3'd2;
        	in = 1'b0;
        #10	s = 3'd6;
        #10	s = 3'd2;
        	in = 1'b1;
        #10	s = 3'd7;
        	in = 1'b0;
        #10	s = 3'd0;
        	in = 1'b1;
        #30	in = 1'b0;
    end
    
    q7 q70(clk, in, s, out);

endmodule
