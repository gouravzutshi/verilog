module tb_sync_counter_dff;

reg clk, reset;
wire [1:0] q;

sync_counter_dff uut(
    .clk(clk),
    .reset(reset),
    .q(q)
);

initial begin

    clk=0;
    forever #5
    clk = ~clk;

end

initial begin

    $monitor("Time=%0t | Reset = %b | q=%b",$time, reset, q);

        reset = 1; #10;
        reset = 0; #50;
        reset = 1; #10;
        reset = 0; #30;

    $finish;

end

endmodule