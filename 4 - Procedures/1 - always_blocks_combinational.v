// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    //For synthesizing hardware, two types of always blocks are relevant:
    //	Combinational: always @(*)
    //	Clocked: always @(posedge clk)
    //Combinational always blocks are equivalent to assign statements,

    // If you explicitly specify the sensitivity list and miss a signal, the synthesized hardware will still behave as though (*) was specified, 
    //but the simulation will not and not match the hardware's behaviour.
    //why is above??
	
    //A note on wire vs. reg: The left-hand-side of an assign statement must be a net type (e.g., wire), 
    //while the left-hand-side of a procedural assignment (in an always block) must be a variable type (e.g., reg). These types (wire vs. reg) have nothing to do with what hardware is synthesized,
    
    assign out_assign = a&&b;
    
    always @(*) begin
    	out_alwaysblock = a&&b;
    end
    
endmodule