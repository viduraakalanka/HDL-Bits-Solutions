module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    integer i;
    always @ (posedge clk)
        begin
            if(load)
                q <= data;
            else
                for(i=0;i<512;i=i+1)
                    begin
                        if(i==0)
                            q[i] <= 1'b0 ^ q[i+1];
                        else if (i==511)
                            q[i] <= q[i-1] ^ 1'b0;
                        else
                        q[i] <= q[i-1] ^ q[i+1];
                    end
        end

endmodule
