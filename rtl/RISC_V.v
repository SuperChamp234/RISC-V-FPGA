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
// CREATED		"Fri Sep 23 23:26:47 2022"

module RISC_V(
	clk,
	reset
);


input wire	clk;
input wire	reset;

wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[36:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;





ALU	b2v_alu1(
	.clk(clk),
	.imm(SYNTHESIZED_WIRE_32),
	.instr_bus(SYNTHESIZED_WIRE_33),
	.pc(SYNTHESIZED_WIRE_34),
	.read_data_dmem(SYNTHESIZED_WIRE_3),
	.rs1(SYNTHESIZED_WIRE_35),
	.rs2(SYNTHESIZED_WIRE_36),
	.read_dmem(SYNTHESIZED_WIRE_17),
	.write_dmem(SYNTHESIZED_WIRE_18),
	.ALUready(SYNTHESIZED_WIRE_8),
	.addr_dmem(SYNTHESIZED_WIRE_37),
	.ALUoutput(SYNTHESIZED_WIRE_10),
	.write_data_dmem(SYNTHESIZED_WIRE_19));


control_unit	b2v_cu1(
	.clk(clk),
	.rs1_valid(SYNTHESIZED_WIRE_6),
	.rs2_valid(SYNTHESIZED_WIRE_7),
	.ALUready(SYNTHESIZED_WIRE_8),
	.rd_valid(SYNTHESIZED_WIRE_9),
	.ALUoutput(SYNTHESIZED_WIRE_10),
	.imm(SYNTHESIZED_WIRE_32),
	.instr_bus(SYNTHESIZED_WIRE_33),
	.pc(SYNTHESIZED_WIRE_34),
	.rs1_value(SYNTHESIZED_WIRE_35),
	.rs2_value(SYNTHESIZED_WIRE_36),
	.rs1_read(SYNTHESIZED_WIRE_26),
	.rs2_read(SYNTHESIZED_WIRE_27),
	.pc_j_valid(SYNTHESIZED_WIRE_23),
	.rd_write(SYNTHESIZED_WIRE_25),
	.next_pc(SYNTHESIZED_WIRE_24),
	.rd_data(SYNTHESIZED_WIRE_29));


decoder	b2v_dec1(
	.clk(clk),
	.instr(SYNTHESIZED_WIRE_16),
	.rd_valid(SYNTHESIZED_WIRE_9),
	.rs1_valid(SYNTHESIZED_WIRE_6),
	.rs2_valid(SYNTHESIZED_WIRE_7),
	
	
	
	
	
	.imm(SYNTHESIZED_WIRE_32),
	.instr_bus(SYNTHESIZED_WIRE_33),
	.rd(SYNTHESIZED_WIRE_28),
	.rs1(SYNTHESIZED_WIRE_30),
	.rs2(SYNTHESIZED_WIRE_31));


dmem	b2v_dmem1(
	.clk(clk),
	.read(SYNTHESIZED_WIRE_17),
	.write(SYNTHESIZED_WIRE_18),
	.data_in(SYNTHESIZED_WIRE_19),
	.r_addr(SYNTHESIZED_WIRE_37),
	.w_addr(SYNTHESIZED_WIRE_37),
	.data_out(SYNTHESIZED_WIRE_3));


imem	b2v_imem1(
	.clk(clk),
	.reset(reset),
	.data_in(0),
	.address(SYNTHESIZED_WIRE_34),
	.rw(1),
	.data_out(SYNTHESIZED_WIRE_16));


PC	b2v_pc1(
	.clk(clk),
	.rst(reset),
	.j_signal(SYNTHESIZED_WIRE_23),
	.jump(SYNTHESIZED_WIRE_24),
	.next_pc(SYNTHESIZED_WIRE_34));


rfile	b2v_rfile1(
	.clk(clk),
	.reset(reset),
	.rd_write(SYNTHESIZED_WIRE_25),
	.read_rs1(SYNTHESIZED_WIRE_26),
	.read_rs2(SYNTHESIZED_WIRE_27),
	.rd(SYNTHESIZED_WIRE_28),
	.rd_data(SYNTHESIZED_WIRE_29),
	.rs1_addr(SYNTHESIZED_WIRE_30),
	.rs2_addr(SYNTHESIZED_WIRE_31),
	.rs1(SYNTHESIZED_WIRE_35),
	.rs2(SYNTHESIZED_WIRE_36));


endmodule
