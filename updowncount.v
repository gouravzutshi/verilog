//the idea is to design a 4 bit up/down counter that counts up or down based on a control signal
//inputs are clk , reset, up_down
//output is count 4 bit

module updowncount(
    input wire clk,
    input wire reset,
    output reg [3:0] count,
    input wire up_down
);

always@(posedge clk or posedge reset) begin
    if(reset) begin
            count <= 3'b000;
    end
    else if(up_down) begin
            count <= count+1;
    end
    else begin
            count <= count-1;
    end
end
endmodule