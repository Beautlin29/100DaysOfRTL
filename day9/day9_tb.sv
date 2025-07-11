`timescale 1ns/1ps  
`include "day9.sv"

module binToGray_tb();
    localparam WID = 4;

    logic [WID-1:0] bin;
    logic [WID-1:0] gray;

    binToGray #(WID) B2G(.bin(bin), .gray(gray));

    initial begin
        for (int i = 0; i < (1 << WID); i++) begin
            bin = i;
            #10;
            $display("bin = %d (0x%h), gray = %b (0x%h)", bin, bin, gray, gray);
        end
        $finish();
    end

    initial begin
        $dumpfile("binToGray_tb.vcd");
        $dumpvars(0, binToGray_tb);
    end
endmodule