`ifndef MY_SEQUENCE_SV
`define MY_SEQUENCE_SV

class my_sequence extends uvm_sequence #(my_item);

`uvm_object_utils(my_sequence)

int loop_count = 100;

function new(string name = "my_sequence");
super.new(name);
endfunction

task body();

req = my_item::type_id::create("req");
start_item(req);
req.rst_n = 0;
req.load = 0;
req.data_in = 0;
finish_item(req);

req = my_item::type_id::create("req");
start_item(req);
req.rst_n = 0;
req.load = 0;
req.data_in = 0;
finish_item(req);

req = my_item::type_id::create("req");
start_item(req);
req.rst_n = 1;
req.load = 0;
req.data_in = 0;
finish_item(req);

repeat(loop_count) begin
req = my_item::type_id::create("req");
start_item(req);
req.rst_n = ~($urandom_range(9, 0) == 0);
req.load = ($urandom_range(2, 0) == 0);
req.data_in = $urandom_range(255, 0);
finish_item(req);
end

endtask

endclass

`endif