`timescale 1ns / 1ps

module tb_heterogeneous_processor_test; // Changed the module name

    reg [31:0] core_a_input_A;
    reg [31:0] core_a_input_B;
    reg [127:0] core_b_input_A;
    reg [127:0] core_b_input_B;
    reg core_a_busy;
    reg core_b_busy;
    reg task_ready;
    
    wire [31:0] core_a_result;
    wire [255:0] core_b_result;
    wire [31:0] bus_data_out;
    wire [255:0] encrypted_data_out;
    wire reconfig_trigger_out;
    wire [7:0] corrected_data_out;
    wire [1:0] voltage_level_out;
    wire [1:0] frequency_level_out;
    wire [15:0] optimized_parameters_out;

    // Instantiate the heterogeneous processor
    heterogeneous_processor uut ( // No changes needed here
        .A(core_a_input_A),
        .B(core_a_input_B),
        .A_flat(core_b_input_A),
        .B_flat(core_b_input_B),
        .core_a_busy(core_a_busy),
        .core_b_busy(core_b_busy),
        .task_ready(task_ready),
        .result_core_a(core_a_result),
        .result_core_b(core_b_result),
        .bus_data_out(bus_data_out),
        .encrypted_data_out(encrypted_data_out),
        .reconfig_trigger_out(reconfig_trigger_out),
        .corrected_data_out(corrected_data_out),
        .voltage_level_out(voltage_level_out),
        .frequency_level_out(frequency_level_out),
        .optimized_parameters_out(optimized_parameters_out)
    );

    // Initialize inputs
    initial begin
        // Initialize Inputs
        core_a_input_A = 32'hA5A5A5A5;
        core_a_input_B = 32'h5A5A5A5A;
        core_b_input_A = 128'hFEDCBA9876543210FEDCBA9876543210;
        core_b_input_B = 128'h0123456789ABCDEF0123456789ABCDEF;
        core_a_busy = 0;
        core_b_busy = 0;
        task_ready = 1;

        // Wait for the design to stabilize
        #10;
        
        // Simulate some operations
        core_a_busy = 1;
        #5 core_a_busy = 0;

        core_b_busy = 1;
        #5 core_b_busy = 0;

        task_ready = 0;
        #5 task_ready = 1;
        
        // Add more test cases as needed
    end

    // Monitor the outputs
    initial begin
        $monitor("At time %t, core_a_result = %h, core_b_result = %h, bus_data_out = %h, encrypted_data_out = %h, reconfig_trigger_out = %b, corrected_data_out = %h, voltage_level_out = %b, frequency_level_out = %b, optimized_parameters_out = %h",
                 $time, core_a_result, core_b_result, bus_data_out, encrypted_data_out, reconfig_trigger_out, corrected_data_out, voltage_level_out, frequency_level_out, optimized_parameters_out);
    end

endmodule

