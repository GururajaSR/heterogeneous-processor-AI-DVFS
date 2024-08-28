module ai_scheduler (
    input core_a_busy,
    input core_b_busy,
    input task_ready,
    output reg assign_to_a,
    output reg assign_to_b
);

    always @(*) begin
        if (task_ready) begin
            if (!core_a_busy) begin
                assign_to_a = 1;
                assign_to_b = 0;
            end else if (!core_b_busy) begin
                assign_to_a = 0;
                assign_to_b = 1;
            end else begin
                assign_to_a = 0;
                assign_to_b = 0;
            end
        end else begin
            assign_to_a = 0;
            assign_to_b = 0;
        end
    end
endmodule

