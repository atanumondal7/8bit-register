`ifndef MY_PACKAGE_SV
`define MY_PACKAGE_SV

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "my_item.sv"
`include "my_sequence.sv"
`include "my_driver.sv"
`include "my_monitor.sv"
`include "my_scoreboard.sv"
`include "my_agent.sv"
`include "my_env.sv"
`include "my_test.sv"

endpackage 

`endif