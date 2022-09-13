module control_unit_tb;

    reg clk;

    reg [31:0] pc;
    wire [31:0] next_pc;
    wire pc_j_valid;
    wire rs1_read; wire rs2_read;
    reg signed [31:0] rs1_value;
    reg signed [31:0] rs2_value;
    reg signed [31:0] imm;
    reg [37:0] instr_bus;
    reg rs1_valid; reg rs2_valid;

    control_unit cu1(.clk(clk), 
                    .rs1_valid(rs1_valid), .rs2_valid(rs2_valid), 
                    .rs1_value(rs1_value), .rs2_value(rs2_value), 
                    .imm(imm), .instr_bus(instr_bus), 
                    .pc(pc), .pc_j_valid(pc_j_valid), .next_pc(next_pc),
                    .rs1_read(rs1_read), .rs2_read(rs2_read));

    initial clk = 0;
    always #10 clk = ~clk;
    initial begin
        instr_bus = 38'b0; #10;
        pc = 1; rs1_valid = 1; rs2_valid = 1; rs1_value = 31'd1; rs2_value = 31'd1; imm = 31'd5;
        instr_bus[27] = 1; #20;
        $stop;
    end

endmodule