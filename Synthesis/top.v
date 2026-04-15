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

    output wire [1023:0]    display_flat,                        // Display bitstream to python visualiser
    
    output wire play,
    output wire internal_reset, 

    output wire [5:0]       player_coord_x,                     // Player X coordinate
    output wire [5:0]       player_coord_y,                     // Player Y coordinate
    output wire             player_display,                     // Display bit

    output wire [5:0]       invader_1_coord_x,                  // Invader 1 X coordinate
    output wire [5:0]       invader_1_coord_y,                  // Invader 1 Y coordinate
    output wire             invader_1_display,                  // Display bit
    output wire             playerbullet_invader_collision_signal_1, // Signal indicating if an invader has been hit by a player bullet
    output wire             invader_outofbounds_signal_1,       // tells main game fsm when invader 1 will hit a boundary next cycle

    output wire [5:0]       invader_2_coord_x,                 // Invader 2 X coordinate
    output wire [5:0]       invader_2_coord_y,                  // Invader 2 Y coordinate
    output wire             invader_2_display,                  // Display bit
    output wire             playerbullet_invader_collision_signal_2, // Signal indicating if an invader has been hit by a player bullet
    output wire             invader_outofbounds_signal_2,       // tells main game fsm when invader 1 will hit a boundary next cycle

    output wire [5:0]       invader_3_coord_x,                  // Invader 3 X coordinate
    output wire [5:0]       invader_3_coord_y,                  // Invader 3 Y coordinate
    output wire             invader_3_display,                  // Display bit
    output wire             playerbullet_invader_collision_signal_3, // Signal indicating if an invader has been hit by a player bullet
    output wire             invader_outofbounds_signal_3,       // tells main game fsm when invader 1 will hit a boundary next cycle

    output wire [5:0]       invader_4_coord_x,                  // Invader 4 X coordinate
    output wire [5:0]       invader_4_coord_y,                  // Invader 4 Y coordinate
    output wire             invader_4_display,                  // Display bit
    output wire             playerbullet_invader_collision_signal_4, // Signal indicating if an invader has been hit by a player bullet
    output wire             invader_outofbounds_signal_4,       // tells main game fsm when invader 1 will hit a boundary next cycle

    output wire [5:0]       shield_coord_x,                    // Shield X coordinate
    output wire [5:0]       shield_coord_y,                     // Shield Y coordinate
    output wire [1:0]       shield_hp,                          // Shield HP (3 to 0)
    output wire             shield_display,                     // Display bit

    output wire [5:0]       player_bullet_coord_x,              // Player bullet X coordinate
    output wire [5:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    output wire             player_bullet_display,              // Display bit
    output wire             player_left_motion,                 // Player left motion 
    output wire             player_right_motion,                // Player right motion  

    output wire [5:0]       invader_bullet_coord_x,             // Invader bullet X coordinate
    output wire [5:0]       invader_bullet_coord_y,             // Invader bullet Y coordinate
    output wire             invader_bullet_display,             // Display bit
    
    output wire             invader_direction,                  // direction bit for horizontal movement (left is 0)
    output wire             move_down,                          // Tells invader to move down

    output wire invaderbullet_player_collision_signal,          // Signals that the player was hit by an invader bullet
    output wire invaderbullet_shield_collision_signal,         // Signals that the invader bullet hit the shield
    output wire playerbullet_shield_collision_signal,           // Signal to indicate if the player bullet has collided with a shield
    
    output wire invader_fire,                                   // Signals the invader bullet to be fired 
    output wire playerbullet_fire,                              // Signals the player bullet to be fired
    output wire [5:0] closest_invader_coord_x,                // Current X coordinates of closest invader to player
    output wire [5:0] closest_invader_coord_y,                  // Current Y coordinates of closest invader to player
    output wire              player_bullet_collision,            // Signal to indicate if the player bullet has collided with an invader
    output wire  [3:0]      invaders_display,
    output wire playerbullet_invader_collision_signal,

    output wire [1:0]       invader_state_1,
    output wire [1:0]       invader_state_2,
    output wire [1:0]       invader_state_3,
    output wire [1:0]       invader_state_4,
    output wire [1:0]       player_state,
    output wire [1:0]       playerbullet_state,
    output wire [1:0]      invaderbullet_state
    );

    assign invaders_display = {invader_4_display,invader_3_display,invader_2_display,invader_1_display};
    assign playerbullet_invader_collision_signal = playerbullet_invader_collision_signal_1 | playerbullet_invader_collision_signal_2 | playerbullet_invader_collision_signal_3 | playerbullet_invader_collision_signal_4;
    // Module Interconnects
    /*
    wire play;
    wire internal_reset; 

    wire [5:0]       player_coord_x;                     // Player X coordinate
    wire [5:0]       player_coord_y;                     // Player Y coordinate
    wire             player_display;                     // Display bit

    wire [5:0]       invader_1_coord_x;                  // Invader 1 X coordinate
    wire [5:0]       invader_1_coord_y;                  // Invader 1 Y coordinate
    wire             invader_1_display;                  // Display bit
    wire             playerbullet_invader_collision_signal_1; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_1;       // tells main game fsm when invader 1 will hit a boundary next cycle

    wire [5:0]       invader_2_coord_x;                 // Invader 2 X coordinate
    wire [5:0]       invader_2_coord_y;                  // Invader 2 Y coordinate
    wire             invader_2_display;                  // Display bit
    wire             playerbullet_invader_collision_signal_2; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_2;       // tells main game fsm when invader 1 will hit a boundary next cycle

    wire [5:0]       invader_3_coord_x;                  // Invader 3 X coordinate
    wire [5:0]       invader_3_coord_y;                  // Invader 3 Y coordinate
    wire             invader_3_display;                  // Display bit
    wire             playerbullet_invader_collision_signal_3; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_3;       // tells main game fsm when invader 1 will hit a boundary next cycle

    wire [5:0]       invader_4_coord_x;                  // Invader 4 X coordinate
    wire [5:0]       invader_4_coord_y;                  // Invader 4 Y coordinate
    wire             invader_4_display;                  // Display bit
    wire             playerbullet_invader_collision_signal_4; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_4;       // tells main game fsm when invader 1 will hit a boundary next cycle

    wire [5:0]       shield_coord_x;                    // Shield X coordinate
    wire [5:0]       shield_coord_y;                     // Shield Y coordinate
    wire [1:0]       shield_hp;                          // Shield HP (3 to 0)
    wire             shield_display;                     // Display bit

    wire [5:0]       player_bullet_coord_x;              // Player bullet X coordinate
    wire [5:0]       player_bullet_coord_y;              // Player bullet Y coordinate
    wire             player_bullet_display;              // Display bit
    wire             player_left_motion;                 // Player left motion 
    wire             player_right_motion;                // Player right motion  

    wire [5:0]       invader_bullet_coord_x;             // Invader bullet X coordinate
    wire [5:0]       invader_bullet_coord_y;             // Invader bullet Y coordinate
    wire             invader_bullet_display;             // Display bit
    
    wire             invader_direction;                  // direction bit for horizontal movement (left is 0)
    wire             move_down;                          // Tells invader to move down
    
    wire invaderbullet_player_collision_signal;          // Signals that the player was hit by an invader bullet
    wire invaderbullet_shield_collision_signal;          // Signals that the invader bullet hit the shield
    wire playerbullet_shield_collision_signal;           // Signal to indicate if the player bullet has collided with a shield
    
    wire invader_fire;                                   // Signals the invader bullet to be fired 
    wire playerbullet_fire;                              // Signals the player bullet to be fired
    wire [5:0] closest_invader_coord_x;                  // Current X coordinates of closest invader to player
    wire [5:0] closest_invader_coord_y;                  // Current Y coordinates of closest invader to player

    wire              player_bullet_collision;            // Signal to indicate if the player bullet has collided with an invader

    wire  [3:0]       invaders_display = {invader_4_display,invader_3_display,invader_2_display,invader_1_display};

    wire playerbullet_invader_collision_signal = playerbullet_invader_collision_signal_1 | playerbullet_invader_collision_signal_2 | playerbullet_invader_collision_signal_3 | playerbullet_invader_collision_signal_4;
    */
    // Instantiate Main Game FSM:
    main_game_fsm main_game_fsm(
        .clka(clka), .clkb(clkb),                             // Input clocks
        .global_reset(reset),                           // Global reset signal
        .player_left_input(player_left_input),
        .player_right_input(player_right_input),
        .player_shoot_input(player_shoot_input),
        .player_display(player_display),
        .player_coordinate_x(player_coord_x),
        .player_coordinate_y(player_coord_y),
        .invaders_display(invaders_display),
        .invader1_coordinate_x(invader_1_coord_x),
        .invader1_coordinate_y(invader_1_coord_y),
        .invader2_coordinate_x(invader_2_coord_x),
        .invader2_coordinate_y(invader_2_coord_y),
        .invader3_coordinate_x(invader_3_coord_x),
        .invader3_coordinate_y(invader_3_coord_y),
        .invader4_coordinate_x(invader_4_coord_x),
        .invader4_coordinate_y(invader_4_coord_y),
        .invaderbullet_coord_x(invader_bullet_coord_x),
        .invaderbullet_coord_y(invader_bullet_coord_y),
        .invaderbullet_player_collision_signal(invaderbullet_player_collision_signal),
        .invaderbullet_shield_collision_signal(invaderbullet_shield_collision_signal),
        .invader_outofbounds_signal_1(invader_outofbounds_signal_1),
        .invader_outofbounds_signal_2(invader_outofbounds_signal_2),
        .invader_outofbounds_signal_3(invader_outofbounds_signal_3),
        .invader_outofbounds_signal_4(invader_outofbounds_signal_4),
        
        .player_left_motion(player_left_motion),
        .player_right_motion(player_right_motion),
        .closest_invader_coord_x(closest_invader_coord_x),
        .closest_invader_coord_y(closest_invader_coord_y),
        .play(play),
        .reset(internal_reset),
        .invader_direction(invader_direction),
        .playerbullet_fire(playerbullet_fire),
        .move_down(move_down),
        .invaderbullet_fire(invader_fire)
    );

    // Instantiate Datapath:
    datapath datapath(
        .clka(clka), .clkb(clkb),                            // Input clocks
        .reset(internal_reset),                                 // Global control and reset signals

        .player_coord_x(player_coord_x),                        // Player X coordinate
        .player_coord_y(player_coord_y),                        // Player Y coordinate
        .player_display(player_display),                        // Display bit

        .invader_1_coord_x(invader_1_coord_x),                     // Invader 1 X coordinate
        .invader_1_coord_y(invader_1_coord_y),                     // Invader 1 Y coordinate
        .invader_1_display(invader_1_display),                     // Display bit

        .invader_2_coord_x(invader_2_coord_x),                     // Invader 2 X coordinate
        .invader_2_coord_y(invader_2_coord_y),                     // Invader 2 Y coordinate
        .invader_2_display(invader_2_display),                     // Display bit

        .invader_3_coord_x(invader_3_coord_x),                     // Invader 3 X coordinate
        .invader_3_coord_y(invader_3_coord_y),                     // Invader 3 Y coordinate
        .invader_3_display(invader_3_display),                     // Display bit

        .invader_4_coord_x(invader_4_coord_x),                     // Invader 4 X coordinate
        .invader_4_coord_y(invader_4_coord_y),                     // Invader 4 Y coordinate
        .invader_4_display(invader_4_display),                     // Display bit

        .shield_coord_x(shield_coord_x),                        // Shield X coordinate
        .shield_coord_y(shield_coord_y),                        // Shield Y coordinate
        .shield_hp(shield_hp),                             // Shield HP (3 to 0)
        .shield_display(shield_display),                        // Display bit

        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .player_bullet_display(player_bullet_display),                 // Display bit

        .invader_bullet_coord_x(invader_bullet_coord_x),                // Invader bullet X coordinate
        .invader_bullet_coord_y(invader_bullet_coord_y),                // Invader bullet Y coordinate
        .invader_bullet_display(invader_bullet_display),                // Display bit

        .display_flat(display_flat)                           // 1024 bit single vector output for display (in python)
    );

    // Instantiate Player FSM:
    player_fsm player_fsm(
        .clka(clka), .clkb(clkb),                            // Input clocks
        .reset(internal_reset), .play(play),           // Internal reset and control signals

        .invader_bullet_coord_x(invader_bullet_coord_x),                // Invader bullet X coordinate
        .invader_bullet_coord_y(invader_bullet_coord_y),                // Invader bullet Y coordinate
        .invaderbullet_player_collision_signal(invaderbullet_player_collision_signal),        // Signal to indicate if the player has collided with an invader bullet
        .player_left_input(player_left_motion),                     // Player's left input
        .player_right_input(player_right_motion),                    // Player's right input
        .player_coord_x(player_coord_x),                        // Player X coordinate
        .player_coord_y(player_coord_y),                        // Player Y coordinate
        .display(player_display),
        .state(player_state)                              // Signal to indicate if the player should be displayed on the screen
    );

    // Instantiate Shield FSM:
    shield_fsm #( .START_X(6'd15), .START_Y(6'd5)) shield_fsm(
        .clka(clka), .clkb(clkb),
        .reset(internal_reset),
        .invader_bullet_coord_x(invader_bullet_coord_x),
        .invader_bullet_coord_y(invader_bullet_coord_y),
        .player_bullet_coord_x(player_bullet_coord_x),
        .player_bullet_coord_y(player_bullet_coord_y),
        .shield_play(play),
        .hp(shield_hp),
        .shield_display(shield_display),
        .invaderbullet_shield_collision(invaderbullet_shield_collision_signal),
        .playerbullet_shield_collision(playerbullet_shield_collision_signal),
        .shield_coord_x(shield_coord_x),
        .shield_coord_y(shield_coord_y),
        
    );

    // Instantiate 4 Invaders
    invader_fsm #( .START_X(6'd6), .START_Y(6'd30)) invader_fsm_1 (
        .clka(clka), .clkb(clkb),                           // Input clocks
        .reset(internal_reset), .play(play),                          // Global control and reset signals
        .invader_direction(invader_direction),                     // direction bit for horizontal movement (left is 0)
        .move_down(move_down),                             // Tells invader to move down
        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .display(invader_1_display),                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal(playerbullet_invader_collision_signal_1), // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x(invader_1_coord_x),                       // Player bullet X coordinate
        .invader_coord_y(invader_1_coord_y),                       // Player bullet Y coordinate
        .invader_outofbounds_signal(invader_outofbounds_signal_1)  
        .state(invader_state_1)          // tells main game fsm when invader hits boundary
    );

    invader_fsm #( .START_X(6'd12), .START_Y(6'd30)) invader_fsm_2(
        .clka(clka), .clkb(clkb),                           // Input clocks
        .reset(internal_reset), .play(play),                          // Global control and reset signals
        .invader_direction(invader_direction),                     // direction bit for horizontal movement (left is 0)
        .move_down(move_down),                             // Tells invader to move down
        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .display(invader_2_display),                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal(playerbullet_invader_collision_signal_2), // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x(invader_2_coord_x),                       // Player bullet X coordinate
        .invader_coord_y(invader_2_coord_y),                        // Player bullet Y coordinate
        .invader_outofbounds_signal(invader_outofbounds_signal_2),
        .state(invader_state_2)               // tells main game fsm when invader hits boundary                             // Current state of this invader
    );

    invader_fsm #( .START_X(6'd18), .START_Y(6'd30)) invader_fsm_3(
        .clka(clka), .clkb(clkb),                           // Input clocks
        .reset(internal_reset), .play(play),                          // Global control and reset signals
        .invader_direction(invader_direction),                     // direction bit for horizontal movement (left is 0)
        .move_down(move_down),                             // Tells invader to move down
        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .display(invader_3_display),                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal(playerbullet_invader_collision_signal_3), // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x(invader_3_coord_x),                       // Player bullet X coordinate
        .invader_coord_y(invader_3_coord_y),                       // Player bullet Y coordinate
        .invader_outofbounds_signal(invader_outofbounds_signal_3),
        .state(invader_state_3)               // tells main game fsm when invader hits boundary
    );

    invader_fsm #( .START_X(6'd24), .START_Y(6'd30)) invader_fsm_4(
        .clka(clka), .clkb(clkb),                           // Input clocks
        .reset(internal_reset), .play(play),                          // Global control and reset signals
        .invader_direction(invader_direction),                     // direction bit for horizontal movement (left is 0)
        .move_down(move_down),                             // Tells invader to move down
        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .display(invader_4_display),                               // Bit indicating if invader is still alive. Can be used as display bit
        .playerbullet_invader_collision_signal(playerbullet_invader_collision_signal_4), // Signal indicating if an invader has been hit by a player bullet
        .invader_coord_x(invader_4_coord_x),                       // Player bullet X coordinate
        .invader_coord_y(invader_4_coord_y),                       // Player bullet Y coordinate
        .invader_outofbounds_signal(invader_outofbounds_signal_4),
        .state(invader_state_3)             // tells main game fsm when invader hits boundary
    );

    // Instantiate Player Bullet FSM:
    player_bullet_fsm player_bullet_fsm(
        .clka(clka), .clkb(clkb),                           // Input clocks
        .reset(internal_reset), .fire(playerbullet_fire),                          // Global control and reset signals
        .player_coord_x(player_coord_x),                        // Player bullet X coordinate
        .player_coord_y(player_coord_y),                        // Player bullet Y coordinate
        .player_bullet_collision(playerbullet_invader_collision_signal),               // Signal to indicate if the player bullet has collided with an invader
        .shield_bullet_collision(playerbullet_shield_collision_signal),               // Signal to indicate if the player bullet has collided with a shield
        .display(player_bullet_display),                               // Signal to indicate if the player bullet should be displayed on the screen
        .player_bullet_coord_x(player_bullet_coord_x),                 // Player bullet X coordinate
        .player_bullet_coord_y(player_bullet_coord_y)                 // Player bullet Y coordinate
    );

    // Instantiate Invader Bullet FSM:
    invader_bullet_fsm invader_bullet_fsm(
        .clka(clka), .clkb(clkb),
        .reset(internal_reset),
        .invaderbullet_player_collision_signal(invaderbullet_player_collision_signal),
        .invaderbullet_shield_collision_signal(invaderbullet_shield_collision_signal),
        .invader_fire(invader_fire),
        .closest_invader_coord_x(closest_invader_coord_x),
        .closest_invader_coord_y(closest_invader_coord_y),
        .invader_bullet_display(invader_bullet_display),
        .invader_bullet_coord_x(invader_bullet_coord_x),
        .invader_bullet_coord_y(invader_bullet_coord_y)
    );

endmodule
