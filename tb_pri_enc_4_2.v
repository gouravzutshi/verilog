// Code your testbench here
// or browse Examples
module tb_pri_enc_4_2;

reg [3:0] inp;
wire [1:0] outp;

pri_en_4_2 uut(
    .inp(inp),
    .outp(outp)
);

initial begin

$monitor("Time=%0t | inp=%b  outp=%b",$time, inp, outp);

inp = 4'b0000; #10;
inp = 4'b0001; #10;
inp = 4'b0010; #10;
inp = 4'b0100; #10;
inp = 4'b1000; #10;
inp = 4'b0011; #10;
inp = 4'b0111; #10;
inp = 4'b1111; #10;

$finish;
end

endmodule