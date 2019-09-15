module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2

    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] state, next_state;
    reg [23:0] out_data;
    
    // State transition logic (combinational)
    always @(*)
        begin
            case(state)
            	S0: next_state = in[3] ? S1 : S0;
            	S1: next_state = S2;
            	S2: next_state = S3;
            	S3: next_state = in[3] ? S1 : S0;
            	default: next_state = state;
            endcase
        end

    // State flip-flops (sequential)
    always @(posedge clk)
        begin
            if(reset)
                state <= S0;
            else
                begin
                	state <= next_state;
                    out_data <= {out_data[15:0],in};
                end
        end
 
    // Output logic
    assign done = (state == S3);

    // New: Datapath to store incoming bytes.
    assign out_bytes = done ? out_data : 24'bx;

endmodule

