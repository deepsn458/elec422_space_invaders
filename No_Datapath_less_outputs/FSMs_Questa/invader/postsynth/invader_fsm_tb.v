///////////////////////////////////////////
// invader_fsm_tb.v
//
// Updated: 28 Apr 2026
//
///////////////////////////////////////////
`timescale 1ns/100ps

module invader_fsm_tb();
reg in_clka, in_clkb;
reg in_reset, in_play, in_move_down, in_invader_direction;
reg [3:0] in_player_bullet_coord_x, in_player_bullet_coord_y;

wire out_display, out_playerbullet_invader_collision_signal, out_invader_outofbounds_signal;
wire [3:0] out_invader_coord_x, out_invader_coord_y;
wire [1:0] out_state;

invader_fsm DUT (
    .clka(in_clka), 
    .clkb(in_clkb), 
    .reset(in_reset), 
    .play(in_play), 
    .invader_direction(in_invader_direction),
    .move_down(in_move_down),
    .player_bullet_coord_x(in_player_bullet_coord_x), 
    .player_bullet_coord_y(in_player_bullet_coord_y),
    .display(out_display), 
    .playerbullet_invader_collision_signal(out_playerbullet_invader_collision_signal), 
    .invader_coord_x(out_invader_coord_x), 
    .invader_coord_y(out_invader_coord_y),
    .invader_outofbounds_signal(out_invader_outofbounds_signal),
    .state(out_state)
);

// Test pattern
initial
begin

// Reset cycle
in_reset = 1;
in_play = 0;
in_move_down = 0;
in_invader_direction = 1;       // Right
in_player_bullet_coord_x = 4'd0;
in_player_bullet_coord_y = 4'd0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// Release reset, start play
in_reset = 0;
in_play = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// MOVE cycle
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// MOVE cycle
in_move_down = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// Collision cycle
in_move_down = 0;
// Invader is at (6, 8) assuming move logic. Placing bullet at (6, 8) to kill.
in_player_bullet_coord_x = 4'd6;
in_player_bullet_coord_y = 4'd8;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// DEAD cycle
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// SECOND RUN: Testing Bounds

// Reset FSM again
in_reset = 1;
in_play = 0;
in_move_down = 0;
in_player_bullet_coord_x = 4'd0;
in_player_bullet_coord_y = 4'd0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// Release reset, start play
in_reset = 0;
in_play = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 8-12: Drive toward right bound to trigger outofbounds_signal
repeat (5) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end

$dumpfile ("invader_fsm_tb.vcd"); 
$dumpvars;
$display ("Reset Play MoveDown State Display Collision X_Coord Y_Coord OutOfBounds");
$monitor ("%b     %b    %b        %b     %b       %b         %d       %d       %b", 
          in_reset, in_play, in_move_down, out_state, out_display, 
          out_playerbullet_invader_collision_signal, out_invader_coord_x, 
          out_invader_coord_y, out_invader_outofbounds_signal);
#100;
$stop;
end 

endmodule