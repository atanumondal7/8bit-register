`timescale 1ns/1ps

module register_8bit (
input logic rst_n,
input logic load,
input logic [7:0] data_in,
output logic [7:0] data_out
);

always_ff @(posedge clk or negedge rst_n) begin

if(!rst_n) begin
data_out <= '0;
end

else if(load) begin
data_out <= data_in;
end

end

endmodule