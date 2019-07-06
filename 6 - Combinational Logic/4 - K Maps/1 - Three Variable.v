module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = a&(~b)&(~c) | c | b&(~c);
endmodule