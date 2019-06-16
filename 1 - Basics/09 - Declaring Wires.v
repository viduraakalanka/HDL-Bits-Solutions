`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	
    wire int1,int2;
    
    assign int1 = a&b;
    assign int2 = c&d;
    assign out = int1|int2;
    assign out_n = ~out;
    
endmodule
