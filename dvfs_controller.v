module dvfs_controller (
    input [31:0] workload,
    output reg [1:0] voltage_level,
    output reg [1:0] frequency_level
);

    always @(*) begin
        if (workload > 100000) begin
            voltage_level = 2'b11;
            frequency_level = 2'b11;
        end else if (workload > 50000) begin
            voltage_level = 2'b10;
            frequency_level = 2'b10;
        end else if (workload > 10000) begin
            voltage_level = 2'b01;
            frequency_level = 2'b01;
        end else begin
            voltage_level = 2'b00;
            frequency_level = 2'b00;
        end
    end
endmodule

