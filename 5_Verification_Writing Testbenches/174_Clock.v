module top_module ( );

    reg clk;
    parameter period = 10;
    
    initial begin
        clk = 1'b0;
    end
    
    always 
        #(period / 2) clk = ~clk;
        
    dut dut0(clk);
    
endmodule
