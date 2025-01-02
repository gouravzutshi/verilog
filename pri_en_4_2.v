// Code your design here
module pri_en_4_2(
  input reg [3:0] inp,
  output reg [1:0] outp
);

always@(*) begin

if (inp[3])
    outp = 2'b11;

  else if (inp[2])
    outp = 2'b10;

  else if (inp[1])
    outp = 2'b01;

  else if (inp[0])
    outp = 2'b00;

else
    outp = 2'b00;

end

endmodule
