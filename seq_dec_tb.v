module seq_dec_tb;

reg clk,reset,in;
wire out;

sequence_detector uut(
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
);

initial begin 
    clk=0;
    forever #5 clk=~clk;
end

initial begin
    $monitor("Time=%0t | Reset=%b, input=%b, output=%b",$time, in, out)
    reset = 1; #10;
    reset = 0; #10;

    in = 1; #10;
    in = 0; #10;
    in = 1; #10;  // Detected "101", output = 1
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;

    $finish
end
endmodule