module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    reg [3:0] cnt;
    
    always @(posedge clk) begin
        if(shift_ena)
            cnt <= {cnt[2:0], data};
        if(count_ena)
            cnt <= cnt - 4'h1;
    end
    
    assign q = cnt;

endmodule
