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
)
(
    input wire          clka, clkb,                             // Input clocks
    input wire          global_reset,                           // Global reset signal

    input wire          player_left_input,
    input wire          player_right_input,
    input wire          player_shoot_input,
    input wire          player_display,  // from player fsm
    input wire[5:0]     player_coordinate_x, player_coordinate_y, // from player fsm
    input wire          invader_display, // from invader fsm 
    input wire[5:0]     invader_coordinate_x, invader_coordinate_y, // from invader fsm
    input wire          invaderbullet_player_collision_signal, // from player fsm (bullet hits player)
    input wire          playerbullet_invader_collision_signal, // from invader fsm
    input wire          invaderbullet_display, playerbullet_display, shield_display, // from the respective fsms
    input wire[1:0]          hp, // from shield fsm

    output wire         player_left_motion, player_right_motion, 
);

   

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