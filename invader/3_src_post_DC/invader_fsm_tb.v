///////////////////////////////////////////
// invader_fsm_tb.v
//
// Written: jc165@rice.edu
// Created: 2 Mar 2026
//
// Purpose: Testbench For FSM That Controls An Invader Entity
// 
////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module invader_fsm_tb();
reg in_clka, in_clkb;
reg in_reset, in_play, in_move_down;
reg [5:0] in_x_offset, in_player_bullet_coord_x, in_player_bullet_coord_y;

wire out_alive, out_player_bullet_collision_signal;
wire [5:0] out_invader_coord_x, out_invader_coord_y;
wire [1:0] out_state;

// create an invader_fsm instance with a custom START_Y.
invader_fsm DUT (
    .clka(in_clka), .clkb(in_clkb), 
    .reset(in_reset), .play(in_play), .move_down(in_move_down),
    .x_offset(in_x_offset), 
    .player_bullet_coord_x(in_player_bullet_coord_x), 
    .player_bullet_coord_y(in_player_bullet_coord_y),
    .alive(out_alive), 
    .player_bullet_collision_signal(out_player_bullet_collision_signal), 
    .invader_coord_x(out_invader_coord_x), 
    .invader_coord_y(out_invader_coord_y),
    .state(out_state)
);

// Test pattern
initial
begin

// cycle 0                      -- Init/Reset cycle
in_reset = 1;
in_play = 0;
in_move_down = 0;
in_x_offset = 6'd1;
in_player_bullet_coord_x = 6'd0;
in_player_bullet_coord_y = 6'd0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 1                      -- Release reset, start play
in_reset = 0;
in_play = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 2                      -- MOVE cycle (horizontal move)
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3                      -- MOVE cycle (vertical move)
in_move_down = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 4                      -- Collision cycle (bullet hits invader coordinates)
in_move_down = 0;
// Note: Assuming START_X and START_Y are 5 and 25 respectively, placing bullet nearby to trigger collision
in_player_bullet_coord_x = 6'd8;
in_player_bullet_coord_y = 6'd21;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 5                      -- DEAD cycle (Transitioned to dead)
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// ------------------------------------------------------------------
// SECOND RUN: Resetting and doing it again
// ------------------------------------------------------------------

// cycle 6                      -- Reset FSM again
in_reset = 1;
in_play = 0;
in_move_down = 0;
in_x_offset = 6'd2;             // Changing offset to 2 for variety
in_player_bullet_coord_x = 6'd0;
in_player_bullet_coord_y = 6'd0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 7                      -- Release reset, start play again
in_reset = 0;
in_play = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 8                      -- MOVE cycle (horizontal move, X becomes 5 + 2 = 7)
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 9                      -- MOVE cycle (vertical move, Y becomes 25 - 3 = 22)
in_move_down = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 10                     -- Collision cycle (bullet hits invader at 10, 23)
in_move_down = 0;
in_player_bullet_coord_x = 6'd10;
in_player_bullet_coord_y = 6'd23;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 11                     -- DEAD cycle (Transitioned to dead)
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

$dumpfile ("invader_fsm_tb.vcd"); 
$dumpvars;
$display ("in_reset, \t in_play, \t in_move_down, \t out_state, \t out_alive, \t out_player_bullet_collision_signal, \t out_invader_coord_x, \t out_invader_coord_y");
$stop;
end 

endmodule