module rfile(
   input clk,
   input reset,
   input [31:0] rs1_addr,
   input [31:0] rs2_addr,
   input [31:0] rd,
   input signed [31:0] rd_data,
   input rd_write,
   input read_rs1,
   input read_rs2,
   output signed [31:0] rs1,
   output signed [31:0] rs2
   
);
   reg signed [31:0] reg_file [31:0];
   reg [7:0] i;
   
   initial begin
      for (i = 0; i<32; i=i+1) begin
         reg_file[i] <= 0;
      end
   end
   
   assign rs1 = read_rs1 ? reg_file[rs1_addr[4:0]] : 0;
   assign rs2 = read_rs2 ? reg_file[rs2_addr[4:0]] : 0;

   
   always @ (posedge clk) begin
      //rs1 <= read_rs1 ? reg_file[rs1_addr[4:0]]: 0;
      //rs2 <= read_rs2 ? reg_file[rs2_addr[4:0]]: 0;
      if(rd_write) begin
         reg_file[rd[4:0]] <= rd_data;
      end
   end
   
endmodule