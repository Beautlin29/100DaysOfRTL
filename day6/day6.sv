module shift_reg(input wire clk, rst, d_in, output wire [3:0]sr);
logic [3:0]sr_prev, sr_next;

always_ff @(posedge clk or posedge rst) begin
    if (rst) sr_prev <= 4'b0000;
    else sr_prev <= sr_next;
end

assign sr_next = {sr_prev[2:0], d_in};
assign sr = sr_prev;
endmodule