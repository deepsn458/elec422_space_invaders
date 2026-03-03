///////////////////////////////////////////
// player_bullet.v
//
// Written: ely2@rice.edu
// Created: 2 Mar 2026
//
// Purpose: FSM for player bullet.
// 
//////////////////////////////////////////////////////////////////////////////////////////////// test

module player_bullet_fsm
    #(
    parameter Y_OFFSET = 3,                                     // Number of pixels to travel upwards upon vertical movement
    parameter Y_MAX = 31                                        // Maximum Y coordinate for the player bullet (top of the screen)
    )(
    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset, fire,                        // Global control and reset signals
    input  wire [5:0]       player_coord_x,                     // Player bullet X coordinate
    input  wire [5:0]       player_coord_y,                     // Player bullet Y coordinate
    input wire              player_bullet_collision,            // Signal to indicate if the player bullet has collided with an invader
    input wire              shield_bullet_collision,            // Signal to indicate if the player bullet has collided with a shield
    output reg              display,                            // Signal to indicate if the player bullet should be displayed on the screen
    output reg  [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    output reg  [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    output reg  [1:0]       state                               // Current state of this player bullet
    );

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter INIT  = 2'b00, FIRING = 2'b01;

    // Detection for checking if collision happened in invader bounding box
    wire collide, boundary;
    assign collide = player_bullet_collision | shield_bullet_collision;
    assign boundary = (player_coord_y >= Y_MAX);     // Check if bullet has reached the top of the screen

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
            reg_clear <= 1;         // clear registers only if restart is asserted
            Load_X <= 0;
            Load_Y <= 0;
        end else begin
        next_state <= temp_state;
        reg_clear <= 0;         // Stop clearing registers when not restarting

        case(temp_state)        // assign clka signals based on tempstate
            IDLE: begin
                    // On clka, set Load_X and Load_Y to 0
                    Load_X <= 0;
                    Load_Y <= 0;
                end

            ADD_ADD: begin
                    // On clka, set Load_X and Load_Y to 1
                    Load_X <= 1;
                    Load_Y <= 1;
                end

            ADD_ACC: begin
                    // On clka, set Load_X and Load_Y to 1
                    Load_X <= 1;
                    Load_Y <= 1;
                end
        endcase
        end
    end

    // Sequential logic to set outputs
    always @ (negedge clkb) begin : FSM_SEQB            // clkb active signals are: Load_Temp, Accumulate
        if (Restart) begin
        Load_Temp <= 0;
        Accumulate <= 0;
        end else begin

        case(next_state)
            IDLE: begin
                    state <= next_state;

                    // On clkb, set Load_Temp and Accumulate to 0
                    Load_Temp <= 0;
                    Accumulate <= 0;
                end

            ADD_ADD: begin
                    state <= next_state;
                    
                    // On clkb, set Load_Temp to 1 and Accumulate to 0
                    Load_Temp <= 1;
                    Accumulate <= 0;
                end

            ADD_ACC: begin
                    state <= next_state;
                    
                    // On clkb, set Load_Temp and Accumulate to 1
                    Load_Temp <= 1;
                    Accumulate <= 1;
                end
        endcase
        end
    end


endmodule