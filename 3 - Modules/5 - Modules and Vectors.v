module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0]con1,con2,con3;
    
    my_dff8 d_flop1(.clk(clk), .d(d), .q(con1));
    my_dff8 d_flop2(.clk(clk), .d(con1), .q(con2) );
    my_dff8 d_flop3(.clk(clk), .d(con2), .q(con3));
    
    always @ (*) begin
        case(sel)
            0 : q = d ;
            1 : q = con1;
            2 : q = con2;
            3 : q = con3;
        endcase
        
        /*if(sel==2'b00)
            q=d;
        else if( sel == 2'b01)
      		q = con1;
        else if( sel == 2'b10)
      		q = con2;
        else if( sel == 2'b11)
      		q = con3;
 		*/
 	end
    
endmodule