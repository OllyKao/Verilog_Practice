module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    
    always @(posedge clk) begin
        if(reset) begin
            hh <= 8'h12;
            mm <= 8'h0;
            ss <= 8'h0;
        end
        else begin
            if(ena) begin
                ss[3:0] <= (ss[3:0] == 4'h9)? 0 : ss[3:0] + 1;
                ss[7:4] <= (ss == 8'h59)? 0 : ss[7:4] + (ss[3:0] == 4'h9);
                if(ss == 8'h59) begin
                    mm[3:0] <= (mm[3:0] == 4'h9)? 0 : mm[3:0] + 1;
                    mm[7:4] <= (mm == 8'h59)? 0 : mm[7:4] + (mm[3:0] == 4'h9);
                    if(mm == 8'h59) begin
                        if(hh == 8'h11)
                            pm <= ~pm;
                        if(hh == 8'h12)
                            hh <= 8'h01;
                        else begin
                            hh[3:0] <= (hh[3:0] == 4'h9)? 0 : hh[3:0] + 1;
                            hh[7:4] <= hh[7:4] + (hh[3:0] == 4'h9);
                        end
                	end 
                end
            end
        end    
    end 

endmodule