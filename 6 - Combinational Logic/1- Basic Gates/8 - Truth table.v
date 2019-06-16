module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
	//here sum of products is used
    assign f = (~x3&x2&~x1) | (~x3&x2&x1) | (x3&~x2&x1) | (x3&x2&x1);
endmodule
