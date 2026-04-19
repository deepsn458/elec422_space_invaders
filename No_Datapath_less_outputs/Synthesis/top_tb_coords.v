`timescale 1ns / 1ps

module top_tb_coords ();

reg in_clka, in_clkb, in_reset;
reg in_player_left_input, in_player_right_input;
reg in_fire;

// New discrete wire connections
wire [3:0] player_coord_x, player_coord_y;
wire       player_display;

wire [3:0] invader_1_coord_x, invader_1_coord_y;
wire       invader_1_display;

wire [3:0] invader_2_coord_x, invader_2_coord_y;
wire       invader_2_display;

wire [3:0] shield_coord_x, shield_coord_y;
wire [1:0] shield_hp;
wire       shield_display;

wire [3:0] player_bullet_coord_x, player_bullet_coord_y;
wire       player_bullet_display;

wire [3:0] invader_bullet_coord_x, invader_bullet_coord_y;
wire       invader_bullet_display;

integer log_file;

task log_matrix;
    input [255:0] test_name;
    begin
        // Format the log to output coordinate pairs rather than a raw matrix
        $fdisplay(log_file, "TIME: %0t | TEST: %s", $time, test_name);
        $fdisplay(log_file, "player %d %d %d", player_coord_x, player_coord_y, player_display);
        $fdisplay(log_file, "invader_1 %d %d %d", invader_1_coord_x, invader_1_coord_y, invader_1_display);
        $fdisplay(log_file, "invader_2 %d %d %d", invader_2_coord_x, invader_2_coord_y, invader_2_display);
        $fdisplay(log_file, "shield %d %d %d %d", shield_coord_x, shield_coord_y, shield_hp, shield_display);
        $fdisplay(log_file, "player_bullet %d %d %d", player_bullet_coord_x, player_bullet_coord_y, player_bullet_display);
        $fdisplay(log_file, "invader_bullet %d %d %d", invader_bullet_coord_x, invader_bullet_coord_y, invader_bullet_display);
        $fdisplay(log_file, "END_FRAME");
    end
endtask

task cycle;
    begin
        in_clka = 0; in_clkb = 0; #1000;
        in_clka = 1; in_clkb = 0; #1000;
        in_clka = 0; in_clkb = 0; #1000;
        in_clka = 0; in_clkb = 1; #1000;
        log_matrix("");
    end
endtask

// Instantiate top using explicitly mapped ports
top U1 (
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .player_left_input(in_player_left_input),
    .player_right_input(in_player_right_input),
    .player_shoot_input(in_fire),
    
    .player_coord_x(player_coord_x),
    .player_coord_y(player_coord_y),
    .player_display(player_display),
    
    .invader_1_coord_x(invader_1_coord_x),
    .invader_1_coord_y(invader_1_coord_y),
    .invader_1_display(invader_1_display),
    
    .invader_2_coord_x(invader_2_coord_x),
    .invader_2_coord_y(invader_2_coord_y),
    .invader_2_display(invader_2_display),
    
    .invader_3_coord_x(invader_3_coord_x),
    .invader_3_coord_y(invader_3_coord_y),
    .invader_3_display(invader_3_display),
    
    .invader_4_coord_x(invader_4_coord_x),
    .invader_4_coord_y(invader_4_coord_y),
    .invader_4_display(invader_4_display),
    
    .shield_coord_x(shield_coord_x),
    .shield_coord_y(shield_coord_y),
    .shield_hp(shield_hp),
    .shield_display(shield_display),
    
    .player_bullet_coord_x(player_bullet_coord_x),
    .player_bullet_coord_y(player_bullet_coord_y),
    .player_bullet_display(player_bullet_display),
    
    .invader_bullet_coord_x(invader_bullet_coord_x),
    .invader_bullet_coord_y(invader_bullet_coord_y),
    .invader_bullet_display(invader_bullet_display)
);

integer i;

initial begin
    // Setup Files
    $dumpfile("top_results.vcd");
    $dumpvars;
    log_file = $fopen("top_display_log.txt", "w");

    // System Reset
    in_reset = 0;
    in_player_left_input = 0; in_player_right_input = 0;
    in_fire = 0;
    cycle;
    in_reset = 1;
    cycle;

    in_reset = 0;

    // Start Firing
    in_fire = 1;
    for (i = 0; i<4; i=i+1) cycle;

    in_fire = 0;
    for (i = 0; i<2; i=i+1) cycle;

    in_fire = 1;
    for (i = 0; i<2; i=i+1) cycle;

    // Movement: Right
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i<10; i=i+1) cycle;
    
    in_fire = 1;
    for (i = 0; i<8; i=i+1) cycle;

    // Movement: Left
    in_fire = 1;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i<16; i=i+1) cycle;

    in_fire = 1;
    for (i = 0; i<17; i=i+1) cycle;

    // Boundary Test: Hold Left to hit the edge of the screen
    $display("Testing: Left Boundary Hit...");
    in_fire = 1;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i < 40; i = i + 1) cycle;

    // Rapid Fire Pulse: Testing if the game handles multiple discrete shots
    $display("Testing: Rapid Fire Pulse...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 10; i = i + 1) begin
        in_fire = 1;
        cycle;
        in_fire = 0; cycle;
    end

    // Diagonal Movement & Shoot: Moving Right while firing
    $display("Testing: Strafing Right while shooting...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i < 20; i = i + 1) cycle;

    // Boundary Test: Hold Right to hit the far edge
    $display("Testing: Right Boundary Hit...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i < 40; i = i + 1) cycle;

    // Input Conflict: Pressing Left and Right simultaneously
    $display("Testing: Left and Right conflict...");
    in_fire = 0;
    in_player_left_input = 1;
    in_player_right_input = 1;
    for (i = 0; i < 5; i = i + 1) cycle;

    // Idle Observation: Let the game run to see alien movement/bullets falling
    $display("Testing: Idle Game State (Watching alien movement)...");
    in_fire = 0;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 100; i = i + 1) cycle;

    // Move center
    in_fire = 0;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i < 16; i = i + 1) cycle;

    // Stay center
    in_fire = 0;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 150; i = i + 1) cycle;

    // Start another game
    in_fire = 1;
    for (i = 0; i<4; i=i+1) cycle;

    in_fire = 0;
    for (i = 0; i<2; i=i+1) cycle;

    in_fire = 1;
    for (i = 0; i<2; i=i+1) cycle;

    // Movement: Left
    in_fire = 1;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i<5; i=i+1) cycle;
    
    in_fire = 1;
    for (i = 0; i<8; i=i+1) cycle;

    // Movement: Right
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i<12; i=i+1) cycle;

    in_fire = 1;
    for (i = 0; i<17; i=i+1) cycle;

    // Boundary Test: Hold Left to hit the edge of the screen
    $display("Testing: Left Boundary Hit...");
    in_fire = 1;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i < 40; i = i + 1) cycle;

    // Go back right
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i < 20; i = i + 1) cycle;

    // Rapid Fire Pulse: Testing if the game handles multiple discrete shots
    $display("Testing: Rapid Fire Pulse...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 10; i = i + 1) begin
        in_fire = 1;
        cycle;
        in_fire = 0; cycle;
    end

    // Diagonal Movement & Shoot: Moving Right while firing
    $display("Testing: Strafing Right while shooting...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i < 20; i = i + 1) cycle;

    // Boundary Test: Hold Right to hit the far edge
    $display("Testing: Right Boundary Hit...");
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    for (i = 0; i < 40; i = i + 1) cycle;

    // Input Conflict: Pressing Left and Right simultaneously
    $display("Testing: Left and Right conflict...");
    in_fire = 0;
    in_player_left_input = 1;
    in_player_right_input = 1;
    for (i = 0; i < 5; i = i + 1) cycle;

    // Idle Observation: Let the game run to see alien movement/bullets falling
    $display("Testing: Idle Game State (Watching alien movement)...");
    in_fire = 0;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 100; i = i + 1) cycle;

    // Move center
    in_fire = 0;
    in_player_left_input = 1;
    in_player_right_input = 0;
    for (i = 0; i < 16; i = i + 1) cycle;

    // Stay center
    in_fire = 0;
    in_player_left_input = 0;
    in_player_right_input = 0;
    for (i = 0; i < 150; i = i + 1) cycle;

    // Cleanup
    $fclose(log_file);
    $display("Simulation Complete. Matrix written to top_display_log.txt");
    $stop;
end

endmodule