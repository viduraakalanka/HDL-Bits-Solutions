module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always @ (posedge clk or posedge areset)
        begin
        	if(areset)
            	q <= 0;
    		else if(load)
                q <= data;
            else if(ena)
                begin
                    q[0] = q[1];
                    q[1] = q[2];
                    q[2] = q[3];
                    q[3] = 0;
                end
            else
                q <= q;
        end
endmodule

