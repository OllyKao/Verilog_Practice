module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    reg [2:0] state, pre_state;
    
    always @(posedge clk) begin
        if(reset) begin
            pre_state <= 0;
        	{fr3, fr2, fr1, dfr} <= 4'b1111;
        end
        else begin
            if(pre_state != state)
                dfr <= pre_state > state;
            pre_state <= state;
            
            case(state)
                0:	{fr3, fr2, fr1} <= 3'b111;
                1:	{fr3, fr2, fr1} <= 3'b011;
                2:	{fr3, fr2, fr1} <= 3'b001;
                3:	{fr3, fr2, fr1} <= 3'b000;
        	endcase
        end
        
    end
    
    always @(*) begin
        state = s[1] + s[2] + s[3];
    end

endmodule
