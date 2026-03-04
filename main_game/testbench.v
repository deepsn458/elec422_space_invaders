module main_game_fsm_tb();

reg in_clka, in_clkb, player_fire, player_left, player_right, global_reset, player_bullet_shield_collision, invader_alive, player_alive, player_coordinates, invader_coordinates, player_bullet_collision, invader_bullet_collision;


wire player_left_out, player_right_out, invader_bullet_start_position, right_limit, left_limit, invader_right_position, invader_left_position, reset_player, reset_invader, reset_shield, invader_direction, play, shield_collision_signal, invader_collision_signal, invader_offset;

main_game_fsm U1 (
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

initial
begin

// cycle 0: initialize
in_reset = 0;
in_fire = 0;
in_player_coord_x = 6'd10;
in_player_coord_y = 6'd1;
in_player_bullet_collision = 0;
in_shield_bullet_collision = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 1: restart (1)
in_reset = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 2: idle (1)
in_reset = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3: Fire at X=10 and travel until Invader Collision
in_fire = 1;
in_player_coord_x = 6'd10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

in_fire = 0;
for (i = 0; i < 3; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

in_player_bullet_collision = 1; // Trigger Invader Collision
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

in_player_bullet_collision = 0;

// NEW: Wait in INIT for 2 cycles before firing again
for (i = 0; i < 2; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

// cycle 4: Fire at X=25 and travel until Shield Collision
in_fire = 1;
in_player_coord_x = 6'd25;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

in_fire = 0;
for (i = 0; i < 2; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

in_shield_bullet_collision = 1; // Trigger Shield Collision
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

in_shield_bullet_collision = 0;

// NEW: Wait in INIT for 3 cycles before firing again
for (i = 0; i < 3; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

// cycle 5: Fire at X=40 and travel to Top Boundary
in_fire = 1;
in_player_coord_x = 6'd40;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

in_fire = 0;
for (i = 0; i < 12; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

$dumpfile ("player_bullet_fsm_tb.vcd"); 
$dumpvars; 
$display ("in_clka, \t in_clkb, \t in_reset, \t in_fire, \t in_player_coord_x, \t in_player_coord_y, \t out_display, \t out_player_bullet_coord_x, \t out_player_bullet_coord_y, \t out_state");

$stop;
end 

endmodule