`ifndef MY_SCOREBOARD_SV
`define MY_SCOREBOARD_SV

class my_scoreboard extends uvm_scoreboard;

`uvm_component_utils(my_scoreboard)
uvm_analysis_imp #(my_item, my_scoreboard) item_imp;

int pass_count = 0;
int fail_count = 0;
logic [7:0] exp_data_out;

function new(string name, uvm_component parent);
super.new(name, parent);
item_imp = new("item_imp", this);
endfunction

function void write(my_item item);

if(!item.rst_n) begin
exp_data_out = '0;
end
else if(item.load) begin
exp_data_out = item.data_in;
end

if(exp_data_out == item.data_out) begin
`uvm_info("SCB", $sformatf("|SUCCESS| rst_n=%0b, load=%0b, data_in=%0d -> data_out=%0d", item.rst_n, item.load, item.data_in, item.data_out), UVM_LOW)
++pass_count;
end
else begin
`uvm_error("SCB", $sformatf("|ERROR| rst_n=%0b, load=%0b, data_in=%0d -> EXP: data_out=%0d | GOT: data_out=%0d", item.rst_n, item.load, item.data_in, exp_data_out, item.data_out))
++fail_count;
end

endfunction

function void report_phase(uvm_phase phase);
super.report_phase(phase);
`uvm_info("SUMMARY", $sformatf("Tests passed: %0d", pass_count), UVM_LOW)
`uvm_info("SUMMARY", $sformatf("Tests failed: %0d", fail_count), UVM_LOW)

if(fail_count > 0) begin
`uvm_info("SUMMARY", ">>>> SIMULATION FAILED <<<<", UVM_LOW)
end
else begin
`uvm_info("SUMMARY", ">>>> SIMULATION PASSED <<<<", UVM_LOW)
end

endfunction

endclass

`endif