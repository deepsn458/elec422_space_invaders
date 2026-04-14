//////////////////////////////////////////
// invader_bullet_fsm.v
//
// Written: dn55@rice.edu
// Created: 2 Mar 2026
//
// Purpose: Control FSM for an invader bullet entity
// 
////////////////////////////////////////////////////////////////////////////////////////////////

module invader_bullet_fsm
#(
    parameter BULLET_Y_OFFSET = 1,
    parameter BOUNDARY_Y = 0,
    parameter START_X = 5,
    parameter START_Y = 25
)(
    input wire clka,
    input wire clkb,
    input wire reset,
    input wire invaderbullet_player_collision_signal,
    input wire invaderbullet_shield_collision_signal,
    input wire invader_fire,
    input wire [5:0] closest_invader_coord_x,
    input wire [5:0] closest_invader_coord_y,

    output reg invader_bullet_display,
    output reg [5:0] invader_bullet_coord_x,
    output reg [5:0] invader_bullet_coord_y,

    output reg [1:0] state
);
    reg [1:0] temp_state;
    reg [1:0] next_state;

    //State parameters
    parameter INITIAL = 2'b00, FIRING = 2'b01;

    always @ (*) begin
        case (state)
        INITIAL: begin
            if (invader_fire) begin
                temp_state = FIRING;
            end else begin
                temp_state = INITIAL;
            end
        end
        FIRING: begin
            if ((invaderbullet_player_collision_signal | invaderbullet_shield_collision_signal)|| invader_bullet_coord_y == BOUNDARY_Y) begin
                temp_state = INITIAL;
            end else begin
                temp_state = FIRING;
            end
        end
        default: temp_state = INITIAL;
        endcase
    end

    // sequential logic to set next_state <= temp_state or respond to restart signal
    always @ (negedge clka) begin
        if (reset) begin
            next_state <= INITIAL;
        end else begin
            next_state <= temp_state;
        end
    end

    //sequential logic to set outputs
    always @ (negedge clkb) begin : OUTPUT_LOGIC
        case (next_state)
            INITIAL: begin
                state <= next_state;
                invader_bullet_display <= 1'b0;
                invader_bullet_coord_x <= closest_invader_coord_x;
                invader_bullet_coord_y <= closest_invader_coord_y;
            end
            FIRING: begin
                state <= next_state;
                invader_bullet_display <= 1'b1;
                if (invader_bullet_coord_y >= BOUNDARY_Y) begin
                    invader_bullet_coord_y <= invader_bullet_coord_y - BULLET_Y_OFFSET;
                end
                
            end
            default: state <= INITIAL;
        endcase
    end
endmodule