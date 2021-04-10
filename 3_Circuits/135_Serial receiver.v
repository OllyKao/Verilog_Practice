module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [3:0] state, next_state;
    
    always @(*) begin
        case(state)
            4'h0:	next_state = in? 4'h0 : 4'h1;
            4'h1, 4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7, 4'h8:	next_state = state + 1;
            4'h9:	next_state = in? 4'hb : 4'ha;
            4'ha:	next_state = in? 4'h0 : 4'ha;	// state stop bit not found
            4'hb:	next_state = in? 4'h0 : 4'h1;	// state done
            default:	next_state = 4'h0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= 4'h0;
        else
            state <= next_state;
    end
    
    assign done = (state == 4'hb);

endmodule
