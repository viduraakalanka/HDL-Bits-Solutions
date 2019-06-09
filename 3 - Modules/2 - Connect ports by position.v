module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    //connect module by position
    mod_a inst_1(out1,out2,a,b,c,d);

endmodule