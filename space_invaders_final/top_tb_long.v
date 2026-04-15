module top_tb_long ();

reg in_clka, in_clkb, in_reset;

reg in_player_left_input, in_player_right_input;
reg in_fire;
reg[31:0] out_display[31:0];
reg[31:0] row_display[31:0];
wire [1023:0] display_flat;
integer r, log_file, row;
always @(*) begin
        for (r = 0; r <= 31; r = r + 1) begin
            out_display[r] = display_flat[(r * 32) +: 32];
            row_display[r] = out_display[r];
        end
    end

task log_matrix;
        input [255:0] test_name; 
        begin
            $fdisplay(log_file, "TIME: %0t | TEST: %s", $time, test_name);
            for (row = 31; row >= 0; row = row - 1) begin
                $fdisplay(log_file, "%b", out_display[row]);
            end
            $fdisplay(log_file, "END_FRAME");
        end
    endtask

task cycle;
    begin
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        log_matrix("");
    end
endtask

top U1 (
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .player_left_input(in_player_left_input),
    .player_right_input(in_player_right_input),
    .player_shoot_input(in_fire),
    .display_flat(display_flat)
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
        in_fire = 1; cycle;
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
        in_fire = 1; cycle;
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