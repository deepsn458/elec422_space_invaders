///////////////////////////////////////////
// main_game_fsm.v
//
// Written: ely2@rice.edu
// Created: 2 Mar 2026
//
// Purpose: FSM for main game logic.
// 
//////////////////////////////////////////////////////////////////////////////////////////////// test


module main_game_fsm
#(
    parameter BOTTOM_BOUND = 6'd0,
    parameter TOP_BOUND    = 6'd31,
    parameter DIRECTION_RIGHT = 1,
    parameter DIRECTION_LEFT = 0
)
(
    input wire          clka, clkb,                             // Input clocks
    input wire          global_reset,                           // Global reset signal

    input wire          player_left_input,
    input wire          player_right_input,
    input wire          player_shoot_input,
    input wire          player_display,  // from player fsm
    input wire[5:0]     player_coordinate_x, player_coordinate_y, // from player fsm
    input wire[3:0]     invaders_display, // from invader fsm 
    input wire[5:0]     invader1_coordinate_x, invader1_coordinate_y, // from invader fsm
    input wire[5:0]     invader2_coordinate_x, invader2_coordinate_y, // from invader fsm
    input wire[5:0]     invader3_coordinate_x, invader3_coordinate_y, // from invader fsm
    input wire[5:0]     invader4_coordinate_x, invader4_coordinate_y, // from invader fsm
    input wire[5:0]     invaderbullet_coord_x, invaderbullet_coord_y,   // from invader bullet fsm
    input wire          invaderbullet_player_collision_signal, invaderbullet_shield_collision_signal, // from player and shield fsms (bullet hits player)
    input wire          invader_outofbounds_signal_1, invader_outofbounds_signal_2, invader_outofbounds_signal_3, invader_outofbounds_signal_4,


    output reg         player_left_motion, player_right_motion, // to player fsm
    output wire [5:0]    closest_invader_coord_x, closest_invader_coord_y, // to invader bullet fsm  
    output reg         play, reset,// global signal
    output reg         invader_direction, // to invader fsm
    output reg         playerbullet_fire, // to player bullet
    output reg         invaderbullet_fire, // to invader bullet ( high when invader bullet his the y limit or has collided)
    output reg         move_down,          // to invader fsm

    output reg [1:0] state          // To be combinationally calculated
);

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter INIT = 2'b00, IN_GAME = 2'b01, DIRECTION_CHANGE = 2'b10, END_GAME = 2'b11;
    wire invader_outofbounds;
    assign invader_outofbounds = invader_outofbounds_signal_1|invader_outofbounds_signal_2|invader_outofbounds_signal_3|invader_outofbounds_signal_4;
/****************************************************************************/
    
    // Calculate absolute value differences between player and invaders
    wire [5:0] diff1 = (player_coordinate_x > invader1_coordinate_x) ? 
                       (player_coordinate_x - invader1_coordinate_x) : 
                       (invader1_coordinate_x - player_coordinate_x);

    wire [5:0] diff2 = (player_coordinate_x > invader2_coordinate_x) ? 
                       (player_coordinate_x - invader2_coordinate_x) : 
                       (invader2_coordinate_x - player_coordinate_x);

    wire [5:0] diff3 = (player_coordinate_x > invader3_coordinate_x) ? 
                       (player_coordinate_x - invader3_coordinate_x) : 
                       (invader3_coordinate_x - player_coordinate_x);

    wire [5:0] diff4 = (player_coordinate_x > invader4_coordinate_x) ? 
                       (player_coordinate_x - invader4_coordinate_x) : 
                       (invader4_coordinate_x - player_coordinate_x);

    wire [5:0] diff_alive1 =    invaders_display[0] ? diff1 : 6'b111111;
    wire [5:0] diff_alive2 =    invaders_display[1] ? diff2 : 6'b111111;
    wire [5:0] diff_alive3 =    invaders_display[2] ? diff3 : 6'b111111;
    wire [5:0] diff_alive4 =    invaders_display[3] ? diff4 : 6'b111111;

    // Compare Invader 1 and Invader 2
    wire [5:0] min_diff_12    = (diff_alive1 < diff_alive2) ? diff_alive1 : diff_alive2;
    wire [5:0] closest_loc_x_12 = (diff_alive1 < diff_alive2) ? invader1_coordinate_x : invader2_coordinate_x;
    wire [5:0] closest_loc_y_12 = (diff_alive1 < diff_alive2) ? invader1_coordinate_y : invader2_coordinate_y;

    // Compare Invader 3 and Invader 4
    wire [5:0] min_diff_34    = (diff_alive3 < diff_alive4) ? diff_alive3 : diff_alive4;
    wire [5:0] closest_loc_x_34 = (diff_alive3 < diff_alive4) ? invader3_coordinate_x : invader4_coordinate_x;
    wire [5:0] closest_loc_y_34 = (diff_alive3 < diff_alive4) ? invader3_coordinate_y : invader4_coordinate_y;
    
    // Compare the winners of the two pairs to get the final coordinate
    assign closest_invader_coord_x = (min_diff_12 < min_diff_34) ? closest_loc_x_12 : closest_loc_x_34;
    assign closest_invader_coord_y = (min_diff_12 < min_diff_34) ? closest_loc_y_12 : closest_loc_y_34;

    // Combinational logic to calculate upcoming tempt state
    always @(*) begin
        case(state)
        // move to in-game if player presses the fire button
        INIT: begin
            if (player_shoot_input) begin
            temp_state = IN_GAME;
            end else begin
            temp_state = INIT;
            end
        end

        IN_GAME: begin
            if (invaders_display == 4'b0 || (~player_display) || closest_invader_coord_y <= 5) begin
            temp_state = INIT;
            end else if (invader_outofbounds) begin
                temp_state = DIRECTION_CHANGE;
            end else begin
            temp_state = IN_GAME;
            end
        end

        DIRECTION_CHANGE: begin
            temp_state = IN_GAME;
        end

        default: temp_state = INIT;
        endcase
    end

    // Sequential logic to set next_state <= temp_state or respond to restart signal
    always @ (negedge clka) begin : FSM_SEQA
        if (global_reset) begin
            next_state <= INIT;
        end else begin
            next_state <= temp_state;
        end
    end

    // Sequential logic to set outputs
    always @ (negedge clkb) begin : FSM_SEQB            // clkb active signals are: Load_Temp, Accumulate
        if (global_reset) begin
                    state <= INIT;
                    player_left_motion <= 0;
                    player_right_motion <= 0;
                    play <= 0;
                    reset <= 1;
                    move_down <= 0;
                    invader_direction <= 1;
                    playerbullet_fire <= 0;
                    invaderbullet_fire <= 0;
        end else begin
        case(next_state)
            INIT: begin
                state <= next_state;
                invader_direction <= 1;
                play <= 0;
                move_down <= 0;
                reset <= 1;
            end
            IN_GAME: begin
                reset <= 0;
                // fire the invader bullet again if has collided or has reached the y limit
                state <= next_state;
                play <= 1;
                move_down <= 0;
                // if((invaderbullet_player_collision_signal | invaderbullet_shield_collision_signal) || invaderbullet_coord_y == BOTTOM_BOUND) begin
                invaderbullet_fire <= 1;
                // end
                //send commands to player and player bullet
                {playerbullet_fire, player_right_motion, player_left_motion} <= {player_shoot_input, player_right_input, player_left_input};
            end

            DIRECTION_CHANGE: begin
                invader_direction <= ~invader_direction;
                move_down <= 1;
            end
        endcase
        end
        end
endmodule
