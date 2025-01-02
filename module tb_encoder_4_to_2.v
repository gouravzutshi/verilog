module tb_encoder_4_to_2;

    reg [3:0] in;
    reg [1:0] out;

    encoder4_to_2 uut(

        .in(in),
        .out(out)

    );

    initial begin

        $monitor("Time=%0t | in=%b, out=%b",$time,in,out);

        in=4'b0001;#10;
        in=4'b0010;#10;
        in=4'b0100;#10;
        in=4'b1000;#10;

        $finish;

    end


endmodule