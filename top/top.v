///////////////////////////////////////////
// top.v
//
// Written: jc165@rice.edu
// Created: 11 Apr 2026
//
// Purpose: Top file that instantiates all FSM and datapaths of the Space Invader game
// 
////////////////////////////////////////////////////////////////////////////////////////////////

module top
    #(
    parameter START_X = 5
    )(

    input  wire             clka, clkb,                         // Input clocks
    input  wire             reset,                              // Global control and reset signals
    input  wire             player_left_input,                  // Player's left input
    input  wire             player_right_input,                 // Player's right input
    input  wire             player_shoot_input,                 // Player's firing input

    output wire [1023:0]    display_flat                        // Display bitstream to python visualiser
    );

    // Module Interconnects
    wire play;

    wire [5:0]       player_coord_x,                     // Player X coordinate
    wire [5:0]       player_coord_y,                     // Player Y coordinate
    wire             player_display,                     // Display bit

    wire [5:0]       invader_1_coord_x,                  // Invader 1 X coordinate
    wire [5:0]       invader_1_coord_y,                  // Invader 1 Y coordinate
    wire             invader_1_display,                  // Display bit

    wire [5:0]       invader_2_coord_x,                  // Invader 2 X coordinate
    wire [5:0]       invader_2_coord_y,                  // Invader 2 Y coordinate
    wire             invader_2_display,                  // Display bit

    wire [5:0]       invader_3_coord_x,                  // Invader 3 X coordinate
    wire [5:0]       invader_3_coord_y,                  // Invader 3 Y coordinate
    wire             invader_3_display,                  // Display bit

    wire [5:0]       invader_4_coord_x,                  // Invader 4 X coordinate
    wire [5:0]       invader_4_coord_y,                  // Invader 4 Y coordinate
    wire             invader_4_display,                  // Display bit

    wire [5:0]       shield_coord_x,                     // Shield X coordinate
    wire [5:0]       shield_coord_y,                     // Shield Y coordinate
    wire [1:0]       shield_hp,                          // Shield HP (3 to 0)
    wire             shield_display,                     // Display bit

    wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    wire             player_bullet_display,              // Display bit

    wire [5:0]       invader_bullet_coord_x,             // Invader bullet X coordinate
    wire [5:0]       invader_bullet_coord_y,             // Invader bullet Y coordinate
    wire             invader_bullet_display,             // Display bit
    
    wire             invader_direction,                  // direction bit for horizontal movement (left is 0)
    wire             move_down,                          // Tells invader to move down
    wire             playerbullet_invader_collision_signal;// Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_1;       // tells main game fsm when invader hits boundary







    // Instantiate Main Game FSM:
    main_game_fsm main_game_fsm(
        .clka, .clkb,                             // Input clocks
        .global_reset,                           // Global reset signal

        .player_left_input,
        .player_right_input,
        .player_shoot_input,
..... TODO:
    );

    // Instantiate Datapath:
    datapath datapath(
        .clka, clkb,                            // Input clocks
        .reset,                                 // Global control and reset signals

        .player_coord_x,                        // Player X coordinate
        .player_coord_y,                        // Player Y coordinate
        .player_display,                        // Display bit

        .invader_1_coord_x,                     // Invader 1 X coordinate
        .invader_1_coord_y,                     // Invader 1 Y coordinate
        .invader_1_display,                     // Display bit

        .invader_2_coord_x,                     // Invader 2 X coordinate
        .invader_2_coord_y,                     // Invader 2 Y coordinate
        .invader_2_display,                     // Display bit

        .invader_3_coord_x,                     // Invader 3 X coordinate
        .invader_3_coord_y,                     // Invader 3 Y coordinate
        .invader_3_display,                     // Display bit

        .invader_4_coord_x,                     // Invader 4 X coordinate
        .invader_4_coord_y,                     // Invader 4 Y coordinate
        .invader_4_display,                     // Display bit

        .shield_coord_x,                        // Shield X coordinate
        .shield_coord_y,                        // Shield Y coordinate
        .shield_hp,                             // Shield HP (3 to 0)
        .shield_display,                        // Display bit

        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .player_bullet_display,                 // Display bit

        .invader_bullet_coord_x,                // Invader bullet X coordinate
        .invader_bullet_coord_y,                // Invader bullet Y coordinate
        .invader_bullet_display,                // Display bit

        .display_flat                           // 1024 bit single vector output for display (in python)
    );

    // Instantiate Player FSM:
    player_fsm player_fsm(
        .clka, clkb,                            // Input clocks
        .reset, play,                           // Global reset and control signals
        .invader_bullet_coord_x,                // Invader bullet X coordinate
        .invader_bullet_coord_y,                // Invader bullet Y coordinate
        .direction                              // Signals to indicate if the player is moving left or right; 1 = right, 0 = left
        .invaderbullet_player_collision,        // Signal to indicate if the player has collided with an invader bullet
        .player_coord_x,                        // Player X coordinate
        .player_coord_y,                        // Player Y coordinate
        .display,                               // Signal to indicate if the player should be displayed on the screen
        .state()                                // Current state of this player bullet
    );

    // Instantiate Shield FSM:
    shield_fsm shield_fsm(
        .clka, .clkb,
        .reset,
        .invader_bullet_coord_x,
        .invader_bullet_coord_y,
        .player_bullet_coord_x,
        .player_bullet_coord_y,
        .shield_play(play),

        .color, //one hot encoding to denote health/color
        .hp,
        .shield_display,
        .invaderbullet_shield_collision,
        .playerbullet_shield_collision,
        .state()
    );

    // Instantiate 4 Invaders
    invader_fsm invader_fsm_1(
        .clka, .clkb,                           // Input clocks
        .reset, .play,                          // Global control and reset signals
        .invader_direction,                     // direction bit for horizontal movement (left is 0)
        .move_down,                             // Tells invader to move down
        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .display,                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal, // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x,                       // Player bullet X coordinate
        .invader_coord_y,                       // Player bullet Y coordinate
        .invader_outofbounds_signal,            // tells main game fsm when invader hits boundary
        .state()                                // Current state of this invader
    );

    invader_fsm invader_fsm_2(
        .clka, .clkb,                           // Input clocks
        .reset, .play,                          // Global control and reset signals
        .invader_direction,                     // direction bit for horizontal movement (left is 0)
        .move_down,                             // Tells invader to move down
        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .display,                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal, // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x,                       // Player bullet X coordinate
        .invader_coord_y,                       // Player bullet Y coordinate
        .invader_outofbounds_signal,            // tells main game fsm when invader hits boundary
        .state()                                // Current state of this invader
    );

    invader_fsm invader_fsm_3(
        .clka, .clkb,                           // Input clocks
        .reset, .play,                          // Global control and reset signals
        .invader_direction,                     // direction bit for horizontal movement (left is 0)
        .move_down,                             // Tells invader to move down
        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .display,                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal, // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x,                       // Player bullet X coordinate
        .invader_coord_y,                       // Player bullet Y coordinate
        .invader_outofbounds_signal,            // tells main game fsm when invader hits boundary
        .state()                                // Current state of this invader
    );

    invader_fsm invader_fsm_4(
        .clka, .clkb,                           // Input clocks
        .reset, .play,                          // Global control and reset signals
        .invader_direction,                     // direction bit for horizontal movement (left is 0)
        .move_down,                             // Tells invader to move down
        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .display,                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal, // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x,                       // Player bullet X coordinate
        .invader_coord_y,                       // Player bullet Y coordinate
        .invader_outofbounds_signal,            // tells main game fsm when invader hits boundary
        .state()                                // Current state of this invader
    );

    // Instantiate Player Bullet FSM:
    player_bullet_fsm player_bullet_fsm(
        .clka, .clkb,                           // Input clocks
        .reset, .fire,                          // Global control and reset signals
        .player_coord_x,                        // Player bullet X coordinate
        .player_coord_y,                        // Player bullet Y coordinate
        .player_bullet_collision,               // Signal to indicate if the player bullet has collided with an invader
        .shield_bullet_collision,               // Signal to indicate if the player bullet has collided with a shield
        .display,                               // Signal to indicate if the player bullet should be displayed on the screen
        .player_bullet_coord_x,                 // Player bullet X coordinate
        .player_bullet_coord_y,                 // Player bullet Y coordinate
        .state()                                // Current state of this player bullet
    );

    // Instantiate Invader Bullet FSM:
    invader_bullet_fsm invader_bullet_fsm(
        .clka, .clkb,
        .reset,
        .invaderbullet_player_collision_signal,
        .invaderbullet_shield_collision_signal,
        .invader_fire,
        .closest_invader_coord_x,
        .closest_invader_coord_y,
        .invader_bullet_display,
        .invader_bullet_coord_x,
        .invader_bullet_coord_y,
        .state()
    );

endmodule
