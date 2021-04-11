module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    reg state, next_state;
    
    always @(*) begin
        case(state)
            1'b0:	next_state = x? 1'b1 : 1'b0;
            1'b1:	next_state = 1'b1;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= 1'b0;
        else
            state <= next_state;
    end
    
    assign z = (~state & x) | (state & ~x);
        

endmodule
