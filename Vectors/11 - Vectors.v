module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
	
    //Notice that the declaration of a vector places the dimensions before the name of the vector, which is unusual 
    //compared to C syntax. However, the part select has the dimensions after the vector name as you would expect.
    
    //declaring something "input" or "output" automatically declares it  as a wire
    
    assign outv = vec;
    assign   o0 = vec[0];
    assign   o1 = vec[1];
    assign   o2 = vec[2];
    
endmodule
