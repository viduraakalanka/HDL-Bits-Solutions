module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    
    // casez treats bits that have the value z as don't-care in the comparison.
    
    //Notice how there are certain inputs (e.g., 4'b1111) that will match more than one case item. 
    //The first match is chosen (so 4'b1111 matches the first item, out = 0, but not any of the later ones).
	
    //There is also a similar casex that treats both x and z as don't-care. I don't see much purpose to using it over casez.
	//The digit ? is a synonym for z. so 2'bz0 is the same as 2'b?0
    
    always @(*) begin
       	casez (in[7:0])
            8'bzzzzzzz1: pos = 0;
            8'bzzzzzz1z: pos = 1;
            8'bzzzzz1zz: pos = 2;
            8'bzzzz1zzz: pos = 3;
            8'bzzz1zzzz: pos = 4;
            8'bzz1zzzzz: pos = 5;
            8'bz1zzzzzz: pos = 6;
            8'b1zzzzzzz: pos = 7;
            default: 	 pos = 0;
    	endcase
	end
endmodule
