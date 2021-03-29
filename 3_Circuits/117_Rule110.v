module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    
    always @(posedge clk) begin
        if(load)
            q <= data;
        else begin
            for(integer i = 0; i < 512; i++) begin
                if(i == 0)
                    q[i] <= q[i];
                else if(i == 511)
                    q[i] <= q[i] | q[i-1];
                else begin
                    case({q[i+1], q[i], q[i-1]})
                        3'b111:	q[i] <= 0;
                        3'b110:	q[i] <= 1;
                        3'b101:	q[i] <= 1;
                        3'b100:	q[i] <= 0;
                        3'b011:	q[i] <= 1;
                        3'b010:	q[i] <= 1;
                        3'b001:	q[i] <= 1;
                        3'b000:	q[i] <= 0;
                    endcase
                end
            end
        end
    end
    
endmodule
