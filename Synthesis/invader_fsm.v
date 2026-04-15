///////////////////////////////////////////
// invader_fsm.v
//
// Written: jc165@rice.edu
// Created: 2 Mar 2026
//
// Purpose: Control FSM for an invader entity
// 
////////////////////////////////////////////////////////////////////////////////////////////////

module invader_fsm
    #(
    parameter START_X = 5,                                      // Start X coordinate of this invader
    parameter START_Y = 5,                                      // Start Y coordinate of this invader
    parameter Y_OFFSET = 2,                                     // Number of pixels to travel downwards upon vertical movement
    parameter DEAD_X = 5,                                       // X coordinate to place invader once dead
    parameter DEAD_Y = 5,                                       // Y coordinate to place invader once dead
    parameter X_OFFSET = 1,                                     // Number of pixels to travel sideways upon horizontal movement
    // change bounds to 4 and 27 to test noshoot tb.
    parameter HORIZ_LEFT_BOUND = 2,                             // originally 2 and 29
    parameter HORIZ_RIGHT_BOUND = 29                            // Left and Right bounds
    )(

    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset, play,                        // Global control and reset signals
    input  wire             invader_direction,                  // direction bit for horizontal movement (left is 0)
    input wire move_down,                                       // Tells invader to move down
    input  wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    input  wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    output reg              display,                              // Bit indicating if invader is still alive. Can be used as display bit
    output reg              playerbullet_invader_collision_signal,     // Signal indicating if an invader has been hit by a player bullet
    output reg  [5:0]       invader_coord_x,                    // Player bullet X coordinate
    output reg  [5:0]       invader_coord_y,                    // Player bullet Y coordinate
    output reg              invader_outofbounds_signal,         // tells main game fsm when invader will hit boundary next cycle
    output reg  [1:0]       state                               // Current state of this invader
    );

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter RESET  = 2'b00, MOVE = 2'b01, DEAD = 2'b10,  INVALID = 2'b11;

    // Detection for checking if collision happened in invader bounding box
    //invader is 3x3
    wire collision_detect_x;
    wire collision_detect_y;
   
    assign collision_detect_x = (player_bullet_coord_x <= (invader_coord_x + 1)) & (player_bullet_coord_x >= (invader_coord_x - 1));
    assign collision_detect_y = (player_bullet_coord_y <= (invader_coord_y + 1)) & (player_bullet_coord_y >= (invader_coord_y - 1));

    // Combinational logic to calculate upcoming tempt state
    always @(*) begin
        case(state)

        RESET: begin
            if (play) begin
            temp_state = MOVE;
            end else begin
            temp_state = RESET;
            end
                end

        MOVE: begin
            if (collision_detect_x & collision_detect_y) begin
            temp_state = DEAD;
            end else begin
            temp_state = MOVE;
            end
        end

        DEAD: begin
            temp_state = DEAD;
        end

        default: temp_state = RESET;
        endcase
    end

    // Sequential logic to set next_state <= temp_state or respond to restart signal
    always @ (negedge clka) begin : FSM_SEQ
        if (reset) begin
            next_state <= RESET;
        end else begin
            next_state <= temp_state;
        end
    end
    
    // This wire toggles each clkb and gates the movement of invaders so that they move left/right
    // once every other clock
    reg move_interval_toggle;

    // Sequential logic to set outputs
    always @ (negedge clkb) begin : OUTPUT_LOGIC

        case(next_state)
            RESET: begin
                    state <= next_state;

                    invader_coord_x <= START_X;
                    invader_coord_y <= START_Y;
                    playerbullet_invader_collision_signal <= 0;
                    move_interval_toggle <= 0;
                    invader_outofbounds_signal <= 0;
                    
                    display <= 1;
                end

            MOVE: begin
                    state <= next_state;

                    // Toggle the clock div system
                    move_interval_toggle <= ~move_interval_toggle;
                    
                    if (move_down) begin
                        invader_coord_y <= invader_coord_y - Y_OFFSET;
                    end else if (move_interval_toggle) begin
                        if (invader_direction) begin
                            invader_coord_x <= invader_coord_x + X_OFFSET;
                            if (invader_coord_x + X_OFFSET * 2 >= HORIZ_RIGHT_BOUND) begin
                                invader_outofbounds_signal <= 1;
                            end
                            else begin
                                invader_outofbounds_signal <= 0;
                            end
                        end else begin
                            invader_coord_x <= invader_coord_x - X_OFFSET;
                            if (invader_coord_x <= HORIZ_LEFT_BOUND + X_OFFSET * 2) begin
                                invader_outofbounds_signal <= 1;
                            end
                            else begin
                                invader_outofbounds_signal <= 0;
                            end
                        end
                    end
                end

            DEAD: begin
                    state <= next_state;
                    
                    invader_coord_x <= DEAD_X;
                    invader_coord_y <= DEAD_Y;

                    invader_outofbounds_signal <= 0;

                    display <= 0;
                    
                    // This logic ensures the playerbullet_invader_collision_signal is toggled on once upon invader death, then set to zero afterwards.
                    // NOTE: This signal is this specific invader's collision signal.
                    //       It should be ORed with the other invaders' signals to create the global playerbullet_invader_collision_signal
                    if (state == MOVE) begin
                        playerbullet_invader_collision_signal <= 1;
                    end else begin
                        playerbullet_invader_collision_signal <= 0;
                    end
                end
        endcase
    end
endmodule
