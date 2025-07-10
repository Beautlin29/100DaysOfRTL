`timescale 1ns/1ps
`include "day3.sv"
module edge_detector_tb();
logic clk = 0;
logic rst;
logic d;
logic r_edge;
logic f_edge;

edge_detector ED (.clk(clk), .rst(rst), .d(d), .r_edge(r_edge), .f_edge(f_edge));

always  #5 clk = ~clk;

initial begin
    rst <= 1'b1;
    d <= 1'b1;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      d <= $random%2;
      @(posedge clk);
    end
    $finish();
end

initial begin
    $dumpfile("edge_detector_tb.vcd");
    $dumpvars(0, edge_detector_tb);
end

endmodule