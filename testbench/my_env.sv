`ifndef MY_ENVIRONMENT_SV
`define MY_ENVIRONMENT_SV

class my_env extends uvm_env;

`uvm_component_utils(my_environment)

my_agent agent;
my_scoreboard scoreboard;

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent = my_agent::type_id::create("agent", this);
scoreboard = my_scoreboard::type_id::create("env", this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
agent.monitor.item_collected_port.connect(scoreboard.item_imp);
endfunction

endclass

`endif