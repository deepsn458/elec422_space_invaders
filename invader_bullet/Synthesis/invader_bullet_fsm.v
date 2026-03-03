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
    parameter BULLET_Y_OFFSET = 2,
    parameter BOUNDARY_Y = 0,
    parameter START_X = 5,
    parameter START_Y = 5
)(
    input wire clka,
    input wire clkb,
    input wire reset,
    input wire player_collision_signal,
    input wire shield_collision_signal,
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
    parameter INITIAL = 2'b00, FIRING = 2'b01, COLLISION = 2'b10;

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
            if (player_collision_signal | shield_collision_signal) begin
                temp_state = COLLISION;
            end else if (invader_bullet_coord_y == BOUNDARY_Y) begin
                temp_state = INITIAL;
            end else begin
                temp_state = FIRING;
            end
        end
        COLLISION: begin
            temp_state = COLLISION;
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
                if (invader_fire) begin
                    invader_bullet_display <= 1'b1;
                    invader_bullet_coord_x <= closest_invader_coord_x;
                    invader_bullet_coord_y <= closest_invader_coord_y;
                end else begin
                    invader_bullet_display <= 1'b0;
                    invader_bullet_coord_x <= START_X;
                    invader_bullet_coord_y <= START_Y;
                end
            end
            FIRING: begin
                state <= next_state;

                if (player_collision_signal | shield_collision_signal) begin
                    invader_bullet_display <= 1'b0;
                end else if (invader_bullet_coord_y[5] & 1) begin
                    invader_bullet_display <= 1'b0;
                end else begin
                    invader_bullet_coord_y <= invader_bullet_coord_y - BULLET_Y_OFFSET;
                end
            end
            COLLISION: begin
                state <= next_state;
            end
            default: state <= INITIAL;
        endcase
    end
endmodule