# elec422_space_invaders

Space Invaders Verilog - Project Signal Directory
=================================================

This document provides a breakdown of all input and output ports used across the provided Space Invader FSM and datapath modules.

-------------------------------------------------
System and Control Signals
These signals are universally used across modules to handle timing, resets, and high-level game states.

* clka, clkb
  - Module(s): All Modules
  - Description: Standard input clocks driving the sequential logic of the system.

* reset
  - Module(s): All Modules
  - Description: Global reset signal used to revert FSMs and datapath registers to their initial states.

* play
  - Module(s): invader_fsm, player_fsm
  - Description: Global control signal that transitions the entities from their reset/init states into active gameplay.

* shield_play
  - Module(s): shield_fsm
  - Description: Control input that initiates the shield logic and sets its initial health.

* state
  - Module(s): invader_bullet_fsm, invader_fsm, shield_fsm, player_bullet_fsm, player_fsm
  - Description: A 2-bit output denoting the current operational state of the respective entity's FSM.

-------------------------------------------------
Player Entity Signals
These signals govern the position, movement, and rendering of the player's ship.

* player_coord_x, player_coord_y
  - Module(s): datapath, player_bullet_fsm, player_fsm
  - Description: 6-bit vectors tracking the X and Y coordinates of the player.

* direction
  - Module(s): player_fsm
  - Description: Input signal indicating intended player movement, where 1 moves right and 0 moves left.

* player_display
  - Module(s): datapath
  - Description: Input bit instructing the datapath to draw the player model at its coordinates.

* display
  - Module(s): invader_fsm, player_bullet_fsm, player_fsm
  - Description: A generic output signal indicating whether a specific entity is alive and should be rendered.

-------------------------------------------------
Invader Entity Signals
These signals manage the positions, boundaries, and rendering for both individual invaders and the collective invader swarm.

* invader_1_coord_x through invader_4_coord_y
  - Module(s): datapath
  - Description: 6-bit vectors explicitly specifying the X and Y coordinates for four distinct invaders.

* invader_1_display through invader_4_display
  - Module(s): datapath
  - Description: Individual display input bits to trigger rendering for each of the four invaders.

* invader_coord_x, invader_coord_y
  - Module(s): invader_fsm
  - Description: 6-bit outputs tracking the current coordinates of a generic invader FSM.

* closest_invader_coord_x, closest_invader_coord_y
  - Module(s): invader_bullet_fsm
  - Description: 6-bit inputs giving the coordinates of the invader closest to the player to originate enemy fire.

* invader_direction
  - Module(s): invader_fsm
  - Description: Input denoting horizontal movement direction, where 0 tells the invader to move left.

* move_down
  - Module(s): invader_fsm
  - Description: Input signal instructing the invader to shift vertically downwards.

* invader_outofbounds_signal
  - Module(s): invader_fsm
  - Description: Output signal informing the main game FSM when an invader hits the horizontal play boundaries.

-------------------------------------------------
Shield Signals
These signals handle the defensive shields, their degrading health, and their visual properties.

* shield_coord_x, shield_coord_y
  - Module(s): datapath
  - Description: 6-bit inputs determining where the shield is rendered on the screen.

* shield_hp
  - Module(s): datapath
  - Description: A 2-bit input representing the shield's hit points, scaling from 3 to 0.

* hp
  - Module(s): shield_fsm
  - Description: A 2-bit output continuously tracking the shield's remaining hit points.

* color
  - Module(s): shield_fsm
  - Description: A 4-bit output utilizing one-hot encoding to signify the shield's current color/degradation level.

* shield_display
  - Module(s): datapath, shield_fsm
  - Description: Signal driving whether the shield should be shown based on its alive status.

-------------------------------------------------
Weapons and Ordnance Signals
These signals control the spawning, coordinates, and visibility of both player and invader projectiles.

* player_bullet_coord_x, player_bullet_coord_y
  - Module(s): datapath, invader_fsm, shield_fsm, player_bullet_fsm
  - Description: 6-bit vectors tracking the location of a fired player bullet.

* invader_bullet_coord_x, invader_bullet_coord_y
  - Module(s): datapath, invader_bullet_fsm, shield_fsm, player_fsm
  - Description: 6-bit vectors tracking the location of a fired invader bullet.

* fire
  - Module(s): player_bullet_fsm
  - Description: Input signal from the user/system telling the player to shoot.

* invader_fire
  - Module(s): invader_bullet_fsm
  - Description: Input signal instructing the swarm to fire a bullet downwards.

* player_bullet_display
  - Module(s): datapath
  - Description: Input bit informing the datapath to render the player's bullet.

* invader_bullet_display
  - Module(s): datapath, invader_bullet_fsm
  - Description: Signal used to tell the system to render an active invader bullet.

-------------------------------------------------
Collision Signals
These are the flags raised when entities intersect within the game grid logic.

* invaderbullet_player_collision_signal / invaderbullet_player_collision
  - Module(s): invader_bullet_fsm, player_fsm
  - Description: Handshake signals verifying an invader bullet has successfully hit the player.

* invaderbullet_shield_collision_signal / invaderbullet_shield_collision
  - Module(s): invader_bullet_fsm, shield_fsm
  - Description: Handshake signals denoting an invader bullet struck the player's shield.

* playerbullet_invader_collision_signal
  - Module(s): invader_fsm
  - Description: Output signal raised upon an invader's death by a player bullet, meant to be globally ORed with other invaders.

* playerbullet_shield_collision / shield_bullet_collision
  - Module(s): shield_fsm, player_bullet_fsm
  - Description: Signals confirming a player's bullet accidentally hit their own shield.

* player_bullet_collision
  - Module(s): player_bullet_fsm
  - Description: Input indicating the player bullet successfully impacted an invader.

-------------------------------------------------
Primary Display Output
This acts as the bridge to standard VGA/Display interfaces.

* display_flat
  - Module(s): datapath
  - Description: A 1024-bit mapped output vector representing the fully flattened 32x32 game grid, built to comply with 1D standard Verilog port rules.
