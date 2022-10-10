// Copyright (C) 2019  Intel Corporation. All rights reserved.
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
// VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
// CREATED		"Sun Oct  9 23:24:31 2022"

module RISC_V(
	clk,
	reset,
	rw,
	D1BB0,
	D1BB1,
	D1BB2,
	D1BB3,
	D1BB4,
	D1BB5,
	D1BB6,
	D2BB0,
	D2BB1,
	D2BB2,
	D2BB3,
	D2BB4,
	D2BB5,
	D2BB6,
	D3BB0,
	D3BB1,
	D3BB2,
	D3BB3,
	D3BB4,
	D3BB5,
	D3BB6,
	D4BB0,
	D4BB1,
	D4BB2,
	D4BB3,
	D4BB4,
	D4BB5,
	D4BB6
);


input wire	clk;
input wire	reset;
input wire	rw;
output wire	D1BB0;
output wire	D1BB1;
output wire	D1BB2;
output wire	D1BB3;
output wire	D1BB4;
output wire	D1BB5;
output wire	D1BB6;
output wire	D2BB0;
output wire	D2BB1;
output wire	D2BB2;
output wire	D2BB3;
output wire	D2BB4;
output wire	D2BB5;
output wire	D2BB6;
output wire	D3BB0;
output wire	D3BB1;
output wire	D3BB2;
output wire	D3BB3;
output wire	D3BB4;
output wire	D3BB5;
output wire	D3BB6;
output wire	D4BB0;
output wire	D4BB1;
output wire	D4BB2;
output wire	D4BB3;
output wire	D4BB4;
output wire	D4BB5;
output wire	D4BB6;

wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[36:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_40;
wire	[31:0] SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[2:0] SYNTHESIZED_WIRE_13;
wire	[6:0] SYNTHESIZED_WIRE_14;
wire	[36:0] SYNTHESIZED_WIRE_16;
wire	[6:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_42;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;





ALU	b2v_alu1(
	.clk(clk),
	.ALUenable(SYNTHESIZED_WIRE_0),
	.imm(SYNTHESIZED_WIRE_38),
	.instr_bus(SYNTHESIZED_WIRE_2),
	.pc(SYNTHESIZED_WIRE_39),
	.read_data_dmem(SYNTHESIZED_WIRE_4),
	.rs1(SYNTHESIZED_WIRE_40),
	.rs2(SYNTHESIZED_WIRE_41),
	.read_dmem(SYNTHESIZED_WIRE_22),
	.write_dmem(SYNTHESIZED_WIRE_23),
	.ALUready(SYNTHESIZED_WIRE_9),
	.addr_dmem(SYNTHESIZED_WIRE_42),
	.ALUoutput(SYNTHESIZED_WIRE_12),
	.write_data_dmem(SYNTHESIZED_WIRE_24));


control_unit	b2v_cu1(
	.clk(clk),
	.rs1_valid(SYNTHESIZED_WIRE_7),
	.rs2_valid(SYNTHESIZED_WIRE_8),
	.ALUready(SYNTHESIZED_WIRE_9),
	.rd_valid(SYNTHESIZED_WIRE_10),
	.imm_valid(SYNTHESIZED_WIRE_11),
	.ALUoutput(SYNTHESIZED_WIRE_12),
	.func3(SYNTHESIZED_WIRE_13),
	.func7(SYNTHESIZED_WIRE_14),
	.imm(SYNTHESIZED_WIRE_38),
	.instr_bus(SYNTHESIZED_WIRE_16),
	.opcode(SYNTHESIZED_WIRE_17),
	.pc(SYNTHESIZED_WIRE_39),
	.rs1_value(SYNTHESIZED_WIRE_40),
	.rs2_value(SYNTHESIZED_WIRE_41),
	.rs1_read(SYNTHESIZED_WIRE_32),
	.rs2_read(SYNTHESIZED_WIRE_33),
	.pc_j_valid(SYNTHESIZED_WIRE_29),
	.rd_write(SYNTHESIZED_WIRE_31),
	.ALUenable(SYNTHESIZED_WIRE_0),
	.ALU_instr_bus(SYNTHESIZED_WIRE_2),
	.display_out(SYNTHESIZED_WIRE_28),
	.next_pc(SYNTHESIZED_WIRE_30),
	.rd_data(SYNTHESIZED_WIRE_35));


decoder	b2v_dec1(
	.clk(clk),
	.instr(SYNTHESIZED_WIRE_21),
	.rd_valid(SYNTHESIZED_WIRE_10),
	.rs1_valid(SYNTHESIZED_WIRE_7),
	.rs2_valid(SYNTHESIZED_WIRE_8),
	
	
	.imm_valid(SYNTHESIZED_WIRE_11),
	.func3(SYNTHESIZED_WIRE_13),
	.func7(SYNTHESIZED_WIRE_14),
	.imm(SYNTHESIZED_WIRE_38),
	.instr_bus(SYNTHESIZED_WIRE_16),
	.opcode(SYNTHESIZED_WIRE_17),
	.rd(SYNTHESIZED_WIRE_34),
	.rs1(SYNTHESIZED_WIRE_36),
	.rs2(SYNTHESIZED_WIRE_37));


dmem	b2v_dmem1(
	.clk(clk),
	.read(SYNTHESIZED_WIRE_22),
	.write(SYNTHESIZED_WIRE_23),
	.data_in(SYNTHESIZED_WIRE_24),
	.r_addr(SYNTHESIZED_WIRE_42),
	.w_addr(SYNTHESIZED_WIRE_42),
	.data_out(SYNTHESIZED_WIRE_4));


imem	b2v_imem1(
	.clk(clk),
	.reset(reset),
	.rw(rw),
	.address(SYNTHESIZED_WIRE_39),
	.data_out(SYNTHESIZED_WIRE_21));


sev_seg_disp	b2v_inst(
	.ALUoutput(SYNTHESIZED_WIRE_28),
	.D1BB0(D1BB0),
	.D1BB1(D1BB1),
	.D1BB2(D1BB2),
	.D1BB3(D1BB3),
	.D1BB4(D1BB4),
	.D1BB5(D1BB5),
	.D1BB6(D1BB6),
	.D2BB0(D2BB0),
	.D2BB1(D2BB1),
	.D2BB2(D2BB2),
	.D2BB3(D2BB3),
	.D2BB4(D2BB4),
	.D2BB5(D2BB5),
	.D2BB6(D2BB6),
	.D3BB0(D3BB0),
	.D3BB1(D3BB1),
	.D3BB2(D3BB2),
	.D3BB3(D3BB3),
	.D3BB4(D3BB4),
	.D3BB5(D3BB5),
	.D3BB6(D3BB6),
	.D4BB0(D4BB0),
	.D4BB1(D4BB1),
	.D4BB2(D4BB2),
	.D4BB3(D4BB3),
	.D4BB4(D4BB4),
	.D4BB5(D4BB5),
	.D4BB6(D4BB6));


PC	b2v_pc1(
	.clk(clk),
	.rst(reset),
	.j_signal(SYNTHESIZED_WIRE_29),
	.jump(SYNTHESIZED_WIRE_30),
	.next_pc(SYNTHESIZED_WIRE_39));


rfile	b2v_rfile1(
	.clk(clk),
	.reset(reset),
	.rd_write(SYNTHESIZED_WIRE_31),
	.read_rs1(SYNTHESIZED_WIRE_32),
	.read_rs2(SYNTHESIZED_WIRE_33),
	.rd(SYNTHESIZED_WIRE_34),
	.rd_data(SYNTHESIZED_WIRE_35),
	.rs1_addr(SYNTHESIZED_WIRE_36),
	.rs2_addr(SYNTHESIZED_WIRE_37),
	
	.rs1(SYNTHESIZED_WIRE_40),
	.rs2(SYNTHESIZED_WIRE_41));


endmodule
