`timescale 1ns/1ps
`include "day12.sv"

module priority_arbiter_tb();
    localparam NUM_PORTS = 4;
    
    logic clk = 0, rst;
    logic [NUM_PORTS-1:0] req;
    logic [NUM_PORTS-1:0] grant;

    priority_arbiter #(NUM_PORTS) ARBITER(.clk(clk), .rst(rst), .req(req), .grant(grant));

    always #5 clk = ~clk;

    initial begin
        rst = 1; req = 0;
        @(posedge clk);
        @(posedge clk);
        rst = 0;

        for (int i = 0; i < 16; i++) begin
            @(negedge clk);
            req = $urandom_range(0, (1 << NUM_PORTS) - 1); 
        end
        $finish();
    end

    initial begin
        $dumpfile("priority_arbiter_tb.vcd");
        $dumpvars(0, priority_arbiter_tb);
    end
endmodule