module dmem(
   input clk,
   input [4:0] r_addr,
   input [4:0] w_addr,
   input [31:0] data_in,
   input read,
   input write,
   output [31:0] data_out
);
   reg [31:0] dynamic_mem [63:0];

   always @ (posedge clk) begin //write
      if(write && !read) begin
         dynamic_mem[w_addr] <= data_in;
      end
   end
   assign data_out = read && !write ? dynamic_mem[r_addr] :  0;
endmodule