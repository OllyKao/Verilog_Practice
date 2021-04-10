module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT = 0, RIGHT = 1, FALL_L = 2, FALL_R = 3, DIG_L = 4, DIG_R = 5, DEAD = 6;
    reg [2:0] state, next_state;
    reg [4:0] count;
    
    always @(*) begin
        case(state)
            LEFT:	next_state = ground? (dig? DIG_L : (bump_left? RIGHT : LEFT)) : FALL_L;
            RIGHT:	next_state = ground? (dig? DIG_R : (bump_right? LEFT : RIGHT)) : FALL_R;
            FALL_L:	next_state = ground? ((count > 20)? DEAD : LEFT) : FALL_L;
            FALL_R:	next_state = ground? ((count > 20)? DEAD : RIGHT) : FALL_R;
            DIG_L:	next_state = ground? DIG_L : FALL_L;
            DIG_R:	next_state = ground? DIG_R : FALL_R;
            DEAD:	next_state = DEAD;
            default:	next_state = next_state;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= LEFT;
        else begin
            if(((state == FALL_L) || (state == FALL_R)) && ((next_state == FALL_L) || (next_state == FALL_R)))
                count <= (count > 20)? count : count + 1;
            else
                count <= 1;
            state <= next_state;
        end
    end
    
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L) || (state == FALL_R);
    assign digging = (state == DIG_L) || (state == DIG_R);

endmodule
