`timescale 1ns/100ps

module main_game_fsm_tb();

    // Inputs
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

    // Outputs
    wire out_player_left_motion, out_player_right_motion;
    wire [3:0] out_closest_invader_coord_x, out_closest_invader_coord_y;
    wire out_play, out_reset;
    wire out_invader_direction, out_playerbullet_fire, out_invaderbullet_fire, out_move_down;
    wire [1:0] out_state;

    // UUT Instance
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

    // Standard clock cycle task
    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10; // State logic samples here
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10; // Outputs and prev_bounds update here
        end
    endtask

    initial begin
        // --- 1. INITIALIZATION ---
        in_clka = 0; in_clkb = 0;
        in_global_reset = 1;
        in_player_left_input = 0; in_player_right_input = 0; in_player_shoot_input = 0;
        in_player_display = 1; in_invaders_display = 2'b11;
        in_player_coordinate_x = 4'd7; in_player_coordinate_y = 4'd15;
        in_invader1_coordinate_x = 4'd2; in_invader1_coordinate_y = 4'd10;
        in_invader2_coordinate_x = 4'd12; in_invader2_coordinate_y = 4'd10;
        in_invaderbullet_coord_x = 4'd0; in_invaderbullet_coord_y = 4'd0;
        in_invaderbullet_player_collision_signal = 0;
        in_invaderbullet_shield_collision_signal = 0;
        in_invader_outofbounds_signal_1 = 0; in_invader_outofbounds_signal_2 = 0;

        cycle();
        in_global_reset = 0;
        cycle(); 

        // --- 2. MOVE TO IN_GAME ---
        in_player_shoot_input = 1;
        cycle(); 
        in_player_shoot_input = 0;

        // --- 3. FORCE DIRECTION_CHANGE ---
        // Requirement: invader_outofbounds is 1 AND prev_invader_outofbounds is 0
        in_invader_outofbounds_signal_1 = 1;
        
        // Run one cycle: 
        // Clka will see (outofbounds=1, prev=0) -> next_state = DIRECTION_CHANGE
        // Clkb will set state = DIRECTION_CHANGE and prev_invader_outofbounds = 1
        cycle(); 
        
        // Verify we are in DIRECTION_CHANGE (state 2'b10)
        if (out_state == 2'b10) $display("Success: Entered DIRECTION_CHANGE");
        else $display("Error: Failed to enter DIRECTION_CHANGE. State is %b", out_state);

        // --- 4. RETURN TO IN_GAME ---
        // In DIRECTION_CHANGE, the code sets temp_state = IN_GAME automatically 
        // unless a loss condition is met.
        in_invader_outofbounds_signal_1 = 0; // Clear the boundary sensor
        cycle(); 
        
        // --- 5. TEST WIN CONDITION (IN_GAME -> INIT) ---
        in_invaders_display = 2'b00;
        cycle(); 
        in_invaders_display = 2'b11; // Reset
        in_player_shoot_input = 1; cycle(); in_player_shoot_input = 0; // Restart

        // --- 6. TEST LOSS: LANDED (IN_GAME -> INIT) ---
        in_invader1_coordinate_y = 4'd4; 
        cycle(); 
        in_invader1_coordinate_y = 4'd10; // Reset
        in_player_shoot_input = 1; cycle(); in_player_shoot_input = 0; // Restart

        // --- 7. TEST LOSS: DEATH (IN_GAME -> INIT) ---
        in_player_display = 0;
        cycle();
        in_player_display = 1; // Reset
        in_player_shoot_input = 1; cycle(); in_player_shoot_input = 0; // Restart

        // --- 8. TEST DIRECTION_CHANGE -> INIT (Death while turning) ---
        in_invader_outofbounds_signal_2 = 1;
        // Trigger the transition logic
        in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; // next_state is now DIRECTION_CHANGE
        in_player_display = 0; // Kill player before Clkb completes the transition
        in_clka = 0; in_clkb = 1; #10;
        cycle(); // Should be back in INIT

        $display("Exhaustive Robust Sequence Complete.");
        $stop;
    end

    initial begin
        $monitor("Time:%0t | State:%b | Bounds:%b | PrevBounds:%b | MoveDn:%b | Dir:%b", 
                 $time, out_state, (in_invader_outofbounds_signal_1 | in_invader_outofbounds_signal_2),
                 DUT.prev_invader_outofbounds, out_move_down, out_invader_direction);
    end

endmodule