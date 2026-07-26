`timescale 1ns / 1ps
module Alu_4bit_tb;

    reg clk;
    reg reset;

    // Instantiate Processor
    Alu_4bit DUT(
        .clk(clk),
        .reset(reset)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #200;

        $finish;
    end

    initial
    begin
       $monitor(
"t=%0t PC=%d Instr=%b Opcode=%b A=%d B=%d Result=%d",
$time,
DUT.pc,
DUT.instruction,
DUT.opcode,
DUT.operand_a,
DUT.operand_b,
DUT.result
);
    end

endmodule
