module top_module (
    //clocking signal cannot  be referenced anywhere in the always block 
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @ (posedge clk or posedge areset ) begin
        //this is an active high  asynchronous reset
        if (areset==1'b1) q<= 1'b0;
        else q <= d;
    end
endmodule