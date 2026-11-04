`ifndef MY_AGENT_sV
`define MY_AGENT_sV

class my_agent extends uvm_agent;

`uvm_component_utils(my_agent)

my_driver driver;
my_monitor monitor;
uvm_sequencer #(my_item) sequencer;

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
driver = my_driver::type_id::create("driver", this);
monitor = my_monitor::type_id::create("monitor", this);
sequencer = uvm_sequencer#(my_item)::type_id::create("sequencer", this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
driver.seq_item_port.connect(sequencer.seq_item_export);
endfunction

endclass

`endif