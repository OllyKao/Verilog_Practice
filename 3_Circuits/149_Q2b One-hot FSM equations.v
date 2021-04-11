module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    
    reg [5:0] Y;
    
    always @(*)begin
        Y[0] = w? 1'b0 : y[0];
        Y[1] = w? y[0] : 1'b0;
        Y[2] = w? (y[1] | y[5]) : 1'b0;
        Y[3] = w? 1'b0 : (y[1] | y[2] | y[4] | y[5]);
        Y[4] = w? (y[2] | y[4]) : 1'b0;
        Y[5] = w? y[3] : 1'b0;
    end
    
    assign Y1 = Y[1];
    assign Y3 = Y[3];

endmodule
