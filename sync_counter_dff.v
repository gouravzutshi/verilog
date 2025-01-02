module sync_counter_dff(
    input wire clk,
    input wire reset,
    output reg [1:0] q //2 bit counter output
);

always@(posedge clk or posedge reset) begin

    if(reset)
     q=2'b00;

    else begin
    q[0] <= ~q[0];
    q[1] <= q[1]^q[0];

    end

    end
endmodule
