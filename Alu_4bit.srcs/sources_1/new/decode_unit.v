`timescale 1ns / 1ps
module decode_unit(
input clk,reset,
input [7:0] instr_in, input reg_write,
input [1:0] write_addr,
input [3:0] write_data,
output[3:0] opcode,
output[1:0] rd,rs,
output[3:0] operand_a,operand_b 
    );
    reg [3:0] reg_file[0:3];
    integer i;
    assign opcode = instr_in[7:4];
    assign rd = instr_in[3:2];
    assign rs = instr_in[1:0];
    assign operand_a = reg_file[rd];
    assign operand_b = reg_file[rs];
   always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        reg_file[0] <= 4'd5;
        reg_file[1] <= 4'd3;
        reg_file[2] <= 4'd2;
        reg_file[3] <= 4'd1;
    end
    else if(reg_write)
    begin
        reg_file[write_addr] <= write_data;
    end
end
endmodule
