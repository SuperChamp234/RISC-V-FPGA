module PC(
  input clk,
  input rst,
  input j_signal,
  input [31:0] jump,
  output[31:0] next_pc
);
  reg [31:0] next_pc_reg = 0;
  reg [3:0] cyc_4 = 4'b1111;

  always @ (posedge clk) begin
    if(rst)
      next_pc_reg <= 31'd0;
    else if(j_signal) begin
      next_pc_reg <= jump;
      cyc_4 <= 3'b0;
    end
    else if(cyc_4 == 32'd3) begin
      next_pc_reg <= next_pc_reg + 32'b1;
      cyc_4 <= 3'b0;
    end
    else begin
      cyc_4 <= cyc_4 + 3'b1;
    end
  end
  assign next_pc = next_pc_reg;
endmodule