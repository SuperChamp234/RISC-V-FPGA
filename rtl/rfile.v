module rfile(
   input clk,
   input reset,
   input [4:0] src_rs1,
   input [4:0] src_rs2,
   input [4:0] rd,
   input signed [31:0] rd_data,
   input rd_valid,
   input rs1_valid,
   input rs2_valid,
   output signed [31:0] rs1,
   output signed [31:0] rs2
   
);
   reg signed [31:0] reg_file [31:0];
   
   reg [5:0] i;
   always @ (posedge clk) begin
      if(reset) begin
         for(i =0;i<=31;i=i+1) begin
            reg_file[i] <= 0;
         end
      end
      else if(rd_valid) begin
         reg_file[rd] = rd_data;
      end
   end
   assign rs1 = rs1_valid ? reg_file[src_rs1] : 0;
   assign rs2 = rs2_valid ? reg_file[src_rs2] : 0;
endmodule