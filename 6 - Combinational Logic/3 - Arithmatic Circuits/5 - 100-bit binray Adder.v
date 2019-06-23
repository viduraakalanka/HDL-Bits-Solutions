module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    genvar i;
    wire [98:0]con_vect;
    one_bit_FA FA1(a[0],b[0],cin,con_vect[0],sum[0]);
    one_bit_FA FA2(a[99],b[99],con_vect[98],cout,sum[99]);
    
    //this is a generte block
    //The loop generate construct provides an easy and concise method to create multiple instances 
    //of module items such as module instances, assign statements, assertions, interface instances 
    //In essence generate block is a special type of for loop with the loop index variable of datatype genvar.
    generate
        for (i=1; i<99; i=i+1) begin : Full_adder_block
            one_bit_FA FA(a[i],b[i],con_vect[i-1],con_vect[i],sum[i]);
    end
    
      
    endgenerate
    
endmodule

module one_bit_FA(
    input a,b,
    input cin,
    output cout,sum);
	
    assign sum  = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule