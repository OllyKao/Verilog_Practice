module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    reg [2:0] state, next_state;
    
    always @(*) begin
        case(state)
            3'd0:	next_state = data? 3'd1 : 3'd0;
            3'd1:	next_state = data? 3'd2 : 3'd0;
            3'd2:	next_state = data? 3'd2 : 3'd3;
            3'd3:	next_state = data? 3'd4 : 3'd0;
            3'd4:	next_state = 3'd4;
            default:	next_state = 3'd0;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= 3'd0;
        else
            state <= next_state;
    end
    
    assign start_shifting = (state == 3'd4);

endmodule
