// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg state;
    //wire next_state;
    parameter A= 1'b0,B= 1'b1;

    //assign out = state ? 1 : 0;
    
    //combinational logic
 always @ (state or in)
   begin
   	case(state)
   		1'b0: if(in == 1) begin
      				next_state <= A;
   					end else
     	 				next_state <= B;
   		1'b1: if(in == 1)
       				next_state <= B;
   					else
           		next_state <= A;
   		default: next_state <= 1'b0;
   endcase
  end
            
  //Sequential logic
	always @ (posedge clk)
		begin
    	if(reset) begin
      	state <= B;
      	out <= 1;
    	end
    	else
        begin
					case(state)
						A: if(in) begin
    						state <= A;
              	out <= 0;
							end else begin
    						state <= B;
                out <= 1;
              end
            B: if(in) begin
    						state <= B;
                out <= 1;
               end  else begin
        				state <= A;
               	out <= 0;
              end
					default: state <= 1'b0;
		 endcase
 		end
	end
            
  //output logic
  always @ (posedge clk)
  	begin
 			if(reset)
  			out <= 1'b1;
  		else
  			begin
  				case(state)
      			A: out <= 1'b0;
      			B: out <= 1'b1;
      			default: out <= 1'b0;
  				endcase
  			end
  	end
endmodule
