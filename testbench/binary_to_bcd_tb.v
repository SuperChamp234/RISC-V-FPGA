module binary_to_bcd_tb;

reg [31:0] bin;
wire [39:0] bcd;

binary_to_bcd bin_bcd1(.bin(bin), .bcd(bcd));

initial begin
    bin = 32'd12345;#20;
    $stop;
end

endmodule