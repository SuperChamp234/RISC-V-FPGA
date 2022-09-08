module PC(
  input clk,
  input rst,
  input j_signal,
  input [31:0] jump,
  output[31:0] next_pc
);
  reg [31:0] next_pc_reg;
  always @ ( posedge clk) begin
    if(rst)
      next_pc_reg <= 32'd0;
    else if(j_signal)
      next_pc_reg <= j_signal;
    else
      next_pc_reg <= next_pc_reg + 1;
  end
  assign next_pc = next_pc_reg;
endmodule