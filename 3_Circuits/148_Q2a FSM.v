module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);

    localparam A=3'h1, B=3'h2, C=3'h3, D=3'h4, E=3'h5, F=3'h6;
    reg [2:0] state, next_state;
    
    always @(*) begin
        case(state)
            A:	next_state = w? B : A;
            B:	next_state = w? C : D;
            C:	next_state = w? E : D;
            D:	next_state = w? F : A;
            E:	next_state = w? E : D;
            F:	next_state = w? C : D;
            default:	next_state = A;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    assign z = (state == E) || (state == F);
    
endmodule

