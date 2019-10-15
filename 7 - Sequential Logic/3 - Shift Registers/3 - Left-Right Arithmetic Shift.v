module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @ (posedge clk)
        begin
            if(load)
                q <= data;
            else if(ena)
                begin
                    if(amount == 0)
                        q <= {q[62:0],1'b0};
                    else if(amount == 1)
                        q <= {q[55:0],8'b0};
                    else if(amount == 2)
                        q <= {{2{q[63]}},q[62:1]};
            				else
                        q <= {{9{q[63]}},q[62:8]};
                end
            else
                q <= q;
        end

endmodule
