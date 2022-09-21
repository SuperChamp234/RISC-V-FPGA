module ALU_tb;

reg clk;
reg [31:0] instr;
reg [31:0] pc;
wire [31:0] next_pc;
wire pc_j_valid;
wire read;
wire write;
wire [31:0] addr;
wire [31:0] write_data_mem;
wire [31:0] ALUoutput;

RISC_V RV1(.clk(clk), .instr(instr),
            .pc(pc), .next_pc(next_pc),
            .pc_j_valid(pc_j_valid), .read(read),
            .write(write), .addr(addr),
            .write_data_mem(write_data_mem),
            .ALUoutput(ALUoutput));

initial begin
    instr = 32'h00210623;
    clk = 1;
    pc = 1;
end

endmodule