module top_module( 
    input [99:0] in,
    output [99:0] out
);

    always @(*) begin
        for(integer ii = 0; ii < 100; ii = ii + 1)
            out[ii] = in[99 - ii];
    end
    
endmodule
