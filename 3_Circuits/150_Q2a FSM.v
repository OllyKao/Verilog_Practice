module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    
    reg [1:0] state, next_state;
    
    always @(*) begin
        case(state)
            2'b00:	next_state = r[1]? 2'b01 : (r[2]? 2'b10 : (r[3]? 2'b11 : 2'b00));
            2'b01:	next_state = r[1]? 2'b01 : 2'b00;
            2'b10:	next_state = r[2]? 2'b10 : 2'b00;
            2'b11:	next_state = r[3]? 2'b11 : 2'b00;
        endcase
    end
    
    always @(posedge clk) begin
        if(~resetn)
            state <= 2'b00;
        else
            state <= next_state;
    end
    
    assign g = {(state == 2'b11), (state == 2'b10), (state == 2'b01)};

endmodule
