module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    reg [1:0] state, next_state;
    
    always @(*) begin
        case(state)
            2'b00:	next_state = x? 2'b01 : 2'b00;
            2'b01:	next_state = x? 2'b10 : 2'b11;
            2'b10:	next_state = x? 2'b10 : 2'b11;
            2'b11:	next_state = x? 2'b10 : 2'b11;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= 2'b0;
        else
            state <= next_state;
    end
    
    assign z = (state == 2'b01) || (state == 2'b11);

endmodule
