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

top U1 (
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .player_left_input(in_player_left_input),
    .player_right_input(in_player_right_input),
    .player_shoot_input(in_fire),
    .display_flat(display_flat)
);

integer i;

initial
begin

in_reset = 0;
in_player_left_input=0; in_player_right_input=0;
in_fire=0;
cycle;

in_reset = 1;
in_player_left_input=0; in_player_right_input=0;
in_fire=0;
cycle;

in_reset = 0;
in_fire = 1;
cycle;
cycle;
cycle;
cycle;

in_fire = 0;
cycle;
cycle;

in_fire = 1;
cycle;
cycle;

in_fire = 0;
in_player_left_input = 1;
in_player_right_input = 0;
for (i = 0; i < 10; i=i+1) cycle;
in_fire = 1;
in_player_left_input = 1;
in_player_right_input = 0;
for (i = 0; i < 8; i=i+1) cycle;

in_fire = 1;
in_player_left_input = 0;
in_player_right_input = 1;
for (i = 0; i < 16; i=i+1) cycle;

in_fire = 0;
in_player_left_input = 0;
in_player_right_input = 1;
for (i = 0; i < 17; i=i+1) cycle;

$dumpfile ("top_results.vcd");
$dumpvars;
$display ("in_clka, \t in_clkb, \t in_reset, \t in_player_left_input, \t in_player_right_input, \t in_fire");

$stop;

end

endmodule