module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    always @(*) begin
        out =0;
        for(integer ii = 0; ii < 255; ii = ii + 1)
            out = in[ii]? out + 1 : out;
    end

endmodule
