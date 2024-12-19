// Code your design here
module dff(
    input wire d,
    input wire clk,
    input reset,
    output reg q
);

always@(posedge clk or posedge reset) begin
if(reset)
q<=1b'0;
else
q<=d;
end

endmodule
