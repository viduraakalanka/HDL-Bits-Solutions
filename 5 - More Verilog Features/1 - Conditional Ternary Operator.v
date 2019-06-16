module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    
    wire [7:0] int1, int2;
    
    //condition ? if_true : if_false
    assign int1 = (a<b)? a:b; 
    assign int2 = (int1<c)? int1:c;
    assign min  = (int2<d)? int2:d;
endmodule
