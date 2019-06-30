module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    
    always @ (posedge clk, posedge ar) begin
        if (ar) q<=1'b0;
        else q<=d;
        
    end
endmodule
