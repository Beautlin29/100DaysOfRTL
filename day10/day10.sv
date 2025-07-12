// counter with load

module counter_load(input wire clk, rst, load, input wire [3:0]load_value, output wire [3:0]count);

logic [3:0]count_reg;

always_ff @(posedge clk or posedge rst) begin
    if (rst) 
        count_reg <= 4'h0;
    else if (load) 
        count_reg <= load_value;
    else 
        count_reg <= (count_reg == 4'hF) ? 4'h0 : count_reg + 1;
end

assign count = count_reg;

endmodule