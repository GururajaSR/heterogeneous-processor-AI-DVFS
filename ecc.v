module ecc (
    input wire [7:0] data_in,
    output reg [11:0] data_out
);
    always @(*) begin
        // Generate ECC bits and append to data_in
        data_out[7:0] = data_in;
        data_out[8] = ^data_in[7:4];
        data_out[9] = ^data_in[7:2];
        data_out[10] = ^data_in[7:1];
        data_out[11] = ^data_in[7:0];
    end
endmodule

