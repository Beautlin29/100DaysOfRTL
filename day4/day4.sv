// a 8-bit ALU

module alu(input logic[7:0] a, b, input logic[2:0] op, output logic[7:0] out);

    localparam  OP_ADD = 3'b000;
    localparam  OP_SUB = 3'b001;
    localparam  OP_SLL = 3'b010;
    localparam  OP_LSR = 3'b011;
    localparam  OP_AND = 3'b100;
    localparam  OP_OR  = 3'b101;
    localparam  OP_XOR = 3'b110;
    localparam  OP_EQL = 3'b111;

    always_comb begin         
        case(op)
            OP_ADD: out = a+b;
            OP_SUB: out = a-b;
            OP_SLL: out = a << 1; 
            OP_LSR: out = a >> 1; 
            OP_AND: out = a & b;
            OP_OR:  out = a | b;
            OP_XOR: out = a ^ b;
            OP_EQL: out = (a == b) ? 8'h01 : 8'h00; 
            default: out = 8'h00; 
        endcase    
    end
  
endmodule