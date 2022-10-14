module binary_to_bcd(
    input [31:0] bin,
    output reg [39:0] bcd
);

function [31:0] div_by_10(
    input[31:0] n,
    input[31:0] q, //00
    input[31:0] r //00
); 
    
    begin
        q = (n >> 1) + (n >> 2);
        q = q + (q >> 4);
        q = q + (q >> 8);
        q = q + (q >> 16);
        q = q >> 3;
        r = n - (((q << 2) + q) << 1);
        div_by_10 = q + (r > 9);
    end
endfunction

reg [31:0] inp;
reg [31:0] next;

always @(*) begin
    inp = bin;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[3:0] = inp - ((next << 3) + (next << 1));//inp - ((next << 3) + (next << 1)); //1
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[7:4] =  inp - ((next << 3) + (next << 1)); //2
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[11:8] =  inp - ((next << 3) + (next << 1)); //3
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[15:12] =  inp - ((next << 3) + (next << 1)); //4
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[19:16] =  inp - ((next << 3) + (next << 1)); //5
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[23:20] =  inp - ((next << 3) + (next << 1)); //6
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[27:24] =  inp - ((next << 3) + (next << 1)); //7
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[31:28] =  inp - ((next << 3) + (next << 1)); //8
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[35:32] =  inp - ((next << 3) + (next << 1)); //9
    inp = next;

    next = div_by_10(inp,32'b0,32'b0);
    bcd[39:36] =  inp - ((next << 3) + (next << 1)); //10
end
endmodule