module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] cout;
    
    FA FA_ [3:0] (x, y, {cout[2:0], 1'b0}, cout, sum[3:0]);

    assign sum[4] = cout[3];
    
endmodule

module FA( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout, sum} = a + b + cin;

endmodule

