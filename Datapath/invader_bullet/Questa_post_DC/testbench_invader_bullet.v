//-----------------------------------------------------
//// Design Name : Testbench for invader_bullet fsm
//// File Name   : testbench_invader_bullet.v
////-----------------------------------------------------
//

module invader_bullet_fsm_tb();

//defines each tes case and the respective cycle number
localparam RESET_1 = 1;
localparam idle_1 = 2;
localparam FIRE = 3;
localparam idle_2 = 5;
localparam COLLIDE = 6;
//second test: out of bounds
localparam RESET_2 = 7;
localparam idle_3 = 8;
localparam FIRE_2 = 9;

reg in_clka, in_clkb, in_reset;
reg in_player_collision_signal, in_shield_collision_signal, in_invader_fire;
reg [5:0] in_closest_invader_coord_x, in_closest_invader_coord_y;

//outputs from the invader bullet fsm module
wire out_invader_bullet_display;
wire [5:0] out_invader_bullet_coord_x, out_invader_bullet_coord_y;
wire [1:0] out_state;

integer i;
//create an invader bullet fsm instance
invader_bullet_fsm invader_bullet(
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .player_collision_signal(in_player_collision_signal),
    .shield_collision_signal(in_shield_collision_signal),
    .invader_fire(in_invader_fire),
    .closest_invader_coord_x(in_closest_invader_coord_x),
    .closest_invader_coord_y(in_closest_invader_coord_y),
    .invader_bullet_display(out_invader_bullet_display),
    .invader_bullet_coord_x(out_invader_bullet_coord_x),
    .invader_bullet_coord_y(out_invader_bullet_coord_y),
    .state(out_state)
);

initial
begin
    for (i = 0; i < 15; i = i+1) begin
        if (i == RESET_1) begin
            in_reset = 1;
            in_player_collision_signal = 0;
            in_shield_collision_signal = 0;
            in_closest_invader_coord_x = 0;
            in_closest_invader_coord_y = 0;
            in_invader_fire = 0;
        end else if (i == (idle_1 || idle_2 || idle_3 || 0)) begin
            in_reset = 0;
            in_player_collision_signal = 0;
            in_shield_collision_signal = 0;
            in_closest_invader_coord_x = 8;
            in_closest_invader_coord_y = 8;
            in_invader_fire = 0;
        end else if ((idle_2>i) && (i>=FIRE)) begin
            in_reset = 0;
            in_player_collision_signal = 0;
            in_shield_collision_signal = 0;
            in_closest_invader_coord_x = 8;
            in_closest_invader_coord_y = 8;
            in_invader_fire = 1;
        end else if ((RESET_2 > i) && (i>= COLLIDE))begin
            in_reset = 0;
            in_player_collision_signal = 1;
            in_shield_collision_signal = 1;
            in_closest_invader_coord_x = 8;
            in_closest_invader_coord_y = 8;
            in_invader_fire = 0;
        end else if (i == RESET_2) begin
            in_reset = 1;
            in_player_collision_signal = 0;
            in_shield_collision_signal = 0;
            in_closest_invader_coord_x = 0;
            in_closest_invader_coord_y = 0;
            in_invader_fire = 0;
        end else if ((i== FIRE_2)) begin
            in_reset = 0;
            in_player_collision_signal = 0;
            in_shield_collision_signal = 0;
            in_closest_invader_coord_x = 9;
            in_closest_invader_coord_y = 9;
            in_invader_fire = 1;
        end
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
    end
    $dumpfile ("invader_bullet_fsm_tb.vcd"); 
$dumpvars; 

    
$stop;
end

endmodule