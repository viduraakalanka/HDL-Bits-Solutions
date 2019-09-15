module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    integer count;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4; //S3 = Done
    reg [2:0] state, next_state;
    reg [7:0] data;
    
    always @ (*)
        begin
            case(state)
                S0: if(~in)
                    next_state = S1;
                else
                    next_state = S0;
                S1: if(count >= 7)
                    next_state = S2;
                else
                    next_state = S1;
                S2: if(in)
                    next_state = S3;
                else
                    next_state = S4;
                S3: if(~in)
                    next_state = S1;
                else
                    next_state = S0;
                S4: if(in)
                    next_state = S0;
                else
                    next_state = S4;
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

    assign done = (state == S3);

    // New: Datapath to latch input bits.
    assign out_byte = done ? data : 8'bx ;

endmodule
