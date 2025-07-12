`timescale 1ns/1ps
`include "day11.sv"

module seq_detect_tb();
logic clk = 0, rst, data;
logic detected;

seq_detect SEQ_DETECT(.clk(clk), .rst(rst), .data(data), .detected(detected));

always #5 clk = ~clk;

initial begin
    rst = 1; data = 0;
    @(posedge clk);
    @(posedge clk);
    rst = 0; 
    
    // Send correct sequence: 1101_1001
    @(negedge clk); data = 1; // 1st bit: 1
    @(negedge clk); data = 1; // 2nd bit: 1
    @(negedge clk); data = 0; // 3rd bit: 0
    @(negedge clk); data = 1; // 4th bit: 1
    @(negedge clk); data = 1; // 5th bit: 1
    @(negedge clk); data = 0; // 6th bit: 0
    @(negedge clk); data = 0; // 7th bit: 0
    @(negedge clk); data = 1; // 8th bit: 1 (complete sequence)
    
    repeat(3) @(posedge clk); // Wait to see detection
    
    // Test with some random data after detection
    @(negedge clk); data = 0;
    @(negedge clk); data = 1;
    @(negedge clk); data = 0;
    
    repeat(5) @(posedge clk);
    $finish();
end

initial begin
    $dumpfile("seq_detect_tb.vcd");
    $dumpvars(0, seq_detect_tb);
end
endmodule