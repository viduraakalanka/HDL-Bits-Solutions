module top_module ( 
    //designing a  7458  chip
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	
    wire and3_wire_a, and3_wire_b, and2_wire_c, and2_wire_d;
    
    assign and3_wire_a = p1a && p1b && p1c;
    assign and3_wire_b = p1d && p1e && p1f;
    assign and2_wire_c = p2a && p2b;
    assign and2_wire_d = p2c && p2d;
    
    assign p1y = and3_wire_a || and3_wire_b;
    assign p2y = and2_wire_c || and2_wire_d;
    

endmodule
