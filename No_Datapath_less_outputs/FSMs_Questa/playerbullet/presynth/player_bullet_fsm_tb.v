///////////////////////////////////////////
// player_bullet_fsm_tb.v
//
// Purpose: Robust Testbench for player_bullet_fsm
////////////////////////////////////////////////////////////////////////////////////////////////

module player_bullet_fsm_tb();

    // Inputs to the module
    reg in_clka, in_clkb, in_reset, in_fire;
    reg [3:0] in_player_coord_x, in_player_coord_y;
    reg in_player_bullet_collision, in_shield_bullet_collision;

    // Outputs from the module
    wire out_display;
    wire [3:0] out_player_bullet_coord_x, out_player_bullet_coord_y;
    wire [1:0] out_state;

    // Instantiate the player_bullet_fsm
    player_bullet_fsm U1 (
        .clka (in_clka),
        .clkb (in_clkb),
        .reset (in_reset),
        .fire (in_fire),
        .player_coord_x (in_player_coord_x),
        .player_coord_y (in_player_coord_y),
        .player_bullet_collision (in_player_bullet_collision),
        .shield_bullet_collision (in_shield_bullet_collision),
        .display (out_display),
        .player_bullet_coord_x (out_player_bullet_coord_x),
        .player_bullet_coord_y (out_player_bullet_coord_y),
        .state (out_state)
    );

    integer i;

    // Task to handle the specific dual-clock timing used in your logic
    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10; // next_state logic
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10; // output and state update
        end
    endtask

    initial
    begin
        // cycle 0: initialize
        in_reset = 0;
        in_fire = 0;
        in_player_coord_x = 4'd7;
        in_player_coord_y = 4'd2;
        in_player_bullet_collision = 0;
        in_shield_bullet_collision = 0;
        cycle();

        // cycle 1: Reset to INIT
        in_reset = 1;
        cycle();
        in_reset = 0;
        cycle();

        // --- SCENARIO 1: Fire and hit Invader ---
        in_fire = 1;
        cycle(); // Transitions to FIRING
        in_fire = 0;
        
        repeat (3) cycle(); // Bullet travels
        
        in_player_bullet_collision = 1; // Collision trigger
        cycle(); // Should transition back to INIT
        in_player_bullet_collision = 0;
        cycle(); // Stay in INIT

        // --- SCENARIO 2: Fire and hit Shield ---
        in_player_coord_x = 4'd12; // New position
        in_fire = 1;
        cycle();
        in_fire = 0;
        
        repeat (2) cycle();
        
        in_shield_bullet_collision = 1; // Collision trigger
        cycle(); // Should transition back to INIT
        in_shield_bullet_collision = 0;
        cycle();

        // --- SCENARIO 3: Fire and hit Top Boundary (Y_MAX=15) ---
        in_player_coord_x = 4'd2;
        in_player_coord_y = 4'd10; // Start higher to reach boundary faster
        in_fire = 1;
        cycle();
        in_fire = 0;

        // Travel until out_player_bullet_coord_y >= 15
        for (i = 0; i < 8; i = i + 1) begin
            cycle();
        end

        // --- SCENARIO 4: Test Reset mid-flight ---
        in_fire = 1;
        cycle();
        in_fire = 0;
        cycle();
        in_reset = 1;
        cycle();
        in_reset = 0;

        $dumpfile ("player_bullet_fsm_tb.vcd"); 
        $dumpvars; 
        $display ("Simulation complete. All exit paths tested.");
        $stop;
    end 

endmodule