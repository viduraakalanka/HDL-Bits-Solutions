module top_module (input a, input b, input c, output out);//
	wire con;
    andgate inst1 ( con, a, b, c, 1'b1, 1'b1);
    assign out = ~con;

endmodule
