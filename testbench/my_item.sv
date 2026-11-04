`ifndef MY_ITEM_SV
`define MY_ITEM_SV

class my_item extends uvm_sequence_item;

logic rst_n;
logic load;
logic [7:0] data_in;

logic [7:0] data_out;
`uvm_object_utils_begin(my_item)

`uvm_field_int(rst_n, UVM_ALL_ON)
`uvm_field_int(load, UVM_ALL_ON)
`uvm_field_int(data_in, UVM_ALL_ON)
`uvm_field_int(data_out, UVM_ALL_ON)

`uvm_object_utils_end

function new(string name = "my_item");
super.new(name);
endfunction

endclass

`endif