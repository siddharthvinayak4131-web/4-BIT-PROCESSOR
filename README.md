# 4-Bit Processor Design Using Verilog HDL

## Overview

This project presents the design and implementation of a simple 4-bit processor using Verilog HDL. The processor follows a basic instruction execution cycle consisting of Fetch, Decode, Execute, and Write-Back stages. The design was developed and simulated using Xilinx Vivado.

The objective of this project is to understand the fundamentals of processor architecture, register file operations, instruction execution, ALU design, and hardware verification through simulation.

---

## Processor Architecture

The processor is divided into four major stages:

### 1. Fetch Stage

* Maintains the Program Counter (PC)
* Fetches instructions from Instruction Memory
* Updates PC for the next instruction

### 2. Decode Stage

* Decodes opcode and register fields
* Reads operands from the Register File
* Provides operands to the Execute stage

### 3. Execute Stage

* Performs arithmetic and logical operations
* Generates status flags
* Produces execution results

### 4. Write-Back Stage

* Writes ALU results back to the Register File
* Updates destination registers

---

## Supported Instructions

| Opcode | Instruction | Description  |
| ------ | ----------- | ------------ |
| 0000   | ADD         | Addition     |
| 0001   | SUB         | Subtraction  |
| 0010   | AND         | Bitwise AND  |
| 0011   | OR          | Bitwise OR   |
| 0100   | MOV         | Move Data    |
| 1111   | NOP         | No Operation |

---

## Register File

The processor contains:

* 4 Registers
* 4-bit Register Width
* Two Read Ports
* One Write Port

---

## Project Files

### Source Files

* fetch_unit.v
* decode_unit.v
* execute_unit.v
* write_back.v
* top_alu.v

### Testbench

* top_alu_tb.v

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Git
* GitHub

---

## Simulation Results

The processor was successfully simulated using Vivado Simulator. The waveforms verify:

* Program Counter Operation
* Instruction Fetching
* Instruction Decoding
* ALU Execution
* Register Write-Back

Simulation screenshots are available in the repository.

---

## Learning Outcomes

This project helped in understanding:

* Processor Architecture
* RTL Design Methodology
* Register File Design
* ALU Design
* Verilog HDL Coding
* Functional Verification using Simulation
* Git and GitHub Version Control

---

## Author

Jay Jain

