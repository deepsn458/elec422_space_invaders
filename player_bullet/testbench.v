module player_bullet_fsm_tb();

reg in_clka, in_clkb, in_reset, in_fire;
reg [5:0] in_player_coord_x, in_player_coord_y;
reg in_player_bullet_collision, in_shield_bullet_collision;

wire out_display;
wire [5:0] out_player_bullet_coord_x, out_player_bullet_coord_y;
wire [1:0] out_state;

// add comment

player_bullet_fsm #(
    .Y_OFFSET(3),
    .Y_MAX(31)
) U1 (
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