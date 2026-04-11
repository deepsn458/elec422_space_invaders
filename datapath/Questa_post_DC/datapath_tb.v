///////////////////////////////////////////
// datapath_tb.v
//
// Written: jc165@rice.edu
// Created: 18 Mar 2026
//
// Purpose: Testbench For datapath that controls display logic for space invader game
// 
////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module datapath_tb();
    // Inputs & Outputs
    reg in_clka, in_clkb;
    reg in_reset;
    
    reg [5:0] in_player_coord_x, in_player_coord_y;
    reg       in_player_display;
    
    reg [5:0] in_invader_1_coord_x, in_invader_1_coord_y;
    reg       in_invader_1_display;
    reg [5:0] in_invader_2_coord_x, in_invader_2_coord_y;
    reg       in_invader_2_display;
    reg [5:0] in_invader_3_coord_x, in_invader_3_coord_y;
    reg       in_invader_3_display;
    reg [5:0] in_invader_4_coord_x, in_invader_4_coord_y;
    reg       in_invader_4_display;
    
    reg [5:0] in_shield_coord_x, in_shield_coord_y;
    reg [1:0] in_shield_hp;
    reg       in_shield_display;
    
    reg [5:0] in_player_bullet_coord_x, in_player_bullet_coord_y;
    reg       in_player_bullet_display;
    reg [5:0] in_invader_bullet_coord_x, in_invader_bullet_coord_y;
    reg       in_invader_bullet_display;

    // The wire catching the flattened output matrix from the DUT 
    wire [1023:0] out_display_flat;
    
    // Unflattened 2D array used for log file creation
    reg [31:0] out_display [31:0];

    // File descriptors and loop variables
    integer log_file;
    integer row, r;

    //buses for each row for easier Questa viewing
    reg [31:0] row_display [31:0];
    
    // DUT Instantiation
    datapath  DUT (
        .clka(in_clka), .clkb(in_clkb), .reset(in_reset),
        
        .player_coord_x(in_player_coord_x), .player_coord_y(in_player_coord_y), .player_display(in_player_display),
        
        .invader_1_coord_x(in_invader_1_coord_x), .invader_1_coord_y(in_invader_1_coord_y), .invader_1_display(in_invader_1_display),
        .invader_2_coord_x(in_invader_2_coord_x), .invader_2_coord_y(in_invader_2_coord_y), .invader_2_display(in_invader_2_display),
        .invader_3_coord_x(in_invader_3_coord_x), .invader_3_coord_y(in_invader_3_coord_y), .invader_3_display(in_invader_3_display),
        .invader_4_coord_x(in_invader_4_coord_x), .invader_4_coord_y(in_invader_4_coord_y), .invader_4_display(in_invader_4_display),
        
        .shield_coord_x(in_shield_coord_x), .shield_coord_y(in_shield_coord_y), .shield_hp(in_shield_hp), .shield_display(in_shield_display),
        
        .player_bullet_coord_x(in_player_bullet_coord_x), .player_bullet_coord_y(in_player_bullet_coord_y), .player_bullet_display(in_player_bullet_display),
        .invader_bullet_coord_x(in_invader_bullet_coord_x), .invader_bullet_coord_y(in_invader_bullet_coord_y), .invader_bullet_display(in_invader_bullet_display),
        
        .display_flat(out_display_flat) // Updated port connection
    );

    // Unflattening Logic
    // Unflatten the flat 1D wire back into a 2D array for logging
    always @(*) begin
        for (r = 0; r <= 31; r = r + 1) begin
            out_display[r] = out_display_flat[(r * 32) +: 32];
            row_display[r] = out_display[r];
        end
    end

    // Logging (Task)
    // Dumps the current out_display matrix to a text file
    task log_matrix;
        input [255:0] test_name; // Pass a string to identify the frame
        begin
            $fdisplay(log_file, "TIME: %0t | TEST: %s", $time, test_name);
            // Print from top (31) to bottom (0) so it looks correct visually
            for (row = 31; row >= 0; row = row - 1) begin
                $fdisplay(log_file, "%b", out_display[row]);
            end
            $fdisplay(log_file, "END_FRAME");
        end
    endtask


    // Test Sequence
    initial begin
        $dumpfile("datapath_tb.vcd"); 
        $dumpvars;
        
        log_file = $fopen("display_log.txt", "w");

        // cycle 0                      -- Init/Reset cycle
        in_reset = 1;
        in_player_display = 0; in_invader_1_display = 0; in_invader_2_display = 0;
        in_invader_3_display = 0; in_invader_4_display = 0; in_shield_display = 0;
        in_player_bullet_display = 0; in_invader_bullet_display = 0;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;

        // cycle 1                      -- Release reset, set up Initial Entity Display
        in_reset = 0;
        
        in_player_coord_x = 6'd16; in_player_coord_y = 6'd2;   in_player_display = 1;
        
        in_invader_1_coord_x = 6'd5;  in_invader_1_coord_y = 6'd28; in_invader_1_display = 1;
        in_invader_2_coord_x = 6'd12; in_invader_2_coord_y = 6'd28; in_invader_2_display = 1;
        in_invader_3_coord_x = 6'd19; in_invader_3_coord_y = 6'd28; in_invader_3_display = 1;
        in_invader_4_coord_x = 6'd26; in_invader_4_coord_y = 6'd28; in_invader_4_display = 1;
        
        in_shield_coord_x = 6'd16; in_shield_coord_y = 6'd8;   in_shield_hp = 2'd3; in_shield_display = 1;
        
        in_player_bullet_coord_x = 6'd16; in_player_bullet_coord_y = 6'd12; in_player_bullet_display = 1;
        in_invader_bullet_coord_x = 6'd12; in_invader_bullet_coord_y = 6'd20; in_invader_bullet_display = 1;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        
        log_matrix("Entities Displayed");

        // cycle 2                      -- Movement Test (Invaders Right, Player Left, Bullets Move)
        in_invader_1_coord_x = in_invader_1_coord_x + 2;
        in_invader_2_coord_x = in_invader_2_coord_x + 2;
        in_invader_3_coord_x = in_invader_3_coord_x + 2;
        in_invader_4_coord_x = in_invader_4_coord_x + 2;
        
        in_player_coord_x = in_player_coord_x - 2;
        in_player_bullet_coord_y = in_player_bullet_coord_y + 2;
        in_invader_bullet_coord_y = in_invader_bullet_coord_y - 2;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        
        log_matrix("Movement Applied");

        // cycle 3                      -- Shield HP = 2    (Invaders Right, Player Left, Bullets Move)
        in_invader_1_coord_x = in_invader_1_coord_x + 2;
        in_invader_2_coord_x = in_invader_2_coord_x + 2;
        in_invader_3_coord_x = in_invader_3_coord_x + 2;
        in_invader_4_coord_x = in_invader_4_coord_x + 2;
        
        in_player_coord_x = in_player_coord_x - 2;
        in_player_bullet_coord_y = in_player_bullet_coord_y + 2;
        in_invader_bullet_coord_y = in_invader_bullet_coord_y - 2;

        in_shield_hp = 2'd2;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        
        log_matrix("Shield HP = 2");

        // cycle 4                      -- Shield HP = 1    (Invaders Down, Player Left, Bullets Move)
        in_invader_1_coord_y = in_invader_1_coord_y - 6;
        in_invader_2_coord_y = in_invader_2_coord_y - 6;
        in_invader_3_coord_y = in_invader_3_coord_y - 6;
        in_invader_4_coord_y = in_invader_4_coord_y - 6;
        
        in_player_coord_x = in_player_coord_x - 2;
        in_player_bullet_coord_y = in_player_bullet_coord_y + 2;
        in_invader_bullet_coord_y = in_invader_bullet_coord_y - 2;

        in_shield_hp = 2'd1;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        
        log_matrix("Shield HP = 1");

        // cycle 5                      -- Shield HP = 0 (Display turns off) (Invaders Left, Player Left, Bullets Move)
        in_invader_1_coord_x = in_invader_1_coord_x - 2;
        in_invader_2_coord_x = in_invader_2_coord_x - 2;
        in_invader_3_coord_x = in_invader_3_coord_x - 2;
        in_invader_4_coord_x = in_invader_4_coord_x - 2;
        
        in_player_coord_x = in_player_coord_x + 2;
        in_player_bullet_coord_y = in_player_bullet_coord_y + 2;
        in_invader_bullet_coord_y = in_invader_bullet_coord_y - 2;

        in_shield_hp = 2'd0;
        in_shield_display = 0;
        
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
        
        log_matrix("Shield Destroyed");

        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;

        log_matrix("End of Test");

        $fclose(log_file);
        $display("Simulation Complete. Matrix written to display_log.txt");
        $stop;
    end 
endmodule