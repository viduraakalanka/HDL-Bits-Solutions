module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
	always @ (posedge clk) begin
        //this is an active high  synchronous reset
        if (reset) q<=1'b0;
        else q <= d;
    end
endmodule