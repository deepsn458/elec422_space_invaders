`timescale 1ns/100ps

module player_fsm_tb();

    reg in_clka, in_clkb, in_reset, in_play;
    reg [3:0] in_invader_bullet_x, in_invader_bullet_y;
    reg in_left, in_right;

    wire [3:0] out_player_x, out_player_y;
    wire out_display;
    wire out_collision;
    wire [1:0] out_state;

    task cycle;
        begin
            in_clka = 0; in_clkb = 0; #10;
            in_clka = 1; #10;
            in_clka = 0; in_clkb = 1; #10;
        end
    endtask

    // Instantiate the player_fsm
    player_fsm U1 (
        .clka(in_clka), 
        .clkb(in_clkb), 
        .reset(in_reset), 
        .play(in_play),
        .invader_bullet_coord_x(in_invader_bullet_x),
        .invader_bullet_coord_y(in_invader_bullet_y),
        .invaderbullet_player_collision_signal(out_collision), // Fixed name
        .player_left_input(in_left),    // Fixed name
        .player_right_input(in_right),  // Fixed name
        .player_coord_x(out_player_x), 
        .player_coord_y(out_player_y),
        .display(out_display), 
        .state(out_state)
    );

    integer i;

    initial begin
        // Reset
        in_reset = 1; in_play = 0; in_left = 0; in_right = 0;
        in_invader_bullet_x = 4'd0; in_invader_bullet_y = 4'd10; 
        cycle();
        in_reset = 0;
        cycle();

        // start play
        in_play = 1;
        cycle();
        in_play = 0;

        // test right boundary
        in_right = 1;
        repeat (10) begin
            cycle();
        end
        in_right = 0;

        // test left boundary
        in_left = 1;
        repeat (15) begin
            cycle();
        end
        in_left = 0;

        // test collision
        in_invader_bullet_x = 4'd2;
        for (i = 5; i >= 0; i = i - 1) begin
            in_invader_bullet_y = i;
            cycle();
        end
    
        $dumpfile ("player_fsm_tb.vcd"); 
        $dumpvars(0, player_fsm_tb); 
        $display ("Simulation finished. Check VCD for waveform.");
        $stop;
    end

    initial begin
        $monitor("Time:%0t | State:%b | X:%d | Y:%d | Collision:%b | Disp:%b", 
                 $time, out_state, out_player_x, out_player_y, out_collision, out_display);
    end

endmodule