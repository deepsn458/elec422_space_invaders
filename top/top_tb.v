module top_tb ();

reg in_clka, in_clkb, in_reset;

reg in_player_left_input, in_player_right_input;
reg in_fire;

wire 



endmodule


// Outputs
wire [3:0] out_DATA;
wire [2:0] out_state;

fsmd_top U1 (
    .clka (in_clka),
    .clkb (in_clkb),
    .reset (in_reset),
    .ADD_X_Y (in_ADD_X_Y),
    .ADD_X_Accum (in_ADD_X_Accum),
    .X_in (in_X),
    .Y_in (in_Y),
    .DATA (out_DATA),
    .state_out (out_state)
);

task cycle;
    begin
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
    end
endtask

initial
begin

in_reset = 0;
in_X = 0; in_Y = 0;
in_ADD_X_Y = 0; in_ADD_X_Accum = 0;
cycle;

in_reset = 1;
cycle;

// First Addition
in_reset = 0;
in_ADD_X_Y = 1;
in_X = 4'd2; in_Y = 4'd1;
cycle;

in_ADD_X_Y = 0; in_ADD_X_Accum = 1;
cycle;

in_X = 4'd1;
cycle;

in_ADD_X_Accum = 0; in_ADD_X_Y = 0;
in_X = 4'd2;
cycle;

// Second Addition
in_ADD_X_Y = 1;
in_X = 4'd3; in_Y = 4'd2;
cycle;

in_ADD_X_Y = 0; in_ADD_X_Accum = 1;
cycle;

in_X = 4'd2;
cycle;

in_ADD_X_Accum = 0; in_ADD_X_Y = 0;
in_X = 4'd3;
cycle;

// Third Addition
in_ADD_X_Y = 1;
in_X = 4'd4; in_Y = 4'd3;
cycle;

in_ADD_X_Y = 0; in_ADD_X_Accum = 1; 
cycle;

in_X = 4'd3;
cycle;

in_ADD_X_Accum = 0; in_ADD_X_Y = 0;
in_X = 4'd4;
cycle;

cycle;
cycle;

$dumpfile ("fsmd_results.vcd");
$dumpvars;
$display ("clka, \t clkb, \t reset, \t X_in, \t Y_in, \t state, \t DATA_OUT");

$stop;
end 

endmodule