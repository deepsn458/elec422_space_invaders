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
    input  wire             reset, play,                        // Global control and reset signals
    input  wire             player_left_input,                  // Player's left input
    input  wire             player_right_input,                 // Player's right input
    input  wire             player_shoot_input,                 // Player's firing input
    );

    // Instantiate Main Game FSM:
    main_game_fsm main_game_fsm(
        .clka, .clkb,                             // Input clocks
        .global_reset,                           // Global reset signal

        .player_left_input,
        .player_right_input,
        .player_shoot_input,
..... TODO:
    );

    // Instantiate Player FSM:
    player_fsm player






        .BPWrongE, .CSRWriteFenceM(CSRWriteFenceM_OR), .RetM, .TrapM,
        .StructuralStallD(StructuralStallD_OR),
        .LSUStallM, .IFUStallF,
        .FPUStallD, .ExternalStall,
        .DivBusyE, .FDivBusyE,
        .wfiM, .IntPendingM,
        // Stall & flush outputs
        .StallF, .StallD, .StallE, .StallM, .StallW,
        .FlushD, .FlushE, .FlushM, .FlushW);



endmodule
