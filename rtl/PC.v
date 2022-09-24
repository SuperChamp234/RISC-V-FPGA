module PC(
  input clk,
  input rst,
  input j_signal,
  input [31:0] jump,
  output[31:0] next_pc
);
  reg [31:0] next_pc_reg;
  reg [31:0] cyc_4;
  
  initial begin
   next_pc_reg <= 1;
   cyc_4 <= 0;
  end
  always @ (posedge clk) begin
    if(rst)
      next_pc_reg <= 31'd0;
    else if(j_signal)
      next_pc_reg <= j_signal;
    else if(cyc_4 == 32'd4) begin
      next_pc_reg <= next_pc_reg + 1;
      cyc_4 <= 0;
    end
    else
      cyc_4 <= cyc_4 + 1;
  end
  assign next_pc = next_pc_reg;
endmodule