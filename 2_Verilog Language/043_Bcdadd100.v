module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout_i;
    
    genvar i;
    generate
        for(i = 0; i < 100; i++) begin:block1
            if(i == 0)
                bcd_fadd bcd_fadd0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cout_i[0]), .sum(sum[3:0]));
            else
                bcd_fadd bcd_faddi(.a(a[(4*(i+1)-1):4*i]), .b(b[(4*(i+1)-1):4*i]), .cin(cout_i[i-1]), .cout(cout_i[i]), .sum(sum[(4*(i+1)-1):4*i]));
        end
    endgenerate
    
    assign cout = cout_i[99];

endmodule