module dmem(
   input clk,
   input [31:0] r_addr,
   input [31:0] w_addr,
   input [31:0] data_in,
   input read,
   input write,
   output [31:0] data_out
);
   reg [31:0] dynamic_mem [63:0];

   initial begin
      dynamic_mem[2] = 32'd2;
      dynamic_mem[3] = 32'd3;
   end
   always @ (posedge clk) begin //write
      if(write && !read) begin
         dynamic_mem[w_addr[4:0]] <= data_in;
      end
   end
   assign data_out = read && !write ? dynamic_mem[r_addr[4:0]] :  0;
endmodule