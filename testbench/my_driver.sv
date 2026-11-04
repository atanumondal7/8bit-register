`ifndef MY_DRIVER_SV
`define MY_DRIVER_SV

class my_driver extends uvm_driver #(my_item);

`uvm_component_utils(my_driver)

virtual my_if vif; 

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif)) begin
`uvm_fatal("DRV", "Could not find the virtual interface handles")
end
endfunction

task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(req);
vif.cb.rst_n <= req.rst_n;
vif.cb.load <= req.load;
vif.cb.data_in <= req.data_in;
@(vif.cb);
seq_item_port.item_done();
end
endtask

endclass

`endif