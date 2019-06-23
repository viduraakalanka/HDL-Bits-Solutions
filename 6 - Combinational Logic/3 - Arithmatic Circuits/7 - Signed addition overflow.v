module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 	//2's complement for a binary number is found by inverting the numbers and adding 1
    //	i.e: 2'scomplement of 0011 is : 1100+0001 =  1101
    //
    //Also remember that MSB of the 2's complement number represents  the sign. i.e if MSB is one then the number is -ve
    //	i.e: 1101 = -8+4+0+1=-3
    //
    //If 2= 0010 then -2= 1101+1 = 1110
    //Also 2+(-2) = 1111 (This property holds for all the numbers)
    //
    //While adding two 2's complement numbers, overflow can be detected two ways:
    //	1. If carryout and crry-on to  MSB are different then overflow occured
    //  2. If both numbers are +ve and result is-ve or vise versa, overflow occurs
    
    assign s = a+b;
    assign overflow = a[7]&&b[7]&&(~s[7]) || (~a[7])&&(~b[7])&&(s[7]); 

endmodule



module top_m( 
    input a, b, cin,
    output cout, sum );
    
	assign cout = a&b | b&cin | a&cin;
	assign sum  = a^b^cin;
endmodule