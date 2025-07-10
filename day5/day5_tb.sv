`timescale 1ns/1ps
`include "day5.sv"

module odd_counter_tb();
logic clk = 0, rst;
logic [7:0] count;

odd_counter OC(.clk(clk), .rst(rst), .count(count));

always #5 clk = ~clk;

initial begin
    rst <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    rst <= 1'b0;
    for (int i=0; i<128; i++)
      @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("odd_counter_tb.vcd");
    $dumpvars(0, odd_counter_tb);
end

endmodule