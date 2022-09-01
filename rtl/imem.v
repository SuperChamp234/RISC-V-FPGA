module imem(
   input clk,
   input reset,
   input [4:0] address,
   input [31:0] data_in,
   input rw,
   output [31:0] data_out
);
   reg [31:0] ins_mem [63:0];
   reg [31:0] data_out_reg;
   reg [7:0] i;
   always @ (posedge clk or posedge reset) begin
      if(reset) begin
         for(i =0;i<=63;i=i+1) begin
            ins_mem[i] <= 0;
         end
         data_out_reg <= 0;
      end
      else begin
         if(~rw) begin
            ins_mem[address] <= data_in;
            data_out_reg <= 0;
         end
         else if(rw) begin
            data_out_reg <= ins_mem[address];
         end
      end
   end
   assign data_out = data_out_reg;
endmodule