module bus_interface (
    input [31:0] core_a_data,
    input [31:0] core_b_data,
    input core_a_req,
    input core_b_req,
    output reg [31:0] bus_data,
    output reg bus_grant_a,
    output reg bus_grant_b
);

    always @(*) begin
        if (core_a_req && !core_b_req) begin
            bus_data = core_a_data;
            bus_grant_a = 1;
            bus_grant_b = 0;
        end else if (!core_a_req && core_b_req) begin
            bus_data = core_b_data;
            bus_grant_a = 0;
            bus_grant_b = 1;
        end else if (core_a_req && core_b_req) begin
            // Priority to Core A if both request
            bus_data = core_a_data;
            bus_grant_a = 1;
            bus_grant_b = 0;
        end else begin
            bus_data = 32'b0;
            bus_grant_a = 0;
            bus_grant_b = 0;
        end
    end
endmodule

