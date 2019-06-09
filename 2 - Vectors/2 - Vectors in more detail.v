`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
// Implicit nets are always one-bit wires and causes bugs if you had intended to use a vector. 
//Disabling creation of implicit nets can be done using the `default_nettype none directive.

module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    //The unpacked dimensions are declared after the name. They are generally used to declare memory arrays. 
	//reg [7:0] mem [255:0];   // 256 unpacked elements, each of which is a 8-bit packed vector of reg.
    
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule
