module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    reg [1:0] state, next_state;
    reg [1:0] w_cnt;
    
    always @(*)begin
        case(state)
            2'b00:	next_state = s? 2'b01 : 2'b00;
            2'b01:	next_state = 2'b10;
            2'b10:	next_state = 2'b11;
            2'b11:	next_state = 2'b01;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset) begin
            state <= 2'b00;
            z <= 1'b0;
        end
        else begin
        	state <= next_state;
            if(state == 2'b01)
                w_cnt <= w? 2'b01 : 2'b00;
            else
                w_cnt <= w? (w_cnt + 2'b01) : w_cnt;
            if(((w_cnt + w) == 2'b10) && (state == 2'b11))
                z <= 1'b1;
            else
                z <= 1'b0;
        end
    end

endmodule
