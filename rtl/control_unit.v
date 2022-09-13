module control_unit(
    input clk,
    input signed [31:0] rs2_value,
    input signed [31:0] rs1_value,
    input signed [31:0] imm,
    input rs1_valid,
    input rs2_valid,
    input [37:0] instr_bus,
    input [31:0] pc,
    output rs1_read,
    output rs2_read,
    output reg [31:0] next_pc,
    output reg pc_j_valid
);
    assign rs2_read = rs2_valid;
    assign rs1_read = rs1_valid;
    always @ (posedge clk) begin
        pc_j_valid <= 0;
        if(instr_bus[27] == 1) begin //beq
            if(rs1_value == rs2_value) begin
                next_pc <= pc + imm;
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[28] == 1) begin //bne
            if(rs1_value != rs2_value) begin
                next_pc <= pc + imm;
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[29] == 1) begin //blt
            if(rs1_value < rs2_value) begin
                next_pc <= pc + imm;
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[30] == 1) begin //bge
            if(rs1_value >= rs2_value) begin
                next_pc <= pc + imm;
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[31] == 1) begin //bltu - review required
            if(rs1_value < rs2_value) begin
                next_pc <= pc + {19'b0 , imm[12:0]};
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[32] == 1) begin //bgeu - review required
            if(rs1_value >= rs2_value) begin
                next_pc <= pc + {19'b0 , imm[12:0]};
                pc_j_valid <= 1;
            end
        end
        else if(instr_bus[33] == 1)begin //jal
            next_pc <= pc + imm;
            pc_j_valid <= 1;
        end
        else if(instr_bus[34] == 1) begin //jalr
            next_pc <= rs1_value + imm;
            pc_j_valid <= 1;
        end
    end

endmodule