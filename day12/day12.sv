// Priority Arbiter 
// Highest priority - 0

module priority_arbiter #(parameter NUM_PORTS = 4)
        (input wire clk, rst, input wire [NUM_PORTS-1:0]req, output wire [NUM_PORTS-1:0]grant);

assign grant[0] = req[0];

genvar i;
generate
    for(i=1; i<NUM_PORTS; i++) begin
        assign grant[i] = req[i] & ~(|req[i-1:0]);
    end
endgenerate
endmodule