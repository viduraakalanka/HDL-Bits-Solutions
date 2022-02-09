module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
   
    initial pm = 0;
    
    //counters for seconds
    count_ss_L c_ss_l(clk,reset,ena,ss[3:0]);
    count_ss_H c_ss_h(clk,reset,((ss[3:0] == 9) && ena),ss[7:4]);
    
    //counters for minutes
    count_ss_L c_mm_l(clk,reset,(ena && (ss[3:0] == 9) && (ss[7:4] == 5)),mm[3:0]);
    count_ss_H c_mm_h(clk,reset,(ena && (mm[3:0] == 9) && (ss[3:0] == 9) && (ss[7:4] == 5)),mm[7:4]);
    
    //counters for hours
    count_hh_L c_hh_l(clk,reset,(ena && (mm[3:0] == 9) && (mm[7:4] == 5) && (ss[7:4] == 5) && (ss[3:0] == 9)),(hh[7:4]==1),pm,pm,hh[3:0]);
    count_hh_H c_hh_h(clk,reset,(ena && ((hh[3:0] == 9) || ((hh[7:4] == 1) && (hh[3:0] == 2))) && (mm[3:0] == 9) && (mm[7:4] == 5) 
																																															&& (ss[3:0]==9) && (ss[7:4] == 5)),hh[7:4]);
   
endmodule

module count_hh_L (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    input incr_h,
    input pm_curr,
    output pm_new,
    output [3:0] q);

    always@(posedge clk)
        begin
            if(reset)
             	begin
             		q <= 2;
                pm_new <= 0;
             	end
            else if (ena)
            	begin
              	if((q == 1) && incr_h)
                	begin
                  	 pm_new <= ~ pm_curr;                        
                     q <= q + 1;
                  end
                 else if((q == 2) && incr_h)
                 	begin
                  	q <= 1;
                    pm_new <= pm_curr;
                  end
                 else if(q == 9)
                 	begin
  						 			q <= 0;
                    pm_new <= pm_curr;
                  end
           			 else
                 	begin
               			q <= q + 1;
                    pm_new <= pm_curr;
                  end
                end
            else
            	begin
              	q <= q;
               	pm_new <= pm_curr;
              end
        	end    	
endmodule

module count_hh_H (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output [3:0] q);

    always@(posedge clk)
        begin
            if(reset)
           	 q <= 1;
            else if (ena)
            	if(q == 1)
              	q <= 0;
              else
              	q <= q + 1;
            else
           	 q <= q;
        end    	
endmodule

module count_ss_L (
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

module count_ss_H (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output [3:0] q);

    always@(posedge clk)
        begin
        	if(reset)
          	q <= 0;
          	else if (ena)
            	if(q == 5)
            		q <= 0;
           		else
               	q <= q + 1;
            else
            	q <= q;
        end    	
endmodule
