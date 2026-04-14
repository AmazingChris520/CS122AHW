module endianness_converter(
    input  logic        clk,
    input  logic [31:0] word,
    input  logic        endianness_in,
    input  logic        endianness_out,
    output logic [31:0] converted_word
);

always_ff @(posedge clk) begin
    if (endianness_in == endianness_out) begin
        converted_word <= word;
    end 
    else begin
        converted_word[31:24] <= word[7:0];
        converted_word[23:16] <= word[15:8];
        converted_word[15:8]  <= word[23:16];
        converted_word[7:0]   <= word[31:24];
    end
end

endmodule