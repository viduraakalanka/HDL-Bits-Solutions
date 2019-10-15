module top_module(
	input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter WL = 0, WR = 1, DL = 2, DR = 3, FL = 4, FR = 5, SPL = 6;
    reg [3:0] state, next_state;
    int count;
    
    // State transition logic
    always @ (*)
        begin
            case(state)
                WL: if(~ground)
                    	next_state = FL;
               		else if(dig)
                    	next_state = DL;
                	else if(bump_left)
                    	next_state = WR;
                	else
                   		next_state = state;
                WR: if(~ground)
                    	next_state = FR;
                	else if(dig)
                    	next_state = DR;
                	else if(bump_right)
                    	next_state = WL;
                	else
                    	next_state = state;
                DL: if(~ground)
                    	next_state = FL;
                	else
                    	next_state = state;
                DR: if(~ground)
                	    next_state = FR;
                	else
                    	next_state = state;
                FL: if(ground)
                        begin
                            if(count > 19)
                                next_state = SPL;
                            else
                   				next_state = WL;
                        end
                	else
                    	next_state = state;
                FR:if(ground)
                        begin
                            if(count > 19)
                                next_state = SPL;
                            else
                    			next_state = WR;
                        end
                	else
                    	next_state = state;
                default: next_state = state;
            endcase
        end
    
    //Sequential logic
    always @ (posedge clk, posedge areset)
        begin
            if(areset)
                state <= WL;
            else
                begin
                	state <= next_state;
                    if((state == FR) | (state == FL))
                    	count <= count + 1;
                    else 
                        count <= 0;
                end
        end
    
    //output logic
    assign walk_left = (state == WL);
    assign walk_right = (state == WR);
    assign aaah = (state == FL) |(state == FR);
    assign digging = (state == DL) | (state == DR);
endmodule


