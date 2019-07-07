module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    assign out = ({8{sel}} & a) | ({8{~sel}} & b);

endmodule