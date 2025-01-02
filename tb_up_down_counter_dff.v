module tb_up_down_counter_dff;

    input reg clk,
    input reg reset,
    input reg up_down,
    output wire [1:0] q;

    up_down_counter_dff uut(
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .q(q)
    );

    initial begin
        clk=0;
        forever #5 clk = ~clk;
    end

    initial begin

        $monitor("Time = %0t | Reset = %b | q=%b",$time, reset, q);

            reset=1; up_down=1; #10;
            reset=0;#50;
            up_down=0;#50;
            
        $finish;

    end

endmodule