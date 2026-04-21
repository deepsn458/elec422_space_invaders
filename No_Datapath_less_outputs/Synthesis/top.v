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

    // Below are previously datapath.v inputs which were flattened into a 1024 bit output.
    // New approach to reduce chip size is to implement the datapath functionality in python.
    output wire [3:0]       player_coord_x,                     // Player X coordinate
    output wire             player_display,                     // Display bit

    output wire [3:0]       invader_1_coord_x,                  // Invader 1 X coordinate
    output wire [3:0]       invader_1_coord_y,                  // Invader 1 Y coordinate
    output wire             invader_1_display,                  // Display bit

    output wire [3:0]       invader_2_coord_x,                  // Invader 2 X coordinate
    output wire [3:0]       invader_2_coord_y,                  // Invader 2 Y coordinate
    output wire             invader_2_display,                  // Display bit

    output wire [3:0]       shield_coord_x,                     // Shield X coordinate
    output wire [3:0]       shield_coord_y,                     // Shield Y coordinate
    output wire [1:0]       shield_hp,                          // Shield HP (3 to 0)

    output wire [3:0]       player_bullet_coord_x,              // Player bullet X coordinate
    output wire [3:0]       player_bullet_coord_y,              // Player bullet Y coordinate
    output wire             player_bullet_display,              // Display bit

    output wire [3:0]       invader_bullet_coord_x,             // Invader bullet X coordinate
    output wire [3:0]       invader_bullet_coord_y,             // Invader bullet Y coordinate
    output wire             invader_bullet_display              // Display bit
    );

    // Module Interconnects

    wire play;
    wire internal_reset; 

    wire             playerbullet_invader_collision_signal_1; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_1;       // tells main game fsm when invader 1 will hit a boundary next cycle

    wire             playerbullet_invader_collision_signal_2; // Signal indicating if an invader has been hit by a player bullet
    wire             invader_outofbounds_signal_2;       // tells main game fsm when invader 1 will hit a boundary next cycle


    wire             player_left_motion;                 // Player left motion 
    wire             player_right_motion;                // Player right motion  
    
    wire             invader_direction;                  // direction bit for horizontal movement (left is 0)
    wire             move_down;                          // Tells invader to move down
    
    wire invaderbullet_player_collision_signal;          // Signals that the player was hit by an invader bullet
    wire invaderbullet_shield_collision_signal;          // Signals that the invader bullet hit the shield
    wire playerbullet_shield_collision_signal;           // Signal to indicate if the player bullet has collided with a shield
    
    wire invader_fire;                                   // Signals the invader bullet to be fired 
    wire playerbullet_fire;                              // Signals the player bullet to be fired
    wire [3:0] closest_invader_coord_x;                  // Current X coordinates of closest invader to player
    wire [3:0] closest_invader_coord_y;                  // Current Y coordinates of closest invader to player

    wire             player_bullet_collision;            // Signal to indicate if the player bullet has collided with an invader

    wire  [1:0]      invaders_display = {invader_2_display,invader_1_display};

    wire playerbullet_invader_collision_signal = playerbullet_invader_collision_signal_1 | playerbullet_invader_collision_signal_2;

    wire [3:0]       player_coord_y;                     // Player Y coordinate

    wire             shield_display;                     // Display bit

    wire             playerbullet_state;                  // Player bullet state
    wire [1:0]       main_game_state;                      // Main game state

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
        .invaderbullet_coord_x(invader_bullet_coord_x),
        .invaderbullet_coord_y(invader_bullet_coord_y),
        .invaderbullet_player_collision_signal(invaderbullet_player_collision_signal),
        .invaderbullet_shield_collision_signal(invaderbullet_shield_collision_signal),
        .invader_outofbounds_signal_1(invader_outofbounds_signal_1),
        .invader_outofbounds_signal_2(invader_outofbounds_signal_2),
        
        .player_left_motion(player_left_motion),
        .player_right_motion(player_right_motion),
        .closest_invader_coord_x(closest_invader_coord_x),
        .closest_invader_coord_y(closest_invader_coord_y),
        .play(play),
        .reset(internal_reset),
        .invader_direction(invader_direction),
        .playerbullet_fire(playerbullet_fire),
        .move_down(move_down),
        .invaderbullet_fire(invader_fire),
        .state(main_game_state)
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
        .state()                              // Signal to indicate if the player should be displayed on the screen
    );

    // Instantiate Shield FSM:
    shield_fsm #( .START_X(4'd7), .START_Y(4'd4)) shield_fsm(
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
        .shield_coord_y(shield_coord_y)       
    );

    // Instantiate 2 Invaders
    invader_fsm #( .START_X(4'd5), .START_Y(4'd13)) invader_fsm_1 (
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
        .invader_outofbounds_signal(invader_outofbounds_signal_1),  
        .state()          // tells main game fsm when invader hits boundary
    );

    invader_fsm #( .START_X(4'd9), .START_Y(4'd13)) invader_fsm_2(
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
        .state()               // tells main game fsm when invader hits boundary                             // Current state of this invader
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
        .player_bullet_coord_y(player_bullet_coord_y),                 // Player bullet Y coordinate
        .state(playerbullet_state)
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
