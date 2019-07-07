module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); 

    wire [7:0] mux_con_0, mux_con_1;
    mux2 mux_inst_0 ( sel[0],    a,    b, mux_con_0 );
    mux2 mux_inst_1 ( sel[0],    c,    d, mux_con_1 );
    mux2 mux_inst_2 ( sel[1], mux_con_0, mux_con_1,  out );

endmodule