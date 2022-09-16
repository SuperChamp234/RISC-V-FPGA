module binary_to_bcd(
    input [31:0] bin,
    output reg [39:0] bcd
);

function adjust(input [3:0] inp);
    begin
        adjust = inp >= 4'd10 ? 0 : inp >= 4'd5 ? inp + 4'd3 : inp;
    end
endfunction

reg [39:0] inp;

always @(*) begin
     inp = {8'd0,bin};
     bcd[39:36] = adjust(inp[39:36]);
     bcd[38:35] = adjust(inp[38:35]);
     bcd[37:34] = adjust(inp[37:34]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[35:32] = adjust(inp[38:35]);
     bcd[39:36] = adjust(inp[39:36]);
    
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[38:35]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[22:19] = adjust(inp[22:19]);
     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]); 
     bcd[38:35] = adjust(inp[38:35]);

     bcd[21:18] = adjust(inp[21:18]);
     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[20:17] = adjust(inp[20:17]);
     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[19:16] = adjust(inp[19:16]);
     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);
    
     bcd[18:15] = adjust(inp[18:15]);
     bcd[22:19] = adjust(inp[22:19]);
     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]); 
     bcd[38:35] = adjust(inp[38:35]);

     bcd[17:14] = adjust(inp[17:14]);
     bcd[21:18] = adjust(inp[21:18]);
     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[16:13] = adjust(inp[16:13]);
     bcd[20:17] = adjust(inp[20:17]);
     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[15:12] = adjust(inp[15:12]);
     bcd[19:16] = adjust(inp[19:16]);
     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[14:11] = adjust(inp[14:11]);
     bcd[18:15] = adjust(inp[18:15]);
     bcd[22:19] = adjust(inp[22:19]);
     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[13:10] = adjust(inp[13:10]);
     bcd[17:14] = adjust(inp[17:14]); 
     bcd[21:18] = adjust(inp[21:18]);
     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[12:9] = adjust(inp[12:9]);
     bcd[16:13] = adjust(inp[16:13]);
     bcd[20:17] = adjust(inp[20:17]);
     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[11:8] = adjust(inp[11:8]);
     bcd[15:12] = adjust(inp[15:12]);
     bcd[19:16] = adjust(inp[19:16]);
     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[10:7] = adjust(inp[10:7]);
     bcd[14:11] = adjust(inp[14:11]);
     bcd[18:15] = adjust(inp[18:15]);
     bcd[22:19] = adjust(inp[22:19]);
     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[9:6] = adjust(inp[9:6]);
     bcd[13:10] = adjust(inp[13:10]);
     bcd[17:14] = adjust(inp[17:14]);
     bcd[21:18] = adjust(inp[21:18]);
     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[8:5] = adjust(inp[8:5]);
     bcd[12:9] = adjust(inp[12:9]);
     bcd[16:13] = adjust(inp[16:13]);
     bcd[20:17] = adjust(inp[20:17]);
     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[7:4] = adjust(inp[7:4]);
     bcd[11:8] = adjust(inp[11:8]);
     bcd[15:12] = adjust(inp[15:12]);
     bcd[19:16] = adjust(inp[19:16]);
     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

     bcd[6:3] = adjust(inp[6:3]);
     bcd[10:7] = adjust(inp[10:7]);
     bcd[14:11] = adjust(inp[14:11]);
     bcd[18:15] = adjust(inp[18:15]);
     bcd[22:19] = adjust(inp[22:19]);
     bcd[26:23] = adjust(inp[26:23]);
     bcd[30:27] = adjust(inp[30:27]);
     bcd[34:31] = adjust(inp[34:31]);
     bcd[38:35] = adjust(inp[38:35]);

     bcd[5:2] = adjust(inp[5:2]);
     bcd[9:6] = adjust(inp[9:6]);
     bcd[13:10] = adjust(inp[13:10]);
     bcd[17:14] = adjust(inp[17:14]);
     bcd[21:18] = adjust(inp[21:18]);
     bcd[25:22] = adjust(inp[25:22]);
     bcd[29:26] = adjust(inp[29:26]);
     bcd[33:30] = adjust(inp[33:30]);
     bcd[37:34] = adjust(inp[37:34]);

     bcd[4:1] = adjust(inp[4:1]);
     bcd[8:5] = adjust(inp[8:5]);
     bcd[12:9] = adjust(inp[12:9]);
     bcd[16:13] = adjust(inp[16:13]);
     bcd[20:17] = adjust(inp[20:17]);
     bcd[24:21] = adjust(inp[24:21]);
     bcd[28:25] = adjust(inp[28:25]);
     bcd[32:29] = adjust(inp[32:29]);
     bcd[36:33] = adjust(inp[36:33]);

     bcd[3:0] = adjust(inp[3:0]);
     bcd[7:4] = adjust(inp[7:4]);
     bcd[11:8] = adjust(inp[11:8]);
     bcd[15:12] = adjust(inp[15:12]);
     bcd[19:16] = adjust(inp[19:16]);
     bcd[23:20] = adjust(inp[23:20]);
     bcd[27:24] = adjust(inp[27:24]);
     bcd[31:28] = adjust(inp[31:28]);
     bcd[35:32] = adjust(inp[35:32]);
     bcd[39:36] = adjust(inp[39:36]);

end

endmodule