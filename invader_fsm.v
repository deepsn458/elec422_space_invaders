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
    parameter Y_OFFSET = 3,                                     // Number of pixels to travel downwards upon vertical movement
    parameter DEAD_X = 5,                                       // X coordinate to place invader once dead
    parameter DEAD_Y = 5                                        // Y coordinate to place invader once dead
    )(

    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset, play, move_down,             // Global control and reset signals
    input  wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    input  wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    output reg              alive,                              // Bit indicating if invader is still alive. Can be used as display bit
    output reg              player_bullet_collision_signal,     // Signal indicating if an invader has been hit by a player bullet
    output reg  [5:0]       invader_coord_x,                    // Player bullet X coordinate
    output reg  [5:0]       invader_coord_y,                    // Player bullet Y coordinate

    output reg  [3:0]       state                               // Current state of this invader
    );

    reg [1:0] temp_state;           // To be combinationally calculated
    reg [1:0] next_state;           // To be sequentially assigned

    // parameter SIZE = 2;
    parameter RESET  = 2'b00, MOVE = 2'b01, DEAD = 2'b10,  INVALID = 2'b11;

    // Detection for checking if collision happened in invader bounding box
    wire collision_detect_x;
    wire collision_detect_y;
    assign collision_detect_x = (player_bullet_coord_x < (invader_coord_x + 1)) & (player_bullet_coord_x > (invader_coord_x - 1));
    assign collision_detect_y = (player_bullet_coord_y < (invader_coord_y + 1)) & (player_bullet_coord_y > (invader_coord_y - 1));

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

        default: temp_state = IDLE;
        endcase
    end

    // Sequential logic to set next_state <= temp_state or respond to restart signal
    always @ (negedge clka) begin : FSM_SEQA
        if (reset) begin
        next_state <= IDLE;
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
