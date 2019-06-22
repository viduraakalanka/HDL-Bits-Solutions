module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
	
    assign out_both      = in[98:0] & in[99:1];//here bits of input vector is shifted right 
    									//and bitwise and is performed to obtain the required output
    assign out_any       = in[99:1] | in[98:0];
    assign out_different = in ^ {in[0],in[99:1]};
 
endmodule
