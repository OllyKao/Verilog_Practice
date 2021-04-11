module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    reg [6:1] Y;
    
    always @(*) begin
        Y[1] = w? (y[1] | y[4]) : 1'b0;
        Y[2] = w? 1'b0 : y[1];
        Y[3] = w? 1'b0 : (y[2] | y[6]);
        Y[4] = w? (y[2] | y[3] | y[5] | y[6]) : 1'b0;
        Y[5] = w? 1'b0 : (y[3] | y[5]);
        Y[6] = w? 1'b0 : y[4];
    end
    
    assign Y2 = Y[2];
    assign Y4 = Y[4];

endmodule
