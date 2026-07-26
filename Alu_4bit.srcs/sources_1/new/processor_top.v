`timescale 1ns / 1ps

module Alu_4bit(
    input clk,
    input reset
);

    // Fetch -> Decode
    wire [7:0] instruction;
    wire [3:0] pc;

    // Decode -> Execute
    wire [3:0] opcode;
    wire [3:0] operand_a;
    wire [3:0] operand_b;
    wire [1:0] rd;
    wire [1:0] rs;

    // Execute -> Write Back
    wire [3:0] result;
    wire [1:0] dest_reg;
    wire zero_flag;
    wire carry_flag;

    // Write Back -> Decode
    wire reg_write;
    wire [1:0] write_addr;
    wire [3:0] write_data;

    // Fetch Unit
    fetch_unit FETCH(
        .clk(clk),
        .reset(reset),
        .pc_out(pc),
        .instruction_out(instruction)
    );

    // Decode Unit
    decode_unit DECODE(
        .clk(clk),
        .reset(reset),
        .instr_in(instruction),

        .reg_write(reg_write),
        .write_addr(write_addr),
        .write_data(write_data),

        .opcode(opcode),
        .rd(rd),
        .rs(rs),
        .operand_a(operand_a),
        .operand_b(operand_b)
    );

    // Execute Unit
    execute_unit EXECUTE(
        .opcode(opcode),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .rd(rd),

        .result(result),
        .dest_reg(dest_reg),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag)
    );
    assign reg_write  = 1'b1;
    assign write_addr = dest_reg;
    assign write_data = result;
endmodule
