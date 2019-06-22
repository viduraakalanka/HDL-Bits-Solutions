module top_module( 
    input a, b, cin,
    output cout, sum );
    
	assign cout = a&b | b&cin | a&cin;
	assign sum  = a^b^cin;
endmodule