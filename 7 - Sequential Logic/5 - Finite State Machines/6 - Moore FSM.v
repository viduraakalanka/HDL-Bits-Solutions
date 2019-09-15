module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
    reg [2:0] next_state, state;
    
    //State transistion logic
    
    always @ (*)
        begin
            case(state)
                S0: if (s[1] & ~s[2] & ~s[3])
                    	next_state = S1;
                	else
                        next_state = state;
                S1:	if (s[1] & s[2] & ~s[3])
                    	next_state = S2;
                else if (~s[1] & ~s[2] & ~s[3])
                    	next_state = S0;
                else
                    	next_state = state;
                S2:	if (s[1] & s[2] & s[3])
                    	next_state = S3;
                else if (s[1] & ~s[2] & ~s[3])
                    	next_state = S5;
                else
                    	next_state = state;
                S3: if (s[1] & s[2] & ~s[3])
                    	next_state = S4;
                else
                    	next_state = state;
                S4:	if (s[1] & ~s[2] & ~s[3])
                    	next_state = S5;
                else if (s[1] & s[2] & s[3])
                    	next_state = S3;
                else
                    	next_state = state;
                S5: if (~s[1] & ~s[2] & ~s[3])
                    	next_state = S0;
                else if (s[1] & s[2] & ~s[3])
                    	next_state = S2;
                else
                    next_state = state;
                default: next_state = state;
            endcase
        end
    
    
    //Current state logic
    always @ (posedge clk)
        begin
            if(reset)
            	state <= S0;
            else
                state <= next_state;
        end
    
    //Output Logic
    
    always @ (*)
        begin
            case(state)
                S0: begin
                    dfr = 1'b1;
                    fr1 = 1'b1;
                    fr2 = 1'b1;
                    fr3 = 1'b1;
                end
                S1: begin
                    dfr = 1'b0;
                    fr1 = 1'b1;
                    fr2 = 1'b1;
                    fr3 = 1'b0;
                end
                S2: begin
                    dfr = 1'b0;
                    fr1 = 1'b1;
                    fr2 = 1'b0;
                    fr3 = 1'b0;
                end
                S3: begin
                    dfr = 1'b0;
                    fr1 = 1'b0;
                    fr2 = 1'b0;
                    fr3 = 1'b0;
                end
                S4: begin
                    dfr = 1'b1;
                    fr1 = 1'b1;
                    fr2 = 1'b0;
                    fr3 = 1'b0;
                end
                S5: begin
                    dfr = 1'b1;
                    fr1 = 1'b1;
                    fr2 = 1'b1;
                    fr3 = 1'b0;
                end
                default: begin
                    dfr = 0;
                    fr1 = 0;
                    fr2 = 0;
                    fr3 = 0;
                end
            endcase
        end
endmodule
