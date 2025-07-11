`timescale 1ns/1ps
`include "day7.sv"

module lfsr_tb();
logic clk=0, rst;
logic [3:0] lfsr;

lfsr LFSR(.clk(clk), .rst(rst), .lfsr(lfsr));
always #5 clk = ~clk;

initial begin
    rst = 1;
    @(posedge clk);
    @(posedge clk);
    rst = 0; 
    repeat(10) @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("lfsr_tb.vcd");
    $dumpvars(0, lfsr_tb);
end

endmodule