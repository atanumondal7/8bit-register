`timescale 1ns/1ps

import uvm_pkg::*;
import my_pkg::*;
`include "uvm_macros.svh"

module my_top;

logic clk = 0;

always #5 clk = ~clk;

my_if vif(clk);

register_8bit dut (
.clk(clk),
.rst_n(vif.rst_n),
.load(vif.load),
.data_in(vif.data_in),
.data_out(vif.data_out)
);

initial begin

uvm_config_db#(virtual my_if)::set(null, "*", "vif", vif);

run_test("my_test");
end

endmodule