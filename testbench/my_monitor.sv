`ifndef MY_MONITOR_SV
`define MY_MONITOR_SV

class my_monitor extends uvm_monitor;

`uvm_component_utils(my_monitor)
uvm_analysis_port #(my_item) item_collected_port;
virtual my_if vif;

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif)) begin
`uvm_fatal("MON", "Could not find virtual interface handles")
end
endfunction

task run_phase(uvm_phase phase);
my_item item;
logic prev_rst_n;
logic prev_load;
logic [7:0] prev_data_in;
logic [7:0] prev_data_out;

@(vif.cb);
@(vif.cb);

prev_rst_n = vif.rst_n;
prev_load = vif.load;
prev_data_in = vif.data_in;
prev_data_out = vif.cb.data_out;

forever begin

@(vif.cb);
item = my_item::type_id::create("item");
item.rst_n = prev_rst_n;
item.load = prev_load;
item.data_in = prev_data_in;
item.data_out = prev_data_out;
item_collected_port.write(item);

prev_rst_n = vif.rst_n;
prev_load = vif.load;
prev_data_in = vif.data_in;
prev_data_out = vif.cb.data_out;
end

endtask

endclass

`endif