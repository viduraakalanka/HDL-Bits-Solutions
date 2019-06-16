module top_module (
    input [7:0] in,
    output parity); 
    //even parity is calculated by XOR ing all the data bits
    
    assign parity = ^in;

endmodule
