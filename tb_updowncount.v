module tb_updowncount;
    reg clk, reset, up_down;
    wire [3:0] count;

    updowncount uut(
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    //Generate the clock signal
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        up_down = 1;

        // Apply reset
        #10 reset = 0;

        // Count Up
        #50 up_down = 1;
        
        // Count Down
        #50 up_down = 0;

        // Stop Simulation
        #50 $stop;
    end
endmodule