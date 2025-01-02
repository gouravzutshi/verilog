module piso_shift_reg(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [3:0] parallel_in,
    output reg serial_out
);

reg [3:0] shift_reg;

always@(posedge clk or posedge reset) begin

    if(reset)
        shift_reg<=4'b0000;

    else if(load)

        shift_reg<=parallel_in;

    else begin
        serial_out<=shift_reg[0];
        

    end

end