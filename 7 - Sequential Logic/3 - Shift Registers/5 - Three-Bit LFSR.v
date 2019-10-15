module top_module (
input [2:0] SW,      // R
input [1:0] KEY,     // L and clk
output [2:0] LEDR);  // Q

    reg [2:0] LEDR_Next;
    
    // NOTE: KEY[0] = CLK, KEY[1] = L;
    always @(*)
        begin
            LEDR_Next[0] = KEY[1] ? SW[0] : LEDR[2];
            LEDR_Next[1] = KEY[1] ? SW[1] : LEDR[0];
            LEDR_Next[2] = KEY[1] ? SW[2] : LEDR[1] ^ LEDR[2];
        end
    
    always @ (posedge KEY[0])
        begin
            LEDR <= LEDR_Next;
        end

endmodule

