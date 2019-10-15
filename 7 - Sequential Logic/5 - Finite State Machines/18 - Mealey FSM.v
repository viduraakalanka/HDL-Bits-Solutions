module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] state, nextState;
    
    always @ (*)
        begin
            case(state)
                S1: if(x)
                    	begin
                            nextState = S2;
                            z = 0;
                        end
                	else
                        begin
                            nextState = S1;
                            z = 0;
                        end
                S2: if(x)
                    	begin
                            nextState = S2;
                            z = 0;
                        end
                	else
                        begin
                            nextState = S3;
                            z = 0;
                        end
                S3: if(x)
                    	begin
                            nextState = S2;
                            z = 1;
                        end
                	else
                        begin
                            nextState = S1;
                            z = 0;
                        end
                default: begin
                    nextState = state;
                    z = 0;
                end
            endcase
        end
    
    always @ (posedge clk, negedge aresetn)
        begin
            if(~aresetn)
                state <= S1;
            else
                state <= nextState;
        end

endmodule
