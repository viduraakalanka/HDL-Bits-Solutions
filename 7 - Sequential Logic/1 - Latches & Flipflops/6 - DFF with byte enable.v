module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
	always @ (posedge clk) begin
        //this is an active high  synchronous reset
        if (resetn==1'b0) q<= 1'b0;
        else begin
            case(byteena)
				2'b00: q       <= q;
                2'b01: q[7:0]  <= d[7:0];
                2'b10: q[15:8] <= d[15:8];
                2'b11: q       <= d;
            endcase
        end
    end	
endmodule
