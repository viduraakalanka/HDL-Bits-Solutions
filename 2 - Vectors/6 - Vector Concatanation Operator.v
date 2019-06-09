module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//
	//Concatenation needs to know the width of every component (or how would you know the length of the result?). 
    //Thus, {1, 2, 3} is illegal and results in the error message: unsized constants are not allowed in concatenations.
	//The concatenation operator can be used on both the left and right sides of assignments.
    
    wire [31:0] concat_reg; //raise an error when work with reg. Reason unknown???
    assign concat_reg = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};
    assign w = concat_reg[31:24];
    assign x = concat_reg[23:16];
    assign y = concat_reg[15:8];
    assign z = concat_reg[7:0];

endmodule
