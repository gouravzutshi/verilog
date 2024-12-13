

module half_adder(

input wire [3:0] a,
input wire [3:0] b, 
output wire [3:0] sum,
output wire [3:0] carry

);

assign{carry, sum} = a+b;

endmodule