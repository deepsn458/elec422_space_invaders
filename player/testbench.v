module player_fsm_tb();

    // Inputs to the module
    reg in_clka, in_clkb, in_reset, in_play;
    reg [5:0] in_invader_bullet_x, in_invader_bullet_y;
    reg in_left, in_right;

    // Outputs from the module
    wire [5:0] out_player_x, out_player_y;
    wire out_display;
    wire out_collision;
    wire [1:0] out_state;

    // Instantiate the player_fsm
    player_fsm U1 (
        .clka(in_clka), .clkb(in_clkb), .reset(in_reset), .play(in_play),
        .invader_bullet_coord_x(in_invader_bullet_x),
        .invader_bullet_coord_y(in_invader_bullet_y),
        .player_bullet_collision(out_collision), 
        .left_motion(in_left), .right_motion(in_right),
        .player_coord_x(out_player_x), .player_coord_y(out_player_y),
        .display(out_display), .state(out_state)
    );

    integer i;

    initial begin
        // cycle 0: initialize
        in_reset = 0; in_play = 0; in_left = 0; in_right = 0;
        in_invader_bullet_x = 6'd0; in_invader_bullet_y = 6'd10; 
        in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;

        // cycle 1: Reset (Player starts at X=16)
        in_reset = 1;
        in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;
        in_reset = 0;

        // cycle 2: Start Game
        in_play = 1;
        in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;
        in_play = 0;

        // cycle 3: Hit Right Boundary (30)
        // From 16 to 30 is 14 steps. We do 16 steps to ensure we hit the wall.
        in_right = 1;
        for (i = 0; i < 16; i = i + 1) begin
            in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;
        end
        in_right = 0;

        // cycle 4: Back up 5 spaces (30 -> 25)
        in_left = 1;
        for (i = 0; i < 5; i = i + 1) begin
            in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;
        end
        in_left = 0;

        // cycle 5: Intersection Test at X=25
        // Bullet starts at X=25, drops from Y=6 down to Y=2 (Player's Y)
        in_invader_bullet_x = 6'd25;
        for (i = 6; i >= 2; i = i - 1) begin 
            in_invader_bullet_y = i;
            in_clka = 0; in_clkb = 0; #10; in_clka = 1; #10; in_clka = 0; in_clkb = 1; #10;
        end

        for (i = 0; i < 5; i = i + 1) begin
            in_clka = 0; in_clkb = 0; #10; 
            in_clka = 1; #10;
            in_clka = 0; in_clkb = 1; #10;
        end


$dumpfile ("player_fsm_tb.vcd"); 
$dumpvars; 
$display ("in_clka, \t in_clkb, \t in_reset, \t in_play, \t in_invader_bullet_x, \t in_invader_bullet_y, \t out_display, \t out_player_coord_x, \t out_player_coord_y, \t out_collision, \t out_state");

$stop;
end 

endmodule