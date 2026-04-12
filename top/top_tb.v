module top_tb ();

reg in_clka, in_clkb, in_reset;

reg in_player_left_input, in_player_right_input;
reg in_fire;

wire [1023:0] display_flat;

task cycle;
    begin
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
    end
endtask

in_reset = 0;
in_player_left_input=0; in_player_right_input=0;
in_fire=0;
cycle;

in_reset = 1;
in_player_left_input=0; in_player_right_input=0;
in_fire=0;
cycle;

in_reset = 0;

cycle;

endmodule