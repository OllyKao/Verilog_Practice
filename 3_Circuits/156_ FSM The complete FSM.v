module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    reg [3:0] state, next_state;
    
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
            4'h8:	next_state = done_counting? 4'h9 : 4'h8;
            4'h9:	next_state = ack? 4'h0 : 4'h9;
            default:	next_state = 4'h0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= 4'h0;
        else
            state <= next_state;
    end
    
    assign shift_ena = (4'h4 <= state) && (state <= 4'h7);
    assign counting = (state == 4'h8);
    assign done = (state == 4'h9);

endmodule
