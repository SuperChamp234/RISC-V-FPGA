module decoder(
   input clk,
   input  [31:0] instr,
   output reg [4:0] rs2,
   output reg [4:0] rs1,
   output [31:0] imm,
   output reg [4:0] rd,
   output reg [2:0] func3,
   output reg [6:0] func7,
   output rd_valid,
   output rs1_valid,
   output rs2_valid,
   output func3_valid,
   output func7_valid,
   output imm_valid,
   output [37:0] instr_bus
);
     reg is_r_instr, is_u_instr, is_i_instr, is_s_instr, is_b_instr, is_j_instr, is_i1_instr, is_i2_instr;
     reg [6:0] opcode;
     reg [7:0] i;
     
//   initial begin
//      assign func7_valid = 0;
//      assign rs2_valid = 0;
//      assign rs1_valid = 0;
//      assign rd_valid = 0;
//      assign func3_valid = 0;
//      assign imm_valid = 0;
//      assign imm = 32'b0;
//      
//      for(i=0;i<38;i=i+1) begin
//         assign instr_bus[i] = 0;
//      end
//   end
      
     
   always @ (posedge clk) begin
      
      //determine the type of instruction
      is_r_instr <= instr[6:0] == 7'b0110011;
      is_i_instr <= (instr[6:0] == 7'b0010011) || (instr[6: 0] == 7'b1100111) || (instr[6:0] == 7'b0000011);
      is_i1_instr <= instr[6:0] == 7'b0010011;
      is_i2_instr <= instr[6:0] == 7'b0000011;
      is_s_instr <= instr[6:0] == 7'b0100011;
      is_b_instr <= instr[6:0] == 7'b1100011;
      is_j_instr <= instr[6:0] == 7'b1101111;
      is_u_instr <= (instr[6:0] == 7'b0010111) || (instr[6:0] == 7'b0110111);
      
      //store the different types of existing fields
      rs2 <= instr[24:20];
      rs1 <= instr[19:15];
      func3 <= instr[14:12];
      rd <= instr[11:7];
      func7 <= instr[31:25];
      opcode <= instr[6:0];      
//      if(is_r_instr) begin
//         func7_valid <= 1;
//         rs2_valid <= 1;
//         rs1_valid <= 1;
//         rd_valid <= 1;
//         func3_valid <= 1;
//         imm_valid <= 0;
//         imm <= 32'd0;
//      end
//      else if(is_i_instr) begin
//         func7_valid <= 0;
//         rs2_valid <= 0;
//         rs1_valid <= 1;
//         rd_valid <= 1;
//         func3_valid <= 1;
//         imm_valid <= 1;
//         imm <= {{20{1'b0}},instr[31:20]};
//      end
//      else if(is_s_instr) begin
//         func7_valid <= 0;
//         rs2_valid <= 1;
//         rs1_valid <= 1;
//         rd_valid <= 0;
//         func3_valid <= 1;
//         imm_valid <= 1;
//         imm <= {{21{instr[31]}}, instr[30:25], instr[11:7]};
//      end
//      else if(is_b_instr) begin
//         func7_valid <= 0;
//         rs2_valid <= 1;
//         rs1_valid <= 1;
//         rd_valid <= 0;
//         func3_valid <= 1;
//         imm_valid <= 1;
//         imm <= { {20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
//      end
//      else if(is_u_instr) begin
//         func7_valid <= 0;
//         rs2_valid <= 0;
//         rs1_valid <= 0;
//         rd_valid <= 1;
//         func3_valid <= 0;
//         imm_valid <= 1;
//         imm <= { instr[31:12], 12'b0 };
//      end
//      else if(is_j_instr) begin
//         func7_valid <= 0;
//         rs2_valid <= 0;
//         rs1_valid <= 0;
//         rd_valid <= 1;
//         func3_valid <= 0;
//         imm_valid <= 1;
//         imm <= { { { { { {12{instr[31]}} , instr[19:12] } , instr[20] } , instr[30:25] } , instr[24:21] }, 1'b0};
//      end
//      
//      temp_imm  <= {imm[5],imm[6], imm[7], imm[8], imm[9], imm[10], imm[11]};
//      
//      instr_bus[0] <= (is_r_instr && (func3 == 3'h0) && (func7==7'h00)); //add
//      instr_bus[1] <= (is_r_instr && (func3 == 3'h0) && (func7==7'h20)); //sub
//      instr_bus[2] <= (is_r_instr && (func3 == 3'h4) && (func7==7'h00)); //xor
//      instr_bus[3] <= (is_r_instr && (func3 == 3'h6) && (func7==7'h00)); //or
//      instr_bus[4] <= (is_r_instr && (func3 == 3'h7) && (func7==7'h00)); //and
//      instr_bus[5] <= (is_r_instr && (func3 == 3'h1) && (func7==7'h00)); //sll
//      instr_bus[6] <= (is_r_instr && (func3 == 3'h5) && (func7==7'h00)); //srl
//      instr_bus[7] <= (is_r_instr && (func3 == 3'h5) && (func7==7'h20)); //sra
//      instr_bus[8] <= (is_r_instr && (func3 == 3'h2) && (func7==7'h00)); //slt
//      instr_bus[9] <= (is_r_instr && (func3 == 3'h3) && (func7==7'h00)); //sltu
//      
//      instr_bus[10] <= (is_i1_instr && (func3 == 3'h0)); //addi
//      instr_bus[11] <= (is_i1_instr && (func3 == 3'h4)); //xori
//      instr_bus[12] <= (is_i1_instr && (func3 == 3'h6)); //ori
//      instr_bus[13] <= (is_i1_instr && (func3 == 3'h7)); //andi
//      instr_bus[14] <= (is_i1_instr && (func3 == 3'h1) && (temp_imm == 7'h00)); //slli
//      instr_bus[15] <= (is_i1_instr && (func3 == 3'h5) && (temp_imm == 7'h00)); //srli
//      instr_bus[16] <= (is_i1_instr && (func3 == 3'h5) && (temp_imm == 7'h20)); //slai
//      instr_bus[17] <= (is_i1_instr && (func3 == 3'h2)); //slti
//      instr_bus[18] <= (is_i1_instr && (func3 == 3'h3)); //sltui
//      
//      instr_bus[19] <= (is_i2_instr && (func3 == 3'h0)); //lb
//      instr_bus[20] <= (is_i2_instr && (func3 == 3'h1)); //lh
//      instr_bus[21] <= (is_i2_instr && (func3 == 3'h2)); //lw
//      instr_bus[22] <= (is_i2_instr && (func3 == 3'h3)); //lbu
//      instr_bus[23] <= (is_i2_instr && (func3 == 3'h4)); //lhu
//      
//      instr_bus[24] <= (is_s_instr && (func3 == 3'h0)); //sb
//      instr_bus[25] <= (is_s_instr && (func3 == 3'h1)); //sh
//      instr_bus[26] <= (is_s_instr && (func3 == 3'h2)); //sw
//      
//      
//      instr_bus[27] <= (is_b_instr && (func3 == 3'h0)); //beq
//      instr_bus[28] <= (is_b_instr && (func3 == 3'h1)); //bne
//      instr_bus[29] <= (is_b_instr && (func3 == 3'h4)); //blt
//      instr_bus[30] <= (is_b_instr && (func3 == 3'h5)); //bge
//      instr_bus[31] <= (is_b_instr && (func3 == 3'h6)); //bltu
//      instr_bus[32] <= (is_b_instr && (func3 == 3'h7)); //bgeu
//      
//      instr_bus[33] <= (is_j_instr); //jar
//      instr_bus[34] <= ((instr[6:0] == 7'b1100111) && (func3 == 3'h0)); //jalr
//   
//      instr_bus[35] <= ((instr[6:0] == 7'b0110111)); //lui
//      instr_bus[36] <= ((instr[6:0] == 7'b0010111)); //auipc
      
    end
    
    decoder_ext Extension1( .imm(imm), .instr(instr), .is_r_instr(is_r_instr), .is_s_instr(is_s_instr), .is_i_instr(is_i_instr), .is_b_instr(is_b_instr), .is_u_instr(is_u_instr), .is_j_instr(is_j_instr), .rd_valid(rd_valid), .rs1_valid(rs1_valid), .rs2_valid(rs2_valid), .func3_valid(func3_valid), .func7_valid(func7_valid), .imm_valid(imm_valid), .instr_bus(instr_bus));
      
endmodule
   