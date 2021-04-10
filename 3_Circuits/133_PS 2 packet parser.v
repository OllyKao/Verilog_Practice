module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [1:0] state, next_state;
    
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            2'b00:	next_state = in[3]? 2'b01 : 2'b00;
            2'b01:	next_state = 2'b10;
            2'b10:	next_state = 2'b11;
            2'b11:	next_state = in[3]? 2'b01 : 2'b00;
        endcase
    end
   
    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset)
            state = 2'b0;
        else
            state = next_state;
    end
 
    // Output logic
    assign done = (state == 2'b11);

endmodule
