///////////////////////////////////////////
// main_game_fsm_tb.v
//
// Optimized for State Transition Coverage
////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module main_game_fsm_tb();

    reg in_clka, in_clkb, in_global_reset;
    reg in_player_left_input, in_player_right_input, in_player_shoot_input;
    reg in_player_display;
    reg [3:0] in_player_coordinate_x, in_player_coordinate_y;
    reg [1:0] in_invaders_display;
    reg [3:0] in_invader1_coordinate_x, in_invader1_coordinate_y;
    reg [3:0] in_invader2_coordinate_x, in_invader2_coordinate_y;
    reg [3:0] in_invaderbullet_coord_x, in_invaderbullet_coord_y;
    reg in_invaderbullet_player_collision_signal, in_invaderbullet_shield_collision_signal;
    reg in_invader_outofbounds_signal_1, in_invader_outofbounds_signal_2;

    wire out_player_left_motion, out_player_right_motion;
    wire [3:0] out_closest_invader_coord_x, out_closest_invader_coord_y;
    wire out_play, out_reset, out_invader_direction, out_playerbullet_fire, out_invaderbullet_fire, out_move_down;
    wire [1:0] out_state;

    main_game_fsm DUT (
        .clka (in_clka), .clkb (in_clkb), .global_reset (in_global_reset),
        .player_left_input (in_player_left_input), .player_right_input (in_player_right_input),
        .player_shoot_input (in_player_shoot_input), .player_display (in_player_display),
        .player_coordinate_x (in_player_coordinate_x), .player_coordinate_y (in_player_coordinate_y),
        .invaders_display (in_invaders_display),
        .invader1_coordinate_x (in_invader1_coordinate_x), .invader1_coordinate_y (in_invader1_coordinate_y),
        .invader2_coordinate_x (in_invader2_coordinate_x), .invader2_coordinate_y (in_invader2_coordinate_y),
        .invaderbullet_coord_x (in_invaderbullet_coord_x), .invaderbullet_coord_y (in_invaderbullet_coord_y),
        .invaderbullet_player_collision_signal (in_invaderbullet_player_collision_signal),
        .invaderbullet_shield_collision_signal (in_invaderbullet_shield_collision_signal),
        .invader_outofbounds_signal_1 (in_invader_outofbounds_signal_1),
        .invader_outofbounds_signal_2 (in_invader_outofbounds_signal_2),
        .player_left_motion (out_player_left_motion), .player_right_motion (out_player_right_motion),
        .closest_invader_coord_x (out_closest_invader_coord_x), .closest_invader_coord_y (out_closest_invader_coord_y),
        .play (out_play), .reset (out_reset), .invader_direction (out_invader_direction),
        .playerbullet_fire (out_playerbullet_fire), .invaderbullet_fire (out_invaderbullet_fire),
        .move_down (out_move_down), .state (out_state)
    );

    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10;
        end
    endtask

    initial begin
        // --- 1. RESET AND SETUP ---
        in_global_reset = 1;
        in_player_display = 1; in_invaders_display = 2'b11;
        in_player_coordinate_x = 4'd7; in_player_coordinate_y = 4'd2;
        in_invader1_coordinate_x = 4'd2; in_invader1_coordinate_y = 4'd10;
        in_invader2_coordinate_x = 4'd12; in_invader2_coordinate_y = 4'd10;
        in_invader_outofbounds_signal_1 = 0; in_invader_outofbounds_signal_2 = 0;
        in_player_shoot_input = 0;
        cycle();
        in_global_reset = 0;
        cycle(); 

        // --- 2. ENTER IN_GAME ---
        in_player_shoot_input = 1;
        cycle();
        in_player_shoot_input = 0;
        
        // Ensure prev_invader_outofbounds is definitely 0
        in_invader_outofbounds_signal_1 = 0;
        cycle(); 

        // --- 3. THE DIRECTION CHANGE TRIGGER ---
        // We set signal=1. On clka, (1 & ~0) is true, so temp_state = DIRECTION_CHANGE.
        // On clkb, state becomes DIRECTION_CHANGE and prev_invader_outofbounds becomes 1.
        $display("Attempting to enter DIRECTION_CHANGE...");
        in_clka = 0; in_clkb = 0; #10;
        in_invader_outofbounds_signal_1 = 1;
        in_clka = 1; in_clkb = 0; #10; 
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        cycle();
        cycle(); 
        
        if (out_state == 2'b10) 
            $display("SUCCESS: State is DIRECTION_CHANGE");
        else 
            $display("FAIL: State is %b", out_state);

        // --- 4. EXIT DIRECTION CHANGE ---
        // It stays in DIRECTION_CHANGE for 1 cycle then goes back to IN_GAME
        cycle(); 
        in_invader_outofbounds_signal_1 = 0; // Release boundary
        cycle();
        cycle();

        // --- 5. RE-ENTER DIRECTION CHANGE (Boundary 2) ---
        in_clka = 0; in_clkb = 0; #10;
        in_invader_outofbounds_signal_2 = 1;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        cycle();
        cycle();
        if (out_state == 2'b10) $display("SUCCESS: Hit Boundary 2");
        in_invader_outofbounds_signal_2 = 0;
        cycle();

        // --- 6. CLEANUP & RESET SEQUENCES ---
        // Win Case
        in_invaders_display = 2'b00;
        cycle(); 
        
        // Final Reset Sequence to show we can return to INIT anytime
        in_global_reset = 1;
        cycle();
        in_global_reset = 0;
        
        $display("Testing complete.");
        $stop;
    end

    initial begin
        $monitor("T:%0t | State:%b | Play:%b | MoveDn:%b | Dir:%b | OutOfBounds:%b | Prev:%b", 
                 $time, out_state, out_play, out_move_down, out_invader_direction, 
                 (in_invader_outofbounds_signal_1 | in_invader_outofbounds_signal_2), 
                 DUT.prev_invader_outofbounds);
    end

endmodule