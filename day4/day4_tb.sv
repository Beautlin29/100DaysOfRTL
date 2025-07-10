`timescale 1ns/1ps
`include "day4.sv"

module alu_tb();
logic [7:0] a, b, out;
logic [2:0] op;

alu ALU(.a(a), .b(b), .op(op), .out(out));

initial begin
    for(int j=0; j<3; j++) begin
        for(int i=0; i<8; i++) begin
            a = $urandom_range(0, 255);
            b = $urandom_range(0, 255);
            op = i[2:0];
            #10;
        end
    end
end

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);
end

endmodule