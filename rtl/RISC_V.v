module RISC_V(
    input clk,
    input [31:0] instr,
    input [31:0] pc,
    output [31:0] next_pc,
    output pc_j_valid,
    output read,
    output write,
    output [31:0] addr,
    output [31:0] write_data_mem,
    output [31:0] ALUoutput
);

wire reset = 0;

//all wires to and from decoder
wire [31:0] rs2;
wire [31:0] rs1;
wire signed [31:0] imm;
wire [31:0] rd;
wire [2:0] func3;
wire [6:0] func7;
wire rd_valid;
wire rs1_valid;
wire rs2_valid;
wire func3_valid;
wire func7_valid;
wire imm_valid;
wire [37:0] instr_bus;

//control unit wires
wire signed [31:0] rs1_value;
wire signed [31:0] rs2_value;
wire rs1_read, rs2_read;


decoder dc1(.clk(clk), .instr(instr), 
            .rs2(rs2), .rs1(rs1), .imm(imm), 
            .rd(rd), .func3(func3), .func7(func7), 
            .rd_valid(rd_valid), .rs1_valid(rs1_valid), 
            .rs2_valid(rs2_valid), .func3_valid(func3_valid), 
            .imm_valid(imm_valid), .instr_bus(instr_bus));

rfile reg_file_1(.clk(clk), .reset(reset), 
                     .rs1_addr(rs1), .rs2_addr(rs2), 
                     .rd(rd),
                     //.rd_data(rd_data), .rd_write(rd_write), no write implemented
                     .read_rs1(rs1_read), .read_rs2(rs2_read),
                     .rs1(rs1_value), .rs2(rs2_value));

control_unit cu1(.clk(clk),
                .rs1_valid(rs1_valid), .rs2_valid(rs2_valid),
                .rs1_value(rs1_value), .rs2_value(rs2_value),
                .imm(imm), .instr_bus(instr_bus), .pc(pc),
                .next_pc(next_pc),
                .rs1_read(rs1_read), .rs2_read(rs2_read),
                .pc_j_valid(pc_j_valid));
                //.rd(rd)) dangling

ALU ALU1(.rs1(rs1_value), .rs2(rs2_value),
        .imm(imm), .instr_bus(instr_bus),
        .read(read), .write(write),
        .addr(addr), .ALUoutput(ALUoutput));
        

endmodule