module imem(
   input clk,
   input reset,
   input [31:0] address,
   input [31:0] data_in,
   input rw,
   output [31:0] data_out
);
   reg [31:0] ins_mem [63:0];
   reg [31:0] data_out_reg;
   reg [7:0] i;
   
   initial begin
      ins_mem[0] = 32'h0;
      ins_mem[1] = 32'h00108093;//addi x1, x1, 1
      ins_mem[2] = 32'h00110113;//addi x2, x2, 1
      ins_mem[3] = 32'h00208133;//add x2, x1, x2
      ins_mem[4] = 32'h002080b3;//add x1, x1, x2
      ins_mem[5] = 32'hffdff1ef;//jal x3, -4
   end
   
   always @ (posedge clk or posedge reset) begin
      if(reset) begin
         ins_mem[0] <= 0;
         data_out_reg <= 0;
      end
      else begin
         if(~rw) begin
            ins_mem[address[4:0]] <= data_in;
            data_out_reg <= 0;
         end
//         else if(rw) begin
//            data_out_reg <= ins_mem[address[4:0]];
//         end
      end
   end
   assign data_out = rw ? ins_mem[address[4:0]] : 0;
endmodule