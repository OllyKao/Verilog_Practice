module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    reg [3:0] state, next_state;
    reg [3:0] cnt;
    reg [9:0] clk_cnt;	// count clk from 0~999
    
    always @(*) begin
        case(state)
            4'h0:	next_state = data? 4'h1 : 4'h0;
            4'h1:	next_state = data? 4'h2 : 4'h0;
            4'h2:	next_state = data? 4'h2 : 4'h3;
            4'h3:	next_state = data? 4'h4 : 4'h0;
            4'h4:	next_state = 4'h5;
            4'h5:	next_state = 4'h6;
            4'h6:	next_state = 4'h7;
            4'h7:	next_state = 4'h8;
            4'h8:	next_state = 4'h8;
            4'h9:	next_state = ack? 4'h0 : 4'h9;
            default:	next_state = 4'h0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= 4'h0;
        else begin
            state <= next_state;
            case(state)
                4'h4:	cnt[3] <= data;
                4'h5:	cnt[2] <= data;
                4'h6:	cnt[1] <= data;
                4'h7: begin
                    cnt[0] <= data;
                    clk_cnt <= 10'd0;
                end
                4'h8: begin
                    if(cnt == 4'h0 && clk_cnt == 10'd999) begin
                        clk_cnt <= 10'd0;
                        state <= 4'h9;
                    end
                    else if(clk_cnt == 10'd999) begin
                        clk_cnt <= 10'd0;
                        cnt <= cnt - 4'h1;
                    end
                    else
                        clk_cnt <= clk_cnt + 10'd1;
                end
            endcase
        end
    end
    
    assign count = cnt;
    assign counting = (state == 4'h8);
    assign done = (state == 4'h9);
        
endmodule
