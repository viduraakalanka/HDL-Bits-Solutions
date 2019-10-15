module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    
    integer i;
    always@(posedge clk)
        begin
            if(load)
                q <= data;
            else if(ena == 1)
                begin
                    for(i = 0; i<100; i=i+1)
                    		q[i] <= q[(i+1)%100];
                end
            else if(ena == 2)
                begin
                    for(i = 0; i<100;i=i+1)
                        q[i] <= q[99 - (100-i)%100];
                end
            else
                q <= q;
        end

endmodule

