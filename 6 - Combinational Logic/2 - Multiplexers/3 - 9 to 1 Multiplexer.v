module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
  
    always @ * begin
  
        case (sel)
            4'b0000 : out = a;
            4'b0001 : out = b;
            4'b0010 : out = c;
            4'b0011 : out = d;
            4'b0100 : out = e;
            4'b0101 : out = f;
            4'b0110 : out = g;
            4'b0111 : out = h;
            4'b1000 : out = i;
            default : out = {16{1'b1}};
        endcase
    end

endmodule