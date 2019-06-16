module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
	
    always @ (scancode) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case (scancode)
            16'he06b:begin
                up = 1'b0; down = 1'b0; left = 1'b1; right = 1'b0;
            end
            16'he072:begin
                up = 1'b0; down = 1'b1; left = 1'b0; right = 1'b0;
            end
            16'he074:begin
                up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b1;
            end
            16'he075:begin
                up = 1'b1; down = 1'b0; left = 1'b0; right = 1'b0;
            end
                
        endcase
    end
endmodule
