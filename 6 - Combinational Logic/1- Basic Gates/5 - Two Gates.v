module top_module (
    input in1,
    input in2,
    input in3,
    output out);
	
    wire wire1;
    assign wire1 = ~(in1^in2);
    assign out   = wire1^in3;
endmodule
