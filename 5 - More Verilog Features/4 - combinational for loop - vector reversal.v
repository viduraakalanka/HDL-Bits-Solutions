module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @ (in) begin 
        for (i=0;i<100; i=i+1) begin
            out[99-i] = in[i];
        end        
    end
endmodule