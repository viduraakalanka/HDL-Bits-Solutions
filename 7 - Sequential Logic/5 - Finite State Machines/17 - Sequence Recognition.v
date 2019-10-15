module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10;
    reg [3:0] state, nextState;
    
    //state  transistion
    always @ (*)
        begin
            case(state)
                S1: nextState = in?S2:S1;
                S2: nextState = in?S3:S1;
                S3: nextState = in?S4:S1;
                S4: nextState = in?S5:S1;
                S5: nextState = in?S6:S1;
                S6: nextState = in?S8:S7;
                S7: nextState = in?S2:S1;
                S8: nextState = in?S10:S9;
                S9: nextState = in?S2:S1;
                S10:nextState = in?S10:S1;
                default: nextState = state;
            endcase
        end
    
    //sequential block
    always@(posedge clk)
        begin
            if(reset)
                state <= S1;
            else
                state <= nextState;
        end
    
    //outputs
    always@(*)
        begin
            disc = 0;
            flag = 0;
            err = 0;
            case(state)
                S7: disc = 1;
                S9: flag = 1;
                S10: err = 1;
                default: begin
                    disc = 0;
                    flag = 0;
                    err = 0;
                end
            endcase
        end

endmodule
