module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);
	//An XOR gate can also be viewed as a programmable inverter, where one input controls whether
    //the other should be inverted. 
    
    wire wire1;
    wire [31:0]b_xor;
    
    assign b_xor = {32{sub}}^b; 
    add16 adder1(a[15:0], b_xor[15:0], sub, result[15:0], wire1);
    add16 adder2(a[31:16], b_xor[31:16], wire1, result[31:16]);
    
    
endmodule