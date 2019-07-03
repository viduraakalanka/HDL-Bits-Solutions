module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]intermediate;
    
    always @ (posedge clk) begin
        intermediate <= in;
        pedge        <= (~intermediate) & in;
    end

endmodule
