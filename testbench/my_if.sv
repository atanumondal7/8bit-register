`ifndef MY_INTERFACE_SV
`define MY_INTERFACE_SV

interface my_if;

logic clk;
logic rst_n;
logic load;
logic data_in;
logic data_out;

clocking cb @(posedge clk)
default input #1 output #1;
input data_out;
output rst_n;
output load;
output data_in;
endclocking

endinteface

`endif