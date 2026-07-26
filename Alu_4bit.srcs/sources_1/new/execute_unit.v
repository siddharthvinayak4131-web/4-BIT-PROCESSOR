`timescale 1ns / 1ps

module execute_unit(
    input  [3:0] opcode,
    input  [3:0] operand_a,
    input  [3:0] operand_b,
    input  [1:0] rd,

    output reg [3:0] result,
    output [1:0] dest_reg,
    output zero_flag,
    output carry_flag
);

    // Opcode Definitions
    localparam ADD    = 4'b0000;
    localparam SUB    = 4'b0001;
    localparam AND_OP = 4'b0010;
    localparam OR_OP  = 4'b0011;
    localparam MOV    = 4'b0100;
    localparam NOP    = 4'b1111;

    // Used for carry generation
    reg [4:0] temp_result;

    // ALU
    always @(*)
    begin
        temp_result = 5'b00000;
        result      = 4'b0000;

        case(opcode)

            ADD:
            begin
                temp_result = operand_a + operand_b;
                result      = temp_result[3:0];
            end

            SUB:
            begin
                temp_result = operand_a - operand_b;
                result      = temp_result[3:0];
            end

            AND_OP:
            begin
                result = operand_a & operand_b;
            end

            OR_OP:
            begin
                result = operand_a | operand_b;
            end

            MOV:
            begin
                result = operand_b;
            end

            NOP:
            begin
                result = 4'b0000;
            end

            default:
            begin
                result = 4'b0000;
            end

        endcase
    end

    // Destination Register forwarded to Write Back
    assign dest_reg = rd;

    // Status Flags
    assign zero_flag  = (result == 4'b0000);
    assign carry_flag = temp_result[4];

endmodule