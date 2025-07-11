module binToOneHot #(parameter BIN = 4, parameter ONEHOT = 16) 
    (input wire [BIN-1:0]bin, output wire [ONEHOT-1:0]onehot);
    
    assign onehot = (1 << bin);

endmodule