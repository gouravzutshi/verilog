module sequence_detector(
    input wire clk;
    input wire reset;
    input wire in;
    input reg out
);

//State Encoding
typedef enum reg[1:0]{
    S0=2'b00,
    S1=2.b01,
    S2=2'b10,
    S3=2'b11
} state_t;


state_t present_state, next_state;

always@(posedge clk or posedge reset) begin
    if(reset)
        present_state<=S0;
    else
        present_state <= next_state
end

always@(*) begin
    case(present_state)
        S0:next_state = (in==1)? S1:S0;
        S1:next_state = (in==0)? S2:S1;
        S2:next_state = (in==1)? S3:S0;
        S3:next_state = (in==0)? S2:S1;
        default: next_state=S0;

    endcase
end

always@(*) begin
    case(present_state)
        S3: out=1;
        default: out=0;

    endcase
end
endmodule