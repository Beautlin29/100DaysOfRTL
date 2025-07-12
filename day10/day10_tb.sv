`timescale 1ns/1ps
`include "day10.sv"

module counter_load_tb();
logic clk = 0, rst, load;
logic [3:0] load_value;
logic [3:0] count;

counter_load COUNTER(.clk(clk), .rst(rst), .load(load), .load_value(load_value), .count(count));

always #5 clk = ~clk;

initial begin
    rst = 1; load = 0; load_value = 4'h0;
    @(posedge clk);
    @(posedge clk);
    rst = 0; 
    @(negedge clk); load = 1; load_value = 4'h5; // Load value 5
    @(negedge clk); load = 0;
    
    repeat(16) @(posedge clk); // Count up to 15 and wrap around
    $finish();
end

initial begin
    $dumpfile("counter_load_tb.vcd");
    $dumpvars(0, counter_load_tb);
end
endmodule