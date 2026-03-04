module main_game_fsm_tb();

// Inputs
reg in_clka, in_clkb, in_global_reset;
reg in_player_fire, in_player_left, in_player_right;
reg in_player_alive, in_invader_alive;

// Outputs
wire out_player_left_out, out_player_right_out;
wire [5:0] out_invader_bullet_x, out_invader_bullet_y;
wire [5:0] out_inv_right_x, out_inv_right_y;
wire [5:0] out_inv_left_x, out_inv_left_y;
wire out_invader_direction, out_reset_player, out_reset_invader, out_reset_shield;
wire out_play, out_invader_offset;

// UUT Instance
main_game_fsm U1 (
    .clka (in_clka),
    .clkb (in_clkb),
    .global_reset (in_global_reset),
    .player_fire (in_player_fire),
    .player_left (in_player_left),
    .player_right (in_player_right),
    .player_alive (in_player_alive),
    .invader_alive (in_invader_alive),
    .player_left_out (out_player_left_out),
    .player_right_out (out_player_right_out),
    .invader_bullet_start_position_x (out_invader_bullet_x),
    .invader_bullet_start_position_y (out_invader_bullet_y),
    .invader_right_position_x (out_inv_right_x),
    .invader_right_position_y (out_inv_right_y),
    .invader_left_position_x (out_inv_left_x),
    .invader_left_position_y (out_inv_left_y),
    .invader_direction (out_invader_direction),
    .reset_player (out_reset_player),
    .reset_invader (out_reset_invader),
    .reset_shield (out_reset_shield),
    .play (out_play),
    .invader_offset (out_invader_offset)
);

integer i;

initial
begin

// cycle 0: initialize
in_global_reset = 0;
in_player_fire = 0;
in_player_left = 0;
in_player_right = 0;
in_player_alive = 1;
in_invader_alive = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 1: Global Reset
in_global_reset = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 2: Release Reset - Move to Play
in_global_reset = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 3: Test Movement Forwarding (Left)
in_player_left = 1;
for (i = 0; i < 2; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end
in_player_left = 0;

// cycle 4: Test Win Condition (Invaders all dead)
in_invader_alive = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 5: Restore and test Loss Condition (Player dead)
in_invader_alive = 1;
in_player_alive = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

$dumpfile ("main_game_fsm_tb.vcd"); 
$dumpvars; 
$display ("in_clka, \t in_clkb, \t global_reset, \t play, \t reset_p, \t reset_i, \t player_alive, \t invader_alive, \t left_out, \t right_out");

$stop;
end 

endmodule