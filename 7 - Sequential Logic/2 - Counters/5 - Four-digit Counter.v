module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 9) ? 1 : 0;
    assign ena[2] = ((q[7:4] == 9) && ena[1]) ? 1 : 0;
    assign ena[3] = ((q[11:8] == 9) && ena[2]) ? 1 : 0;
    
    count_bcd c0(clk,reset,1,q[3:0]);
    count_bcd c1(clk,reset,ena[1],q[7:4]);
    count_bcd c2(clk,reset,ena[2],q[11:8]);
    count_bcd c3(clk,reset,ena[3],q[15:12]);

endmodule

module count_bcd (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output [3:0] q);

    always@(posedge clk)
        begin
            if(reset)
            	q <= 0;
            else if (ena)
            	if(q == 9)
            		q <= 0;
           		else
                q <= q + 1;
            else
                q <= q;
        end    	
endmodule
