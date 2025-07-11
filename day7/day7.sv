// Linear Feedback Shift Register

module lfsr(input wire clk, rst, output wire [3:0]lfsr);
logic [3:0]lfsr_prev, lfsr_next;

// lfsr[0] = lfsr[3] ^ lfsr[1]
always_ff @(posedge clk or posedge rst) begin
    if (rst) lfsr_prev <= 4'hE;  // Use E instead of 0 to avoid lock-up
    else lfsr_prev <= lfsr_next;
end

assign lfsr_next = {lfsr_prev[2:0], lfsr_prev[3] ^ lfsr_prev[1]};
assign lfsr = lfsr_prev;

endmodule