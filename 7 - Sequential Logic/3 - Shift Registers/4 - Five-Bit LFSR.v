module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire in1,in2,in3,in4,in5;
    
    assign in1 = reset ? 1'b1 : q[1];
    assign in2 = reset ? 1'b0 : q[2];
    assign in3 = reset ? 1'b0 : q[3] ^ q[0];
    assign in4 = reset ? 1'b0 : q[4];
    assign in5 = reset ? 1'b0 : q[0] ^ 1'b0;
        
    d_ff ff1(clk,in1,q[0]);
    d_ff ff2(clk,in2,q[1]);
    d_ff ff3(clk,in3,q[2]);
    d_ff ff4(clk,in4,q[3]);
    d_ff ff5(clk,in5,q[4]);

endmodule

module d_ff(
input clk,
    input d,
    output q
);
    always @ (posedge clk)
        begin
            q <= d;
        end
endmodule


