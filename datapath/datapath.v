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
    parameter display_size = 32,                                // Start X coordinate of this invader
    parameter display_buffer_offset = 16                        // Start Y coordinate of this invader
    )(
        
    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset,                              // Global control and reset signals

    input  wire [5:0]       player_coord_x,                     // Player X coordinate
    input  wire [5:0]       player_coord_y,                     // Player Y coordinate

    input  wire [5:0]       invader_1_coord_x,                  // Invader 1 X coordinate
    input  wire [5:0]       invader_1_coord_y,                  // Invader 1 Y coordinate

    input  wire [5:0]       invader_2_coord_x,                  // Invader 2 X coordinate
    input  wire [5:0]       invader_2_coord_y,                  // Invader 2 Y coordinate

    input  wire [5:0]       invader_3_coord_x,                  // Invader 3 X coordinate
    input  wire [5:0]       invader_3_coord_y,                  // Invader 3 Y coordinate

    input  wire [5:0]       invader_4_coord_x,                  // Invader 4 X coordinate
    input  wire [5:0]       invader_4_coord_y,                  // Invader 4 Y coordinate

    input  wire [5:0]       shield_coord_x,                     // Shield X coordinate
    input  wire [5:0]       shield_coord_y,                     // Shield Y coordinate

    input  wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    input  wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate

    input  wire [5:0]       invader_bullet_coord_x,             // Invader bullet X coordinate
    input  wire [5:0]       invader_bullet_coord_y,             // Invader bullet Y coordinate

    output wire [31:0]      display     [31:0]                  // This is the 32 X 32 display data to be output
    );

    // 






endmodule