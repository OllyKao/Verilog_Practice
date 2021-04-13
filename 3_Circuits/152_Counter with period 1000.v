module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    reg [9:0] cnt;
    
    always @(posedge clk) begin
        if(reset)
            cnt <= 10'd0;
        else begin
            if(cnt == 10'd999)
                cnt <= 10'd0;
            else
                cnt <= cnt + 1'b1;
        end
    end
    
    assign q = cnt;

endmodule
