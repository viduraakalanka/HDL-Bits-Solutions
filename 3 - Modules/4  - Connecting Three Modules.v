module top_module ( input clk, input d, output q );
    wire con1,con2;
    
    my_dff d_flop1(.clk(clk),.d(d),.q(con1));
    my_dff d_flop2(.clk(clk),.d(con1),.q(con2));
    my_dff d_flop3(.clk(clk),.d(con2),.q(q));
endmodule