module top_module (
    input [7:0] in,
    output [31:0] out );//
	// The replication operator allows repeating a vector and concatenating them together:
	//{num{vector}}
    
    //this is sign-extending a smaller number to a larger one
    assign out = { {24{in[7]}} , in[7:0] };

endmodule