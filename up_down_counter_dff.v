module up_down_counter_dff(
    input wire clk,
    input wire reset,
    input wire up_down,
    output reg [1:0] q
);

always@(posedge clk or posedge reset) begin

    if(reset)
        q<=2'b00;

    else begin

    q[0]<=~q[0];
    q[1]<=q[1]^q[0]^~up_down;

    end

end

endmodule