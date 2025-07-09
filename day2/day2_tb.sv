`timescale 1ns/1ps
`include "day2.sv"

module dff_tb;
  logic clk = 0;         
  logic rst;
  logic d;
  logic dff_norst;
  logic dff_synrst;
  logic dff_asyrst;

  dff DFF (.*);         

  always  #5 clk = ~clk; 

  initial begin
    rst = 1'b1;
    d   = 1'b0;
    @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
    d   = 1'b1;
    @(posedge clk); @(posedge clk);
    @(negedge clk);
    rst = 1'b1;
    @(posedge clk); @(posedge clk);
    rst = 1'b0;
    @(posedge clk); @(posedge clk);
    $finish;
  end

  // Dump VCD
  initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, dff_tb);
  end

endmodule
