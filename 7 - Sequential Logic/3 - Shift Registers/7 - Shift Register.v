module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] outReg;
    
    always @ (posedge clk)
        begin
        if(~resetn)
                outReg[3] <= 0;
            else
                begin
                    outReg <= {in,outReg[2:0]};
                end
        end 
    assign out = outReg[0];
endmodule


