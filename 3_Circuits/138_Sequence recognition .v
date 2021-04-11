module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    reg [3:0] state, next_state;
    
    always @(*) begin
        case(state)
            4'h0, 4'h1, 4'h2, 4'h3, 4'h4:	next_state = in? (state + 4'h1) : 4'h0;
            4'h5:	next_state = in? (state + 4'h1) : 4'h8;
            4'h6:	next_state = in? (state + 4'h1) : 4'h9;
            4'h7:	next_state = in? 4'h7 : 4'h0;
            4'h8:	next_state = in? 4'h1 : 4'h0;
            4'h9:	next_state = in? 4'h1 : 4'h0;
            default:	next_state = 4'h0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= 4'h0;
        else
            state <= next_state;
    end
    
    assign disc = (state == 4'h8);
    assign flag = (state == 4'h9);
    assign err= (state == 4'h7);

endmodule
