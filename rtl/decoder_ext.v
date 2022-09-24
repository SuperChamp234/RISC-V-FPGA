module decoder_ext(
   input  [31:0] instr,
   input is_r_instr,
   input is_s_instr,
   input is_i_instr,
   input is_b_instr,
   input is_u_instr,
   input is_j_instr,
   output rd_valid,
   output rs1_valid,
   output rs2_valid,
   output func3_valid,
   output func7_valid,
   output imm_valid,
   output signed [31:0] imm,
   output [36:0] instr_bus
);
   wire is_i1_instr, is_i2_instr;
   wire [4:0] func3;
   wire [8:0] func7;
   wire [6:0] temp_imm;
   assign is_i1_instr = instr[6:0] == 7'b0010011;
   assign is_i2_instr = instr[6:0] == 7'b0000011;
   assign func3 = instr[14:12];
   assign func7 = instr[31:25];
   assign func7_valid = is_r_instr;
   assign rs2_valid = is_r_instr || is_s_instr || is_b_instr;
   assign rs1_valid = is_r_instr || is_i_instr || is_s_instr || is_b_instr;
   assign rd_valid = is_r_instr || is_i_instr || is_u_instr || is_j_instr;
   assign func3_valid = rs1_valid;
   assign imm_valid = ~is_r_instr;
   
   assign imm  = is_i_instr ? {   {21{instr[31]}},  instr[30:20]  } :
                is_s_instr ? {{21{instr[31]}}, instr[30:25], instr[11:7]} :
                is_b_instr ? { {20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0} :
                is_u_instr ? { instr[31:12], 12'b0 } :
                is_j_instr ? { { { { { {12{instr[31]}} , instr[19:12] } , instr[20] } , instr[30:25] } , instr[24:21] }, 1'b0} :
                32'b0;
   
   assign temp_imm = {imm[5],imm[6], imm[7], imm[8], imm[9], imm[10], imm[11]};
   
   assign instr_bus[0] = (is_r_instr && (func3 == 3'h0) && (func7==7'h00))  ? 1'b1 : 1'b0; //add
   assign instr_bus[1] = (is_r_instr && (func3 == 3'h0) && (func7==7'h20))  ? 1'b1 : 1'b0; //sub
   assign instr_bus[2] = (is_r_instr && (func3 == 3'h4) && (func7==7'h00))  ? 1'b1 : 1'b0; //xor
   assign instr_bus[3] = (is_r_instr && (func3 == 3'h6) && (func7==7'h00))  ? 1'b1 : 1'b0; //or
   assign instr_bus[4] = (is_r_instr && (func3 == 3'h7) && (func7==7'h00))  ? 1'b1 : 1'b0; //and
   assign instr_bus[5] = (is_r_instr && (func3 == 3'h1) && (func7==7'h00))  ? 1'b1 : 1'b0; //sll
   assign instr_bus[6] = (is_r_instr && (func3 == 3'h5) && (func7==7'h00))  ? 1'b1 : 1'b0; //srl
   assign instr_bus[7] = (is_r_instr && (func3 == 3'h5) && (func7==7'h20))  ? 1'b1 : 1'b0; //sra
   assign instr_bus[8] = (is_r_instr && (func3 == 3'h2) && (func7==7'h00))  ? 1'b1 : 1'b0; //slt
   assign instr_bus[9] = (is_r_instr && (func3 == 3'h3) && (func7==7'h00))  ? 1'b1 : 1'b0; //sltu
   
   assign instr_bus[10] = (is_i1_instr && (func3 == 3'h0))  ? 1'b1 : 1'b0; //addi
   assign instr_bus[11] = (is_i1_instr && (func3 == 3'h4))  ? 1'b1 : 1'b0; //xori
   assign instr_bus[12] = (is_i1_instr && (func3 == 3'h6))  ? 1'b1 : 1'b0; //ori
   assign instr_bus[13] = (is_i1_instr && (func3 == 3'h7))  ? 1'b1 : 1'b0; //andi
   assign instr_bus[14] = (is_i1_instr && (func3 == 3'h1) && (temp_imm == 7'h00))  ? 1'b1 : 1'b0; //slli
   assign instr_bus[15] = (is_i1_instr && (func3 == 3'h5) && (temp_imm == 7'h00))  ? 1'b1 : 1'b0; //srli
   assign instr_bus[16] = (is_i1_instr && (func3 == 3'h5) && (temp_imm == 7'h20))  ? 1'b1 : 1'b0; //slai
   assign instr_bus[17] = (is_i1_instr && (func3 == 3'h2))  ? 1'b1 : 1'b0; //slti
   assign instr_bus[18] = (is_i1_instr && (func3 == 3'h3))  ? 1'b1 : 1'b0; //sltui
   
   assign instr_bus[19] = (is_i2_instr && (func3 == 3'h0))  ? 1'b1 : 1'b0; //lb
   assign instr_bus[20] = (is_i2_instr && (func3 == 3'h1))  ? 1'b1 : 1'b0; //lh
   assign instr_bus[21] = (is_i2_instr && (func3 == 3'h2))  ? 1'b1 : 1'b0; //lw
   assign instr_bus[22] = (is_i2_instr && (func3 == 3'h3))  ? 1'b1 : 1'b0; //lbu
   assign instr_bus[23] = (is_i2_instr && (func3 == 3'h4))  ? 1'b1 : 1'b0; //lhu
   
   assign instr_bus[24] = (is_s_instr && (func3 == 3'h0))  ? 1'b1 : 1'b0; //sb
   assign instr_bus[25] = (is_s_instr && (func3 == 3'h1))  ? 1'b1 : 1'b0; //sh
   assign instr_bus[26] = (is_s_instr && (func3 == 3'h2))  ? 1'b1 : 1'b0; //sw
   
   
   assign instr_bus[27] = (is_b_instr && (func3 == 3'h0))  ? 1'b1 : 1'b0; //beq
   assign instr_bus[28] = (is_b_instr && (func3 == 3'h1))  ? 1'b1 : 1'b0; //bne
   assign instr_bus[29] = (is_b_instr && (func3 == 3'h4))  ? 1'b1 : 1'b0; //blt
   assign instr_bus[30] = (is_b_instr && (func3 == 3'h5))  ? 1'b1 : 1'b0; //bge
   assign instr_bus[31] = (is_b_instr && (func3 == 3'h6))  ? 1'b1 : 1'b0; //bltu
   assign instr_bus[32] = (is_b_instr && (func3 == 3'h7))  ? 1'b1 : 1'b0; //bgeu
   
   assign instr_bus[33] = (is_j_instr)  ? 1'b1 : 1'b0; //jar
   assign instr_bus[34] = ((instr[6:0] == 7'b1100111) && (func3 == 3'h0))  ? 1'b1 : 1'b0; //jalr

   assign instr_bus[35] = ((instr[6:0] == 7'b0110111))  ? 1'b1 : 1'b0; //lui
   assign instr_bus[36] = ((instr[6:0] == 7'b0010111))  ? 1'b1 : 1'b0; //auipc

endmodule