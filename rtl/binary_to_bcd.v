module binary_to_bcd(
    input [31:0] bin,
    output reg [39:0] bcd
);

reg [31:0] inp;

always @(*) begin
    inp = bin;

    bcd[3:0] = inp % 10; //1
    inp = inp/10;

    bcd[7:4] =  inp % 10; //2
    inp = inp/10;

    bcd[11:8] =  inp % 10; //3
    inp = inp/10;

    bcd[15:12] =  inp % 10; //4
    inp = inp/10;

    bcd[19:16] =  inp % 10; //5
    inp = inp/10;

    bcd[23:20] =  inp % 10; //6
    inp = inp/10;

    bcd[27:24] =  inp % 10; //7
    inp = inp/10;

    bcd[31:28] =  inp % 10; //8
    inp = inp/10;

    bcd[35:32] =  inp % 10; //9
    inp = inp/10;

    bcd[39:36] =  inp % 10; //10
end
endmodule