module binToGray #(parameter WID = 4)(input wire [WID-1:0]bin, output wire [WID-1:0]gray);
    // Gray code conversion: G[i] = B[i] ^ B[i+1]
    assign gray[WID-1] = bin[WID-1]; 
    genvar i;
    generate
        for (i = WID-2; i >= 0; i--) begin 
            assign gray[i] = bin[i] ^ bin[i+1];
        end
    endgenerate
endmodule