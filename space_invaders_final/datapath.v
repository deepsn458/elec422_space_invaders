///////////////////////////////////////////
// datapath.v
//
// Written: jc165@rice.edu
// Created: 17 Mar 2026
//
// Purpose: Datapath that maintains the game coordinate system for display
// 
////////////////////////////////////////////////////////////////////////////////////////////////

module datapath
    #(
    parameter [5:0] DISPLAY_SIZE = 6'd31                                 // Display Size (minus 1 due to zero-indexing)
    )(

    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset,                              // Global control and reset signals

    input  wire [5:0]       player_coord_x,                     // Player X coordinate
    input  wire [5:0]       player_coord_y,                     // Player Y coordinate
    input  wire             player_display,                     // Display bit

    input  wire [5:0]       invader_1_coord_x,                  // Invader 1 X coordinate
    input  wire [5:0]       invader_1_coord_y,                  // Invader 1 Y coordinate
    input  wire             invader_1_display,                  // Display bit

    input  wire [5:0]       invader_2_coord_x,                  // Invader 2 X coordinate
    input  wire [5:0]       invader_2_coord_y,                  // Invader 2 Y coordinate
    input  wire             invader_2_display,                  // Display bit

    input  wire [5:0]       invader_3_coord_x,                  // Invader 3 X coordinate
    input  wire [5:0]       invader_3_coord_y,                  // Invader 3 Y coordinate
    input  wire             invader_3_display,                  // Display bit

    input  wire [5:0]       invader_4_coord_x,                  // Invader 4 X coordinate
    input  wire [5:0]       invader_4_coord_y,                  // Invader 4 Y coordinate
    input  wire             invader_4_display,                  // Display bit

    input  wire [5:0]       shield_coord_x,                     // Shield X coordinate
    input  wire [5:0]       shield_coord_y,                     // Shield Y coordinate
    input  wire [1:0]       shield_hp,                          // Shield HP (3 to 0)
    input  wire             shield_display,                     // Display bit

    input  wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    input  wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    input  wire             player_bullet_display,              // Display bit

    input  wire [5:0]       invader_bullet_coord_x,             // Invader bullet X coordinate
    input  wire [5:0]       invader_bullet_coord_y,             // Invader bullet Y coordinate
    input  wire             invader_bullet_display,             // Display bit

    // Output flattened to 1D vector to comply with standard Verilog port rules
    // 32 rows * 32 cols = 1024 bits total (1023 down to 0)
    output wire [1023:0]    display_flat                        
    );

    // Internal 2D arrays to manage matrix logically
    reg [DISPLAY_SIZE:0] internal_display [DISPLAY_SIZE:0];
    reg [DISPLAY_SIZE:0] temp_display [DISPLAY_SIZE:0];
    reg [DISPLAY_SIZE:0] next_display [DISPLAY_SIZE:0];

    // Logic to set temp_display based on locations of entities
    reg [5:0] row, col, i, j;

    always @(*) begin
        for (row = 6'd0; row <= DISPLAY_SIZE; row = row + 6'd1) begin
            for (col = 6'd0; col <= DISPLAY_SIZE; col = col + 6'd1) begin
                
                // Clear the background
                temp_display[row][col] = 1'b0;

                // Player Display Logic
                if (player_display) begin
                    if ((row == player_coord_y     && col == player_coord_x)     || // Center
                        (row == player_coord_y     && col + 6'd1 == player_coord_x) || // Left
                        (row == player_coord_y     && col == player_coord_x + 6'd1) || // Right
                        (row == player_coord_y + 6'd1 && col == player_coord_x))       // Above (Y + 1)
                    begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Invader 1 Display Logic
                if (invader_1_display) begin
                    if ((row == invader_1_coord_y     && col == invader_1_coord_x)     || // Center
                        (row == invader_1_coord_y     && col + 6'd1 == invader_1_coord_x) || // Left
                        (row == invader_1_coord_y     && col == invader_1_coord_x + 1) || // Right
                        (row + 1 == invader_1_coord_y && col == invader_1_coord_x)     || // Below (Y - 1)
                        (row == invader_1_coord_y + 6'd1 && col + 6'd1 == invader_1_coord_x) || // Above-Left
                        (row == invader_1_coord_y + 6'd1 && col == invader_1_coord_x + 6'd1))   // Above-Right
                    begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Invader 2 Display Logic
                if (invader_2_display) begin
                    if ((row == invader_2_coord_y     && col == invader_2_coord_x)     || // Center
                        (row == invader_2_coord_y     && col + 6'd1 == invader_2_coord_x) || // Left
                        (row == invader_2_coord_y     && col == invader_2_coord_x + 6'd1) || // Right
                        (row == invader_2_coord_y + 6'd1 && col == invader_2_coord_x)     || // Above (Y + 1)
                        (row + 6'd1 == invader_2_coord_y && col == invader_2_coord_x))       // Below (Y - 1)
                    begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Invader 3 Display Logic
                if (invader_3_display) begin
                    if ((row == invader_3_coord_y     && col == invader_3_coord_x)     || // Center
                        (row == invader_3_coord_y     && col + 6'd1 == invader_3_coord_x) || // Left
                        (row == invader_3_coord_y     && col == invader_3_coord_x + 6'd1) || // Right
                        (row == invader_3_coord_y + 6'd1 && col == invader_3_coord_x)     || // Above (Y + 1)
                        (row + 6'd1 == invader_3_coord_y && col == invader_3_coord_x)     || // Below (Y - 1)
                        (row == invader_3_coord_y + 6'd1 && col + 6'd1 == invader_3_coord_x) || // Above-Left
                        (row == invader_3_coord_y + 1 && col == invader_3_coord_x + 6'd1))   // Above-Right
                    begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Invader 4 Display Logic
                if (invader_4_display) begin
                    if ((row == invader_4_coord_y     && col == invader_4_coord_x)     || // Center
                        (row == invader_4_coord_y + 6'd1 && col + 1 == invader_4_coord_x) || // Above-Left
                        (row == invader_4_coord_y + 6'd1 && col == invader_4_coord_x + 6'd1) || // Above-Right
                        (row + 6'd1 == invader_4_coord_y && col + 6'd1 == invader_4_coord_x) || // Below-Left
                        (row + 6'd1 == invader_4_coord_y && col == invader_4_coord_x + 6'd1))   // Below-Right
                    begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Shield Display Logic
                if (shield_display && shield_hp > 0) begin
                    
                    // Bottom Layer (row == Y)
                    if (row == shield_coord_y) begin
                        if (col + 6'd2 == shield_coord_x) temp_display[row][col] = 1'b1; // X - 2
                        if (col + 6'd1 == shield_coord_x) temp_display[row][col] = 1'b1; // X - 1
                        if (col == shield_coord_x)     temp_display[row][col] = 1'b1; // X
                        
                        // X + 1 is 0 when HP is 1
                        if (col == shield_coord_x + 6'd1 && shield_hp != 2'd1) temp_display[row][col] = 1'b1;
                        if (col == shield_coord_x + 6'd2) temp_display[row][col] = 1'b1; // X + 2
                    end
                    
                    // Top Layer (row == Y + 1)
                    else if (row == shield_coord_y + 6'd1) begin
                        if (col + 6'd2 == shield_coord_x) temp_display[row][col] = 1'b1; // X - 2
                        
                        // X - 1 is 0 when HP is 2 or 1 (only displays when HP == 3)
                        if (col + 6'd1 == shield_coord_x && shield_hp == 2'd3) temp_display[row][col] = 1'b1; 
                        
                        // X is 0 when HP is 1
                        if (col == shield_coord_x     && shield_hp != 2'd1) temp_display[row][col] = 1'b1;
                        if (col == shield_coord_x + 6'd1) temp_display[row][col] = 1'b1; // X + 1
                        if (col == shield_coord_x + 6'd2) temp_display[row][col] = 1'b1; // X + 2
                    end
                end

                // Player Bullet Display Logic
                if (player_bullet_display) begin
                    if (row == player_bullet_coord_y && col == player_bullet_coord_x) begin
                        temp_display[row][col] = 1'b1;
                    end
                end

                // Invader Bullet Display Logic
                if (invader_bullet_display) begin
                    if (row == invader_bullet_coord_y && col == invader_bullet_coord_x) begin
                        temp_display[row][col] = 1'b1;
                    end
                end
            end
        end
    end

    // Sequential logic to set next_display <= temp_display or respond to restart signal
    always @ (negedge clka) begin : CLOCKING_POSITIONS
        if (reset) begin
            for (i = 6'd0; i < (DISPLAY_SIZE + 6'd1); i = i + 6'd1) next_display[i] <= 0;
        end else begin
            for (i = 6'd0; i < (DISPLAY_SIZE + 6'd1); i = i + 6'd1) next_display[i] <= temp_display[i];
        end
    end

    // Sequential logic to set outputs
    always @ (negedge clkb) begin : OUTPUT_LOGIC
        if (reset) begin
            for (j = 6'd0; j < (DISPLAY_SIZE + 6'd1); j = j + 6'd1) internal_display[j] <= 0;
        end else begin
            for (j = 6'd0; j < (DISPLAY_SIZE + 6'd1); j = j + 6'd1) internal_display[j] <= next_display[j];
        end
    end


    // Output assignment: Flatten the 2D array onto the 1D wire
    genvar g;
    generate
        for (g = 0; g <= DISPLAY_SIZE; g = g + 1) begin : FLATTEN_MATRIX
            assign display_flat[(g * 32) +: 32] = internal_display[g];
        end
    endgenerate

endmodule