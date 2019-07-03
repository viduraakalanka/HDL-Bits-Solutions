module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
  	reg [7:0]intermediate;
    
    always @ (posedge clk) begin
        intermediate   <= in;
        anyedge        <= intermediate ^ in;
    end
endmodule
