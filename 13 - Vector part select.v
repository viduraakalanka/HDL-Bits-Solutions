//byte reversing
//This operation is often used when the endianness of a piece of data needs to be swapped, 
//for example between little-endian x86 systems and the big-endian formats used in many Internet protocols.
`default_nettype none

module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[7:0] = in[31:24];
    assign out[15:8] = in[23:16];
    assign out[23:16] = in[15:8];
    assign out[31:24] = in[7:0];
endmodule
