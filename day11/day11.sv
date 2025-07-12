module seq_detect(input wire clk, rst, data, output wire detected);
// Sequence Detector for "1101_1001" pattern
localparam SEQ = 8'b1101_1001;

logic [7:0]shift_reg;
logic [7:0]next_shift;

always_ff @(posedge clk or posedge rst) begin
    if (rst) shift_reg <= 8'h00;
    else shift_reg <= next_shift;
end

assign next_shift = {shift_reg[6:0], data};
assign detected = (shift_reg == SEQ);

endmodule