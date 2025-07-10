// rising and falling edge detector

module edge_detector(input clk, input rst, input d, output r_edge, output f_edge);
logic d_prev;

always_ff @(posedge clk or posedge rst) begin
    if (rst) d_prev <= 1'b0;
    else d_prev <= d;
end

assign r_edge = (d==1'b1 && d_prev==1'b0) ? 1'b1 : 1'b0;
assign f_edge = (d==1'b0 && d_prev==1'b1) ? 1'b1 : 1'b0;

endmodule