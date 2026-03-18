///////////////////////////////////////////
// player_fsm.v
//
// Written: ely2@rice.edu
// Created: 2 Mar 2026
//
// Purpose: FSM for player.
// 
//////////////////////////////////////////////////////////////////////////////////////////////// test

module player_fsm #(
    parameter LEFT_BOUND = 6'd1,
    parameter RIGHT_BOUND = 6'd30,
    parameter X_START = 6'd16,
    parameter Y_START = 6'd2
    )(
    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset, play,                        // Global reset and control signals
    input wire  [5:0]       invader_bullet_coord_x,              // Invader bullet X coordinate
    input wire  [5:0]       invader_bullet_coord_y,              // Invader bullet Y coordinate
    input direction                         // Signals to indicate if the player is moving left or right; 1 = right, 0 = left
    output reg               invaderbullet_player_collision,            // Signal to indicate if the player has collided with an invader bullet
    output  reg [5:0]       player_coord_x,                     // Player X coordinate
    output  reg [5:0]       player_coord_y,                     // Player Y coordinate
    output reg              display,                            // Signal to indicate if the player should be displayed on the screen
    output reg  [1:0]       state                               // Current state of this player bullet
    );

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter INIT = 2'b00, PLAY = 2'b01, DEAD = 2'b10;

    // Detection for checking if collision happened in invader bounding box
    wire intersection;     // Check if bullet has reached the top of the screen
    assign intersection = ((invader_bullet_coord_x - player_coord_x < 2 && invader_bullet_coord_x >= player_coord_x) || (invader_bullet_coord_x - player_coord_x > -2 && invader_bullet_coord_x <= player_coord_x)) && (invader_bullet_coord_y == player_coord_y);

    // Combinational logic to calculate upcoming tempt state
    always @(*) begin
        case(state)

        INIT: begin
            if (play) begin
                temp_state = PLAY;
            end else begin
                temp_state = INIT;
            end
        end

        PLAY: begin
            if (intersection) begin
                temp_state = DEAD;
            end else begin
                temp_state = PLAY;
            end
        end

        DEAD: begin
            temp_state = DEAD;
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
            player_coord_x <= X_START;
            player_coord_y <= Y_START;
            invaderbullet_player_collision <= 0;
            display <= 1;
        end else begin

        case(next_state)
            INIT: begin
                state <= next_state;
                player_coord_x <= X_START;
                player_coord_y <= Y_START;
                display <= 0;
                player_bullet_collision <= 0;
            end
            PLAY: begin
                state <= next_state;
                display <= 1;
                if (direction == 0 && player_coord_x > LEFT_BOUND) begin
                    player_coord_x <= player_coord_x - 1;
                end else if (direction == 1 && player_coord_x < RIGHT_BOUND) begin
                    player_coord_x <= player_coord_x + 1;
                end
                else begin
                    player_coord_x <= player_coord_x;
                end
                invaderbullet_player_collision <= 0;
            end
            DEAD: begin
                state <= next_state;
                display <= 0;
                player_coord_x <= player_coord_x;
                player_coord_y <= player_coord_y;
                invaderbullet_player_collision <= 1;
            end

            default: begin
                state <= INIT;
                player_coord_x <= X_START;
                player_coord_y <= Y_START;
                invaderbullet_player_collision <= 0;
                display <= 1;
            end
        endcase
        end
    end
endmodule