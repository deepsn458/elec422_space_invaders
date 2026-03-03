//////////////////////////////////////////
// invader_bullet_fsm.v
//
// Written: dn55@rice.edu
// Created: 2 Mar 2026
//
// Purpose: Control FSM for an invader entity
// 
////////////////////////////////////////////////////////////////////////////////////////////////

module invader_bullet_fsm
#(
    parameter BULLET_Y_OFFSET = 2,
    parameter BOUNDARY_Y = 0,
    parameter START_X = 5,
    parameter START_Y = 5
)(
    input wire clka,
    input wire clkb,
    input wire player_collision_signal,
    input wire shield_collision_signal,
    input wire invader_fire
    input wire [5:0] closest_invader_coord_x,
    input wire [5:0] closest_invader_coord_y

    output reg invader_bullet_display,
    output reg [5:0] invader_bullet_coord_x,
    output reg [5:0] invader_bullet_coord_y

    output reg [1:0] state
);
    reg [1:0] temp_state;
    reg [1:0] next_state;

    //State parameters
    parameter INITIAL = 2'b00, FIRING = 2'b01, COLLISION = 2'b10;

    wire 

endmodule