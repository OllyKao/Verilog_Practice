module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    // solve by instance array
    full_adder f_adder[99:0](.a(a), .b(b), .cin({cout[98:0], cin}), .cout(cout), .sum(sum));
    
    // solve by generate statement
    /*
    genvar i;
    generate
        for (i = 0; i < 100; i++) begin:block1
            if(i == 0)
                full_adder f_adder(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
            else
                full_adder f_adder(.a(a[i]), .b(b[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
        end
    endgenerate
    */
endmodule

module full_adder(
    input a, b, cin,
    output cout, sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule