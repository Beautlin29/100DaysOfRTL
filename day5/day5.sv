// an odd counter

module odd_counter(input clk, rst, output logic [7:0]count);

logic [7:0] nxt_count;

always_ff @(posedge clk or posedge rst) begin
    if (rst) count <= 8'h1;
    else count <= nxt_count;
end

assign nxt_count = count + 8'h2;

endmodule