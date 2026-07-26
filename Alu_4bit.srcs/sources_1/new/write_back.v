`timescale 1ns / 1ps
module writeback_unit(
    input [3:0] result,
    input [1:0] dest_reg,

    output reg_write,
    output [1:0] write_addr,
    output [3:0] write_data
);

    assign reg_write  = 1'b1;
    assign write_addr = dest_reg;
    assign write_data = result;

endmodule