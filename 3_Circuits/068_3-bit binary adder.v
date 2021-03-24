module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    fadder fadder_ [2:0] (a, b, {cin,cout[1:0]}, cout, sum);

endmodule

module fadder( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout, sum} = a + b + cin;

endmodule

