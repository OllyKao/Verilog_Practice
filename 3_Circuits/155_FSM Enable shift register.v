module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [1:0] cnt;
    
    always @(posedge clk) begin
        if(reset) begin
            shift_ena <= 1'b1;
            cnt <= 2'd0;
        end
        else begin
            cnt <= (cnt == 2'd3)? 2'd3 : (cnt + 2'd1);
            shift_ena <= (cnt == 2'd3)? 1'b0 : 1'b1;
        end
    end

endmodule
