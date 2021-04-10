module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    
    reg [3:0] state, next_state;
    reg odd, odd_correct;
    wire odd_reset;
    
    // Use FSM from Fsm_serial
    always @(*) begin
        case(state)
            4'h0:	next_state = in? 4'h0 : 4'h1;
            4'h1, 4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7, 4'h8, 4'h9:	next_state = state + 1;
            4'ha:	next_state = in? 4'hc : 4'hb;
            4'hb:	next_state = in? 4'h0 : 4'hb;	// state stop bit not found
            4'hc:	next_state = in? 4'h0 : 4'h1;	// state done
            default:	next_state = 4'h0;
        endcase
    end
    
    // New: Datapath to latch input bits.
    always @(posedge clk) begin
        if(reset)
            state <= 4'h0;
        else begin
            state <= next_state;
            if((state == 4'ha) && odd)
                odd_correct <= 1'b1;
            else
                odd_correct <= 1'b0;
            
            if((1 < next_state) && (next_state < 10))
                out_byte[next_state - 2] <= in;
        end
    end
    
    assign done = (odd_correct && (state == 4'hc));
    assign odd_reset = ~((4'h0 < state) && (state < 4'ha));
    
    parity parity0(clk, odd_reset, in, odd);

endmodule
