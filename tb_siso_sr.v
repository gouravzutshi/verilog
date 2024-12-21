module tb_siso_sr;

reg serial_in,clk,reset;
wire serial_out;


siso_shift_register uut(
    .serial_in(serial_in),
    .clk(clk),
    .reset(reset),
    .serial_out(serial_out)
);
  
initial begin
	clk=0;
	forever #5 clk = ~clk;
end

initial begin

    $monitor("Time = %0t | serial_in=%b, serial_out=%b, reset = %b",$time, serial_in, serial_out, reset);

        // Apply reset
        reset = 1; serial_in = 0; #10;
        reset = 0; #10;

        // Shift in data
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Continue shifting zeros
        serial_in = 0; #10;
        serial_in = 0; #10;
    $finish;

end
endmodule