module core_b (
    input [127:0] A_flat,
    input [127:0] B_flat,
    output reg [255:0] C_flat
);

    integer i, j, k;
    reg [7:0] A [0:3][0:3];
    reg [7:0] B [0:3][0:3];
    reg [15:0] C [0:3][0:3];

    always @(*) begin
        // Flatten A and B
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                A[i][j] = A_flat[(i * 4 + j) * 8 +: 8];
                B[i][j] = B_flat[(i * 4 + j) * 8 +: 8];
            end
        end

        // Matrix multiplication
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                C[i][j] = 0;
                for (k = 0; k < 4; k = k + 1) begin
                    C[i][j] = C[i][j] + (A[i][k] * B[k][j]);
                end
            end
        end

        // Flatten C
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                C_flat[(i * 4 + j) * 16 +: 16] = C[i][j];
            end
        end
    end
endmodule

