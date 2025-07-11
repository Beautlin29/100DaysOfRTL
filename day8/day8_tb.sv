`timescale 1ns/1ps
`include "day8.sv"

module binToOneHot_tb();

    localparam BIN = 4;
    localparam ONEHOT = 16;

    logic [BIN-1:0] bin;
    logic [ONEHOT-1:0] onehot;

    binToOneHot #(BIN, ONEHOT) BTOH(.bin(bin), .onehot(onehot));

    initial begin
        for (int i = 0; i < 16; i++) begin
            bin = i;
            #10;
            $display("bin = %d (0x%h), onehot = %b (0x%h)", bin, bin, onehot, onehot);
        end
        $finish();
    end

    initial begin
        $dumpfile("binToOneHot_tb.vcd");
        $dumpvars(0, binToOneHot_tb);
    end
endmodule