module top_tb ();

reg in_clka, in_clkb, in_reset;

reg in_player_left_input, in_player_right_input;
reg in_fire;
reg[31:0] out_display[31:0];
reg[31:0] row_display[31:0];
wire [1023:0] display_flat;
integer r, log_file, row;
always @(*) begin
        for (r = 0; r <= 31; r = r + 1) begin
            out_display[r] = display_flat[(r * 32) +: 32];
            row_display[r] = out_display[r];
        end
    end

task log_matrix;
        input [255:0] test_name; 
        begin
            $fdisplay(log_file, "TIME: %0t | TEST: %s", $time, test_name);
            for (row = 31; row >= 0; row = row - 1) begin
                $fdisplay(log_file, "%b", out_display[row]);
            end
            $fdisplay(log_file, "END_FRAME");
        end
    endtask

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

initial begin
    // Setup Files
    $dumpfile("top_results.vcd");
    $dumpvars;
    log_file = $fopen("top_display_log.txt", "w");

    // System Reset
    in_reset = 0;
    in_player_left_input = 0; in_player_right_input = 0;
    in_fire = 0;
    cycle;

    in_reset = 1;
    cycle;

    in_reset = 0;
    log_matrix("After Reset");

    // Start Firing
    in_fire = 1;
    repeat(4) cycle;
    log_matrix("Post-Fire Sequence");

    in_fire = 0;
    repeat(2) cycle;

    in_fire = 1;
    repeat(2) cycle;
    log_matrix("Second Fire Burst");

    // Movement: Left
    in_fire = 0;
    in_player_left_input = 1;
    in_player_right_input = 0;
    repeat(10) cycle;
    
    in_fire = 1;
    repeat(8) cycle;
    log_matrix("Moving Left and Firing");

    // Movement: Right
    in_fire = 1;
    in_player_left_input = 0;
    in_player_right_input = 1;
    repeat(16) cycle;
    log_matrix("Moving Right and Firing");

    in_fire = 0;
    repeat(17) cycle;
    log_matrix("Final Position");

    // Cleanup
    $fclose(log_file);
    $display("Simulation Complete. Matrix written to top_display_log.txt");
    $stop;
end

endmodule