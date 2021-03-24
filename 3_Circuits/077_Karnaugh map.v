module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] c;
    
    generate
        genvar i;
        for(i = 0; i < 4; i++) begin: block1
            if(i == 0)
                bcd_fadd bcd_fadd0(a[3:0], b[3:0], cin, c[0], sum[3:0]);
            else
                bcd_fadd bcd_fadd(a[4*i+3:4*i], b[4*i+3:4*i], c[i-1], c[i], sum[4*i+3:4*i]);
        end
    endgenerate
    
    assign cout = c[3];

endmodule
