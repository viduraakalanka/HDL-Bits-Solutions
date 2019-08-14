module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    wire [7:0] qOut;
    wire [2:0] sel;
    assign sel = {A,B,C};
    
    d_ff mem(clk,enable,S,qOut);
    
    always @ (*)
        begin
            case(sel)
                3'b000: Z = qOut[0];
                3'b001: Z = qOut[1];
                3'b010: Z = qOut[2];
                3'b011: Z = qOut[3];
                3'b100: Z = qOut[4];
                3'b101: Z = qOut[5];
                3'b110: Z = qOut[6];
                3'b111: Z = qOut[7];
            endcase
        end
endmodule

module d_ff(
    input clk,
input en,
input s,
    output [7:0] q);
    
    always @ (posedge clk)
        begin
            if(en)
                q <= {q[6:0],s};
            else
                q <= q;
        end
endmodule


