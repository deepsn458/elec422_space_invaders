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
    parameter START_X = 15,
    parameter START_Y = 10,
    parameter SHIELD_DIAMETER = 2           // This is the diameter NOT INCLUDING CENTRAL PIXEL (aka how many pixels extending out from central pixel)
) (
    input wire clka,
    input wire clkb,
    input wire reset,
    input wire [5:0] invader_bullet_coord_x, 
    input wire [5:0] invader_bullet_coord_y,
    input wire [5:0] player_bullet_coord_x,
    input wire [5:0] player_bullet_coord_y,
    input wire shield_play,
    output reg [1:0] hp,
    output reg shield_display,
    output reg invaderbullet_shield_collision,
    output reg playerbullet_shield_collision,
    output reg [5:0] shield_coord_x, shield_coord_y,
    output reg [1:0] state
);

    reg [1:0] temp_state;
    reg [1:0] next_state;

    //State parameters
    parameter INITIAL = 2'b00, ALIVE = 2'b01, NO_HEALTH = 2'b10;

    //internal wire to track shield coordinates
    wire invaderbullet_collision_x, invaderbullet_collision_y, 
         playerbullet_collision_x, playerbullet_collision_y, playerbullet_shield_distance;
    assign invaderbullet_collision_x = (invader_bullet_coord_x <= (shield_coord_x + SHIELD_DIAMETER)) && (invader_bullet_coord_x >= (shield_coord_x - SHIELD_DIAMETER));
    assign invaderbullet_collision_y = invader_bullet_coord_y == shield_coord_y;
    

    assign playerbullet_collision_x = (player_bullet_coord_x <= (shield_coord_x + SHIELD_DIAMETER)) && (player_bullet_coord_x >= (shield_coord_x -SHIELD_DIAMETER));
    assign playerbullet_collision_y = player_bullet_coord_y == shield_coord_y;
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
            if ((invaderbullet_collision_x & invaderbullet_collision_y) && hp < 1) begin
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
                hp <= 2'd3;
                shield_coord_x <= START_X;
                shield_coord_y <= START_Y;
                invaderbullet_shield_collision <= 1'b0;
                playerbullet_shield_collision <= 1'b0;
                shield_display <= 1'b0;
        end

        ALIVE: begin
            state <= next_state;
            shield_display <= 1'b1;
            if ((playerbullet_collision_x & playerbullet_collision_y) && hp > 1) begin
                playerbullet_shield_collision <= 1'b1;
            end else begin
                playerbullet_shield_collision <= 1'b0;
            end

            if ((invaderbullet_collision_x & invaderbullet_collision_y) && hp > 1) begin
                hp <= hp - 1;
            
                invaderbullet_shield_collision <= 1'b1;
            end else if ((invaderbullet_collision_x & invaderbullet_collision_y) && hp <= 1) begin
                hp <= hp - 1;
                
                shield_display <= 1'b0;
                invaderbullet_shield_collision <= 1'b1;
            end else  begin
                invaderbullet_shield_collision <= 1'b0;
            end
        end
        NO_HEALTH: begin
            state <= next_state;
            invaderbullet_shield_collision <= 1'b0;
            playerbullet_shield_collision <= 1'b0;
        end
        default: state <= INITIAL;
        endcase
    end
endmodule


