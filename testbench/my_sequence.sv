`ifndef MY_SEQUENCE_SV
`define MY_SEQUENCE_SV

class my_sequence extends uvm_sequence #(my_item);

`uvm_object_utils(my_sequence)

int loop_count = 100;

function new(string name);
super.new(name);
endfunction

task body();

repeat(loop_count) begin
req = my_item::type_id::create("req");
start_item(req);
req.rst_n = ($urandom_range(0,9) == 0);
req.load = ($urandom_range(0,4) == 0);
req.data_in = $urandom_range(0, (1 << 8) - 1);
finish_item();
end

endtask

endclass

`endif