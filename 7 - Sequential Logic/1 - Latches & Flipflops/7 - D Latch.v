module top_module (
    input d, 
    input ena,
    output q);
	
    //Latches are level-sensitive (not edge-sensitive) circuits, so in an always block, they use level-sensitive sensitivity lists.
	//However, they are still sequential elements, so should use non-blocking assignments.
	//A D-latch acts like a wire (or non-inverting buffer) when enabled, and preserves the current value when disabled.

    always @ (*) begin
        if (ena) q<=d;
    end

endmodule