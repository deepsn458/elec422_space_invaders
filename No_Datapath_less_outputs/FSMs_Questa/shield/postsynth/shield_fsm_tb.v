module shield_fsm_tb();

    reg in_clka, in_clkb, in_reset;
    reg [3:0] in_invader_bullet_coord_x, in_invader_bullet_coord_y;
    reg [3:0] in_player_bullet_coord_x, in_player_bullet_coord_y;
    reg in_shield_play;

    wire [1:0] out_hp;
    wire out_shield_display;
    wire out_invaderbullet_shield_collision;
    wire out_playerbullet_shield_collision;
    wire [1:0] out_state;

    parameter START_X = 7;
    parameter START_Y = 5;

    shield_fsm DUT (
        .clka(in_clka),
        .clkb(in_clkb),
        .reset(in_reset),
        .invader_bullet_coord_x(in_invader_bullet_coord_x),
        .invader_bullet_coord_y(in_invader_bullet_coord_y),
        .player_bullet_coord_x(in_player_bullet_coord_x),
        .player_bullet_coord_y(in_player_bullet_coord_y),
        .shield_play(in_shield_play),
        .hp(out_hp),
        .shield_display(out_shield_display),
        .invaderbullet_shield_collision(out_invaderbullet_shield_collision),
        .playerbullet_shield_collision(out_playerbullet_shield_collision),
        .state(out_state)
    );

    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 0; in_clkb = 1; #10;
        end
    endtask

    initial begin
        // reset
        in_reset = 1; in_shield_play = 0;
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        in_player_bullet_coord_x = 0;  in_player_bullet_coord_y = 0;
        cycle();
        in_reset = 0;
        cycle();

        // start game
        in_shield_play = 1;
        cycle(); 
        in_shield_play = 0;

        // invader bullet hits it
        in_invader_bullet_coord_x = START_X + 1; 
        in_invader_bullet_coord_y = START_Y;
        cycle(); 
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        cycle()

        // player bullet hits it
        in_player_bullet_coord_x = START_X;
        in_player_bullet_coord_y = START_Y;
        cycle();
        in_player_bullet_coord_x = 0; in_player_bullet_coord_y = 0;
        cycle();

        // invader bullet again
        in_invader_bullet_coord_x = START_X + 2;
        in_invader_bullet_coord_y = START_Y;
        cycle();
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        cycle();

        // final invader bullet hit
        in_invader_bullet_coord_x = START_X;
        in_invader_bullet_coord_y = START_Y;
        cycle(); // HP goes to 0
        in_invader_bullet_coord_x = 0; in_invader_bullet_coord_y = 0;
        
        cycle(); 

        // verify no health -> autoreset
        cycle();

        $dumpfile("shield_fsm_tb.vcd"); 
        $dumpvars; 
        $display("Shield Robust Test Complete.");
        $stop;
    end

    initial begin
        $monitor("T:%0t | State:%b | HP:%d | Disp:%b | Inv_Coll:%b | Ply_Coll:%b", 
                 $time, out_state, out_hp, out_shield_display, 
                 out_invaderbullet_shield_collision, out_playerbullet_shield_collision);
    end

endmodule