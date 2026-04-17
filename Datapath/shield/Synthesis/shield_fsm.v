//////////////////////////////////////////
// shield_fsm.v
//
// Written: dn55@rice.edu
// Created: 2 Mar 2026
//
// Purpose: Control FSM for a shield entity
// 
////////////////////////////////////////////////////////////////////////////////////////////////
module shield_fsm
#(
    parameter HP_3 = 3,
    parameter HP_2 = 2,
    parameter HP_1 = 1,
    parameter HP_0 = 0,
    parameter START_X = 10,
    parameter START_Y = 10,
    parameter SHIELD_RADIUS = 5
) (
    input wire clka,
    input wire clkb,
    input wire reset,
    input wire [5:0] invader_bullet_coord_x, 
    input wire [5:0] invader_bullet_coord_y,
    input wire shield_play,

    output reg [3:0] color, //one hot encoding to denote health/color
    output reg [1:0] hp,
    output reg shield_display,
    output reg bullet_shield_collision,
    output reg [1:0] state
);

    reg [1:0] temp_state;
    reg [1:0] next_state;

    //State parameters
    parameter INITIAL = 2'b00, ALIVE = 2'b01, NO_HEALTH = 2'b10;

    //internal wire to track shield coordinates
    reg [5:0] shield_coord_x, shield_coord_y;
    wire collision_x, collision_y;
    assign collision_x = ((invader_bullet_coord_x - shield_coord_x) < SHIELD_RADIUS) || ((shield_coord_x-invader_bullet_coord_x) < SHIELD_RADIUS);
    assign collision_y = invader_bullet_coord_y == shield_coord_y;

    always @ (*) begin
        case (state)
        INITIAL: begin
            if (shield_play) begin
                temp_state = ALIVE;
            end else begin
                temp_state = INITIAL;
            end
        end

        ALIVE: begin
            if ((collision_x & collision_y) && hp < 1) begin
                temp_state = NO_HEALTH;
            end else begin
                temp_state = ALIVE;
            end
        end

        NO_HEALTH: begin
            temp_state = NO_HEALTH;
        end
        default: temp_state = INITIAL;
        endcase
    end

    //sequential logic to set next_state <= temp_state or respond to reset signal
    always @ (negedge clka) begin
        if (reset) begin
            next_state <= INITIAL;
        end else begin
            next_state <= temp_state;
        end
    end

    //sequntial logic to set output
    always @ (negedge clkb) begin
        case (next_state)
            INITIAL: begin
                state <= next_state;
                if (shield_play) begin
                    shield_display <= 1'b1;
                    hp <= 2'd3;
                    color <= 4'b1000;
                    shield_coord_x <= START_X;
                    shield_coord_y <= START_Y;
                    bullet_shield_collision <= 1'b0;
                end else begin
                    shield_display <= 1'b0;
                    hp <= 2'd0;
                    color <= 4'b0000;
                    shield_coord_x <= 0;
                    shield_coord_y <= 0;
                    bullet_shield_collision <= 1'b0;
                end
        end

        ALIVE: begin
            state <= next_state;
            if ((collision_x & collision_y) && hp > 1) begin
                hp <= hp - 1;
                color <= color >> 1;
                bullet_shield_collision <= 1'b1;
            end else if ((collision_x & collision_y) && hp <= 1) begin
                hp <= hp - 1;
                color <= color >> 1;
                shield_display <= 1'b0;
                bullet_shield_collision <= 1'b1;
            end else begin
                bullet_shield_collision <= 1'b0;
            end
        end
        NO_HEALTH: begin
            state <= next_state;
            bullet_shield_collision <= 1'b0;
        end
        default: state <= INITIAL;
        endcase
    end
endmodule


