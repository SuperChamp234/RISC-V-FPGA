module rfile(
   input clk,
   input reset,
   input [4:0] rs1_addr,
   input [4:0] rs2_addr,
   input [4:0] rd,
   input signed [31:0] rd_data,
   input rd_write,
   input read_rs1,
   input read_rs2,
   output signed [31:0] rs1,
   output signed [31:0] rs2
   
);
   reg signed [31:0] reg_file [31:0];
   initial begin
      reg_file[0] = 0;
   end
   always @ (posedge clk) begin
      if(rd_write && !read_rs1 && !read_rs2 && rd != 5'b0) begin
         reg_file[rd] <= rd_data;
      end
   end
   assign rs1 = read_rs1 && !rd_write ? reg_file[rs1_addr] : 0;
   assign rs2 = read_rs2 && !rd_write ? reg_file[rs2_addr] : 0;
endmodule