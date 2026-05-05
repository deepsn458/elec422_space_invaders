module player_bullet_fsm_tb();

    reg in_clka, in_clkb, in_reset, in_fire;
    reg [3:0] in_player_coord_x, in_player_coord_y;
    reg in_player_bullet_collision, in_shield_bullet_collision;

    wire out_display;
    wire [3:0] out_player_bullet_coord_x, out_player_bullet_coord_y;
    wire [1:0] out_state;

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

    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10;
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

        // fire and hit invader
        in_fire = 1;
        cycle();
        in_fire = 0;
        
        repeat (3) cycle();
        
        in_player_bullet_collision = 1;
        cycle(); // Should transition back to INIT
        in_player_bullet_collision = 0;
        cycle(); // Stay in INIT

        // fire and hit shield
        in_player_coord_x = 4'd12;
        in_fire = 1;
        cycle();
        in_fire = 0;
        
        repeat (2) cycle();
        
        in_shield_bullet_collision = 1;
        cycle(); // Should transition back to INIT
        in_shield_bullet_collision = 0;
        cycle();

        // fire and hit top boundary
        in_player_coord_x = 4'd2;
        in_player_coord_y = 4'd10;
        in_fire = 1;
        cycle();
        in_fire = 0;

        // Travel until out_player_bullet_coord_y >= 15
        for (i = 0; i < 8; i = i + 1) begin
            cycle();
        end

        // reset
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