module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [31:0] q_next;
    
    //NOTE: In a primitive shift register, the values are shifted by 1 every clock cycle. We make use of the same property here to define a combinational block feeding the values into the D-FF. The only change occurs in the value of inputs to the D-FF having taps
    
    always @ (*)
        begin
            q_next = q[31:1];
            q_next[31] = q[0];
            q_next[21] = q[22] ^ q[0];
            q_next[1]  = q[2] ^ q[0];
            q_next[0]  = q[1] ^ q[0];
        end

    always @ (posedge clk)
        begin
            if(reset)
                q <= 32'b1;
            else
                q <= q_next;
        end
    
endmodule

