// Code your design here
module siso_shift_register(
    input wire serial_in,
    input wire clk,
    input wire reset,
    output reg serial_out
);

reg [3:0] shift_reg;

always@(posedge clk or posedge reset) begin
    if(reset)
    shift_reg<=4'b0000;

    else begin
    serial_out<=shift_reg[0];
    shift_reg<={serial_in,shift_reg[3:1]};
    end

    end

    endmodule