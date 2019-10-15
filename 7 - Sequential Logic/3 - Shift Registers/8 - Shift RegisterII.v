module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    // MUXDFF modn(clk,w,r,l,e,qin,qout)
    MUXDFF mod1(KEY[0], LEDR[1], SW[0], KEY[2], KEY[1], LEDR[0], LEDR[0]);
    MUXDFF mod2(KEY[0], LEDR[2], SW[1], KEY[2], KEY[1], LEDR[1], LEDR[1]);
    MUXDFF mod3(KEY[0], LEDR[3], SW[2], KEY[2], KEY[1], LEDR[2], LEDR[2]);
    MUXDFF mod4(KEY[0], KEY[3], SW[3], KEY[2], KEY[1], LEDR[3], LEDR[3]);

endmodule

module MUXDFF (
    input clk,
    input w,
input r,
input l,
input e,
    input qin,
output qout);
    
    wire mux1Out,mux2Out;
    
    assign mux1Out = e ? w : qin;
    assign mux2Out = l ? r: mux1Out;
    
    always @ (posedge clk)
        qout <=mux2Out;

endmodule


