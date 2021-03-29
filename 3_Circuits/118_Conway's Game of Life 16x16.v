module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    reg q_2d [15:0][15:0];
    reg [2:0] total [255:0];
    int i0, i, i1, j0, j, j1;
    
    always @(*) begin
        for(i = 0; i < 16; i++) begin
            for(j = 0; j < 16; j++) begin
                q_2d[i][j] <= q[i*16 + j];
        	end
        end
        
        for(i = 0; i < 16; i++) begin
            for(j = 0; j < 16; j++) begin
                i0 = (i == 0)? 15 : i - 1;
                i1 = (i == 15)? 0 : i + 1;
                j0 = (j == 0)? 15 : j - 1;
                j1 = (j == 15)? 0 : j + 1;
                total[i*16 + j] <= 	q_2d[i0][j0]	+ q_2d[i0][j]	+ q_2d[i0][j1]
                				+	q_2d[i][j0]						+ q_2d[i][j1]
                				+	q_2d[i1][j0]	+ q_2d[i1][j]	+ q_2d[i1][j1];
            end
        end
    end
    
    always @(posedge clk) begin        
        if(load)
            q <= data;
        else begin
            for(i = 0; i < 256; i++) begin
                case(total[i])
                    2:			q[i] <= q[i];
                    3:			q[i] <= 1'b1;
                    default:	q[i] <= 1'b0;
                endcase
        	end
        end
    end

endmodule
