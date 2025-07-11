`timescale 1ns/1ps
`include "day6.sv"

module shift_reg_tb();
logic clk = 0, rst, d_in;
logic [3:0] sr;

shift_reg SR(.clk(clk), .rst(rst), .d_in(d_in), .sr(sr));

always #5 clk = ~clk;

initial begin
    rst = 1; d_in = 0;
    @(posedge clk);
    @(posedge clk);
    rst = 0; 
    @(negedge clk); d_in = 1; 
    @(negedge clk); d_in = 0;
    @(negedge clk); d_in = 1;
    @(negedge clk); d_in = 1;
    repeat(6) @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("shift_reg_tb.vcd");
    $dumpvars(0, shift_reg_tb);
end
    
endmodule