module tb_seq_dec_2;
    reg clk,reset,inp;
    wire outp;

    //Time to initiate the sequence detector
    seq_dec_2 uut(
            .clk(clk),
            .reset(reset),
            .inp(inp),
            .outp(outp)
    );

    //I guess the next thing is to initiate the clock

    initial begin
            clk=0;
            forever #5 clk=~clk;
    end

    //Next part is to start driving the simaulations

    initial begin
        $monitor("Time = %0t | reset=%b | input=%b | output=%b", $time, reset, inp, outp);

        reset=1;
        inp=0;

        #10 reset=0;

        //Apply input sequence
        #10 inp = 1; // Start sequence
        #10 inp = 1;
        #10 inp = 0;
        #10 inp = 1; // Sequence 1101 detected
        #10 inp = 0; // Reset to S0
        #10 inp = 1;
        #10 inp = 1;
        #10 inp = 0;
        #10 inp = 1; // Sequence 1101 detected again

        #20 $finish;
    end
    
endmodule