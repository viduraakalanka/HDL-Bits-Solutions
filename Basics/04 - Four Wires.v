module top_module( input a,b,c,output w,x,y,z );
    
    assign w = a; //assign statements are executed in parallel
    assign x = b;
    assign y = b;
    assign z = c;
endmodule
