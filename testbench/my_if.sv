`timescale 1ns/1ps

`ifndef MY_INTERFACE_SV
`define MY_INTERFACE_SV

import uvm_pkg::*;
import my_pkg::*;
`include "uvm_macros.svh"

interface my_if (input logic clk);

logic rst_n;
logic load;
logic [7:0] data_in;
logic [7:0] data_out;

clocking cb @(posedge clk);
default input #1 output #1;
input data_out;
output rst_n;
output load;
output data_in;
endclocking

endinterface

`endif