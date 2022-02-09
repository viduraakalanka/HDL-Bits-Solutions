module one_bit_FA(
    input a,b,
    input cin,
    output cout,sum);
	
    assign sum  = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    /*
    genvar i;
    
    one_bit_FA FA1(a[0],b[0],cin,cout[0],sum[0]);
    
    //this is a generte block
    //The loop generate construct provides an easy and concise method to create multiple instances 
    //of module items such as module instances, assign statements, assertions, interface instances 
    //In essence generate block is a special type of for loop with the loop index variable of datatype genvar.
    generate
        for (i=1; i<100; i=i+1) begin : Full_adder_block
        one_bit_FA FA(a[i],b[i],cout[i-1],cout[i],sum[i]);
    end
    endgenerate
    */
    one_bit_FA adder_100 [99:0] (a,b,{cout[98:0],cin},sum,cout);
endmodule