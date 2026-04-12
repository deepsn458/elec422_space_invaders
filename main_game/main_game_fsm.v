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
    input wire          playerbullet_invader_collision_signal, // from invader fsm
    input wire          invaderbullet_display, playerbullet_display, shield_display, // from the respective fsms
    input wire[1:0]     hp, // from shield fsm
    input wire          invader_outofbounds_signal_1, invader_outofbounds_signal_2, invader_outofbounds_signal_3, invader_outofbounds_signal_4,


    output reg         player_left_motion, player_right_motion, // to player fsm
    output reg[5:0]    closest_invader_coord_x, closest_invader_coord_y, // to invader bullet fsm  
    output reg         play, reset,// global signal
    output reg         invader_direction, // to invader fsm
    output reg         playerbullet_fire, // to player bullet
    output reg         invaderbullet_fire, // to invader bullet ( high when invader bullet his the y limit or has collided)

    output reg [1:0] state          // To be combinationally calculated
);

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter INIT = 2'b00, IN_GAME = 2'b01, END_GAME = 2'b10;
    wire invader_outofbounds;
    assign invader_outofbounds = invader_outofbounds_signal_1|invader_outofbounds_signal_2|invader_outofbounds_signal_3|invader_outofbounds_signal_4;
    reg prev_invader_outofbounds;
/****************************************************************************/
    task find_closest_invader;
    reg [5:0] diff [0:3];
    reg [5:0] min_diff;
    reg [1:0] min_idx;
    integer i;
    begin
    // Absolute differences
    diff[0] = (invader1_coordinate_x >= invaderbullet_coord_x) ? (invader1_coordinate_x - invaderbullet_coord_x) : (invaderbullet_coord_x - invader1_coordinate_x);
    diff[1] = (invader2_coordinate_x >= invaderbullet_coord_x) ? (invader2_coordinate_x - invaderbullet_coord_x) : (invaderbullet_coord_x - invader2_coordinate_x);
    diff[2] = (invader3_coordinate_x >= invaderbullet_coord_x) ? (invader3_coordinate_x - invaderbullet_coord_x) : (invaderbullet_coord_x - invader3_coordinate_x);
    diff[3] = (invader4_coordinate_x >= invaderbullet_coord_x) ? (invader4_coordinate_x - invaderbullet_coord_x) : (invaderbullet_coord_x - invader4_coordinate_x);

    // Find minimum and track index
    min_diff = diff[0];
    min_idx  = 0;
    for (i = 1; i < 4; i = i + 1) begin
        if (diff[i] < min_diff) begin
            min_diff = diff[i];
            min_idx  = i;
        end
    end

    // Assign closest invader coords directly by index
    case (min_idx)
        2'd0: begin closest_invader_coord_x = invader1_coordinate_x; closest_invader_coord_y = invader1_coordinate_y; end
        2'd1: begin closest_invader_coord_x = invader2_coordinate_x; closest_invader_coord_y = invader2_coordinate_y; end
        2'd2: begin closest_invader_coord_x = invader3_coordinate_x; closest_invader_coord_y = invader3_coordinate_y; end
        2'd3: begin closest_invader_coord_x = invader4_coordinate_x; closest_invader_coord_y = invader4_coordinate_y; end
    endcase
    end
    endtask
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
            if (invaders_display == 4'b0 || (~player_display |invader_outofbounds)) begin
            temp_state = INIT;
            end else begin
            temp_state = IN_GAME;
            end
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
            closest_invader_coord_x <= 0;
            closest_invader_coord_y <= 0;
            play <= 0;
            reset <= 1;
            invader_direction <= DIRECTION_RIGHT;
            playerbullet_fire <= 0;
            invaderbullet_fire <= 0;
        end else begin
        case(next_state)
            INIT: begin
                state <= next_state;
                play <= 0;
                reset <= 0;
            end

            IN_GAME: begin
                // fire the invader bullet again if has collided or has reached the y limit
                state <= next_state;
                play <= 1;
                if((invaderbullet_player_collision_signal | invaderbullet_shield_collision_signal) || invaderbullet_coord_y == BOTTOM_BOUND) begin
                    invaderbullet_fire <= 1;
                end
                //send commands to player and player bullet
                {playerbullet_fire, player_right_motion, player_left_motion} <= {player_shoot_input, player_right_input, player_left_input};
                
                //set invader direction
                if (invader_outofbounds & ~prev_invader_outofbounds)
                    invader_direction <= ~invader_direction;
                prev_invader_outofbounds <= invader_outofbounds;

                //find closest invader coordinate
                find_closest_invader();
            end
        endcase
        end
    end


endmodule
