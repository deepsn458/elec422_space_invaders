///////////////////////////////////////////
// shield_fsm_tb.v
//
// Updated: 4 May 2026
// Purpose: Robust testing for shield HP depletion and state transitions.
////////////////////////////////////////////////////////////////////////////////////////////////

module shield_fsm_tb();

    // Inputs
    reg in_clka, in_clkb, in_reset;
    reg [3:0] in_invader_bullet_coord_x, in_invader_bullet_coord_y;
    reg [3:0] in_player_bullet_coord_x, in_player_bullet_coord_y;
    reg in_shield_play;

    // Outputs
    wire [1:0] out_hp;
    wire out_shield_display;
    wire out_invaderbullet_shield_collision;
    wire out_playerbullet_shield_collision;
    wire [1:0] out_state;

    // Parameters matching module defaults
    parameter START_X = 7;
    parameter START_Y = 5;

    // Instantiate UUT
    shield_fsm DUT (
        .clka(in_clka),
        .clkb(in_clkb),
        .reset(in_reset),
        .invader_bullet_coord_x(in_invader_bullet_coord_x),
        .invader_bullet_coord_y(in_invader_bullet_coord_y),
        .player_bullet_coord_x(in_player_bullet_coord_x),
        .player_bullet_coord_y(in_player_bullet_coord_y),
        .shield_play(in_shield_play),
        .hp(out_hp),
        .shield_display(out_shield_display),
        .invaderbullet_shield_collision(out_invaderbullet_shield_collision),
        .playerbullet_shield_collision(out_playerbullet_shield_collision),
        .state(out_state)
    );

    // Standard dual-clock cycle task
    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10; // next_state calculation
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10; // output/HP update
        end
    endtask

    initial begin
        // --- 1. INITIALIZATION ---
        in_reset = 1; in_shield_play = 0;
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        in_player_bullet_coord_x = 0;  in_player_bullet_coord_y = 0;
        cycle();
        in_reset = 0;
        cycle(); // Confirm state is INITIAL (2'b00)

        // --- 2. START GAME (INITIAL -> ALIVE) ---
        in_shield_play = 1;
        cycle(); 
        in_shield_play = 0;
        // State should be ALIVE (2'b01), HP should be 3.

        // --- 3. HIT 1: Invader Bullet (HP 3 -> 2) ---
        // Collision logic: y must match exactly, x must be within START_X to START_X+2
        in_invader_bullet_coord_x = START_X + 1; 
        in_invader_bullet_coord_y = START_Y;
        cycle(); 
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0; // Remove bullet
        cycle(); // IDLE cycle to see HP update

        // --- 4. HIT 2: Player Bullet (Testing friendly fire collision signal) ---
        in_player_bullet_coord_x = START_X;
        in_player_bullet_coord_y = START_Y;
        cycle();
        in_player_bullet_coord_x = 0; in_player_bullet_coord_y = 0;
        cycle();

        // --- 5. HIT 3: Invader Bullet (HP 2 -> 1) ---
        in_invader_bullet_coord_x = START_X + 2;
        in_invader_bullet_coord_y = START_Y;
        cycle();
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        cycle();

        // --- 6. HIT 4: Final Blow (HP 1 -> 0, ALIVE -> NO_HEALTH) ---
        in_invader_bullet_coord_x = START_X;
        in_invader_bullet_coord_y = START_Y;
        cycle(); // HP goes to 0
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        
        // Final transition to NO_HEALTH requires a clka edge while HP < 1
        cycle(); 

        // --- 7. VERIFY NO_HEALTH AUTO-RESET ---
        // Your code has a specific behavior: NO_HEALTH sets state back to INITIAL.
        cycle();

        $dumpfile("shield_fsm_tb.vcd"); 
        $dumpvars; 
        $display("Shield Robust Test Complete.");
        $stop;
    end

    initial begin
        $monitor("T:%0t | State:%b | HP:%d | Disp:%b | Inv_Coll:%b | Ply_Coll:%b", 
                 $time, out_state, out_hp, out_shield_display, 
                 out_invaderbullet_shield_collision, out_playerbullet_shield_collision);
    end

endmodule