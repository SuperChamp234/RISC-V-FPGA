// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Mon Sep 26 23:57:52 2022"

module RISC_V(
	clk,
	reset,
	rw,
	imem_write_data
);


input wire	clk;
input wire	reset;
input wire	rw;
input wire	[31:0] imem_write_data;

wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[36:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[36:0] SYNTHESIZED_WIRE_13;
wire	[6:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;





ALU	b2v_alu1(
	.clk(clk),
	.ALUenable(SYNTHESIZED_WIRE_0),
	.imm(SYNTHESIZED_WIRE_34),
	.instr_bus(SYNTHESIZED_WIRE_2),
	.pc(SYNTHESIZED_WIRE_35),
	.read_data_dmem(SYNTHESIZED_WIRE_4),
	.rs1(SYNTHESIZED_WIRE_36),
	.rs2(SYNTHESIZED_WIRE_37),
	.read_dmem(SYNTHESIZED_WIRE_19),
	.write_dmem(SYNTHESIZED_WIRE_20),
	.ALUready(SYNTHESIZED_WIRE_9),
	.addr_dmem(SYNTHESIZED_WIRE_38),
	.ALUoutput(SYNTHESIZED_WIRE_11),
	.write_data_dmem(SYNTHESIZED_WIRE_21));


control_unit	b2v_cu1(
	.clk(clk),
	.rs1_valid(SYNTHESIZED_WIRE_7),
	.rs2_valid(SYNTHESIZED_WIRE_8),
	.ALUready(SYNTHESIZED_WIRE_9),
	.rd_valid(SYNTHESIZED_WIRE_10),
	.ALUoutput(SYNTHESIZED_WIRE_11),
	.imm(SYNTHESIZED_WIRE_34),
	.instr_bus(SYNTHESIZED_WIRE_13),
	.opcode(SYNTHESIZED_WIRE_14),
	.pc(SYNTHESIZED_WIRE_35),
	.rs1_value(SYNTHESIZED_WIRE_36),
	.rs2_value(SYNTHESIZED_WIRE_37),
	.rs1_read(SYNTHESIZED_WIRE_28),
	.rs2_read(SYNTHESIZED_WIRE_29),
	.pc_j_valid(SYNTHESIZED_WIRE_25),
	.rd_write(SYNTHESIZED_WIRE_27),
	.ALUenable(SYNTHESIZED_WIRE_0),
	.ALU_instr_bus(SYNTHESIZED_WIRE_2),
	.next_pc(SYNTHESIZED_WIRE_26),
	.rd_data(SYNTHESIZED_WIRE_31));


decoder	b2v_dec1(
	.clk(clk),
	.instr(SYNTHESIZED_WIRE_18),
	.rd_valid(SYNTHESIZED_WIRE_10),
	.rs1_valid(SYNTHESIZED_WIRE_7),
	.rs2_valid(SYNTHESIZED_WIRE_8),
	
	
	
	
	
	.imm(SYNTHESIZED_WIRE_34),
	.instr_bus(SYNTHESIZED_WIRE_13),
	.opcode(SYNTHESIZED_WIRE_14),
	.rd(SYNTHESIZED_WIRE_30),
	.rs1(SYNTHESIZED_WIRE_32),
	.rs2(SYNTHESIZED_WIRE_33));


dmem	b2v_dmem1(
	.clk(clk),
	.read(SYNTHESIZED_WIRE_19),
	.write(SYNTHESIZED_WIRE_20),
	.data_in(SYNTHESIZED_WIRE_21),
	.r_addr(SYNTHESIZED_WIRE_38),
	.w_addr(SYNTHESIZED_WIRE_38),
	.data_out(SYNTHESIZED_WIRE_4));


imem	b2v_imem1(
	.clk(clk),
	.reset(reset),
	.rw(rw),
	.address(SYNTHESIZED_WIRE_35),
	.data_in(imem_write_data),
	.data_out(SYNTHESIZED_WIRE_18));


PC	b2v_pc1(
	.clk(clk),
	.rst(reset),
	.j_signal(SYNTHESIZED_WIRE_25),
	.jump(SYNTHESIZED_WIRE_26),
	.next_pc(SYNTHESIZED_WIRE_35));


rfile	b2v_rfile1(
	.clk(clk),
	.reset(reset),
	.rd_write(SYNTHESIZED_WIRE_27),
	.read_rs1(SYNTHESIZED_WIRE_28),
	.read_rs2(SYNTHESIZED_WIRE_29),
	.rd(SYNTHESIZED_WIRE_30),
	.rd_data(SYNTHESIZED_WIRE_31),
	.rs1_addr(SYNTHESIZED_WIRE_32),
	.rs2_addr(SYNTHESIZED_WIRE_33),
	
	.rs1(SYNTHESIZED_WIRE_36),
	.rs2(SYNTHESIZED_WIRE_37));


endmodule
