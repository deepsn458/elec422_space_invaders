//-----------------------------------------------------
//// Design Name : Testbench for shield fsm
//// File Name   : testbench_shield_fsm.v
////-----------------------------------------------------
//

module shield_fsm_tb();

//defines each test case and the cycle number
localparam RESET_1 = 1;
localparam idle_1 = 2;
localparam START = 3;
localparam HIT_1 = 4;
localparam idle_2 = 5;
localparam HIT_2 = 6;
localparam idle_3 = 7;
localparam HIT_3 = 8;
localparam idle_4 = 9;

localparam SHIELD_X = 10;
localparam SHIELD_Y = 10;
reg in_clka, in_clkb, in_reset;
reg [5:0] in_invader_bullet_coord_x, in_invader_bullet_coord_y;
reg in_shield_play;
reg [5:0] in_player_bullet_coord_x, in_player_bullet_coord_y;

wire out_shield_display, out_playerbullet_shield_collision, out_invaderbullet_shield_collision;
wire [1:0] out_hp;
wire [3:0] out_color;
wire [1:0] out_state; 

integer i;
//create a shield fsm instance
shield_fsm shield_fsm(
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .invader_bullet_coord_x(in_invader_bullet_coord_x),
    .invader_bullet_coord_y(in_invader_bullet_coord_y),
    .player_bullet_coord_x(in_player_bullet_coord_x),
    .player_bullet_coord_y(in_player_bullet_coord_y),
    .shield_play(in_shield_play),
    .shield_display(out_shield_display),
    .invaderbullet_shield_collision(out_invaderbullet_shield_collision),
    .playerbullet_shield_collision(out_playerbullet_shield_collision),
    .hp(out_hp),
    .state(out_state)
);

initial
begin
    for (i = 0; i < 10; i = i+1) begin
        if (i == RESET_1) begin
            in_reset = 1;
            in_invader_bullet_coord_x = 0;
            in_invader_bullet_coord_y = 0;
            in_shield_play = 0;
        end else if (i == (idle_1 || idle_2 || idle_3 || idle_4 ||0)) begin
            in_reset = 0;
            in_invader_bullet_coord_x = 0;
            in_invader_bullet_coord_y = 0;
            in_player_bullet_coord_x = 15;
            in_player_bullet_coord_y = 10;
            in_shield_play = in_shield_play;
        end else if ((HIT_1 > i) && (i >= START)) begin
            in_reset = 0;
            in_invader_bullet_coord_x = 0;
            in_invader_bullet_coord_y = 0;
            in_player_bullet_coord_x = 15;
            in_player_bullet_coord_y = 9;
            in_shield_play = 1;
        end else if ((idle_2 > i) && (i >= HIT_1)) begin
            in_reset = 0;
            in_invader_bullet_coord_x = 8;
            in_invader_bullet_coord_y = 10;
            in_player_bullet_coord_x = 15;
            in_player_bullet_coord_y = 8;
            in_shield_play = 0;
        end else if ((idle_3 > i) && (i >= HIT_2)) begin
            in_reset = 0;
            in_invader_bullet_coord_x = 12;
            in_invader_bullet_coord_y = 10;
            in_player_bullet_coord_x = 0;
            in_player_bullet_coord_y = 0;
            in_shield_play = 0;
        end else if ((idle_4 > i) && (i >= HIT_3)) begin
            in_reset = 0;
            in_invader_bullet_coord_x = 7;
            in_invader_bullet_coord_y = 10;
            in_player_bullet_coord_x = 0;
            in_player_bullet_coord_y = 0;
            in_shield_play = 0;
        end else begin
            in_reset = 0;
            in_invader_bullet_coord_x = 0;
            in_invader_bullet_coord_y = 0;
            in_player_bullet_coord_x = 0;
            in_player_bullet_coord_y = 0;
            in_shield_play = 0;
        end
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
    end 
     $dumpfile ("shield_fsm_tb.vcd"); 
$dumpvars; 

    
$stop;
end
endmodule