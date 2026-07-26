`timescale 1ns / 1ps
module fetch_unit(
    input clk,
    input reset,
    output [3:0] pc_out,
    output [7:0] instruction_out
);
    reg [3:0] pc;
    reg [7:0] ir;
    reg [7:0] instr_mem [0:15];
    initial begin
        instr_mem[0]  = 8'b00000001; // ADD R0,R1
        instr_mem[1]  = 8'b00010110; // SUB R1,R2
        instr_mem[2]  = 8'b00101011; // AND R2,R3
        instr_mem[3]  = 8'b00111100; // OR  R3,R0
        instr_mem[4]  = 8'b01000001; // MOV R0,R1
        instr_mem[5]  = 8'b01000010; // MOV R0,R2
        instr_mem[6]  = 8'b01000011; // MOV R0,R3
        instr_mem[7]  = 8'b11110000; // NOP
        instr_mem[8]  = 8'b00000001;
        instr_mem[9]  = 8'b00010110;
        instr_mem[10] = 8'b00101011;
        instr_mem[11] = 8'b00111100;
        instr_mem[12] = 8'b01000001;
        instr_mem[13] = 8'b01010010;
        instr_mem[14] = 8'b01100111;
        instr_mem[15] = 8'b11110000;
    end

    // Fetch Operation
    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            pc <= 4'b0000;
            ir <= 8'b00000000;
        end
        else
        begin
            ir <= instr_mem[pc];  // Fetch instruction
            pc <= pc + 1'b1;      // Increment PC
        end
    end

    assign pc_out = pc;
    assign instruction_out = ir;

endmodule