module tb_traffic_lights;
    reg clk,reset;
    wire red_light,green_light,yellow_light;

    traffic_lights uut(
            .clk(clk),
            .reset(reset),
            .red_light(red_light),
            .yellow_light(yellow_light),
            .green_light(green_light)
    ); // these first few steps you gotta remember bro, the upcoming logic is what usually changes

    //Starting here you have to initialise the clock to 0

    initial begin
        clk=0;
    end

    always #5 clk=~clk; //toggle clock every 5 time units (10ns in this case)

    initial begin
            $monitor("Time=%0t | Reset=%b | State=%b | Counter=%d | RED=%b | GREEN=%b | YELLOW=%b", 
                 $time, reset, uut.current_state, uut.counter, red_light, green_light, yellow_light);

            // Apply reset
            reset = 1;          // Hold reset for 10ns
            #10 reset = 0;      // Release reset

            // Run simulation for 500ns
            #500;
            $finish; 
    end
    //now you head to the actual simulation
endmodule