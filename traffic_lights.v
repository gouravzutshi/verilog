module traffic_lights(
    input wire clk,
    input wire reset,
    output reg red_light,
    output reg yellow_light,
    output reg green_light
);

//this is the important bit surrounding FSMs, which is mainly the enum function where you define the states

typedef enum reg[1:0]{
    S0_red=2'b00,
    S1_green=2'b01,
    S2_yellow=2'b10
} state_t; //Here you have defined the state and added corresponding numbers

//The next thing needed to be done should be something else,something associated with the always block I guess
//But before that we have to define 2 states the present state and the next state so that we can move forward and back

state_t current_state, next_state;
reg[2:0] counter; //there is also a counter for timing purposes, I guess wherever we will require timing we will call this into service, I also thing this could have been achieved with clock cycles but let's see

//The first thing we wrote here was the State transition logic
always@(posedge clk or posedge reset) begin
    if(reset) begin
            current_state<=S0_red;
            counter<=5;
    end else begin
            if(counter==0) begin
                current_state <= next_state;

                case(next_state)
                S0_red:counter<=5;
                S1_green:counter<=5;
                S2_yellow:counter<=2;
                endcase

            end else begin
                    counter<=counter-1;
            end
    end

end

//The next thing we will write is the next state logic

always@(*) begin
    case(current_state)
        S0_red: next_state=S1_green;

        S1_green: next_state=S2_yellow;

        S2_yellow: next_state=S0_red;

        default: next_state=S0_red;
    endcase
end

//The next thing usually has to be the output logic

always@(*) begin
    red_light=0;
    yellow_light=0;
    green_light=0;

    case(current_state)
        S0_red: red_light=1;
        S1_green: green_light=1;
        S2_yellow: yellow_light=1;
    endcase
end
endmodule //Takeaway is that a lot of things can be achieved through case function keep it handy and move forward