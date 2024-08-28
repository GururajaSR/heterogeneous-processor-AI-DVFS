# Heterogeneous Processor with AI, DVFS, and Fault Tolerance

## Overview

This repository contains the Verilog implementation of a heterogeneous processor architecture that integrates artificial intelligence (AI), dynamic voltage and frequency scaling (DVFS), fault tolerance, and encryption techniques. The processor includes multiple cores designed for various tasks such as ALU operations, matrix multiplication, and more. It features advanced optimization techniques for power and performance management, AI-driven scheduling, and fault monitoring for reliability.

## Block Diagram

Below is the block diagram of the heterogeneous processor, illustrating its key components, interconnections, and data flows:

![Heterogeneous Processor Block Diagram](https://github.com/GururajaSR/heterogeneous-processor-AI-DVFS/blob/main/diagrams.jpeg)

## Working

The processor works as a collaboration between various specialized modules that handle different tasks:
1. **Core A (ALU)**: Responsible for basic arithmetic and logical operations based on a 4-bit opcode. It handles data that flows through the primary processing paths.
2. **Core B (Matrix Multiplication)**: Performs matrix multiplication for 4x4 matrices, suited for data-intensive operations that need vector processing.
3. **ECC Module**: Ensures data integrity by detecting and correcting errors in the system's output using error-correcting codes.
4. **AES Encryption**: Provides encryption using the AES algorithm for secure data handling in real-time.
5. **DVFS Controller**: Optimizes the power consumption of the processor by dynamically adjusting voltage and frequency levels depending on workload conditions.
6. **AI Optimizer**: Utilizes machine learning techniques to optimize task scheduling and overall processor performance.
7. **Fault Monitor**: Monitors the system for potential errors or faults, triggering fault-tolerant mechanisms as necessary.
8. **Bus Interface**: Facilitates communication between the cores and peripherals, ensuring seamless data transfer.
9. **AI Scheduler**: Directs tasks to the appropriate core, maximizing efficiency through AI-driven decisions.

## Testbench

This repository includes a comprehensive testbench (`tb_heterogeneous_processor_test.v`) to simulate and validate the processor's functionality.

### Testbench Features:
- Initializes core inputs for both Core A and Core B with predefined data.
- Simulates core busy signals to emulate different workloads.
- Monitors all major outputs such as results from cores, bus data, encrypted outputs, voltage and frequency levels, and optimized parameters.
- Logs the output values over time to evaluate the system's behavior under various conditions.

## Usage

### 1. Clone the repository:
```bash
git clone https://github.com/GururajaSR/heterogeneous-processor-AI-DVFS.git
cd heterogeneous-processor-AI-DVFS
```

### 2. Compile the Verilog files:
```bash
iverilog -o tb_heterogeneous_processor_tb tb_heterogeneous_processor.v core_a.v core_b.v ecc.v aes_encrypt.v dvfs_controller.v ai_optimizer.v fault_monitor.v bus_interface.v heterogeneous_processor.v ai_scheduler.v
```

### 3. Run the simulation:
```bash
vvp tb_heterogeneous_processor_tb
```

### 4. View the waveform:
```bash
gtkwave tb_heterogeneous_processor.vcd
```
## Waveform Simulation

The waveform below, generated using GTKWave, shows the simulation of the heterogeneous processor's operation using the testbench tb_heterogeneous_processor_test. Key signals such as core_a_result, core_b_result, bus_data_out, encrypted_data_out, voltage_level_out, and optimized_parameters_out are traced over time, illustrating how the processor manages tasks, applies DVFS, and optimizes core functionality. This visualization highlights the interaction between the different cores and modules as data is processed and optimized.

![Waveform](https://github.com/GururajaSR/heterogeneous-processor-AI-DVFS/blob/main/waveform.png)

## Contributions
Feel free to contribute to this project. Fork the repository, create a new branch, and submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. 
