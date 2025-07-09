module dff(input clk, input rst, input d, output reg dff_norst, output reg dff_synrst, output reg dff_asyrst);
    always_ff @(posedge clk) begin 
        dff_norst <= d;        
    end

    always_ff @(posedge clk) begin
        if (rst) dff_synrst <= 1'b0;
        else dff_synrst <= d;
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) dff_asyrst <= 1'b0;
        else dff_asyrst <= d;
    end
endmodule