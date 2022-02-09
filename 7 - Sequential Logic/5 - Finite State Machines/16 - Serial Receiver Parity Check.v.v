module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    integer count;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5; //S3 = Done
    reg [2:0] state, next_state;
    reg [7:0] data;
    wire odd_parity;
    wire reset_TFF;
    
    assign reset_TFF = (state == S0);
    parity parity_check(clk,reset_TFF,in,odd_parity);
    
    always @ (*)
        begin
            case(state)
                S0: if(~in)
                    	next_state = S1;
                	else
                    	next_state = S0;
                S1: if(count == 7)
                    	next_state = S2;
                	else	
                    	next_state = S1;
                S2: if ((~odd_parity && in) || (odd_parity && ~in))
                    	next_state = S3;
                	else
                        next_state = S5; 
                S3: if(in)
                    	next_state = S4;
                	else
                    	next_state = S5;
                S4: if(~in)
                    	next_state = S1;
                	else
                    	next_state = S0;
                S5: if(in)
                    	next_state = S0;
                	else
                    	next_state = S5;
                default: next_state = state;
            endcase
        end
    
    always @(posedge clk)
        begin
            if(reset)
                state <= S0;
            else
                begin
                	state <= next_state;
                    if(state != S1)
                        count <= 0;
                    else
                        begin
                    		count <= count + 1;
                            data <= {in,data[7:1]};
                        end
                end
        end

    assign done = (state == S4);
    assign out_byte = done ? data : 8'bx ;

endmodule
