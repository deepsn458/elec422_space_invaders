//-----------------------------------------------------
//// Design Name : Testbench for invader_bullet fsm
//// File Name   : invader_bullet_fsm_tb.v
////-----------------------------------------------------
`timescale 1ns/100ps

module invader_bullet_fsm_tb();

// Defines each test case and the respective cycle number
localparam RESET_1 = 1;
localparam IDLE_1  = 2;
localparam FIRE    = 3;
localparam IDLE_2  = 5;
localparam COLLIDE = 6;
// Second test: reset and fire again
localparam RESET_2 = 8;
localparam FIRE_2  = 10;

reg in_clka, in_clkb, in_reset;
reg in_invaderbullet_player_collision_signal;
reg in_invaderbullet_shield_collision_signal;
reg in_invader_fire;
reg [3:0] in_closest_invader_coord_x, in_closest_invader_coord_y;

// Outputs from the invader bullet fsm module
wire out_invader_bullet_display;
wire [3:0] out_invader_bullet_coord_x, out_invader_bullet_coord_y;
wire [1:0] out_state;

integer i;

// Create an invader bullet fsm instance
invader_bullet_fsm #(
    .BULLET_Y_OFFSET(1),
    .BOUNDARY_Y(0)
) DUT (
    .clka(in_clka),
    .clkb(in_clkb),
    .reset(in_reset),
    .invaderbullet_player_collision_signal(in_invaderbullet_player_collision_signal),
    .invaderbullet_shield_collision_signal(in_invaderbullet_shield_collision_signal),
    .invader_fire(in_invader_fire),
    .closest_invader_coord_x(in_closest_invader_coord_x),
    .closest_invader_coord_y(in_closest_invader_coord_y),
    .invader_bullet_display(out_invader_bullet_display),
    .invader_bullet_coord_x(out_invader_bullet_coord_x),
    .invader_bullet_coord_y(out_invader_bullet_coord_y),
    .state(out_state)
);

initial
begin
    // Initial values
    in_clka = 0; in_clkb = 0;
    in_reset = 0;
    in_invaderbullet_player_collision_signal = 0;
    in_invaderbullet_shield_collision_signal = 0;
    in_invader_fire = 0;
    in_closest_invader_coord_x = 4'd0;
    in_closest_invader_coord_y = 4'd0;

    for (i = 0; i < 20; i = i + 1) begin
        // --- Input Stimulus Logic ---
        if (i == RESET_1 || i == RESET_2) begin
            in_reset = 1;
        end else begin
            in_reset = 0;
            
            if (i == FIRE || i == FIRE_2) begin
                in_invader_fire = 1;
                in_closest_invader_coord_x = 4'd8;
                in_closest_invader_coord_y = 4'd12;
            end else if (i == COLLIDE) begin
                in_invaderbullet_player_collision_signal = 1;
                in_invader_fire = 0;
            end else if (i == IDLE_1 || i == IDLE_2) begin
                in_invader_fire = 0;
                in_invaderbullet_player_collision_signal = 0;
                in_invaderbullet_shield_collision_signal = 0;
            end
        end

        // --- Clocking Sequence ---
        // clka (State transition) followed by clkb (Output update)
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 1; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 0; #10;
        in_clka = 0; in_clkb = 1; #10;
    end

    $dumpfile ("invader_bullet_fsm_tb.vcd"); 
    $dumpvars(0, invader_bullet_fsm_tb); 
    
    $display("Testbench complete.");
    $stop;
end

// Monitor for easy debugging
initial begin
    $monitor("Time: %t | State: %b | Fire: %b | Display: %b | X: %d | Y: %d", 
             $time, out_state, in_invader_fire, out_invader_bullet_display, 
             out_invader_bullet_coord_x, out_invader_bullet_coord_y);
end

endmodule