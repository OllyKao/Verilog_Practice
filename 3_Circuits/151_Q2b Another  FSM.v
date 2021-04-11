module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    reg [3:0] state , next_state;
    
    always @(*) begin
        case(state)
            4'h0:	next_state = resetn? 4'h1 : 4'h0;
            4'h1:	next_state = 4'h2;
            4'h2:	next_state = x? 4'h3 : 4'h2;
            4'h3:	next_state = x? 4'h3 : 4'h4;
            4'h4:	next_state = x? 4'h5 : 4'h2;
            4'h5:	next_state = y? 4'h7 : 4'h6;
            4'h6:	next_state = y? 4'h7 : 4'h8;
            4'h7:	next_state = 4'h7;
            4'h8:	next_state = 4'h8;
            default:	next_state = 4'h0;
        endcase
    end
    
    always @(posedge clk) begin
        if(~resetn)
            state <= 4'h0;
        else
            state <= next_state;
    end
    
    assign f = (state == 4'h1);
    assign g = (state == 4'h5) || (state == 4'h6) || (state == 4'h7);

endmodule
