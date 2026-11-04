# 8-Bit Register

A parameter-free 8-bit register written in SystemVerilog, verified with a class-based UVM-style testbench. The design is a synchronous load register with an active-low asynchronous reset.

## Overview

The register captures `data_in` on the rising edge of `clk` when `load` is asserted. When `load` is low, the stored value is held. Asserting `rst_n` low clears the output to zero immediately, independent of the clock.

## Design

### Ports

| Port       | Direction | Width | Description                                      |
|------------|-----------|-------|--------------------------------------------------|
| `clk`      | input     | 1     | Clock. Data is captured on the rising edge.      |
| `rst_n`    | input     | 1     | Active-low asynchronous reset.                   |
| `load`     | input     | 1     | Load enable. When high, `data_in` is captured.   |
| `data_in`  | input     | 8     | Data input.                                      |
| `data_out` | output    | 8     | Registered output.                               |

### Behavior

| `rst_n` | `load` | Clock edge | Result                  |
|---------|--------|------------|-------------------------|
| 0       | X      | X          | `data_out` cleared to 0 |
| 1       | 1      | Rising     | `data_out` = `data_in`  |
| 1       | 0      | Rising     | `data_out` unchanged    |

## Verification

The testbench is a class-based environment with the following components:

| File               | Purpose                                                        |
|--------------------|----------------------------------------------------------------|
| `my_if.sv`         | Interface bundling the DUT signals.                            |
| `my_item.sv`       | Transaction class holding the randomized stimulus fields.      |
| `my_sequence.sv`   | Generates the sequence of transactions.                        |
| `my_driver.sv`     | Drives transactions onto the DUT interface.                    |
| `my_monitor.sv`    | Samples DUT signals and forwards observed transactions.        |
| `my_agent.sv`      | Groups the sequencer, driver, and monitor.                     |
| `my_scoreboard.sv` | Compares observed output against the expected register value.  |
| `my_env.sv`        | Instantiates and connects the agent and scoreboard.            |
| `my_test.sv`       | Top-level test that configures and starts the environment.     |
| `my_pkg.sv`        | Package collecting the testbench classes.                      |
| `my_top.sv`        | Top module: clock generation, DUT instantiation, test launch.  |


## Running the Simulation

The `sim/` directory contains a file list and a run script.

- `files.f` lists the source files in compile order.
- `run.py` compiles and runs the simulation using the file list in Questa.

From the repository root:

```
cd sim
python run.py
```

## Tools

- SystemVerilog (IEEE 1800)
- Questa Starter Edition for compilation and Simulation
- Python 3 for the run script