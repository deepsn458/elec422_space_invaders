///////////////////////////////////////////
// main_game_fsm.v
//
// Written: ely2@rice.edu
// Created: 2 Mar 2026
//
// Purpose: FSM for main game logic.
// 
//////////////////////////////////////////////////////////////////////////////////////////////// test

module main_game_fsm(
    input wire          clka, clkb,                             // Input clocks
    input wire          global_reset,                           // Global reset signal

    input wire          player_fire,                            // Player fire signal
    input wire          player_left, player_right,              // Player movement signals
    // input wire          player_coordinates,                     // Player coordinates
    input wire          player_alive,                           // Player alive signal
    
    // input wire          invader_coordinates,                    // Invader coordinates
    input wire          invader_alive,                          // Invader alive signal

    output reg          player_left_out, player_right_out,      // Forwarded player movement outputs
    output reg [5:0]    invader_bullet_start_position_x,        // Starting position_x of the invader bullet
    output reg [5:0]    invader_bullet_start_position_y,        // Starting position_y of the invader bullet
    output reg          invader_right_position,                 // Coordinates of rightmost invader
    output reg          invader_left_position,                  // Coordinates of leftmost invader
    output reg          invader_direction,                      // Direction of invader movement
    output reg      reset_player, reset_invader, reset_shield,  // Reset signals for player, invader, and shield
    output reg          play,                                   // Game is in play
    output reg          invader_offset
    );

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter INIT  = 2'b00, FIRING = 2'b01;

    // Detection for checking if collision happened in invader bounding box
    wire collide, boundary;
    assign collide = player_bullet_collision | shield_bullet_collision;
    assign boundary = (player_bullet_coord_y >= Y_MAX);     // Check if bullet has reached the top of the screen

    // Combinational logic to calculate upcoming tempt state
    always @(*) begin
        case(state)

        INIT: begin
            if (fire) begin
            temp_state = FIRING;
            end else begin
            temp_state = INIT;
            end
        end

        FIRING: begin
            if (collide | boundary) begin
            temp_state = INIT;
            end else begin
            temp_state = FIRING;
            end
        end

        default: temp_state = INIT;
        endcase
    end

    // Sequential logic to set next_state <= temp_state or respond to restart signal
    always @ (negedge clka) begin : FSM_SEQA
        if (reset) begin
            next_state <= INIT;
        end else begin
            next_state <= temp_state;
        end
    end

    // Sequential logic to set outputs
    always @ (negedge clkb) begin : FSM_SEQB            // clkb active signals are: Load_Temp, Accumulate
        if (reset) begin
            state <= INIT;
            player_bullet_coord_x <= 0;
            player_bullet_coord_y <= 0;
            display <= 0;
        end else begin

        case(next_state)
            INIT: begin
                state <= next_state;
                player_bullet_coord_x <= player_coord_x;
                player_bullet_coord_y <= player_coord_y;
                display <= 0;
            end
            FIRING: begin
                state <= next_state;
                player_bullet_coord_x <= player_bullet_coord_x;
                player_bullet_coord_y <= player_bullet_coord_y + Y_OFFSET;
                display <= 1;
            end
        endcase
        end
    end


endmodule