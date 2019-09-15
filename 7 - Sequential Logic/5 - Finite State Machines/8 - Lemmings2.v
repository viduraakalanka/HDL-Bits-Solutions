module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter WL = 0, WR = 1, FL = 2, FR = 3;
    reg [1:0] state, next_state;
    
    // State transition logic
    always @ (*)
        begin
            case(state)
                WL: if(~ground)
                    	next_state = FL;
                else if(bump_left)
                    	next_state = WR;
                else
                    	next_state = state;
                WR: if(~ground)
                    	next_state = FR;
                else if(bump_right)
                    	next_state = WL;
                else
                    	next_state = state;
                FL: if(ground)
                    	next_state = WL;
                	else
                        next_state = FL;
                FR:	if(ground)
                    	next_state = WR;
                	else
                        next_state = FR;
                default: next_state = state;
            endcase
        end
    
    //Sequential logic
    always @ (posedge clk, posedge areset)
        begin
            if(areset)
                state <= WL;
            else
                state <= next_state;
        end
    
    //output logic
    assign walk_left = (state == WL);
    assign walk_right = (state == WR);
    assign aaah = (state == FL) |(state == FR);
endmodule


