module main_game_fsm_tb();

// Inputs
reg in_clka, in_clkb, in_global_reset;
reg in_player_left_input, in_player_right_input, in_player_shoot_input;
reg in_player_display;
reg [5:0] in_player_coordinate_x, in_player_coordinate_y;
reg [3:0] in_invaders_display;
reg [5:0] in_invader1_coordinate_x, in_invader1_coordinate_y;
reg [5:0] in_invader2_coordinate_x, in_invader2_coordinate_y;
reg [5:0] in_invader3_coordinate_x, in_invader3_coordinate_y;
reg [5:0] in_invader4_coordinate_x, in_invader4_coordinate_y;
reg [5:0] in_invaderbullet_coord_x, in_invaderbullet_coord_y;
reg in_invaderbullet_player_collision_signal, in_invaderbullet_shield_collision_signal;
reg in_invader_outofbounds_signal_1, in_invader_outofbounds_signal_2;
reg in_invader_outofbounds_signal_3, in_invader_outofbounds_signal_4;

// Outputs
wire out_player_left_motion, out_player_right_motion;
wire [5:0] out_closest_invader_coord_x, out_closest_invader_coord_y;
wire out_play, out_reset;
wire out_invader_direction;
wire out_playerbullet_fire, out_invaderbullet_fire;
wire out_move_down;
wire [1:0] out_state;

// UUT Instance
main_game_fsm U1 (
    .clka (in_clka),
    .clkb (in_clkb),
    .global_reset (in_global_reset),
    .player_left_input (in_player_left_input),
    .player_right_input (in_player_right_input),
    .player_shoot_input (in_player_shoot_input),
    .player_display (in_player_display),
    .player_coordinate_x (in_player_coordinate_x),
    .player_coordinate_y (in_player_coordinate_y),
    .invaders_display (in_invaders_display),
    .invader1_coordinate_x (in_invader1_coordinate_x),
    .invader1_coordinate_y (in_invader1_coordinate_y),
    .invader2_coordinate_x (in_invader2_coordinate_x),
    .invader2_coordinate_y (in_invader2_coordinate_y),
    .invader3_coordinate_x (in_invader3_coordinate_x),
    .invader3_coordinate_y (in_invader3_coordinate_y),
    .invader4_coordinate_x (in_invader4_coordinate_x),
    .invader4_coordinate_y (in_invader4_coordinate_y),
    .invaderbullet_coord_x (in_invaderbullet_coord_x),
    .invaderbullet_coord_y (in_invaderbullet_coord_y),
    .invaderbullet_player_collision_signal (in_invaderbullet_player_collision_signal),
    .invaderbullet_shield_collision_signal (in_invaderbullet_shield_collision_signal),
    .invader_outofbounds_signal_1 (in_invader_outofbounds_signal_1),
    .invader_outofbounds_signal_2 (in_invader_outofbounds_signal_2),
    .invader_outofbounds_signal_3 (in_invader_outofbounds_signal_3),
    .invader_outofbounds_signal_4 (in_invader_outofbounds_signal_4),
    .player_left_motion (out_player_left_motion),
    .player_right_motion (out_player_right_motion),
    .closest_invader_coord_x (out_closest_invader_coord_x),
    .closest_invader_coord_y (out_closest_invader_coord_y),
    .play (out_play),
    .reset (out_reset),
    .invader_direction (out_invader_direction),
    .playerbullet_fire (out_playerbullet_fire),
    .invaderbullet_fire (out_invaderbullet_fire),
    .move_down (out_move_down),
    .state (out_state)
);

integer i;

initial
begin

// cycle 0: initialize
in_global_reset = 0;
in_player_shoot_input = 0;
in_player_left_input = 0;
in_player_right_input = 0;
in_player_display = 1;
in_invaders_display = 4'b1111;

// initialize all coordinates to arbitrary starting locations
in_player_coordinate_x = 6'd15; in_player_coordinate_y = 6'd30;
in_invader1_coordinate_x = 6'd5;  in_invader1_coordinate_y = 6'd10;
in_invader2_coordinate_x = 6'd10; in_invader2_coordinate_y = 6'd10;
in_invader3_coordinate_x = 6'd15; in_invader3_coordinate_y = 6'd10;
in_invader4_coordinate_x = 6'd20; in_invader4_coordinate_y = 6'd10;
in_invaderbullet_coord_x = 6'd0;  in_invaderbullet_coord_y = 6'd0;

// initialize signals
in_invaderbullet_player_collision_signal = 0;
in_invaderbullet_shield_collision_signal = 0;
in_invader_outofbounds_signal_1 = 0;
in_invader_outofbounds_signal_2 = 0;
in_invader_outofbounds_signal_3 = 0;
in_invader_outofbounds_signal_4 = 0;

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

// cycle 2: Release Reset and shoot to move to Play
in_global_reset = 0;
in_player_shoot_input = 1;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;
in_player_shoot_input = 0;

// cycle 3: Test Movement Forwarding (Left)
in_player_left_input = 1;
for (i = 0; i < 2; i = i + 1) begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
end
in_player_left_input = 0;

// cycle 4: Test Win Condition (Invaders all dead)
in_invaders_display = 4'b0000;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

// cycle 5: Restore and test Loss Condition (Player dead)
in_invaders_display = 4'b1111;
in_player_display = 0;
in_clka = 0; in_clkb = 0; #10;
in_clka = 1; in_clkb = 0; #10;
in_clka = 0; in_clkb = 0; #10;
in_clka = 0; in_clkb = 1; #10;

$dumpfile ("main_game_fsm_tb.vcd"); 
$dumpvars;
$display ("in_clka \t in_clkb \t state \t play \t reset \t player_display \t invaders_display \t p_left_mot \t p_right_mot");
$stop;
end 

endmodule