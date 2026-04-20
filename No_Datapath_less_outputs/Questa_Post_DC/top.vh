/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon Apr 20 00:43:28 2026
/////////////////////////////////////////////////////////////


module top ( clka, clkb, reset, player_left_input, player_right_input, 
        player_shoot_input, player_coord_x, player_coord_y, player_display, 
        invader_1_coord_x, invader_1_coord_y, invader_1_display, 
        invader_2_coord_x, invader_2_coord_y, invader_2_display, 
        shield_coord_x, shield_coord_y, shield_hp, shield_display, 
        player_bullet_coord_x, player_bullet_coord_y, player_bullet_display, 
        invader_bullet_coord_x, invader_bullet_coord_y, invader_bullet_display, 
        playerbullet_state, main_game_state );
  output [3:0] player_coord_x;
  output [3:0] player_coord_y;
  output [3:0] invader_1_coord_x;
  output [3:0] invader_1_coord_y;
  output [3:0] invader_2_coord_x;
  output [3:0] invader_2_coord_y;
  output [3:0] shield_coord_x;
  output [3:0] shield_coord_y;
  output [1:0] shield_hp;
  output [3:0] player_bullet_coord_x;
  output [3:0] player_bullet_coord_y;
  output [3:0] invader_bullet_coord_x;
  output [3:0] invader_bullet_coord_y;
  output [1:0] main_game_state;
  input clka, clkb, reset, player_left_input, player_right_input,
         player_shoot_input;
  output player_display, invader_1_display, invader_2_display, shield_display,
         player_bullet_display, invader_bullet_display, playerbullet_state;
  wire   playerbullet_invader_collision_signal_1,
         playerbullet_invader_collision_signal_2,
         playerbullet_invader_collision_signal,
         invaderbullet_player_collision_signal,
         invaderbullet_shield_collision_signal, invader_outofbounds_signal_1,
         invader_outofbounds_signal_2, player_left_motion, player_right_motion,
         play, internal_reset, invader_direction, playerbullet_fire, move_down,
         invader_fire, playerbullet_shield_collision_signal,
         \main_game_fsm/n174 , \main_game_fsm/n173 , \main_game_fsm/n172 ,
         \main_game_fsm/n171 , \main_game_fsm/n170 , \main_game_fsm/n169 ,
         \main_game_fsm/n168 , \main_game_fsm/n167 , \main_game_fsm/n166 ,
         \main_game_fsm/n165 , \main_game_fsm/n164 , \main_game_fsm/n163 ,
         \main_game_fsm/n162 , \main_game_fsm/n161 , \main_game_fsm/n160 ,
         \main_game_fsm/n159 , \main_game_fsm/n158 , \main_game_fsm/n157 ,
         \main_game_fsm/n156 , \main_game_fsm/n155 , \main_game_fsm/n154 ,
         \main_game_fsm/n153 , \main_game_fsm/n152 , \main_game_fsm/n151 ,
         \main_game_fsm/n150 , \main_game_fsm/n149 , \main_game_fsm/n148 ,
         \main_game_fsm/n147 , \main_game_fsm/n146 , \main_game_fsm/n145 ,
         \main_game_fsm/n144 , \main_game_fsm/n143 , \main_game_fsm/n142 ,
         \main_game_fsm/n141 , \main_game_fsm/n140 , \main_game_fsm/n139 ,
         \main_game_fsm/n138 , \main_game_fsm/n137 , \main_game_fsm/n136 ,
         \main_game_fsm/n135 , \main_game_fsm/n134 , \main_game_fsm/n133 ,
         \main_game_fsm/n132 , \main_game_fsm/n131 , \main_game_fsm/n130 ,
         \main_game_fsm/n129 , \main_game_fsm/n128 , \main_game_fsm/n127 ,
         \main_game_fsm/n126 , \main_game_fsm/n125 , \main_game_fsm/n124 ,
         \main_game_fsm/n123 , \main_game_fsm/n122 , \main_game_fsm/n121 ,
         \main_game_fsm/n120 , \main_game_fsm/n119 , \main_game_fsm/n118 ,
         \main_game_fsm/n117 , \main_game_fsm/n116 , \main_game_fsm/n115 ,
         \main_game_fsm/n114 , \main_game_fsm/n113 , \main_game_fsm/n112 ,
         \main_game_fsm/n111 , \main_game_fsm/n110 , \main_game_fsm/n109 ,
         \main_game_fsm/n108 , \main_game_fsm/n107 , \main_game_fsm/n106 ,
         \main_game_fsm/n105 , \main_game_fsm/n104 , \main_game_fsm/n103 ,
         \main_game_fsm/n102 , \main_game_fsm/n101 , \main_game_fsm/n100 ,
         \main_game_fsm/n99 , \main_game_fsm/n98 , \main_game_fsm/n97 ,
         \main_game_fsm/n96 , \main_game_fsm/n95 , \main_game_fsm/n94 ,
         \main_game_fsm/n93 , \main_game_fsm/n92 , \main_game_fsm/n91 ,
         \main_game_fsm/n90 , \main_game_fsm/n89 , \main_game_fsm/n88 ,
         \main_game_fsm/n87 , \main_game_fsm/n86 , \main_game_fsm/n85 ,
         \main_game_fsm/n84 , \main_game_fsm/n83 , \main_game_fsm/n82 ,
         \main_game_fsm/n81 , \main_game_fsm/n80 , \main_game_fsm/n79 ,
         \main_game_fsm/n78 , \main_game_fsm/n77 , \main_game_fsm/n76 ,
         \main_game_fsm/N106 , \main_game_fsm/N105 , \main_game_fsm/N82 ,
         \main_game_fsm/N81 , \main_game_fsm/N80 , \main_game_fsm/N79 ,
         \main_game_fsm/N78 , \main_game_fsm/next_playerbullet_fire ,
         \main_game_fsm/next_player_right_motion ,
         \main_game_fsm/next_player_left_motion , \main_game_fsm/N73 ,
         \main_game_fsm/N72 , \main_game_fsm/N71 , \main_game_fsm/N70 ,
         \main_game_fsm/prev_invader_outofbounds ,
         \main_game_fsm/temp_playerbullet_fire ,
         \main_game_fsm/temp_player_right_motion ,
         \main_game_fsm/temp_player_left_motion , \player_fsm/n132 ,
         \player_fsm/n131 , \player_fsm/n130 , \player_fsm/n129 ,
         \player_fsm/n121 , \player_fsm/n119 , \player_fsm/n117 ,
         \player_fsm/n116 , \player_fsm/n114 , \player_fsm/n113 ,
         \player_fsm/n112 , \player_fsm/n111 , \player_fsm/n110 ,
         \player_fsm/n109 , \player_fsm/n108 , \player_fsm/n107 ,
         \player_fsm/n106 , \player_fsm/n105 , \player_fsm/n104 ,
         \player_fsm/n103 , \player_fsm/n102 , \player_fsm/n101 ,
         \player_fsm/n100 , \player_fsm/n99 , \player_fsm/n98 ,
         \player_fsm/n97 , \player_fsm/n96 , \player_fsm/n95 ,
         \player_fsm/n94 , \player_fsm/n93 , \player_fsm/n92 ,
         \player_fsm/n91 , \player_fsm/n90 , \player_fsm/n89 ,
         \player_fsm/n88 , \player_fsm/n87 , \player_fsm/n86 ,
         \player_fsm/n85 , \player_fsm/n84 , \player_fsm/n83 ,
         \player_fsm/n82 , \player_fsm/n81 , \player_fsm/n80 ,
         \player_fsm/n79 , \player_fsm/n78 , \player_fsm/n77 ,
         \player_fsm/n76 , \player_fsm/n75 , \player_fsm/n74 ,
         \player_fsm/n73 , \player_fsm/n72 , \player_fsm/n71 ,
         \player_fsm/n70 , \player_fsm/n69 , \player_fsm/n68 ,
         \player_fsm/n67 , \player_fsm/n66 , \player_fsm/n65 ,
         \player_fsm/N102 , \player_fsm/N97 , \player_fsm/N91 ,
         \player_fsm/N90 , \player_fsm/N52 , \player_fsm/N51 ,
         \player_fsm/N31 , \player_fsm/N24 , \player_fsm/N23 ,
         \player_fsm/N22 , \player_fsm/N21 , \player_fsm/N20 ,
         \player_fsm/N17 , \player_fsm/N16 , \player_fsm/N15 ,
         \player_fsm/N14 , \player_fsm/N13 , \player_fsm/state[0] ,
         \player_fsm/state[1] , \shield_fsm/n91 , \shield_fsm/n90 ,
         \shield_fsm/n89 , \shield_fsm/n88 , \shield_fsm/n87 ,
         \shield_fsm/n86 , \shield_fsm/n85 , \shield_fsm/n84 ,
         \shield_fsm/n83 , \shield_fsm/n81 , \shield_fsm/n79 ,
         \shield_fsm/n78 , \shield_fsm/n77 , \shield_fsm/n76 ,
         \shield_fsm/n75 , \shield_fsm/n74 , \shield_fsm/n73 ,
         \shield_fsm/n72 , \shield_fsm/n71 , \shield_fsm/n70 ,
         \shield_fsm/n69 , \shield_fsm/n68 , \shield_fsm/n67 ,
         \shield_fsm/n66 , \shield_fsm/n65 , \shield_fsm/n64 ,
         \shield_fsm/n63 , \shield_fsm/n62 , \shield_fsm/n61 ,
         \shield_fsm/n60 , \shield_fsm/n59 , \shield_fsm/n58 ,
         \shield_fsm/n56 , \shield_fsm/n55 , \shield_fsm/n53 ,
         \shield_fsm/n52 , \shield_fsm/n51 , \shield_fsm/n50 ,
         \shield_fsm/n49 , \shield_fsm/n48 , \shield_fsm/N104 ,
         \shield_fsm/N90 , \shield_fsm/N89 , \shield_fsm/N48 ,
         \shield_fsm/N47 , \shield_fsm/N34 , \shield_fsm/N33 ,
         \shield_fsm/N32 , \shield_fsm/N31 , \shield_fsm/N30 ,
         \shield_fsm/N28 , \shield_fsm/N22 , \shield_fsm/N21 ,
         \shield_fsm/N20 , \shield_fsm/N19 , \shield_fsm/N18 ,
         \shield_fsm/N16 , \shield_fsm/N14 , \shield_fsm/N13 ,
         \shield_fsm/state[0] , \shield_fsm/state[1] , \invader_fsm_1/n106 ,
         \invader_fsm_1/n105 , \invader_fsm_1/n104 , \invader_fsm_1/n103 ,
         \invader_fsm_1/n102 , \invader_fsm_1/n101 , \invader_fsm_1/n100 ,
         \invader_fsm_1/n99 , \invader_fsm_1/n98 , \invader_fsm_1/n97 ,
         \invader_fsm_1/n96 , \invader_fsm_1/n95 , \invader_fsm_1/n94 ,
         \invader_fsm_1/n93 , \invader_fsm_1/n92 , \invader_fsm_1/n91 ,
         \invader_fsm_1/n90 , \invader_fsm_1/n89 , \invader_fsm_1/n88 ,
         \invader_fsm_1/n87 , \invader_fsm_1/n86 , \invader_fsm_1/n85 ,
         \invader_fsm_1/n84 , \invader_fsm_1/n83 , \invader_fsm_1/n82 ,
         \invader_fsm_1/n81 , \invader_fsm_1/n80 , \invader_fsm_1/n79 ,
         \invader_fsm_1/n78 , \invader_fsm_1/n77 , \invader_fsm_1/n76 ,
         \invader_fsm_1/n75 , \invader_fsm_1/n74 , \invader_fsm_1/n73 ,
         \invader_fsm_1/n72 , \invader_fsm_1/n71 , \invader_fsm_1/n70 ,
         \invader_fsm_1/n69 , \invader_fsm_1/n68 , \invader_fsm_1/n67 ,
         \invader_fsm_1/n66 , \invader_fsm_1/n65 , \invader_fsm_1/n64 ,
         \invader_fsm_1/n63 , \invader_fsm_1/n62 , \invader_fsm_1/n61 ,
         \invader_fsm_1/n60 , \invader_fsm_1/n59 , \invader_fsm_1/n58 ,
         \invader_fsm_1/n57 , \invader_fsm_1/n56 , \invader_fsm_1/N77 ,
         \invader_fsm_1/N75 , \invader_fsm_1/N74 , \invader_fsm_1/N72 ,
         \invader_fsm_1/move_interval_toggle , \invader_fsm_1/N48 ,
         \invader_fsm_1/N47 , \invader_fsm_1/N35 , \invader_fsm_1/N34 ,
         \invader_fsm_1/N32 , \invader_fsm_1/N29 , \invader_fsm_1/N28 ,
         \invader_fsm_1/N27 , \invader_fsm_1/N26 , \invader_fsm_1/N25 ,
         \invader_fsm_1/N23 , \invader_fsm_1/N22 , \invader_fsm_1/N20 ,
         \invader_fsm_1/N17 , \invader_fsm_1/N16 , \invader_fsm_1/N15 ,
         \invader_fsm_1/N14 , \invader_fsm_1/N13 , \invader_fsm_1/state[0] ,
         \invader_fsm_1/state[1] , \invader_fsm_2/n108 , \invader_fsm_2/n107 ,
         \invader_fsm_2/n106 , \invader_fsm_2/n105 , \invader_fsm_2/n104 ,
         \invader_fsm_2/n103 , \invader_fsm_2/n102 , \invader_fsm_2/n101 ,
         \invader_fsm_2/n100 , \invader_fsm_2/n99 , \invader_fsm_2/n98 ,
         \invader_fsm_2/n97 , \invader_fsm_2/n96 , \invader_fsm_2/n95 ,
         \invader_fsm_2/n94 , \invader_fsm_2/n93 , \invader_fsm_2/n92 ,
         \invader_fsm_2/n91 , \invader_fsm_2/n90 , \invader_fsm_2/n89 ,
         \invader_fsm_2/n88 , \invader_fsm_2/n87 , \invader_fsm_2/n86 ,
         \invader_fsm_2/n85 , \invader_fsm_2/n84 , \invader_fsm_2/n83 ,
         \invader_fsm_2/n82 , \invader_fsm_2/n81 , \invader_fsm_2/n80 ,
         \invader_fsm_2/n79 , \invader_fsm_2/n78 , \invader_fsm_2/n77 ,
         \invader_fsm_2/n76 , \invader_fsm_2/n75 , \invader_fsm_2/n74 ,
         \invader_fsm_2/n73 , \invader_fsm_2/n72 , \invader_fsm_2/n71 ,
         \invader_fsm_2/n70 , \invader_fsm_2/n69 , \invader_fsm_2/n68 ,
         \invader_fsm_2/n67 , \invader_fsm_2/n66 , \invader_fsm_2/n65 ,
         \invader_fsm_2/n64 , \invader_fsm_2/n63 , \invader_fsm_2/n62 ,
         \invader_fsm_2/n61 , \invader_fsm_2/n60 , \invader_fsm_2/n59 ,
         \invader_fsm_2/n58 , \invader_fsm_2/n57 , \invader_fsm_2/n56 ,
         \invader_fsm_2/N77 , \invader_fsm_2/N75 , \invader_fsm_2/N74 ,
         \invader_fsm_2/N72 , \invader_fsm_2/move_interval_toggle ,
         \invader_fsm_2/N48 , \invader_fsm_2/N47 , \invader_fsm_2/N35 ,
         \invader_fsm_2/N34 , \invader_fsm_2/N32 , \invader_fsm_2/N29 ,
         \invader_fsm_2/N28 , \invader_fsm_2/N27 , \invader_fsm_2/N26 ,
         \invader_fsm_2/N25 , \invader_fsm_2/N23 , \invader_fsm_2/N22 ,
         \invader_fsm_2/N20 , \invader_fsm_2/N17 , \invader_fsm_2/N16 ,
         \invader_fsm_2/N15 , \invader_fsm_2/N14 , \invader_fsm_2/N13 ,
         \invader_fsm_2/state[0] , \invader_fsm_2/state[1] ,
         \player_bullet_fsm/n56 , \player_bullet_fsm/n55 ,
         \player_bullet_fsm/n53 , \player_bullet_fsm/n51 ,
         \player_bullet_fsm/n50 , \player_bullet_fsm/n49 ,
         \player_bullet_fsm/n48 , \player_bullet_fsm/n46 ,
         \player_bullet_fsm/n45 , \player_bullet_fsm/n43 ,
         \player_bullet_fsm/n42 , \player_bullet_fsm/n41 ,
         \player_bullet_fsm/n40 , \player_bullet_fsm/n38 ,
         \player_bullet_fsm/n37 , \player_bullet_fsm/n36 ,
         \player_bullet_fsm/n35 , \player_bullet_fsm/n33 ,
         \player_bullet_fsm/n32 , \player_bullet_fsm/n31 ,
         \player_bullet_fsm/n30 , \player_bullet_fsm/n25 ,
         \player_bullet_fsm/n24 , \player_bullet_fsm/n21 ,
         \player_bullet_fsm/n20 , \player_bullet_fsm/N13 ,
         \player_bullet_fsm/next_state[0] , \invader_bullet_fsm/n51 ,
         \invader_bullet_fsm/n50 , \invader_bullet_fsm/n49 ,
         \invader_bullet_fsm/n48 , \invader_bullet_fsm/n47 ,
         \invader_bullet_fsm/n46 , \invader_bullet_fsm/n45 ,
         \invader_bullet_fsm/n44 , \invader_bullet_fsm/n43 ,
         \invader_bullet_fsm/n42 , \invader_bullet_fsm/n41 ,
         \invader_bullet_fsm/n39 , \invader_bullet_fsm/n37 ,
         \invader_bullet_fsm/n33 , \invader_bullet_fsm/n32 ,
         \invader_bullet_fsm/n31 , \invader_bullet_fsm/n30 ,
         \invader_bullet_fsm/n29 , \invader_bullet_fsm/n28 ,
         \invader_bullet_fsm/n27 , \invader_bullet_fsm/n26 ,
         \invader_bullet_fsm/n25 , \invader_bullet_fsm/n24 ,
         \invader_bullet_fsm/n23 , \invader_bullet_fsm/n22 ,
         \invader_bullet_fsm/n21 , \invader_bullet_fsm/n20 ,
         \invader_bullet_fsm/n19 , \invader_bullet_fsm/n18 ,
         \invader_bullet_fsm/n17 , \invader_bullet_fsm/n16 ,
         \invader_bullet_fsm/N36 , \invader_bullet_fsm/N19 ,
         \invader_bullet_fsm/next_state[0] , \invader_bullet_fsm/state[0] , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314;
  wire   [3:0] closest_invader_coord_x;
  wire   [1:0] \main_game_fsm/next_state ;
  wire   [1:0] \player_fsm/next_state ;
  wire   [1:0] \shield_fsm/next_state ;
  wire   [1:0] \invader_fsm_1/next_state ;
  wire   [1:0] \invader_fsm_2/next_state ;
  wire   [4:2] \invader_fsm_2/r410/carry ;
  wire   [4:2] \invader_fsm_2/add_50/carry ;
  wire   [4:2] \invader_fsm_1/r410/carry ;
  wire   [4:2] \invader_fsm_1/add_50/carry ;
  wire   [4:2] \shield_fsm/add_45_2/carry ;
  wire   [4:2] \shield_fsm/add_49_2/carry ;
  wire   [4:2] \player_fsm/r399/carry ;
  wire   [4:2] \player_fsm/add_39_2/carry ;
  assign player_coord_y[0] = 1'b0;
  assign player_coord_y[1] = 1'b0;
  assign player_coord_y[2] = 1'b0;
  assign player_coord_y[3] = 1'b0;
  assign shield_coord_y[1] = 1'b0;
  assign shield_coord_y[3] = 1'b0;
  assign shield_coord_x[0] = 1'b1;
  assign shield_coord_x[3] = 1'b0;
  assign invader_1_coord_x[0] = \invader_fsm_1/N72 ;
  assign invader_2_coord_x[0] = \invader_fsm_2/N72 ;

  OR2X1 U1 ( .A(playerbullet_invader_collision_signal_1), .B(
        playerbullet_invader_collision_signal_2), .Y(
        playerbullet_invader_collision_signal) );
  NAND2X1 \main_game_fsm/U165  ( .A(\main_game_fsm/next_state [1]), .B(n71), 
        .Y(\main_game_fsm/n85 ) );
  OAI21X1 \main_game_fsm/U164  ( .A(\main_game_fsm/next_state [1]), .B(n71), 
        .C(\main_game_fsm/n85 ), .Y(\main_game_fsm/n90 ) );
  NAND2X1 \main_game_fsm/U163  ( .A(\main_game_fsm/n90 ), .B(n31), .Y(
        \main_game_fsm/n82 ) );
  NOR2X1 \main_game_fsm/U162  ( .A(n71), .B(\main_game_fsm/n82 ), .Y(
        \main_game_fsm/N105 ) );
  NOR2X1 \main_game_fsm/U161  ( .A(n68), .B(\main_game_fsm/n82 ), .Y(
        \main_game_fsm/N106 ) );
  NAND2X1 \main_game_fsm/U160  ( .A(main_game_state[0]), .B(n46), .Y(
        \main_game_fsm/n102 ) );
  NAND2X1 \main_game_fsm/U159  ( .A(main_game_state[0]), .B(
        \main_game_fsm/n102 ), .Y(\main_game_fsm/N70 ) );
  NOR2X1 \main_game_fsm/U158  ( .A(invader_outofbounds_signal_1), .B(
        invader_outofbounds_signal_2), .Y(\main_game_fsm/n105 ) );
  OR2X1 \main_game_fsm/U157  ( .A(invader_1_display), .B(invader_2_display), 
        .Y(\main_game_fsm/n107 ) );
  NAND2X1 \main_game_fsm/U156  ( .A(player_coord_x[0]), .B(n147), .Y(
        \main_game_fsm/n125 ) );
  OAI21X1 \main_game_fsm/U155  ( .A(invader_1_coord_x[1]), .B(
        \main_game_fsm/n125 ), .C(n13), .Y(\main_game_fsm/n170 ) );
  OAI21X1 \main_game_fsm/U154  ( .A(n97), .B(n8), .C(\main_game_fsm/n170 ), 
        .Y(\main_game_fsm/n148 ) );
  NAND2X1 \main_game_fsm/U153  ( .A(player_coord_x[2]), .B(n138), .Y(
        \main_game_fsm/n164 ) );
  AOI22X1 \main_game_fsm/U152  ( .A(\main_game_fsm/n148 ), .B(
        \main_game_fsm/n164 ), .C(invader_1_coord_x[2]), .D(n11), .Y(
        \main_game_fsm/n169 ) );
  XOR2X1 \main_game_fsm/U151  ( .A(invader_1_coord_x[3]), .B(player_coord_x[3]), .Y(\main_game_fsm/n163 ) );
  NOR2X1 \main_game_fsm/U150  ( .A(\main_game_fsm/n169 ), .B(n93), .Y(
        \main_game_fsm/n161 ) );
  OAI21X1 \main_game_fsm/U149  ( .A(player_coord_x[2]), .B(n138), .C(
        \main_game_fsm/n164 ), .Y(\main_game_fsm/n146 ) );
  OAI21X1 \main_game_fsm/U148  ( .A(\main_game_fsm/n146 ), .B(
        \main_game_fsm/n148 ), .C(\main_game_fsm/n164 ), .Y(
        \main_game_fsm/n168 ) );
  NAND2X1 \main_game_fsm/U147  ( .A(n93), .B(\main_game_fsm/n168 ), .Y(
        \main_game_fsm/n167 ) );
  OAI21X1 \main_game_fsm/U146  ( .A(invader_1_coord_x[3]), .B(n12), .C(
        \main_game_fsm/n167 ), .Y(\main_game_fsm/n135 ) );
  NAND2X1 \main_game_fsm/U145  ( .A(\invader_fsm_1/N72 ), .B(n10), .Y(
        \main_game_fsm/n126 ) );
  OAI21X1 \main_game_fsm/U144  ( .A(n8), .B(\main_game_fsm/n126 ), .C(
        player_coord_x[1]), .Y(\main_game_fsm/n166 ) );
  OAI21X1 \main_game_fsm/U143  ( .A(invader_1_coord_x[1]), .B(n95), .C(
        \main_game_fsm/n166 ), .Y(\main_game_fsm/n147 ) );
  OAI21X1 \main_game_fsm/U142  ( .A(player_coord_x[2]), .B(n138), .C(
        \main_game_fsm/n147 ), .Y(\main_game_fsm/n165 ) );
  AOI21X1 \main_game_fsm/U141  ( .A(\main_game_fsm/n164 ), .B(
        \main_game_fsm/n165 ), .C(n87), .Y(\main_game_fsm/n162 ) );
  AOI22X1 \main_game_fsm/U140  ( .A(\main_game_fsm/n161 ), .B(n87), .C(
        \main_game_fsm/n162 ), .D(\main_game_fsm/n163 ), .Y(
        \main_game_fsm/n160 ) );
  NAND2X1 \main_game_fsm/U139  ( .A(\main_game_fsm/n160 ), .B(
        invader_1_display), .Y(\main_game_fsm/n111 ) );
  NAND2X1 \main_game_fsm/U138  ( .A(player_coord_x[0]), .B(n177), .Y(
        \main_game_fsm/n123 ) );
  OAI21X1 \main_game_fsm/U137  ( .A(invader_2_coord_x[1]), .B(
        \main_game_fsm/n123 ), .C(n13), .Y(\main_game_fsm/n159 ) );
  OAI21X1 \main_game_fsm/U136  ( .A(n98), .B(n6), .C(\main_game_fsm/n159 ), 
        .Y(\main_game_fsm/n142 ) );
  NAND2X1 \main_game_fsm/U135  ( .A(player_coord_x[2]), .B(n158), .Y(
        \main_game_fsm/n153 ) );
  AOI22X1 \main_game_fsm/U134  ( .A(\main_game_fsm/n142 ), .B(
        \main_game_fsm/n153 ), .C(invader_2_coord_x[2]), .D(n11), .Y(
        \main_game_fsm/n158 ) );
  XOR2X1 \main_game_fsm/U133  ( .A(invader_2_coord_x[3]), .B(player_coord_x[3]), .Y(\main_game_fsm/n152 ) );
  NOR2X1 \main_game_fsm/U132  ( .A(\main_game_fsm/n158 ), .B(n94), .Y(
        \main_game_fsm/n150 ) );
  OAI21X1 \main_game_fsm/U131  ( .A(player_coord_x[2]), .B(n158), .C(
        \main_game_fsm/n153 ), .Y(\main_game_fsm/n140 ) );
  OAI21X1 \main_game_fsm/U130  ( .A(\main_game_fsm/n140 ), .B(
        \main_game_fsm/n142 ), .C(\main_game_fsm/n153 ), .Y(
        \main_game_fsm/n157 ) );
  NAND2X1 \main_game_fsm/U129  ( .A(n94), .B(\main_game_fsm/n157 ), .Y(
        \main_game_fsm/n156 ) );
  OAI21X1 \main_game_fsm/U128  ( .A(invader_2_coord_x[3]), .B(n12), .C(
        \main_game_fsm/n156 ), .Y(\main_game_fsm/n130 ) );
  NAND2X1 \main_game_fsm/U127  ( .A(\invader_fsm_2/N72 ), .B(n10), .Y(
        \main_game_fsm/n124 ) );
  OAI21X1 \main_game_fsm/U126  ( .A(n6), .B(\main_game_fsm/n124 ), .C(
        player_coord_x[1]), .Y(\main_game_fsm/n155 ) );
  OAI21X1 \main_game_fsm/U125  ( .A(invader_2_coord_x[1]), .B(n96), .C(
        \main_game_fsm/n155 ), .Y(\main_game_fsm/n141 ) );
  OAI21X1 \main_game_fsm/U124  ( .A(player_coord_x[2]), .B(n158), .C(
        \main_game_fsm/n141 ), .Y(\main_game_fsm/n154 ) );
  AOI21X1 \main_game_fsm/U123  ( .A(\main_game_fsm/n153 ), .B(
        \main_game_fsm/n154 ), .C(n91), .Y(\main_game_fsm/n151 ) );
  AOI22X1 \main_game_fsm/U122  ( .A(\main_game_fsm/n150 ), .B(n91), .C(
        \main_game_fsm/n151 ), .D(\main_game_fsm/n152 ), .Y(
        \main_game_fsm/n149 ) );
  NAND2X1 \main_game_fsm/U121  ( .A(\main_game_fsm/n149 ), .B(
        invader_2_display), .Y(\main_game_fsm/n109 ) );
  XNOR2X1 \main_game_fsm/U120  ( .A(\main_game_fsm/n148 ), .B(
        \main_game_fsm/n146 ), .Y(\main_game_fsm/n144 ) );
  XNOR2X1 \main_game_fsm/U119  ( .A(\main_game_fsm/n146 ), .B(
        \main_game_fsm/n147 ), .Y(\main_game_fsm/n145 ) );
  AOI22X1 \main_game_fsm/U118  ( .A(\main_game_fsm/n144 ), .B(n87), .C(
        \main_game_fsm/n145 ), .D(\main_game_fsm/n135 ), .Y(
        \main_game_fsm/n143 ) );
  NAND2X1 \main_game_fsm/U117  ( .A(\main_game_fsm/n143 ), .B(
        invader_1_display), .Y(\main_game_fsm/n115 ) );
  XNOR2X1 \main_game_fsm/U116  ( .A(\main_game_fsm/n142 ), .B(
        \main_game_fsm/n140 ), .Y(\main_game_fsm/n138 ) );
  XNOR2X1 \main_game_fsm/U115  ( .A(\main_game_fsm/n140 ), .B(
        \main_game_fsm/n141 ), .Y(\main_game_fsm/n139 ) );
  AOI22X1 \main_game_fsm/U114  ( .A(\main_game_fsm/n138 ), .B(n91), .C(
        \main_game_fsm/n139 ), .D(\main_game_fsm/n130 ), .Y(
        \main_game_fsm/n137 ) );
  NAND2X1 \main_game_fsm/U113  ( .A(\main_game_fsm/n137 ), .B(
        invader_2_display), .Y(\main_game_fsm/n113 ) );
  XOR2X1 \main_game_fsm/U112  ( .A(invader_1_coord_x[1]), .B(player_coord_x[1]), .Y(\main_game_fsm/n136 ) );
  XOR2X1 \main_game_fsm/U111  ( .A(n97), .B(\main_game_fsm/n136 ), .Y(
        \main_game_fsm/n133 ) );
  XOR2X1 \main_game_fsm/U110  ( .A(n95), .B(\main_game_fsm/n136 ), .Y(
        \main_game_fsm/n134 ) );
  AOI22X1 \main_game_fsm/U109  ( .A(n87), .B(\main_game_fsm/n133 ), .C(
        \main_game_fsm/n134 ), .D(\main_game_fsm/n135 ), .Y(
        \main_game_fsm/n132 ) );
  NAND2X1 \main_game_fsm/U108  ( .A(\main_game_fsm/n132 ), .B(
        invader_1_display), .Y(\main_game_fsm/n119 ) );
  XOR2X1 \main_game_fsm/U107  ( .A(invader_2_coord_x[1]), .B(player_coord_x[1]), .Y(\main_game_fsm/n131 ) );
  XOR2X1 \main_game_fsm/U106  ( .A(n98), .B(\main_game_fsm/n131 ), .Y(
        \main_game_fsm/n128 ) );
  XOR2X1 \main_game_fsm/U105  ( .A(n96), .B(\main_game_fsm/n131 ), .Y(
        \main_game_fsm/n129 ) );
  AOI22X1 \main_game_fsm/U104  ( .A(n91), .B(\main_game_fsm/n128 ), .C(
        \main_game_fsm/n129 ), .D(\main_game_fsm/n130 ), .Y(
        \main_game_fsm/n127 ) );
  NAND2X1 \main_game_fsm/U103  ( .A(\main_game_fsm/n127 ), .B(
        invader_2_display), .Y(\main_game_fsm/n117 ) );
  NAND2X1 \main_game_fsm/U102  ( .A(\main_game_fsm/n125 ), .B(
        \main_game_fsm/n126 ), .Y(\main_game_fsm/n120 ) );
  NAND2X1 \main_game_fsm/U101  ( .A(\main_game_fsm/n123 ), .B(
        \main_game_fsm/n124 ), .Y(\main_game_fsm/n122 ) );
  OAI21X1 \main_game_fsm/U100  ( .A(n169), .B(\main_game_fsm/n122 ), .C(
        invader_1_display), .Y(\main_game_fsm/n121 ) );
  OAI22X1 \main_game_fsm/U99  ( .A(n90), .B(\main_game_fsm/n119 ), .C(
        \main_game_fsm/n120 ), .D(\main_game_fsm/n121 ), .Y(
        \main_game_fsm/n118 ) );
  OAI21X1 \main_game_fsm/U98  ( .A(n86), .B(\main_game_fsm/n117 ), .C(
        \main_game_fsm/n118 ), .Y(\main_game_fsm/n116 ) );
  OAI21X1 \main_game_fsm/U97  ( .A(n89), .B(\main_game_fsm/n115 ), .C(
        \main_game_fsm/n116 ), .Y(\main_game_fsm/n114 ) );
  OAI21X1 \main_game_fsm/U96  ( .A(n85), .B(\main_game_fsm/n113 ), .C(
        \main_game_fsm/n114 ), .Y(\main_game_fsm/n112 ) );
  OAI21X1 \main_game_fsm/U95  ( .A(n88), .B(\main_game_fsm/n111 ), .C(
        \main_game_fsm/n112 ), .Y(\main_game_fsm/n110 ) );
  OAI21X1 \main_game_fsm/U94  ( .A(n84), .B(\main_game_fsm/n109 ), .C(
        \main_game_fsm/n110 ), .Y(\main_game_fsm/n95 ) );
  AOI22X1 \main_game_fsm/U93  ( .A(invader_1_coord_y[1]), .B(n14), .C(
        invader_2_coord_y[1]), .D(\main_game_fsm/n95 ), .Y(\main_game_fsm/n93 ) );
  AOI22X1 \main_game_fsm/U92  ( .A(invader_1_coord_y[2]), .B(n14), .C(
        invader_2_coord_y[2]), .D(\main_game_fsm/n95 ), .Y(\main_game_fsm/n92 ) );
  AOI22X1 \main_game_fsm/U91  ( .A(invader_1_coord_y[3]), .B(n14), .C(
        invader_2_coord_y[3]), .D(\main_game_fsm/n95 ), .Y(\main_game_fsm/n91 ) );
  OAI21X1 \main_game_fsm/U90  ( .A(\main_game_fsm/n93 ), .B(
        \main_game_fsm/n92 ), .C(\main_game_fsm/n91 ), .Y(\main_game_fsm/n108 ) );
  NAND3X1 \main_game_fsm/U89  ( .A(\main_game_fsm/n107 ), .B(
        \main_game_fsm/n108 ), .C(player_display), .Y(\main_game_fsm/n106 ) );
  NAND3X1 \main_game_fsm/U88  ( .A(n119), .B(n70), .C(n73), .Y(
        \main_game_fsm/n97 ) );
  OAI21X1 \main_game_fsm/U87  ( .A(\main_game_fsm/n105 ), .B(
        \main_game_fsm/prev_invader_outofbounds ), .C(n45), .Y(
        \main_game_fsm/n104 ) );
  OAI21X1 \main_game_fsm/U86  ( .A(main_game_state[0]), .B(n46), .C(
        \main_game_fsm/n104 ), .Y(\main_game_fsm/n103 ) );
  NAND2X1 \main_game_fsm/U85  ( .A(n73), .B(\main_game_fsm/n103 ), .Y(
        \main_game_fsm/n99 ) );
  OAI21X1 \main_game_fsm/U84  ( .A(\main_game_fsm/n102 ), .B(
        \main_game_fsm/n97 ), .C(\main_game_fsm/n99 ), .Y(\main_game_fsm/n101 ) );
  NAND3X1 \main_game_fsm/U83  ( .A(n72), .B(n46), .C(player_shoot_input), .Y(
        \main_game_fsm/n100 ) );
  AOI21X1 \main_game_fsm/U82  ( .A(\main_game_fsm/n99 ), .B(
        \main_game_fsm/n100 ), .C(reset), .Y(\main_game_fsm/N78 ) );
  NAND2X1 \main_game_fsm/U81  ( .A(n45), .B(n31), .Y(\main_game_fsm/n98 ) );
  NOR2X1 \main_game_fsm/U80  ( .A(\main_game_fsm/n97 ), .B(\main_game_fsm/n98 ), .Y(\main_game_fsm/N79 ) );
  OAI22X1 \main_game_fsm/U79  ( .A(n14), .B(n177), .C(n147), .D(
        \main_game_fsm/n95 ), .Y(closest_invader_coord_x[0]) );
  OAI22X1 \main_game_fsm/U78  ( .A(n14), .B(n6), .C(n8), .D(
        \main_game_fsm/n95 ), .Y(closest_invader_coord_x[1]) );
  OAI22X1 \main_game_fsm/U77  ( .A(n14), .B(n158), .C(n138), .D(
        \main_game_fsm/n95 ), .Y(closest_invader_coord_x[2]) );
  AOI22X1 \main_game_fsm/U76  ( .A(\main_game_fsm/n95 ), .B(
        invader_2_coord_x[3]), .C(invader_1_coord_x[3]), .D(n14), .Y(
        \main_game_fsm/n96 ) );
  AOI22X1 \main_game_fsm/U75  ( .A(invader_1_coord_y[0]), .B(n14), .C(
        invader_2_coord_y[0]), .D(\main_game_fsm/n95 ), .Y(\main_game_fsm/n94 ) );
  OAI21X1 \main_game_fsm/U74  ( .A(\main_game_fsm/next_state [1]), .B(
        \main_game_fsm/next_state [0]), .C(n31), .Y(\main_game_fsm/n84 ) );
  NOR2X1 \main_game_fsm/U73  ( .A(\main_game_fsm/n90 ), .B(\main_game_fsm/n84 ), .Y(\main_game_fsm/n78 ) );
  AOI21X1 \main_game_fsm/U72  ( .A(n69), .B(n31), .C(\main_game_fsm/n78 ), .Y(
        \main_game_fsm/n89 ) );
  NAND3X1 \main_game_fsm/U71  ( .A(n31), .B(n68), .C(
        \main_game_fsm/next_state [0]), .Y(\main_game_fsm/n76 ) );
  OAI21X1 \main_game_fsm/U70  ( .A(\main_game_fsm/n89 ), .B(n43), .C(
        \main_game_fsm/n76 ), .Y(\main_game_fsm/n174 ) );
  OAI21X1 \main_game_fsm/U69  ( .A(n30), .B(\main_game_fsm/n78 ), .C(
        invader_direction), .Y(\main_game_fsm/n88 ) );
  OAI21X1 \main_game_fsm/U68  ( .A(invader_direction), .B(\main_game_fsm/n85 ), 
        .C(\main_game_fsm/n88 ), .Y(\main_game_fsm/n87 ) );
  OR2X1 \main_game_fsm/U67  ( .A(\main_game_fsm/n84 ), .B(\main_game_fsm/n87 ), 
        .Y(\main_game_fsm/n173 ) );
  NAND2X1 \main_game_fsm/U66  ( .A(move_down), .B(\main_game_fsm/n78 ), .Y(
        \main_game_fsm/n86 ) );
  OAI21X1 \main_game_fsm/U65  ( .A(reset), .B(\main_game_fsm/n85 ), .C(
        \main_game_fsm/n86 ), .Y(\main_game_fsm/n172 ) );
  AOI21X1 \main_game_fsm/U64  ( .A(\main_game_fsm/n78 ), .B(internal_reset), 
        .C(\main_game_fsm/n84 ), .Y(\main_game_fsm/n83 ) );
  AOI22X1 \main_game_fsm/U63  ( .A(\main_game_fsm/n78 ), .B(
        \main_game_fsm/prev_invader_outofbounds ), .C(n119), .D(n28), .Y(
        \main_game_fsm/n81 ) );
  AOI22X1 \main_game_fsm/U62  ( .A(\main_game_fsm/next_player_left_motion ), 
        .B(n28), .C(player_left_motion), .D(\main_game_fsm/n78 ), .Y(
        \main_game_fsm/n80 ) );
  AOI22X1 \main_game_fsm/U61  ( .A(\main_game_fsm/next_playerbullet_fire ), 
        .B(n28), .C(playerbullet_fire), .D(\main_game_fsm/n78 ), .Y(
        \main_game_fsm/n79 ) );
  AOI22X1 \main_game_fsm/U60  ( .A(\main_game_fsm/next_player_right_motion ), 
        .B(n28), .C(player_right_motion), .D(\main_game_fsm/n78 ), .Y(
        \main_game_fsm/n77 ) );
  OAI21X1 \main_game_fsm/U59  ( .A(reset), .B(n44), .C(\main_game_fsm/n76 ), 
        .Y(\main_game_fsm/n171 ) );
  AND2X2 \main_game_fsm/U8  ( .A(player_left_input), .B(\main_game_fsm/n101 ), 
        .Y(\main_game_fsm/N71 ) );
  AND2X2 \main_game_fsm/U7  ( .A(player_right_input), .B(\main_game_fsm/n101 ), 
        .Y(\main_game_fsm/N72 ) );
  AND2X2 \main_game_fsm/U6  ( .A(\main_game_fsm/n101 ), .B(player_shoot_input), 
        .Y(\main_game_fsm/N73 ) );
  AND2X2 \main_game_fsm/U5  ( .A(\main_game_fsm/temp_player_left_motion ), .B(
        n31), .Y(\main_game_fsm/N80 ) );
  AND2X2 \main_game_fsm/U4  ( .A(\main_game_fsm/temp_player_right_motion ), 
        .B(n31), .Y(\main_game_fsm/N81 ) );
  AND2X2 \main_game_fsm/U3  ( .A(\main_game_fsm/temp_playerbullet_fire ), .B(
        n31), .Y(\main_game_fsm/N82 ) );
  DFFNEGX1 \main_game_fsm/player_right_motion_reg  ( .D(n27), .CLK(n23), .Q(
        player_right_motion) );
  DFFNEGX1 \main_game_fsm/playerbullet_fire_reg  ( .D(n26), .CLK(n23), .Q(
        playerbullet_fire) );
  DFFNEGX1 \main_game_fsm/player_left_motion_reg  ( .D(n25), .CLK(n23), .Q(
        player_left_motion) );
  DFFNEGX1 \main_game_fsm/next_player_left_motion_reg  ( .D(
        \main_game_fsm/N80 ), .CLK(clka), .Q(
        \main_game_fsm/next_player_left_motion ) );
  LATCH \main_game_fsm/temp_player_left_motion_reg  ( .CLK(\main_game_fsm/N70 ), .D(\main_game_fsm/N71 ), .Q(\main_game_fsm/temp_player_left_motion ) );
  DFFNEGX1 \main_game_fsm/next_player_right_motion_reg  ( .D(
        \main_game_fsm/N81 ), .CLK(clka), .Q(
        \main_game_fsm/next_player_right_motion ) );
  LATCH \main_game_fsm/temp_player_right_motion_reg  ( .CLK(
        \main_game_fsm/N70 ), .D(\main_game_fsm/N72 ), .Q(
        \main_game_fsm/temp_player_right_motion ) );
  DFFNEGX1 \main_game_fsm/next_playerbullet_fire_reg  ( .D(\main_game_fsm/N82 ), .CLK(clka), .Q(\main_game_fsm/next_playerbullet_fire ) );
  LATCH \main_game_fsm/temp_playerbullet_fire_reg  ( .CLK(\main_game_fsm/N70 ), 
        .D(\main_game_fsm/N73 ), .Q(\main_game_fsm/temp_playerbullet_fire ) );
  DFFNEGX1 \main_game_fsm/invader_direction_reg  ( .D(\main_game_fsm/n173 ), 
        .CLK(n23), .Q(invader_direction) );
  DFFNEGX1 \main_game_fsm/play_reg  ( .D(\main_game_fsm/n174 ), .CLK(n23), .Q(
        play) );
  DFFNEGX1 \main_game_fsm/invaderbullet_fire_reg  ( .D(\main_game_fsm/n171 ), 
        .CLK(n23), .Q(invader_fire) );
  DFFNEGX1 \main_game_fsm/state_reg[1]  ( .D(\main_game_fsm/N106 ), .CLK(n23), 
        .Q(main_game_state[1]) );
  DFFNEGX1 \main_game_fsm/move_down_reg  ( .D(\main_game_fsm/n172 ), .CLK(n23), 
        .Q(move_down) );
  DFFNEGX1 \main_game_fsm/reset_reg  ( .D(n29), .CLK(n23), .Q(internal_reset)
         );
  DFFNEGX1 \main_game_fsm/next_state_reg[1]  ( .D(\main_game_fsm/N79 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [1]) );
  DFFNEGX1 \main_game_fsm/prev_invader_outofbounds_reg  ( .D(n24), .CLK(n23), 
        .Q(\main_game_fsm/prev_invader_outofbounds ) );
  DFFNEGX1 \main_game_fsm/next_state_reg[0]  ( .D(\main_game_fsm/N78 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [0]) );
  DFFNEGX1 \main_game_fsm/state_reg[0]  ( .D(\main_game_fsm/N105 ), .CLK(n23), 
        .Q(main_game_state[0]) );
  NOR2X1 \player_fsm/U118  ( .A(n102), .B(\player_fsm/next_state [1]), .Y(
        \player_fsm/n68 ) );
  NOR2X1 \player_fsm/U117  ( .A(n99), .B(\player_fsm/next_state [0]), .Y(
        \player_fsm/n93 ) );
  OAI21X1 \player_fsm/U116  ( .A(\player_fsm/n68 ), .B(\player_fsm/n93 ), .C(
        n15), .Y(\player_fsm/N102 ) );
  NAND2X1 \player_fsm/U106  ( .A(n201), .B(\player_fsm/n121 ), .Y(
        \player_fsm/n119 ) );
  XNOR2X1 \player_fsm/U102  ( .A(invader_bullet_coord_x[2]), .B(
        player_coord_x[2]), .Y(\player_fsm/n106 ) );
  NAND2X1 \player_fsm/U101  ( .A(invader_bullet_coord_x[1]), .B(n13), .Y(
        \player_fsm/n109 ) );
  NAND2X1 \player_fsm/U100  ( .A(\player_fsm/n109 ), .B(n194), .Y(
        \player_fsm/n114 ) );
  OR2X1 \player_fsm/U99  ( .A(n13), .B(invader_bullet_coord_x[1]), .Y(
        \player_fsm/n110 ) );
  OAI21X1 \player_fsm/U98  ( .A(n10), .B(\player_fsm/n114 ), .C(
        \player_fsm/n110 ), .Y(\player_fsm/n113 ) );
  AOI22X1 \player_fsm/U97  ( .A(\player_fsm/n106 ), .B(\player_fsm/n113 ), .C(
        player_coord_x[2]), .D(n196), .Y(\player_fsm/n112 ) );
  OAI21X1 \player_fsm/U96  ( .A(invader_bullet_coord_x[3]), .B(n12), .C(
        \player_fsm/n112 ), .Y(\player_fsm/n111 ) );
  OAI21X1 \player_fsm/U95  ( .A(player_coord_x[3]), .B(n195), .C(
        \player_fsm/n111 ), .Y(\player_fsm/n101 ) );
  NAND2X1 \player_fsm/U94  ( .A(\player_fsm/n110 ), .B(n10), .Y(
        \player_fsm/n108 ) );
  OAI21X1 \player_fsm/U93  ( .A(n194), .B(\player_fsm/n108 ), .C(
        \player_fsm/n109 ), .Y(\player_fsm/n107 ) );
  NAND2X1 \player_fsm/U92  ( .A(\player_fsm/n106 ), .B(\player_fsm/n107 ), .Y(
        \player_fsm/n105 ) );
  OAI21X1 \player_fsm/U91  ( .A(player_coord_x[2]), .B(n196), .C(
        \player_fsm/n105 ), .Y(\player_fsm/n103 ) );
  OAI21X1 \player_fsm/U90  ( .A(n78), .B(n195), .C(player_coord_x[3]), .Y(
        \player_fsm/n104 ) );
  OAI21X1 \player_fsm/U89  ( .A(invader_bullet_coord_x[3]), .B(
        \player_fsm/n103 ), .C(\player_fsm/n104 ), .Y(\player_fsm/n102 ) );
  AOI22X1 \player_fsm/U88  ( .A(\player_fsm/N17 ), .B(\player_fsm/n101 ), .C(
        \player_fsm/N24 ), .D(\player_fsm/n102 ), .Y(\player_fsm/n100 ) );
  OR2X1 \player_fsm/U87  ( .A(\player_fsm/n99 ), .B(\player_fsm/n100 ), .Y(
        \player_fsm/n96 ) );
  AOI22X1 \player_fsm/U86  ( .A(\player_fsm/state[0] ), .B(\player_fsm/n96 ), 
        .C(play), .D(n101), .Y(\player_fsm/n97 ) );
  OR2X1 \player_fsm/U85  ( .A(internal_reset), .B(\player_fsm/state[1] ), .Y(
        \player_fsm/n98 ) );
  NOR2X1 \player_fsm/U84  ( .A(\player_fsm/n97 ), .B(\player_fsm/n98 ), .Y(
        \player_fsm/N51 ) );
  NOR2X1 \player_fsm/U83  ( .A(\player_fsm/state[1] ), .B(\player_fsm/n96 ), 
        .Y(\player_fsm/n95 ) );
  AOI22X1 \player_fsm/U82  ( .A(\player_fsm/n95 ), .B(\player_fsm/state[0] ), 
        .C(\player_fsm/state[1] ), .D(n101), .Y(\player_fsm/n94 ) );
  NOR2X1 \player_fsm/U81  ( .A(internal_reset), .B(\player_fsm/n94 ), .Y(
        \player_fsm/N52 ) );
  NOR2X1 \player_fsm/U80  ( .A(\player_fsm/N102 ), .B(n102), .Y(
        \player_fsm/N90 ) );
  NOR2X1 \player_fsm/U79  ( .A(\player_fsm/N102 ), .B(n99), .Y(
        \player_fsm/N91 ) );
  NAND2X1 \player_fsm/U78  ( .A(\player_fsm/n93 ), .B(n15), .Y(
        \player_fsm/n65 ) );
  XNOR2X1 \player_fsm/U77  ( .A(n99), .B(\player_fsm/next_state [0]), .Y(
        \player_fsm/n92 ) );
  NAND2X1 \player_fsm/U76  ( .A(\player_fsm/n75 ), .B(n100), .Y(
        \player_fsm/N97 ) );
  NOR2X1 \player_fsm/U75  ( .A(player_coord_x[3]), .B(player_coord_x[2]), .Y(
        \player_fsm/n91 ) );
  OAI21X1 \player_fsm/U74  ( .A(n10), .B(n13), .C(\player_fsm/n91 ), .Y(
        \player_fsm/n90 ) );
  NAND3X1 \player_fsm/U73  ( .A(\player_fsm/n90 ), .B(n37), .C(
        player_left_motion), .Y(\player_fsm/n72 ) );
  OAI21X1 \player_fsm/U72  ( .A(player_coord_x[1]), .B(player_coord_x[0]), .C(
        player_coord_x[2]), .Y(\player_fsm/n89 ) );
  OAI21X1 \player_fsm/U71  ( .A(n12), .B(\player_fsm/n89 ), .C(n38), .Y(
        \player_fsm/n88 ) );
  NOR2X1 \player_fsm/U70  ( .A(n37), .B(\player_fsm/n88 ), .Y(\player_fsm/n70 ) );
  NAND2X1 \player_fsm/U69  ( .A(n10), .B(\player_fsm/n70 ), .Y(
        \player_fsm/n87 ) );
  OAI21X1 \player_fsm/U68  ( .A(player_coord_x[0]), .B(\player_fsm/n72 ), .C(
        \player_fsm/n87 ), .Y(\player_fsm/n86 ) );
  OAI21X1 \player_fsm/U67  ( .A(n35), .B(\player_fsm/n70 ), .C(
        \player_fsm/n65 ), .Y(\player_fsm/n81 ) );
  AOI22X1 \player_fsm/U66  ( .A(\player_fsm/n68 ), .B(\player_fsm/n86 ), .C(
        player_coord_x[0]), .D(\player_fsm/n81 ), .Y(\player_fsm/n85 ) );
  NAND2X1 \player_fsm/U65  ( .A(\player_fsm/n85 ), .B(\player_fsm/n75 ), .Y(
        \player_fsm/n132 ) );
  NAND3X1 \player_fsm/U64  ( .A(n10), .B(n13), .C(n35), .Y(\player_fsm/n84 )
         );
  AOI21X1 \player_fsm/U63  ( .A(\player_fsm/N13 ), .B(\player_fsm/n70 ), .C(
        n33), .Y(\player_fsm/n82 ) );
  NAND3X1 \player_fsm/U62  ( .A(player_coord_x[1]), .B(player_coord_x[0]), .C(
        n35), .Y(\player_fsm/n83 ) );
  OAI21X1 \player_fsm/U61  ( .A(n65), .B(\player_fsm/n82 ), .C(
        \player_fsm/n83 ), .Y(\player_fsm/n79 ) );
  OAI21X1 \player_fsm/U60  ( .A(n32), .B(n13), .C(\player_fsm/n75 ), .Y(
        \player_fsm/n80 ) );
  OR2X1 \player_fsm/U59  ( .A(\player_fsm/n79 ), .B(\player_fsm/n80 ), .Y(
        \player_fsm/n131 ) );
  OAI21X1 \player_fsm/U58  ( .A(player_coord_x[0]), .B(player_coord_x[1]), .C(
        n35), .Y(\player_fsm/n78 ) );
  OAI21X1 \player_fsm/U57  ( .A(n35), .B(\player_fsm/n70 ), .C(
        \player_fsm/n78 ), .Y(\player_fsm/n73 ) );
  AOI22X1 \player_fsm/U56  ( .A(n33), .B(n11), .C(player_coord_x[2]), .D(
        \player_fsm/n73 ), .Y(\player_fsm/n77 ) );
  OAI21X1 \player_fsm/U55  ( .A(n36), .B(n76), .C(\player_fsm/n77 ), .Y(
        \player_fsm/n76 ) );
  AOI22X1 \player_fsm/U54  ( .A(\player_fsm/n68 ), .B(\player_fsm/n76 ), .C(
        n65), .D(player_coord_x[2]), .Y(\player_fsm/n74 ) );
  NAND2X1 \player_fsm/U53  ( .A(\player_fsm/n74 ), .B(\player_fsm/n75 ), .Y(
        \player_fsm/n130 ) );
  OAI21X1 \player_fsm/U52  ( .A(n11), .B(\player_fsm/n72 ), .C(n34), .Y(
        \player_fsm/n71 ) );
  AOI22X1 \player_fsm/U51  ( .A(\player_fsm/N15 ), .B(\player_fsm/n70 ), .C(
        player_coord_x[3]), .D(\player_fsm/n71 ), .Y(\player_fsm/n69 ) );
  NOR2X1 \player_fsm/U50  ( .A(internal_reset), .B(\player_fsm/n69 ), .Y(
        \player_fsm/n67 ) );
  NAND2X1 \player_fsm/U49  ( .A(\player_fsm/n67 ), .B(\player_fsm/n68 ), .Y(
        \player_fsm/n66 ) );
  OAI21X1 \player_fsm/U48  ( .A(n12), .B(\player_fsm/n65 ), .C(
        \player_fsm/n66 ), .Y(\player_fsm/n129 ) );
  AND2X2 \player_fsm/U21  ( .A(\player_fsm/n92 ), .B(n15), .Y(\player_fsm/n75 ) );
  DFFNEGX1 \player_fsm/display_reg  ( .D(\player_fsm/N97 ), .CLK(n23), .Q(
        player_display) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[1]  ( .D(\player_fsm/n131 ), .CLK(
        n23), .Q(player_coord_x[1]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[3]  ( .D(\player_fsm/n129 ), .CLK(
        n22), .Q(player_coord_x[3]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[2]  ( .D(\player_fsm/n130 ), .CLK(
        n22), .Q(player_coord_x[2]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[0]  ( .D(\player_fsm/n132 ), .CLK(
        n22), .Q(player_coord_x[0]) );
  DFFNEGX1 \player_fsm/state_reg[1]  ( .D(\player_fsm/N91 ), .CLK(n22), .Q(
        \player_fsm/state[1] ) );
  DFFNEGX1 \player_fsm/invaderbullet_player_collision_signal_reg  ( .D(n65), 
        .CLK(n22), .Q(invaderbullet_player_collision_signal) );
  DFFNEGX1 \player_fsm/next_state_reg[1]  ( .D(\player_fsm/N52 ), .CLK(clka), 
        .Q(\player_fsm/next_state [1]) );
  DFFNEGX1 \player_fsm/state_reg[0]  ( .D(\player_fsm/N90 ), .CLK(n22), .Q(
        \player_fsm/state[0] ) );
  DFFNEGX1 \player_fsm/next_state_reg[0]  ( .D(\player_fsm/N51 ), .CLK(clka), 
        .Q(\player_fsm/next_state [0]) );
  NAND2X1 \shield_fsm/U78  ( .A(\shield_fsm/next_state [0]), .B(n114), .Y(
        \shield_fsm/n67 ) );
  OAI21X1 \shield_fsm/U77  ( .A(\shield_fsm/next_state [1]), .B(
        \shield_fsm/next_state [0]), .C(n15), .Y(\shield_fsm/n69 ) );
  AOI21X1 \shield_fsm/U76  ( .A(n15), .B(n113), .C(\shield_fsm/n49 ), .Y(
        \shield_fsm/N104 ) );
  NAND3X1 \shield_fsm/U74  ( .A(\shield_fsm/N22 ), .B(\shield_fsm/N16 ), .C(
        n199), .Y(\shield_fsm/n77 ) );
  XOR2X1 \shield_fsm/U73  ( .A(n111), .B(invader_bullet_coord_y[0]), .Y(
        \shield_fsm/n79 ) );
  XOR2X1 \shield_fsm/U71  ( .A(n112), .B(invader_bullet_coord_y[2]), .Y(
        \shield_fsm/n81 ) );
  NAND3X1 \shield_fsm/U70  ( .A(\shield_fsm/n79 ), .B(n202), .C(
        \shield_fsm/n81 ), .Y(\shield_fsm/n78 ) );
  OR2X1 \shield_fsm/U69  ( .A(\shield_fsm/n77 ), .B(\shield_fsm/n78 ), .Y(
        \shield_fsm/n61 ) );
  NOR2X1 \shield_fsm/U68  ( .A(\shield_fsm/n61 ), .B(shield_hp[1]), .Y(
        \shield_fsm/n50 ) );
  NAND2X1 \shield_fsm/U67  ( .A(\shield_fsm/n50 ), .B(n117), .Y(
        \shield_fsm/n74 ) );
  AOI22X1 \shield_fsm/U66  ( .A(\shield_fsm/state[0] ), .B(\shield_fsm/n74 ), 
        .C(play), .D(n115), .Y(\shield_fsm/n75 ) );
  OR2X1 \shield_fsm/U65  ( .A(internal_reset), .B(\shield_fsm/state[1] ), .Y(
        \shield_fsm/n76 ) );
  NOR2X1 \shield_fsm/U64  ( .A(\shield_fsm/n75 ), .B(\shield_fsm/n76 ), .Y(
        \shield_fsm/N47 ) );
  NOR2X1 \shield_fsm/U63  ( .A(\shield_fsm/state[1] ), .B(\shield_fsm/n74 ), 
        .Y(\shield_fsm/n73 ) );
  AOI22X1 \shield_fsm/U62  ( .A(\shield_fsm/n73 ), .B(\shield_fsm/state[0] ), 
        .C(\shield_fsm/state[1] ), .D(n115), .Y(\shield_fsm/n72 ) );
  NOR2X1 \shield_fsm/U61  ( .A(internal_reset), .B(\shield_fsm/n72 ), .Y(
        \shield_fsm/N48 ) );
  NOR2X1 \shield_fsm/U60  ( .A(internal_reset), .B(\shield_fsm/n67 ), .Y(
        \shield_fsm/N89 ) );
  NOR2X1 \shield_fsm/U59  ( .A(\shield_fsm/n67 ), .B(n114), .Y(
        \shield_fsm/N90 ) );
  OAI21X1 \shield_fsm/U58  ( .A(\shield_fsm/n61 ), .B(\shield_fsm/n67 ), .C(
        \shield_fsm/n71 ), .Y(\shield_fsm/n68 ) );
  NAND3X1 \shield_fsm/U57  ( .A(\shield_fsm/n68 ), .B(n117), .C(n113), .Y(
        \shield_fsm/n66 ) );
  OAI21X1 \shield_fsm/U56  ( .A(n117), .B(\shield_fsm/n68 ), .C(
        \shield_fsm/n66 ), .Y(\shield_fsm/n70 ) );
  OR2X1 \shield_fsm/U55  ( .A(\shield_fsm/n69 ), .B(\shield_fsm/n70 ), .Y(
        \shield_fsm/n91 ) );
  OAI21X1 \shield_fsm/U54  ( .A(\shield_fsm/n67 ), .B(n117), .C(
        \shield_fsm/n68 ), .Y(\shield_fsm/n65 ) );
  AOI22X1 \shield_fsm/U53  ( .A(shield_hp[1]), .B(\shield_fsm/n65 ), .C(n62), 
        .D(n116), .Y(\shield_fsm/n64 ) );
  NAND2X1 \shield_fsm/U52  ( .A(\shield_fsm/n64 ), .B(n63), .Y(
        \shield_fsm/n90 ) );
  OAI21X1 \shield_fsm/U51  ( .A(\shield_fsm/N104 ), .B(n112), .C(n63), .Y(
        \shield_fsm/n89 ) );
  NAND3X1 \shield_fsm/U50  ( .A(\shield_fsm/N104 ), .B(n15), .C(
        \shield_fsm/next_state [1]), .Y(\shield_fsm/n63 ) );
  OAI21X1 \shield_fsm/U49  ( .A(\shield_fsm/N104 ), .B(n111), .C(
        \shield_fsm/n63 ), .Y(\shield_fsm/n88 ) );
  OAI21X1 \shield_fsm/U48  ( .A(\shield_fsm/N104 ), .B(n110), .C(n63), .Y(
        \shield_fsm/n87 ) );
  OAI21X1 \shield_fsm/U47  ( .A(\shield_fsm/N104 ), .B(n109), .C(n63), .Y(
        \shield_fsm/n86 ) );
  NAND2X1 \shield_fsm/U46  ( .A(n113), .B(n15), .Y(\shield_fsm/n60 ) );
  NAND2X1 \shield_fsm/U45  ( .A(invaderbullet_shield_collision_signal), .B(
        \shield_fsm/n49 ), .Y(\shield_fsm/n62 ) );
  OAI21X1 \shield_fsm/U44  ( .A(\shield_fsm/n61 ), .B(\shield_fsm/n60 ), .C(
        \shield_fsm/n62 ), .Y(\shield_fsm/n85 ) );
  NAND3X1 \shield_fsm/U43  ( .A(\shield_fsm/N28 ), .B(n64), .C(
        \shield_fsm/n59 ), .Y(\shield_fsm/n51 ) );
  XOR2X1 \shield_fsm/U41  ( .A(n112), .B(player_bullet_coord_y[2]), .Y(
        \shield_fsm/n55 ) );
  XOR2X1 \shield_fsm/U39  ( .A(shield_coord_y[0]), .B(player_bullet_coord_y[0]), .Y(\shield_fsm/n58 ) );
  NOR2X1 \shield_fsm/U38  ( .A(player_bullet_coord_y[3]), .B(\shield_fsm/n58 ), 
        .Y(\shield_fsm/n56 ) );
  NAND3X1 \shield_fsm/U37  ( .A(n180), .B(\shield_fsm/n55 ), .C(
        \shield_fsm/n56 ), .Y(\shield_fsm/n52 ) );
  NAND2X1 \shield_fsm/U36  ( .A(playerbullet_shield_collision_signal), .B(
        \shield_fsm/n49 ), .Y(\shield_fsm/n53 ) );
  OAI21X1 \shield_fsm/U35  ( .A(\shield_fsm/n51 ), .B(\shield_fsm/n52 ), .C(
        \shield_fsm/n53 ), .Y(\shield_fsm/n84 ) );
  AOI22X1 \shield_fsm/U34  ( .A(n113), .B(n103), .C(shield_display), .D(
        \shield_fsm/n49 ), .Y(\shield_fsm/n48 ) );
  NAND2X1 \shield_fsm/U33  ( .A(\shield_fsm/n48 ), .B(n63), .Y(
        \shield_fsm/n83 ) );
  AND2X2 \shield_fsm/U18  ( .A(n63), .B(\shield_fsm/next_state [0]), .Y(
        \shield_fsm/n71 ) );
  AND2X2 \shield_fsm/U16  ( .A(\shield_fsm/n71 ), .B(\shield_fsm/n67 ), .Y(
        \shield_fsm/n49 ) );
  AND2X2 \shield_fsm/U11  ( .A(shield_hp[1]), .B(\shield_fsm/N34 ), .Y(
        \shield_fsm/n59 ) );
  DFFNEGX1 \shield_fsm/playerbullet_shield_collision_reg  ( .D(
        \shield_fsm/n84 ), .CLK(n22), .Q(playerbullet_shield_collision_signal)
         );
  DFFNEGX1 \shield_fsm/shield_display_reg  ( .D(\shield_fsm/n83 ), .CLK(n22), 
        .Q(shield_display) );
  DFFNEGX1 \shield_fsm/invaderbullet_shield_collision_reg  ( .D(
        \shield_fsm/n85 ), .CLK(n22), .Q(invaderbullet_shield_collision_signal) );
  DFFNEGX1 \shield_fsm/shield_coord_x_reg[1]  ( .D(\shield_fsm/n86 ), .CLK(n22), .Q(shield_coord_x[1]) );
  DFFNEGX1 \shield_fsm/shield_coord_x_reg[2]  ( .D(\shield_fsm/n87 ), .CLK(n22), .Q(shield_coord_x[2]) );
  DFFNEGX1 \shield_fsm/shield_coord_y_reg[0]  ( .D(\shield_fsm/n88 ), .CLK(n22), .Q(shield_coord_y[0]) );
  DFFNEGX1 \shield_fsm/shield_coord_y_reg[2]  ( .D(\shield_fsm/n89 ), .CLK(n22), .Q(shield_coord_y[2]) );
  DFFNEGX1 \shield_fsm/state_reg[1]  ( .D(\shield_fsm/N90 ), .CLK(n21), .Q(
        \shield_fsm/state[1] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[1]  ( .D(\shield_fsm/N48 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [1]) );
  DFFNEGX1 \shield_fsm/state_reg[0]  ( .D(\shield_fsm/N89 ), .CLK(n21), .Q(
        \shield_fsm/state[0] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[0]  ( .D(\shield_fsm/N47 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [0]) );
  DFFNEGX1 \shield_fsm/hp_reg[1]  ( .D(\shield_fsm/n90 ), .CLK(n21), .Q(
        shield_hp[1]) );
  DFFNEGX1 \shield_fsm/hp_reg[0]  ( .D(\shield_fsm/n91 ), .CLK(n21), .Q(
        shield_hp[0]) );
  NAND3X1 \invader_fsm_1/U93  ( .A(\invader_fsm_1/N35 ), .B(
        \invader_fsm_1/N29 ), .C(\invader_fsm_1/n92 ), .Y(\invader_fsm_1/n88 )
         );
  NAND3X1 \invader_fsm_1/U92  ( .A(n15), .B(n144), .C(\invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n63 ) );
  NOR2X1 \invader_fsm_1/U91  ( .A(\invader_fsm_1/state[1] ), .B(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n91 ) );
  NAND3X1 \invader_fsm_1/U90  ( .A(play), .B(n15), .C(\invader_fsm_1/n91 ), 
        .Y(\invader_fsm_1/n90 ) );
  OAI21X1 \invader_fsm_1/U89  ( .A(n120), .B(\invader_fsm_1/n63 ), .C(
        \invader_fsm_1/n90 ), .Y(\invader_fsm_1/N47 ) );
  NAND3X1 \invader_fsm_1/U88  ( .A(n15), .B(n145), .C(\invader_fsm_1/state[1] ), .Y(\invader_fsm_1/n89 ) );
  OAI21X1 \invader_fsm_1/U87  ( .A(\invader_fsm_1/n63 ), .B(
        \invader_fsm_1/n88 ), .C(\invader_fsm_1/n89 ), .Y(\invader_fsm_1/N48 )
         );
  NOR2X1 \invader_fsm_1/U86  ( .A(n146), .B(\invader_fsm_1/next_state [1]), 
        .Y(\invader_fsm_1/n82 ) );
  NAND2X1 \invader_fsm_1/U85  ( .A(\invader_fsm_1/n82 ), .B(n52), .Y(
        \invader_fsm_1/n86 ) );
  OAI21X1 \invader_fsm_1/U84  ( .A(\invader_fsm_1/next_state [1]), .B(
        \invader_fsm_1/next_state [0]), .C(n15), .Y(\invader_fsm_1/n87 ) );
  NAND2X1 \invader_fsm_1/U83  ( .A(\invader_fsm_1/next_state [1]), .B(n146), 
        .Y(\invader_fsm_1/n62 ) );
  NAND2X1 \invader_fsm_1/U82  ( .A(n61), .B(\invader_fsm_1/n62 ), .Y(
        \invader_fsm_1/n70 ) );
  OAI21X1 \invader_fsm_1/U81  ( .A(n141), .B(\invader_fsm_1/n86 ), .C(n60), 
        .Y(\invader_fsm_1/n56 ) );
  AOI22X1 \invader_fsm_1/U80  ( .A(n147), .B(invader_direction), .C(n147), .D(
        n42), .Y(\invader_fsm_1/n85 ) );
  OAI21X1 \invader_fsm_1/U79  ( .A(\invader_fsm_1/n70 ), .B(n40), .C(
        \invader_fsm_1/n56 ), .Y(\invader_fsm_1/n84 ) );
  OAI21X1 \invader_fsm_1/U78  ( .A(\invader_fsm_1/n56 ), .B(n147), .C(
        \invader_fsm_1/n84 ), .Y(\invader_fsm_1/n106 ) );
  OAI21X1 \invader_fsm_1/U77  ( .A(\invader_fsm_1/n70 ), .B(n142), .C(n61), 
        .Y(\invader_fsm_1/n105 ) );
  NAND2X1 \invader_fsm_1/U76  ( .A(n60), .B(n143), .Y(\invader_fsm_1/n65 ) );
  NOR2X1 \invader_fsm_1/U75  ( .A(n143), .B(internal_reset), .Y(
        \invader_fsm_1/n74 ) );
  OAI22X1 \invader_fsm_1/U74  ( .A(n141), .B(\invader_fsm_1/n65 ), .C(
        \invader_fsm_1/move_interval_toggle ), .D(n67), .Y(
        \invader_fsm_1/n104 ) );
  OAI21X1 \invader_fsm_1/U73  ( .A(n143), .B(n52), .C(n60), .Y(
        \invader_fsm_1/n79 ) );
  NAND3X1 \invader_fsm_1/U72  ( .A(\invader_fsm_1/n79 ), .B(n131), .C(
        \invader_fsm_1/n74 ), .Y(\invader_fsm_1/n83 ) );
  OAI21X1 \invader_fsm_1/U71  ( .A(n131), .B(\invader_fsm_1/n79 ), .C(
        \invader_fsm_1/n83 ), .Y(\invader_fsm_1/n103 ) );
  OR2X1 \invader_fsm_1/U70  ( .A(invader_1_coord_y[0]), .B(\invader_fsm_1/n70 ), .Y(\invader_fsm_1/n102 ) );
  XNOR2X1 \invader_fsm_1/U69  ( .A(invader_1_coord_y[2]), .B(
        invader_1_coord_y[1]), .Y(\invader_fsm_1/n80 ) );
  NAND3X1 \invader_fsm_1/U68  ( .A(\invader_fsm_1/n82 ), .B(
        \invader_fsm_1/n79 ), .C(\invader_fsm_1/n80 ), .Y(\invader_fsm_1/n77 )
         );
  OAI21X1 \invader_fsm_1/U67  ( .A(n128), .B(\invader_fsm_1/n79 ), .C(
        \invader_fsm_1/n77 ), .Y(\invader_fsm_1/n81 ) );
  OR2X1 \invader_fsm_1/U66  ( .A(\invader_fsm_1/n70 ), .B(\invader_fsm_1/n81 ), 
        .Y(\invader_fsm_1/n101 ) );
  AOI21X1 \invader_fsm_1/U65  ( .A(\invader_fsm_1/n80 ), .B(n131), .C(n143), 
        .Y(\invader_fsm_1/n78 ) );
  OAI21X1 \invader_fsm_1/U64  ( .A(\invader_fsm_1/n78 ), .B(n50), .C(
        invader_1_coord_y[3]), .Y(\invader_fsm_1/n75 ) );
  NAND3X1 \invader_fsm_1/U63  ( .A(n131), .B(n126), .C(n51), .Y(
        \invader_fsm_1/n76 ) );
  NAND3X1 \invader_fsm_1/U62  ( .A(\invader_fsm_1/n75 ), .B(
        \invader_fsm_1/n76 ), .C(n61), .Y(\invader_fsm_1/n100 ) );
  AOI22X1 \invader_fsm_1/U61  ( .A(n139), .B(\invader_fsm_1/n59 ), .C(
        \invader_fsm_1/N13 ), .D(\invader_fsm_1/n60 ), .Y(\invader_fsm_1/n72 )
         );
  OAI21X1 \invader_fsm_1/U60  ( .A(\invader_fsm_1/n56 ), .B(n8), .C(
        \invader_fsm_1/n72 ), .Y(\invader_fsm_1/n99 ) );
  AOI22X1 \invader_fsm_1/U59  ( .A(\invader_fsm_1/N14 ), .B(invader_direction), 
        .C(\invader_fsm_1/N20 ), .D(n42), .Y(\invader_fsm_1/n71 ) );
  OAI21X1 \invader_fsm_1/U58  ( .A(\invader_fsm_1/n70 ), .B(n41), .C(
        \invader_fsm_1/n56 ), .Y(\invader_fsm_1/n69 ) );
  OAI21X1 \invader_fsm_1/U57  ( .A(n138), .B(\invader_fsm_1/n56 ), .C(
        \invader_fsm_1/n69 ), .Y(\invader_fsm_1/n98 ) );
  AOI22X1 \invader_fsm_1/U56  ( .A(n134), .B(\invader_fsm_1/n59 ), .C(
        \invader_fsm_1/N15 ), .D(\invader_fsm_1/n60 ), .Y(\invader_fsm_1/n68 )
         );
  OAI21X1 \invader_fsm_1/U55  ( .A(\invader_fsm_1/n56 ), .B(n9), .C(
        \invader_fsm_1/n68 ), .Y(\invader_fsm_1/n97 ) );
  NAND3X1 \invader_fsm_1/U54  ( .A(\invader_fsm_1/n65 ), .B(n15), .C(
        \invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n67 ) );
  OAI21X1 \invader_fsm_1/U53  ( .A(\invader_fsm_1/n65 ), .B(n144), .C(
        \invader_fsm_1/n67 ), .Y(\invader_fsm_1/n96 ) );
  NAND3X1 \invader_fsm_1/U52  ( .A(\invader_fsm_1/n65 ), .B(n15), .C(
        \invader_fsm_1/next_state [0]), .Y(\invader_fsm_1/n66 ) );
  OAI21X1 \invader_fsm_1/U51  ( .A(n145), .B(\invader_fsm_1/n65 ), .C(
        \invader_fsm_1/n66 ), .Y(\invader_fsm_1/n95 ) );
  NAND2X1 \invader_fsm_1/U50  ( .A(playerbullet_invader_collision_signal_1), 
        .B(n60), .Y(\invader_fsm_1/n64 ) );
  OAI21X1 \invader_fsm_1/U49  ( .A(\invader_fsm_1/n62 ), .B(
        \invader_fsm_1/n63 ), .C(\invader_fsm_1/n64 ), .Y(\invader_fsm_1/n94 )
         );
  OAI21X1 \invader_fsm_1/U48  ( .A(invader_1_coord_x[1]), .B(
        \invader_fsm_1/N72 ), .C(invader_1_coord_x[2]), .Y(\invader_fsm_1/n61 ) );
  AOI22X1 \invader_fsm_1/U47  ( .A(\invader_fsm_1/n58 ), .B(
        \invader_fsm_1/n59 ), .C(\invader_fsm_1/N77 ), .D(\invader_fsm_1/n60 ), 
        .Y(\invader_fsm_1/n57 ) );
  OAI21X1 \invader_fsm_1/U46  ( .A(\invader_fsm_1/n56 ), .B(n118), .C(
        \invader_fsm_1/n57 ), .Y(\invader_fsm_1/n93 ) );
  AND2X2 \invader_fsm_1/U7  ( .A(\invader_fsm_1/N23 ), .B(\invader_fsm_1/N17 ), 
        .Y(\invader_fsm_1/n92 ) );
  AND2X2 \invader_fsm_1/U6  ( .A(\invader_fsm_1/n74 ), .B(\invader_fsm_1/n56 ), 
        .Y(\invader_fsm_1/n73 ) );
  AND2X2 \invader_fsm_1/U5  ( .A(\invader_fsm_1/n73 ), .B(n42), .Y(
        \invader_fsm_1/n59 ) );
  AND2X2 \invader_fsm_1/U4  ( .A(invader_direction), .B(\invader_fsm_1/n73 ), 
        .Y(\invader_fsm_1/n60 ) );
  AND2X2 \invader_fsm_1/U3  ( .A(\invader_fsm_1/n61 ), .B(n9), .Y(
        \invader_fsm_1/n58 ) );
  DFFNEGX1 \invader_fsm_1/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_1/n93 ), .CLK(n21), .Q(invader_outofbounds_signal_1) );
  DFFNEGX1 \invader_fsm_1/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_1/n94 ), .CLK(n21), .Q(
        playerbullet_invader_collision_signal_1) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[3]  ( .D(\invader_fsm_1/n100 ), 
        .CLK(n21), .Q(invader_1_coord_y[3]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[2]  ( .D(\invader_fsm_1/n101 ), 
        .CLK(n21), .Q(invader_1_coord_y[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[1]  ( .D(\invader_fsm_1/n103 ), 
        .CLK(n21), .Q(invader_1_coord_y[1]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[3]  ( .D(\invader_fsm_1/n97 ), 
        .CLK(n21), .Q(invader_1_coord_x[3]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[2]  ( .D(\invader_fsm_1/n98 ), 
        .CLK(n21), .Q(invader_1_coord_x[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[1]  ( .D(\invader_fsm_1/n99 ), 
        .CLK(n21), .Q(invader_1_coord_x[1]) );
  DFFNEGX1 \invader_fsm_1/move_interval_toggle_reg  ( .D(\invader_fsm_1/n104 ), 
        .CLK(n21), .Q(\invader_fsm_1/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_1/display_reg  ( .D(\invader_fsm_1/n105 ), .CLK(n20), 
        .Q(invader_1_display) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[1]  ( .D(\invader_fsm_1/N48 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [1]) );
  DFFNEGX1 \invader_fsm_1/state_reg[1]  ( .D(\invader_fsm_1/n96 ), .CLK(n20), 
        .Q(\invader_fsm_1/state[1] ) );
  DFFNEGX1 \invader_fsm_1/state_reg[0]  ( .D(\invader_fsm_1/n95 ), .CLK(n20), 
        .Q(\invader_fsm_1/state[0] ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[0]  ( .D(\invader_fsm_1/n102 ), 
        .CLK(n20), .Q(invader_1_coord_y[0]) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[0]  ( .D(\invader_fsm_1/N47 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [0]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[0]  ( .D(\invader_fsm_1/n106 ), 
        .CLK(n20), .Q(\invader_fsm_1/N72 ) );
  NAND3X1 \invader_fsm_2/U95  ( .A(\invader_fsm_2/N35 ), .B(
        \invader_fsm_2/N29 ), .C(\invader_fsm_2/n94 ), .Y(\invader_fsm_2/n90 )
         );
  NAND3X1 \invader_fsm_2/U94  ( .A(n15), .B(n174), .C(\invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n63 ) );
  NOR2X1 \invader_fsm_2/U93  ( .A(\invader_fsm_2/state[1] ), .B(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n93 ) );
  NAND3X1 \invader_fsm_2/U92  ( .A(play), .B(n15), .C(\invader_fsm_2/n93 ), 
        .Y(\invader_fsm_2/n92 ) );
  OAI21X1 \invader_fsm_2/U91  ( .A(n149), .B(\invader_fsm_2/n63 ), .C(
        \invader_fsm_2/n92 ), .Y(\invader_fsm_2/N47 ) );
  NAND3X1 \invader_fsm_2/U90  ( .A(n15), .B(n175), .C(\invader_fsm_2/state[1] ), .Y(\invader_fsm_2/n91 ) );
  OAI21X1 \invader_fsm_2/U89  ( .A(\invader_fsm_2/n63 ), .B(
        \invader_fsm_2/n90 ), .C(\invader_fsm_2/n91 ), .Y(\invader_fsm_2/N48 )
         );
  NOR2X1 \invader_fsm_2/U88  ( .A(n176), .B(\invader_fsm_2/next_state [1]), 
        .Y(\invader_fsm_2/n83 ) );
  NAND2X1 \invader_fsm_2/U87  ( .A(\invader_fsm_2/n83 ), .B(n52), .Y(
        \invader_fsm_2/n89 ) );
  OAI21X1 \invader_fsm_2/U86  ( .A(\invader_fsm_2/next_state [1]), .B(
        \invader_fsm_2/next_state [0]), .C(n15), .Y(\invader_fsm_2/n86 ) );
  NAND2X1 \invader_fsm_2/U85  ( .A(\invader_fsm_2/next_state [1]), .B(n176), 
        .Y(\invader_fsm_2/n62 ) );
  NOR2X1 \invader_fsm_2/U84  ( .A(\invader_fsm_2/n86 ), .B(n172), .Y(
        \invader_fsm_2/n65 ) );
  OAI21X1 \invader_fsm_2/U83  ( .A(n170), .B(\invader_fsm_2/n89 ), .C(
        \invader_fsm_2/n65 ), .Y(\invader_fsm_2/n56 ) );
  AOI22X1 \invader_fsm_2/U82  ( .A(n177), .B(invader_direction), .C(n177), .D(
        n42), .Y(\invader_fsm_2/n88 ) );
  OAI21X1 \invader_fsm_2/U81  ( .A(n59), .B(n39), .C(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n87 ) );
  OAI21X1 \invader_fsm_2/U80  ( .A(\invader_fsm_2/n56 ), .B(n177), .C(
        \invader_fsm_2/n87 ), .Y(\invader_fsm_2/n108 ) );
  OAI21X1 \invader_fsm_2/U79  ( .A(n59), .B(n169), .C(n58), .Y(
        \invader_fsm_2/n107 ) );
  NAND2X1 \invader_fsm_2/U78  ( .A(\invader_fsm_2/n65 ), .B(n173), .Y(
        \invader_fsm_2/n66 ) );
  NOR2X1 \invader_fsm_2/U77  ( .A(n173), .B(internal_reset), .Y(
        \invader_fsm_2/n85 ) );
  OAI22X1 \invader_fsm_2/U76  ( .A(n170), .B(\invader_fsm_2/n66 ), .C(
        \invader_fsm_2/move_interval_toggle ), .D(n66), .Y(
        \invader_fsm_2/n106 ) );
  OAI21X1 \invader_fsm_2/U75  ( .A(n173), .B(n52), .C(\invader_fsm_2/n65 ), 
        .Y(\invader_fsm_2/n80 ) );
  NAND3X1 \invader_fsm_2/U74  ( .A(\invader_fsm_2/n80 ), .B(n171), .C(
        \invader_fsm_2/n85 ), .Y(\invader_fsm_2/n84 ) );
  OAI21X1 \invader_fsm_2/U73  ( .A(n171), .B(\invader_fsm_2/n80 ), .C(
        \invader_fsm_2/n84 ), .Y(\invader_fsm_2/n105 ) );
  OR2X1 \invader_fsm_2/U72  ( .A(invader_2_coord_y[0]), .B(n59), .Y(
        \invader_fsm_2/n104 ) );
  XNOR2X1 \invader_fsm_2/U71  ( .A(invader_2_coord_y[2]), .B(
        invader_2_coord_y[1]), .Y(\invader_fsm_2/n81 ) );
  NAND3X1 \invader_fsm_2/U70  ( .A(\invader_fsm_2/n83 ), .B(
        \invader_fsm_2/n80 ), .C(\invader_fsm_2/n81 ), .Y(\invader_fsm_2/n78 )
         );
  OAI21X1 \invader_fsm_2/U69  ( .A(n166), .B(\invader_fsm_2/n80 ), .C(
        \invader_fsm_2/n78 ), .Y(\invader_fsm_2/n82 ) );
  OR2X1 \invader_fsm_2/U68  ( .A(n59), .B(\invader_fsm_2/n82 ), .Y(
        \invader_fsm_2/n103 ) );
  AOI21X1 \invader_fsm_2/U67  ( .A(\invader_fsm_2/n81 ), .B(n171), .C(n173), 
        .Y(\invader_fsm_2/n79 ) );
  OAI21X1 \invader_fsm_2/U66  ( .A(\invader_fsm_2/n79 ), .B(n48), .C(
        invader_2_coord_y[3]), .Y(\invader_fsm_2/n76 ) );
  NAND3X1 \invader_fsm_2/U65  ( .A(n171), .B(n164), .C(n49), .Y(
        \invader_fsm_2/n77 ) );
  NAND3X1 \invader_fsm_2/U64  ( .A(\invader_fsm_2/n76 ), .B(
        \invader_fsm_2/n77 ), .C(n58), .Y(\invader_fsm_2/n102 ) );
  NOR2X1 \invader_fsm_2/U63  ( .A(n66), .B(n47), .Y(\invader_fsm_2/n75 ) );
  AOI22X1 \invader_fsm_2/U62  ( .A(n155), .B(\invader_fsm_2/n59 ), .C(
        \invader_fsm_2/N13 ), .D(\invader_fsm_2/n60 ), .Y(\invader_fsm_2/n74 )
         );
  OAI21X1 \invader_fsm_2/U61  ( .A(\invader_fsm_2/n56 ), .B(n6), .C(
        \invader_fsm_2/n74 ), .Y(\invader_fsm_2/n101 ) );
  AOI22X1 \invader_fsm_2/U60  ( .A(\invader_fsm_2/N14 ), .B(
        \invader_fsm_2/n60 ), .C(n47), .D(invader_2_coord_x[2]), .Y(
        \invader_fsm_2/n72 ) );
  AOI22X1 \invader_fsm_2/U59  ( .A(n172), .B(n15), .C(\invader_fsm_2/N20 ), 
        .D(\invader_fsm_2/n59 ), .Y(\invader_fsm_2/n73 ) );
  NAND2X1 \invader_fsm_2/U58  ( .A(\invader_fsm_2/n72 ), .B(
        \invader_fsm_2/n73 ), .Y(\invader_fsm_2/n100 ) );
  AOI22X1 \invader_fsm_2/U57  ( .A(\invader_fsm_2/N15 ), .B(invader_direction), 
        .C(n152), .D(n42), .Y(\invader_fsm_2/n71 ) );
  OAI21X1 \invader_fsm_2/U56  ( .A(\invader_fsm_2/n71 ), .B(n173), .C(n58), 
        .Y(\invader_fsm_2/n70 ) );
  NAND2X1 \invader_fsm_2/U55  ( .A(\invader_fsm_2/n70 ), .B(
        \invader_fsm_2/n56 ), .Y(\invader_fsm_2/n69 ) );
  OAI21X1 \invader_fsm_2/U54  ( .A(\invader_fsm_2/n56 ), .B(n7), .C(
        \invader_fsm_2/n69 ), .Y(\invader_fsm_2/n99 ) );
  NAND3X1 \invader_fsm_2/U53  ( .A(\invader_fsm_2/n66 ), .B(n15), .C(
        \invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n68 ) );
  OAI21X1 \invader_fsm_2/U52  ( .A(\invader_fsm_2/n66 ), .B(n174), .C(
        \invader_fsm_2/n68 ), .Y(\invader_fsm_2/n98 ) );
  NAND3X1 \invader_fsm_2/U51  ( .A(\invader_fsm_2/n66 ), .B(n15), .C(
        \invader_fsm_2/next_state [0]), .Y(\invader_fsm_2/n67 ) );
  OAI21X1 \invader_fsm_2/U50  ( .A(n175), .B(\invader_fsm_2/n66 ), .C(
        \invader_fsm_2/n67 ), .Y(\invader_fsm_2/n97 ) );
  NAND2X1 \invader_fsm_2/U49  ( .A(playerbullet_invader_collision_signal_2), 
        .B(\invader_fsm_2/n65 ), .Y(\invader_fsm_2/n64 ) );
  OAI21X1 \invader_fsm_2/U48  ( .A(\invader_fsm_2/n62 ), .B(
        \invader_fsm_2/n63 ), .C(\invader_fsm_2/n64 ), .Y(\invader_fsm_2/n96 )
         );
  OAI21X1 \invader_fsm_2/U47  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/N72 ), .C(invader_2_coord_x[2]), .Y(\invader_fsm_2/n61 ) );
  AOI22X1 \invader_fsm_2/U46  ( .A(\invader_fsm_2/n58 ), .B(
        \invader_fsm_2/n59 ), .C(\invader_fsm_2/N77 ), .D(\invader_fsm_2/n60 ), 
        .Y(\invader_fsm_2/n57 ) );
  OAI21X1 \invader_fsm_2/U45  ( .A(\invader_fsm_2/n56 ), .B(n148), .C(
        \invader_fsm_2/n57 ), .Y(\invader_fsm_2/n95 ) );
  AND2X2 \invader_fsm_2/U6  ( .A(\invader_fsm_2/N23 ), .B(\invader_fsm_2/N17 ), 
        .Y(\invader_fsm_2/n94 ) );
  AND2X2 \invader_fsm_2/U5  ( .A(\invader_fsm_2/n75 ), .B(n42), .Y(
        \invader_fsm_2/n59 ) );
  AND2X2 \invader_fsm_2/U4  ( .A(invader_direction), .B(\invader_fsm_2/n75 ), 
        .Y(\invader_fsm_2/n60 ) );
  AND2X2 \invader_fsm_2/U3  ( .A(\invader_fsm_2/n61 ), .B(n7), .Y(
        \invader_fsm_2/n58 ) );
  DFFNEGX1 \invader_fsm_2/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_2/n95 ), .CLK(n20), .Q(invader_outofbounds_signal_2) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[3]  ( .D(\invader_fsm_2/n99 ), 
        .CLK(n20), .Q(invader_2_coord_x[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[1]  ( .D(\invader_fsm_2/n101 ), 
        .CLK(n20), .Q(invader_2_coord_x[1]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[2]  ( .D(\invader_fsm_2/n100 ), 
        .CLK(n20), .Q(invader_2_coord_x[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[3]  ( .D(\invader_fsm_2/n102 ), 
        .CLK(n20), .Q(invader_2_coord_y[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[2]  ( .D(\invader_fsm_2/n103 ), 
        .CLK(n20), .Q(invader_2_coord_y[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[0]  ( .D(\invader_fsm_2/n104 ), 
        .CLK(n20), .Q(invader_2_coord_y[0]) );
  DFFNEGX1 \invader_fsm_2/display_reg  ( .D(\invader_fsm_2/n107 ), .CLK(n20), 
        .Q(invader_2_display) );
  DFFNEGX1 \invader_fsm_2/move_interval_toggle_reg  ( .D(\invader_fsm_2/n106 ), 
        .CLK(n19), .Q(\invader_fsm_2/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[1]  ( .D(\invader_fsm_2/n105 ), 
        .CLK(n19), .Q(invader_2_coord_y[1]) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[1]  ( .D(\invader_fsm_2/N48 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [1]) );
  DFFNEGX1 \invader_fsm_2/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_2/n96 ), .CLK(n19), .Q(
        playerbullet_invader_collision_signal_2) );
  DFFNEGX1 \invader_fsm_2/state_reg[1]  ( .D(\invader_fsm_2/n98 ), .CLK(n19), 
        .Q(\invader_fsm_2/state[1] ) );
  DFFNEGX1 \invader_fsm_2/state_reg[0]  ( .D(\invader_fsm_2/n97 ), .CLK(n19), 
        .Q(\invader_fsm_2/state[0] ) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[0]  ( .D(\invader_fsm_2/N47 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [0]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[0]  ( .D(\invader_fsm_2/n108 ), 
        .CLK(n19), .Q(\invader_fsm_2/N72 ) );
  NAND3X1 \player_bullet_fsm/U57  ( .A(player_bullet_coord_y[1]), .B(
        player_bullet_coord_y[0]), .C(player_bullet_coord_y[2]), .Y(
        \player_bullet_fsm/n25 ) );
  OAI21X1 \player_bullet_fsm/U56  ( .A(n179), .B(\player_bullet_fsm/n25 ), .C(
        playerbullet_state), .Y(\player_bullet_fsm/n50 ) );
  NOR2X1 \player_bullet_fsm/U55  ( .A(playerbullet_shield_collision_signal), 
        .B(playerbullet_invader_collision_signal), .Y(\player_bullet_fsm/n49 )
         );
  AOI22X1 \player_bullet_fsm/U54  ( .A(n178), .B(\player_bullet_fsm/n49 ), .C(
        playerbullet_fire), .D(n186), .Y(\player_bullet_fsm/n48 ) );
  NOR2X1 \player_bullet_fsm/U53  ( .A(internal_reset), .B(
        \player_bullet_fsm/n48 ), .Y(\player_bullet_fsm/N13 ) );
  NAND2X1 \player_bullet_fsm/U52  ( .A(\player_bullet_fsm/next_state[0] ), .B(
        n15), .Y(\player_bullet_fsm/n33 ) );
  OAI21X1 \player_bullet_fsm/U46  ( .A(player_coord_x[3]), .B(internal_reset), 
        .C(\player_bullet_fsm/n33 ), .Y(\player_bullet_fsm/n45 ) );
  OAI21X1 \player_bullet_fsm/U45  ( .A(\player_bullet_fsm/n33 ), .B(n185), .C(
        \player_bullet_fsm/n45 ), .Y(\player_bullet_fsm/n55 ) );
  NOR2X1 \player_bullet_fsm/U44  ( .A(n56), .B(internal_reset), .Y(
        \player_bullet_fsm/n41 ) );
  AOI22X1 \player_bullet_fsm/U43  ( .A(player_coord_x[2]), .B(
        \player_bullet_fsm/n41 ), .C(player_bullet_coord_x[2]), .D(n56), .Y(
        \player_bullet_fsm/n43 ) );
  AOI22X1 \player_bullet_fsm/U42  ( .A(player_coord_x[1]), .B(
        \player_bullet_fsm/n41 ), .C(player_bullet_coord_x[1]), .D(n56), .Y(
        \player_bullet_fsm/n42 ) );
  AOI22X1 \player_bullet_fsm/U41  ( .A(player_coord_x[0]), .B(
        \player_bullet_fsm/n41 ), .C(player_bullet_coord_x[0]), .D(n56), .Y(
        \player_bullet_fsm/n40 ) );
  NAND2X1 \player_bullet_fsm/U39  ( .A(\player_bullet_fsm/next_state[0] ), .B(
        n180), .Y(\player_bullet_fsm/n38 ) );
  OAI21X1 \player_bullet_fsm/U38  ( .A(n189), .B(\player_bullet_fsm/n38 ), .C(
        n15), .Y(\player_bullet_fsm/n37 ) );
  NOR2X1 \player_bullet_fsm/U36  ( .A(player_bullet_coord_y[0]), .B(n187), .Y(
        \player_bullet_fsm/n36 ) );
  NOR2X1 \player_bullet_fsm/U32  ( .A(n180), .B(n189), .Y(
        \player_bullet_fsm/n31 ) );
  OAI21X1 \player_bullet_fsm/U30  ( .A(\player_bullet_fsm/n31 ), .B(n188), .C(
        \player_bullet_fsm/n32 ), .Y(\player_bullet_fsm/n30 ) );
  NOR2X1 \player_bullet_fsm/U25  ( .A(player_bullet_coord_y[3]), .B(
        \player_bullet_fsm/n25 ), .Y(\player_bullet_fsm/n24 ) );
  OAI21X1 \player_bullet_fsm/U23  ( .A(\player_bullet_fsm/n20 ), .B(n179), .C(
        \player_bullet_fsm/n21 ), .Y(\player_bullet_fsm/n51 ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[3]  ( .D(
        \player_bullet_fsm/n51 ), .CLK(n19), .Q(player_bullet_coord_y[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[1]  ( .D(
        \player_bullet_fsm/n53 ), .CLK(n19), .Q(player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[0]  ( .D(n55), .CLK(
        n19), .Q(player_bullet_coord_x[0]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[1]  ( .D(n54), .CLK(
        n19), .Q(player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[2]  ( .D(n53), .CLK(
        n19), .Q(player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[3]  ( .D(
        \player_bullet_fsm/n55 ), .CLK(n19), .Q(player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_fsm/state_reg  ( .D(n56), .CLK(n19), .Q(
        playerbullet_state) );
  DFFNEGX1 \player_bullet_fsm/display_reg  ( .D(n56), .CLK(n18), .Q(
        player_bullet_display) );
  DFFNEGX1 \player_bullet_fsm/next_state_reg[0]  ( .D(\player_bullet_fsm/N13 ), 
        .CLK(clka), .Q(\player_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[2]  ( .D(n3), .CLK(n18), .Q(player_bullet_coord_y[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[0]  ( .D(
        \player_bullet_fsm/n56 ), .CLK(n18), .Q(player_bullet_coord_y[0]) );
  NAND3X1 \invader_bullet_fsm/U55  ( .A(n202), .B(n201), .C(n203), .Y(
        \invader_bullet_fsm/n19 ) );
  NOR2X1 \invader_bullet_fsm/U54  ( .A(\invader_bullet_fsm/n19 ), .B(
        invader_bullet_coord_y[3]), .Y(\invader_bullet_fsm/n20 ) );
  NOR2X1 \invader_bullet_fsm/U53  ( .A(\invader_bullet_fsm/n20 ), .B(n190), 
        .Y(\invader_bullet_fsm/n41 ) );
  NOR2X1 \invader_bullet_fsm/U52  ( .A(invaderbullet_shield_collision_signal), 
        .B(invaderbullet_player_collision_signal), .Y(\invader_bullet_fsm/n42 ) );
  AOI22X1 \invader_bullet_fsm/U51  ( .A(\invader_bullet_fsm/n41 ), .B(
        \invader_bullet_fsm/n42 ), .C(invader_fire), .D(n190), .Y(
        \invader_bullet_fsm/n39 ) );
  NOR2X1 \invader_bullet_fsm/U49  ( .A(\invader_bullet_fsm/n39 ), .B(
        internal_reset), .Y(\invader_bullet_fsm/N19 ) );
  NOR2X1 \invader_bullet_fsm/U47  ( .A(n198), .B(internal_reset), .Y(
        \invader_bullet_fsm/N36 ) );
  AOI22X1 \invader_bullet_fsm/U46  ( .A(n83), .B(n198), .C(
        \invader_bullet_fsm/next_state[0] ), .D(n203), .Y(
        \invader_bullet_fsm/n37 ) );
  NAND3X1 \invader_bullet_fsm/U41  ( .A(\invader_bullet_fsm/n29 ), .B(n15), 
        .C(closest_invader_coord_x[0]), .Y(\invader_bullet_fsm/n33 ) );
  OAI21X1 \invader_bullet_fsm/U40  ( .A(\invader_bullet_fsm/n29 ), .B(n194), 
        .C(\invader_bullet_fsm/n33 ), .Y(\invader_bullet_fsm/n49 ) );
  OAI21X1 \invader_bullet_fsm/U39  ( .A(n82), .B(internal_reset), .C(
        \invader_bullet_fsm/n29 ), .Y(\invader_bullet_fsm/n32 ) );
  OAI21X1 \invader_bullet_fsm/U38  ( .A(\invader_bullet_fsm/n29 ), .B(n195), 
        .C(\invader_bullet_fsm/n32 ), .Y(\invader_bullet_fsm/n48 ) );
  OAI21X1 \invader_bullet_fsm/U37  ( .A(closest_invader_coord_x[2]), .B(
        internal_reset), .C(\invader_bullet_fsm/n29 ), .Y(
        \invader_bullet_fsm/n31 ) );
  OAI21X1 \invader_bullet_fsm/U36  ( .A(\invader_bullet_fsm/n29 ), .B(n196), 
        .C(\invader_bullet_fsm/n31 ), .Y(\invader_bullet_fsm/n47 ) );
  NAND3X1 \invader_bullet_fsm/U35  ( .A(\invader_bullet_fsm/n29 ), .B(n15), 
        .C(closest_invader_coord_x[1]), .Y(\invader_bullet_fsm/n30 ) );
  OAI21X1 \invader_bullet_fsm/U34  ( .A(\invader_bullet_fsm/n29 ), .B(n197), 
        .C(\invader_bullet_fsm/n30 ), .Y(\invader_bullet_fsm/n46 ) );
  NAND3X1 \invader_bullet_fsm/U32  ( .A(n203), .B(n202), .C(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n26 ) );
  NAND2X1 \invader_bullet_fsm/U31  ( .A(\invader_bullet_fsm/n26 ), .B(n15), 
        .Y(\invader_bullet_fsm/n28 ) );
  AOI21X1 \invader_bullet_fsm/U30  ( .A(n79), .B(n198), .C(
        \invader_bullet_fsm/n28 ), .Y(\invader_bullet_fsm/n27 ) );
  OAI21X1 \invader_bullet_fsm/U28  ( .A(invader_bullet_coord_y[2]), .B(
        \invader_bullet_fsm/n26 ), .C(n15), .Y(\invader_bullet_fsm/n25 ) );
  AOI21X1 \invader_bullet_fsm/U27  ( .A(n80), .B(n198), .C(
        \invader_bullet_fsm/n25 ), .Y(\invader_bullet_fsm/n21 ) );
  OAI21X1 \invader_bullet_fsm/U26  ( .A(n198), .B(n202), .C(
        \invader_bullet_fsm/n24 ), .Y(\invader_bullet_fsm/n23 ) );
  NAND2X1 \invader_bullet_fsm/U25  ( .A(invader_bullet_coord_y[2]), .B(
        \invader_bullet_fsm/n23 ), .Y(\invader_bullet_fsm/n22 ) );
  AOI22X1 \invader_bullet_fsm/U23  ( .A(\invader_bullet_fsm/n20 ), .B(
        \invader_bullet_fsm/next_state[0] ), .C(n81), .D(n198), .Y(
        \invader_bullet_fsm/n16 ) );
  AOI21X1 \invader_bullet_fsm/U21  ( .A(invader_bullet_coord_y[3]), .B(
        \invader_bullet_fsm/n18 ), .C(internal_reset), .Y(
        \invader_bullet_fsm/n17 ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_display_reg  ( .D(
        \invader_bullet_fsm/n50 ), .CLK(n18), .Q(invader_bullet_display) );
  DFFNEGX1 \invader_bullet_fsm/state_reg[0]  ( .D(\invader_bullet_fsm/N36 ), 
        .CLK(n18), .Q(\invader_bullet_fsm/state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[0]  ( .D(
        \invader_bullet_fsm/n49 ), .CLK(n18), .Q(invader_bullet_coord_x[0]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[3]  ( .D(
        \invader_bullet_fsm/n48 ), .CLK(n18), .Q(invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[2]  ( .D(
        \invader_bullet_fsm/n47 ), .CLK(n18), .Q(invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[1]  ( .D(
        \invader_bullet_fsm/n46 ), .CLK(n18), .Q(invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_fsm/next_state_reg[0]  ( .D(
        \invader_bullet_fsm/N19 ), .CLK(clka), .Q(
        \invader_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[3]  ( .D(
        \invader_bullet_fsm/n43 ), .CLK(n18), .Q(invader_bullet_coord_y[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[2]  ( .D(
        \invader_bullet_fsm/n44 ), .CLK(n18), .Q(invader_bullet_coord_y[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[1]  ( .D(
        \invader_bullet_fsm/n45 ), .CLK(n18), .Q(invader_bullet_coord_y[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[0]  ( .D(
        \invader_bullet_fsm/n51 ), .CLK(n18), .Q(invader_bullet_coord_y[0]) );
  HAX1 \invader_fsm_2/r410/U1_1_1  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/N72 ), .YC(\invader_fsm_2/r410/carry [2]), .YS(
        \invader_fsm_2/N13 ) );
  HAX1 \invader_fsm_2/r410/U1_1_2  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/r410/carry [2]), .YC(\invader_fsm_2/r410/carry [3]), 
        .YS(\invader_fsm_2/N14 ) );
  HAX1 \invader_fsm_2/r410/U1_1_3  ( .A(invader_2_coord_x[3]), .B(
        \invader_fsm_2/r410/carry [3]), .YC(\invader_fsm_2/N16 ), .YS(
        \invader_fsm_2/N15 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_1  ( .A(invader_2_coord_y[1]), .B(
        invader_2_coord_y[0]), .YC(\invader_fsm_2/add_50/carry [2]), .YS(
        \invader_fsm_2/N25 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_2  ( .A(invader_2_coord_y[2]), .B(
        \invader_fsm_2/add_50/carry [2]), .YC(\invader_fsm_2/add_50/carry [3]), 
        .YS(\invader_fsm_2/N26 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_3  ( .A(invader_2_coord_y[3]), .B(
        \invader_fsm_2/add_50/carry [3]), .YC(\invader_fsm_2/N28 ), .YS(
        \invader_fsm_2/N27 ) );
  HAX1 \invader_fsm_1/r410/U1_1_1  ( .A(invader_1_coord_x[1]), .B(
        \invader_fsm_1/N72 ), .YC(\invader_fsm_1/r410/carry [2]), .YS(
        \invader_fsm_1/N13 ) );
  HAX1 \invader_fsm_1/r410/U1_1_2  ( .A(invader_1_coord_x[2]), .B(
        \invader_fsm_1/r410/carry [2]), .YC(\invader_fsm_1/r410/carry [3]), 
        .YS(\invader_fsm_1/N14 ) );
  HAX1 \invader_fsm_1/r410/U1_1_3  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/r410/carry [3]), .YC(\invader_fsm_1/N16 ), .YS(
        \invader_fsm_1/N15 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_1  ( .A(invader_1_coord_y[1]), .B(
        invader_1_coord_y[0]), .YC(\invader_fsm_1/add_50/carry [2]), .YS(
        \invader_fsm_1/N25 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_2  ( .A(invader_1_coord_y[2]), .B(
        \invader_fsm_1/add_50/carry [2]), .YC(\invader_fsm_1/add_50/carry [3]), 
        .YS(\invader_fsm_1/N26 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_3  ( .A(invader_1_coord_y[3]), .B(
        \invader_fsm_1/add_50/carry [3]), .YC(\invader_fsm_1/N28 ), .YS(
        \invader_fsm_1/N27 ) );
  HAX1 \shield_fsm/r409/U1_1_2  ( .A(shield_coord_x[2]), .B(shield_coord_x[1]), 
        .YC(\shield_fsm/N14 ), .YS(\shield_fsm/N13 ) );
  HAX1 \shield_fsm/add_45_2/U1_1_1  ( .A(invader_bullet_coord_x[1]), .B(
        invader_bullet_coord_x[0]), .YC(\shield_fsm/add_45_2/carry [2]), .YS(
        \shield_fsm/N18 ) );
  HAX1 \shield_fsm/add_45_2/U1_1_2  ( .A(invader_bullet_coord_x[2]), .B(
        \shield_fsm/add_45_2/carry [2]), .YC(\shield_fsm/add_45_2/carry [3]), 
        .YS(\shield_fsm/N19 ) );
  HAX1 \shield_fsm/add_45_2/U1_1_3  ( .A(invader_bullet_coord_x[3]), .B(
        \shield_fsm/add_45_2/carry [3]), .YC(\shield_fsm/N21 ), .YS(
        \shield_fsm/N20 ) );
  HAX1 \shield_fsm/add_49_2/U1_1_1  ( .A(player_bullet_coord_x[1]), .B(
        player_bullet_coord_x[0]), .YC(\shield_fsm/add_49_2/carry [2]), .YS(
        \shield_fsm/N30 ) );
  HAX1 \shield_fsm/add_49_2/U1_1_2  ( .A(player_bullet_coord_x[2]), .B(
        \shield_fsm/add_49_2/carry [2]), .YC(\shield_fsm/add_49_2/carry [3]), 
        .YS(\shield_fsm/N31 ) );
  HAX1 \shield_fsm/add_49_2/U1_1_3  ( .A(player_bullet_coord_x[3]), .B(
        \shield_fsm/add_49_2/carry [3]), .YC(\shield_fsm/N33 ), .YS(
        \shield_fsm/N32 ) );
  HAX1 \player_fsm/r399/U1_1_1  ( .A(player_coord_x[1]), .B(player_coord_x[0]), 
        .YC(\player_fsm/r399/carry [2]), .YS(\player_fsm/N13 ) );
  HAX1 \player_fsm/r399/U1_1_2  ( .A(player_coord_x[2]), .B(
        \player_fsm/r399/carry [2]), .YC(\player_fsm/r399/carry [3]), .YS(
        \player_fsm/N14 ) );
  HAX1 \player_fsm/r399/U1_1_3  ( .A(player_coord_x[3]), .B(
        \player_fsm/r399/carry [3]), .YC(\player_fsm/N16 ), .YS(
        \player_fsm/N15 ) );
  HAX1 \player_fsm/add_39_2/U1_1_1  ( .A(invader_bullet_coord_x[1]), .B(
        invader_bullet_coord_x[0]), .YC(\player_fsm/add_39_2/carry [2]), .YS(
        \player_fsm/N20 ) );
  HAX1 \player_fsm/add_39_2/U1_1_2  ( .A(invader_bullet_coord_x[2]), .B(
        \player_fsm/add_39_2/carry [2]), .YC(\player_fsm/add_39_2/carry [3]), 
        .YS(\player_fsm/N21 ) );
  HAX1 \player_fsm/add_39_2/U1_1_3  ( .A(invader_bullet_coord_x[3]), .B(
        \player_fsm/add_39_2/carry [3]), .YC(\player_fsm/N23 ), .YS(
        \player_fsm/N22 ) );
  AND2X2 U2 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(n1) );
  AND2X2 U3 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(n2) );
  AND2X2 U4 ( .A(n56), .B(\player_bullet_fsm/n30 ), .Y(n3) );
  INVX2 U5 ( .A(internal_reset), .Y(n15) );
  BUFX2 U6 ( .A(n16), .Y(n18) );
  BUFX2 U7 ( .A(n16), .Y(n19) );
  BUFX2 U8 ( .A(n16), .Y(n20) );
  BUFX2 U9 ( .A(n17), .Y(n21) );
  BUFX2 U10 ( .A(n17), .Y(n22) );
  BUFX2 U11 ( .A(n17), .Y(n23) );
  INVX2 U12 ( .A(\player_bullet_fsm/n33 ), .Y(n56) );
  INVX2 U13 ( .A(\main_game_fsm/n95 ), .Y(n14) );
  INVX2 U14 ( .A(player_coord_x[1]), .Y(n13) );
  INVX2 U15 ( .A(player_coord_x[3]), .Y(n12) );
  INVX2 U16 ( .A(invader_2_coord_x[1]), .Y(n6) );
  INVX2 U17 ( .A(invader_1_coord_x[1]), .Y(n8) );
  INVX2 U18 ( .A(invader_2_coord_x[3]), .Y(n7) );
  INVX2 U19 ( .A(invader_1_coord_x[3]), .Y(n9) );
  INVX2 U20 ( .A(player_coord_x[0]), .Y(n10) );
  INVX2 U21 ( .A(player_coord_x[2]), .Y(n11) );
  BUFX2 U22 ( .A(clkb), .Y(n16) );
  BUFX2 U23 ( .A(clkb), .Y(n17) );
  XOR2X1 U24 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(
        \invader_fsm_2/N74 ) );
  XOR2X1 U25 ( .A(n1), .B(invader_2_coord_x[3]), .Y(\invader_fsm_2/N75 ) );
  NAND2X1 U26 ( .A(n1), .B(invader_2_coord_x[3]), .Y(n4) );
  XOR2X1 U27 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(
        \invader_fsm_1/N74 ) );
  XOR2X1 U28 ( .A(n2), .B(invader_1_coord_x[3]), .Y(\invader_fsm_1/N75 ) );
  NAND2X1 U29 ( .A(n2), .B(invader_1_coord_x[3]), .Y(n5) );
  INVX2 U30 ( .A(\main_game_fsm/n81 ), .Y(n24) );
  INVX2 U31 ( .A(\main_game_fsm/n80 ), .Y(n25) );
  INVX2 U32 ( .A(\main_game_fsm/n79 ), .Y(n26) );
  INVX2 U33 ( .A(\main_game_fsm/n77 ), .Y(n27) );
  INVX2 U34 ( .A(\main_game_fsm/n82 ), .Y(n28) );
  INVX2 U35 ( .A(\main_game_fsm/n83 ), .Y(n29) );
  INVX2 U36 ( .A(\main_game_fsm/n76 ), .Y(n30) );
  INVX2 U37 ( .A(reset), .Y(n31) );
  INVX2 U38 ( .A(\player_fsm/n81 ), .Y(n32) );
  INVX2 U39 ( .A(\player_fsm/n84 ), .Y(n33) );
  INVX2 U40 ( .A(\player_fsm/n73 ), .Y(n34) );
  INVX2 U41 ( .A(\player_fsm/n72 ), .Y(n35) );
  INVX2 U42 ( .A(\player_fsm/n70 ), .Y(n36) );
  INVX2 U43 ( .A(player_right_motion), .Y(n37) );
  INVX2 U44 ( .A(player_left_motion), .Y(n38) );
  INVX2 U45 ( .A(\invader_fsm_2/n88 ), .Y(n39) );
  INVX2 U46 ( .A(\invader_fsm_1/n85 ), .Y(n40) );
  INVX2 U47 ( .A(\invader_fsm_1/n71 ), .Y(n41) );
  INVX2 U48 ( .A(invader_direction), .Y(n42) );
  INVX2 U49 ( .A(play), .Y(n43) );
  INVX2 U50 ( .A(invader_fire), .Y(n44) );
  INVX2 U51 ( .A(\main_game_fsm/n102 ), .Y(n45) );
  INVX2 U52 ( .A(main_game_state[1]), .Y(n46) );
  INVX2 U53 ( .A(\invader_fsm_2/n56 ), .Y(n47) );
  INVX2 U54 ( .A(\invader_fsm_2/n80 ), .Y(n48) );
  INVX2 U55 ( .A(\invader_fsm_2/n78 ), .Y(n49) );
  INVX2 U56 ( .A(\invader_fsm_1/n79 ), .Y(n50) );
  INVX2 U57 ( .A(\invader_fsm_1/n77 ), .Y(n51) );
  INVX2 U58 ( .A(move_down), .Y(n52) );
  INVX2 U59 ( .A(\player_bullet_fsm/n43 ), .Y(n53) );
  INVX2 U60 ( .A(\player_bullet_fsm/n42 ), .Y(n54) );
  INVX2 U61 ( .A(\player_bullet_fsm/n40 ), .Y(n55) );
  INVX2 U62 ( .A(\player_bullet_fsm/n37 ), .Y(n57) );
  INVX2 U63 ( .A(\invader_fsm_2/n86 ), .Y(n58) );
  INVX2 U64 ( .A(\invader_fsm_2/n65 ), .Y(n59) );
  INVX2 U65 ( .A(\invader_fsm_1/n70 ), .Y(n60) );
  INVX2 U66 ( .A(\invader_fsm_1/n87 ), .Y(n61) );
  INVX2 U67 ( .A(\shield_fsm/n66 ), .Y(n62) );
  INVX2 U68 ( .A(\shield_fsm/n69 ), .Y(n63) );
  INVX2 U69 ( .A(\shield_fsm/n60 ), .Y(n64) );
  INVX2 U70 ( .A(\player_fsm/n65 ), .Y(n65) );
  INVX2 U71 ( .A(\invader_fsm_2/n85 ), .Y(n66) );
  INVX2 U72 ( .A(\invader_fsm_1/n74 ), .Y(n67) );
  INVX2 U73 ( .A(\main_game_fsm/next_state [1]), .Y(n68) );
  INVX2 U74 ( .A(\main_game_fsm/n85 ), .Y(n69) );
  INVX2 U75 ( .A(\main_game_fsm/prev_invader_outofbounds ), .Y(n70) );
  INVX2 U76 ( .A(\main_game_fsm/next_state [0]), .Y(n71) );
  INVX2 U77 ( .A(main_game_state[0]), .Y(n72) );
  INVX2 U78 ( .A(\main_game_fsm/n106 ), .Y(n73) );
  INVX2 U79 ( .A(n214), .Y(n74) );
  INVX2 U80 ( .A(\player_fsm/N15 ), .Y(n75) );
  INVX2 U81 ( .A(\player_fsm/N14 ), .Y(n76) );
  INVX2 U82 ( .A(\player_fsm/N13 ), .Y(n77) );
  INVX2 U83 ( .A(\player_fsm/n103 ), .Y(n78) );
  INVX2 U84 ( .A(\main_game_fsm/n93 ), .Y(n79) );
  INVX2 U85 ( .A(\main_game_fsm/n92 ), .Y(n80) );
  INVX2 U86 ( .A(\main_game_fsm/n91 ), .Y(n81) );
  INVX2 U87 ( .A(\main_game_fsm/n96 ), .Y(n82) );
  INVX2 U88 ( .A(\main_game_fsm/n94 ), .Y(n83) );
  INVX2 U89 ( .A(\main_game_fsm/n111 ), .Y(n84) );
  INVX2 U90 ( .A(\main_game_fsm/n115 ), .Y(n85) );
  INVX2 U91 ( .A(\main_game_fsm/n119 ), .Y(n86) );
  INVX2 U92 ( .A(\main_game_fsm/n135 ), .Y(n87) );
  INVX2 U93 ( .A(\main_game_fsm/n109 ), .Y(n88) );
  INVX2 U94 ( .A(\main_game_fsm/n113 ), .Y(n89) );
  INVX2 U95 ( .A(\main_game_fsm/n117 ), .Y(n90) );
  INVX2 U96 ( .A(\main_game_fsm/n130 ), .Y(n91) );
  INVX2 U97 ( .A(n207), .Y(n92) );
  INVX2 U98 ( .A(\main_game_fsm/n163 ), .Y(n93) );
  INVX2 U99 ( .A(\main_game_fsm/n152 ), .Y(n94) );
  INVX2 U100 ( .A(\main_game_fsm/n126 ), .Y(n95) );
  INVX2 U101 ( .A(\main_game_fsm/n124 ), .Y(n96) );
  INVX2 U102 ( .A(\main_game_fsm/n125 ), .Y(n97) );
  INVX2 U103 ( .A(\main_game_fsm/n123 ), .Y(n98) );
  INVX2 U104 ( .A(\player_fsm/next_state [1]), .Y(n99) );
  INVX2 U105 ( .A(\player_fsm/n68 ), .Y(n100) );
  INVX2 U106 ( .A(\player_fsm/state[0] ), .Y(n101) );
  INVX2 U107 ( .A(\player_fsm/next_state [0]), .Y(n102) );
  INVX2 U108 ( .A(\shield_fsm/n50 ), .Y(n103) );
  INVX2 U109 ( .A(n229), .Y(n104) );
  INVX2 U110 ( .A(n225), .Y(n105) );
  INVX2 U111 ( .A(n240), .Y(n106) );
  INVX2 U112 ( .A(n236), .Y(n107) );
  INVX2 U113 ( .A(\shield_fsm/N13 ), .Y(n108) );
  INVX2 U114 ( .A(shield_coord_x[1]), .Y(n109) );
  INVX2 U115 ( .A(shield_coord_x[2]), .Y(n110) );
  INVX2 U116 ( .A(shield_coord_y[0]), .Y(n111) );
  INVX2 U117 ( .A(shield_coord_y[2]), .Y(n112) );
  INVX2 U118 ( .A(\shield_fsm/n67 ), .Y(n113) );
  INVX2 U119 ( .A(\shield_fsm/next_state [1]), .Y(n114) );
  INVX2 U120 ( .A(\shield_fsm/state[0] ), .Y(n115) );
  INVX2 U121 ( .A(shield_hp[1]), .Y(n116) );
  INVX2 U122 ( .A(shield_hp[0]), .Y(n117) );
  INVX2 U123 ( .A(invader_outofbounds_signal_1), .Y(n118) );
  INVX2 U124 ( .A(\main_game_fsm/n105 ), .Y(n119) );
  INVX2 U125 ( .A(\invader_fsm_1/n88 ), .Y(n120) );
  INVX2 U126 ( .A(\invader_fsm_1/N34 ), .Y(n121) );
  INVX2 U127 ( .A(n246), .Y(n122) );
  INVX2 U128 ( .A(n252), .Y(n123) );
  INVX2 U129 ( .A(n255), .Y(n124) );
  INVX2 U130 ( .A(\invader_fsm_1/N27 ), .Y(n125) );
  INVX2 U131 ( .A(invader_1_coord_y[3]), .Y(n126) );
  INVX2 U132 ( .A(\invader_fsm_1/N32 ), .Y(n127) );
  INVX2 U133 ( .A(invader_1_coord_y[2]), .Y(n128) );
  INVX2 U134 ( .A(n249), .Y(n129) );
  INVX2 U135 ( .A(\invader_fsm_1/N25 ), .Y(n130) );
  INVX2 U136 ( .A(invader_1_coord_y[1]), .Y(n131) );
  INVX2 U137 ( .A(\invader_fsm_1/N22 ), .Y(n132) );
  INVX2 U138 ( .A(n264), .Y(n133) );
  INVX2 U139 ( .A(n277), .Y(n134) );
  INVX2 U140 ( .A(n269), .Y(n135) );
  INVX2 U141 ( .A(\invader_fsm_1/N15 ), .Y(n136) );
  INVX2 U142 ( .A(\invader_fsm_1/N20 ), .Y(n137) );
  INVX2 U143 ( .A(invader_1_coord_x[2]), .Y(n138) );
  INVX2 U144 ( .A(n274), .Y(n139) );
  INVX2 U145 ( .A(\invader_fsm_1/N13 ), .Y(n140) );
  INVX2 U146 ( .A(\invader_fsm_1/move_interval_toggle ), .Y(n141) );
  INVX2 U147 ( .A(invader_1_display), .Y(n142) );
  INVX2 U148 ( .A(\invader_fsm_1/n82 ), .Y(n143) );
  INVX2 U149 ( .A(\invader_fsm_1/state[1] ), .Y(n144) );
  INVX2 U150 ( .A(\invader_fsm_1/state[0] ), .Y(n145) );
  INVX2 U151 ( .A(\invader_fsm_1/next_state [0]), .Y(n146) );
  INVX2 U152 ( .A(\invader_fsm_1/N72 ), .Y(n147) );
  INVX2 U153 ( .A(invader_outofbounds_signal_2), .Y(n148) );
  INVX2 U154 ( .A(\invader_fsm_2/n90 ), .Y(n149) );
  INVX2 U155 ( .A(\invader_fsm_2/N22 ), .Y(n150) );
  INVX2 U156 ( .A(n301), .Y(n151) );
  INVX2 U157 ( .A(n314), .Y(n152) );
  INVX2 U158 ( .A(n306), .Y(n153) );
  INVX2 U159 ( .A(\invader_fsm_2/N15 ), .Y(n154) );
  INVX2 U160 ( .A(n311), .Y(n155) );
  INVX2 U161 ( .A(\invader_fsm_2/N20 ), .Y(n156) );
  INVX2 U162 ( .A(\invader_fsm_2/N13 ), .Y(n157) );
  INVX2 U163 ( .A(invader_2_coord_x[2]), .Y(n158) );
  INVX2 U164 ( .A(\invader_fsm_2/N34 ), .Y(n159) );
  INVX2 U165 ( .A(n283), .Y(n160) );
  INVX2 U166 ( .A(n289), .Y(n161) );
  INVX2 U167 ( .A(n292), .Y(n162) );
  INVX2 U168 ( .A(\invader_fsm_2/N27 ), .Y(n163) );
  INVX2 U169 ( .A(invader_2_coord_y[3]), .Y(n164) );
  INVX2 U170 ( .A(\invader_fsm_2/N32 ), .Y(n165) );
  INVX2 U171 ( .A(invader_2_coord_y[2]), .Y(n166) );
  INVX2 U172 ( .A(n286), .Y(n167) );
  INVX2 U173 ( .A(\invader_fsm_2/N25 ), .Y(n168) );
  INVX2 U174 ( .A(invader_2_display), .Y(n169) );
  INVX2 U175 ( .A(\invader_fsm_2/move_interval_toggle ), .Y(n170) );
  INVX2 U176 ( .A(invader_2_coord_y[1]), .Y(n171) );
  INVX2 U177 ( .A(\invader_fsm_2/n62 ), .Y(n172) );
  INVX2 U178 ( .A(\invader_fsm_2/n83 ), .Y(n173) );
  INVX2 U179 ( .A(\invader_fsm_2/state[1] ), .Y(n174) );
  INVX2 U180 ( .A(\invader_fsm_2/state[0] ), .Y(n175) );
  INVX2 U181 ( .A(\invader_fsm_2/next_state [0]), .Y(n176) );
  INVX2 U182 ( .A(\invader_fsm_2/N72 ), .Y(n177) );
  INVX2 U183 ( .A(\player_bullet_fsm/n50 ), .Y(n178) );
  INVX2 U184 ( .A(player_bullet_coord_y[3]), .Y(n179) );
  INVX2 U185 ( .A(player_bullet_coord_y[1]), .Y(n180) );
  INVX2 U186 ( .A(\shield_fsm/N31 ), .Y(n181) );
  INVX2 U187 ( .A(\shield_fsm/N30 ), .Y(n182) );
  INVX2 U188 ( .A(player_bullet_coord_x[1]), .Y(n183) );
  INVX2 U189 ( .A(player_bullet_coord_x[2]), .Y(n184) );
  INVX2 U190 ( .A(player_bullet_coord_x[3]), .Y(n185) );
  INVX2 U191 ( .A(playerbullet_state), .Y(n186) );
  INVX2 U192 ( .A(\player_bullet_fsm/next_state[0] ), .Y(n187) );
  INVX2 U193 ( .A(player_bullet_coord_y[2]), .Y(n188) );
  INVX2 U194 ( .A(player_bullet_coord_y[0]), .Y(n189) );
  INVX2 U195 ( .A(\invader_bullet_fsm/state[0] ), .Y(n190) );
  INVX2 U196 ( .A(\player_fsm/N22 ), .Y(n191) );
  INVX2 U197 ( .A(\shield_fsm/N19 ), .Y(n192) );
  INVX2 U198 ( .A(\shield_fsm/N18 ), .Y(n193) );
  INVX2 U199 ( .A(invader_bullet_coord_x[0]), .Y(n194) );
  INVX2 U200 ( .A(invader_bullet_coord_x[3]), .Y(n195) );
  INVX2 U201 ( .A(invader_bullet_coord_x[2]), .Y(n196) );
  INVX2 U202 ( .A(invader_bullet_coord_x[1]), .Y(n197) );
  INVX2 U203 ( .A(\invader_bullet_fsm/next_state[0] ), .Y(n198) );
  INVX2 U204 ( .A(invader_bullet_coord_y[3]), .Y(n199) );
  INVX2 U205 ( .A(\invader_bullet_fsm/n19 ), .Y(n200) );
  INVX2 U206 ( .A(invader_bullet_coord_y[2]), .Y(n201) );
  INVX2 U207 ( .A(invader_bullet_coord_y[1]), .Y(n202) );
  INVX2 U208 ( .A(invader_bullet_coord_y[0]), .Y(n203) );
  NOR2X1 U209 ( .A(\player_fsm/n116 ), .B(\player_fsm/N31 ), .Y(
        \player_fsm/n99 ) );
  OR2X1 U210 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n204) );
  NOR2X1 U211 ( .A(invader_bullet_coord_y[1]), .B(n204), .Y(\player_fsm/N31 )
         );
  AOI22X1 U212 ( .A(player_coord_x[0]), .B(invader_bullet_coord_x[0]), .C(
        player_coord_x[1]), .D(n193), .Y(n205) );
  AOI21X1 U213 ( .A(\player_fsm/N20 ), .B(n13), .C(n205), .Y(n210) );
  NAND2X1 U214 ( .A(player_coord_x[3]), .B(n191), .Y(n208) );
  NAND3X1 U215 ( .A(n208), .B(n11), .C(\player_fsm/N21 ), .Y(n206) );
  OAI21X1 U216 ( .A(player_coord_x[3]), .B(n191), .C(n206), .Y(n207) );
  OAI21X1 U217 ( .A(\player_fsm/N21 ), .B(n11), .C(n208), .Y(n209) );
  AOI22X1 U218 ( .A(n210), .B(n92), .C(n92), .D(n209), .Y(n211) );
  OR2X1 U219 ( .A(n211), .B(\player_fsm/N23 ), .Y(\player_fsm/N24 ) );
  AOI22X1 U220 ( .A(invader_bullet_coord_x[0]), .B(player_coord_x[0]), .C(
        invader_bullet_coord_x[1]), .D(n77), .Y(n212) );
  AOI21X1 U221 ( .A(\player_fsm/N13 ), .B(n197), .C(n212), .Y(n217) );
  NAND2X1 U222 ( .A(invader_bullet_coord_x[3]), .B(n75), .Y(n215) );
  NAND3X1 U223 ( .A(n215), .B(n196), .C(\player_fsm/N14 ), .Y(n213) );
  OAI21X1 U224 ( .A(invader_bullet_coord_x[3]), .B(n75), .C(n213), .Y(n214) );
  OAI21X1 U225 ( .A(\player_fsm/N14 ), .B(n196), .C(n215), .Y(n216) );
  AOI22X1 U226 ( .A(n217), .B(n74), .C(n74), .D(n216), .Y(n218) );
  OR2X1 U227 ( .A(n218), .B(\player_fsm/N16 ), .Y(\player_fsm/N17 ) );
  AOI22X1 U228 ( .A(shield_coord_x[2]), .B(n181), .C(shield_coord_x[1]), .D(
        n182), .Y(n220) );
  OAI21X1 U229 ( .A(shield_coord_x[1]), .B(n182), .C(player_bullet_coord_x[0]), 
        .Y(n219) );
  AOI22X1 U230 ( .A(\shield_fsm/N31 ), .B(n110), .C(n220), .D(n219), .Y(n222)
         );
  NOR2X1 U231 ( .A(\shield_fsm/N33 ), .B(\shield_fsm/N32 ), .Y(n221) );
  NAND2X1 U232 ( .A(n222), .B(n221), .Y(\shield_fsm/N34 ) );
  NAND2X1 U233 ( .A(\shield_fsm/N14 ), .B(n185), .Y(n225) );
  NAND3X1 U234 ( .A(n225), .B(n108), .C(player_bullet_coord_x[2]), .Y(n223) );
  OAI21X1 U235 ( .A(\shield_fsm/N14 ), .B(n185), .C(n223), .Y(n229) );
  OAI21X1 U236 ( .A(player_bullet_coord_x[1]), .B(shield_coord_x[1]), .C(
        player_bullet_coord_x[0]), .Y(n224) );
  OAI21X1 U237 ( .A(n109), .B(n183), .C(n224), .Y(n228) );
  NOR2X1 U238 ( .A(player_bullet_coord_x[2]), .B(n108), .Y(n226) );
  OAI21X1 U239 ( .A(n105), .B(n226), .C(n104), .Y(n227) );
  OAI21X1 U240 ( .A(n229), .B(n228), .C(n227), .Y(\shield_fsm/N28 ) );
  AOI22X1 U241 ( .A(shield_coord_x[2]), .B(n192), .C(shield_coord_x[1]), .D(
        n193), .Y(n231) );
  OAI21X1 U242 ( .A(shield_coord_x[1]), .B(n193), .C(invader_bullet_coord_x[0]), .Y(n230) );
  AOI22X1 U243 ( .A(\shield_fsm/N19 ), .B(n110), .C(n231), .D(n230), .Y(n233)
         );
  NOR2X1 U244 ( .A(\shield_fsm/N21 ), .B(\shield_fsm/N20 ), .Y(n232) );
  NAND2X1 U245 ( .A(n233), .B(n232), .Y(\shield_fsm/N22 ) );
  NAND2X1 U246 ( .A(\shield_fsm/N14 ), .B(n195), .Y(n236) );
  NAND3X1 U247 ( .A(n236), .B(n108), .C(invader_bullet_coord_x[2]), .Y(n234)
         );
  OAI21X1 U248 ( .A(\shield_fsm/N14 ), .B(n195), .C(n234), .Y(n240) );
  OAI21X1 U249 ( .A(invader_bullet_coord_x[1]), .B(shield_coord_x[1]), .C(
        invader_bullet_coord_x[0]), .Y(n235) );
  OAI21X1 U250 ( .A(n109), .B(n197), .C(n235), .Y(n239) );
  NOR2X1 U251 ( .A(invader_bullet_coord_x[2]), .B(n108), .Y(n237) );
  OAI21X1 U252 ( .A(n107), .B(n237), .C(n106), .Y(n238) );
  OAI21X1 U253 ( .A(n240), .B(n239), .C(n238), .Y(\shield_fsm/N16 ) );
  NAND3X1 U254 ( .A(\invader_fsm_1/N74 ), .B(n8), .C(\invader_fsm_1/N75 ), .Y(
        n241) );
  NAND2X1 U255 ( .A(n5), .B(n241), .Y(\invader_fsm_1/N77 ) );
  NAND2X1 U256 ( .A(n123), .B(n179), .Y(n243) );
  NAND3X1 U257 ( .A(n243), .B(n127), .C(player_bullet_coord_y[2]), .Y(n242) );
  OAI21X1 U258 ( .A(n123), .B(n179), .C(n242), .Y(n246) );
  OAI21X1 U259 ( .A(player_bullet_coord_y[2]), .B(n127), .C(n243), .Y(n248) );
  OAI22X1 U260 ( .A(player_bullet_coord_y[1]), .B(n249), .C(
        player_bullet_coord_y[0]), .D(invader_1_coord_y[0]), .Y(n244) );
  OAI21X1 U261 ( .A(n129), .B(n180), .C(n244), .Y(n245) );
  OAI21X1 U262 ( .A(n246), .B(n245), .C(n121), .Y(n247) );
  AOI21X1 U263 ( .A(n122), .B(n248), .C(n247), .Y(\invader_fsm_1/N35 ) );
  NOR2X1 U264 ( .A(invader_1_coord_y[1]), .B(invader_1_coord_y[0]), .Y(n250)
         );
  AOI21X1 U265 ( .A(invader_1_coord_y[0]), .B(invader_1_coord_y[1]), .C(n250), 
        .Y(n249) );
  NAND2X1 U266 ( .A(n250), .B(n128), .Y(n251) );
  OAI21X1 U267 ( .A(n250), .B(n128), .C(n251), .Y(\invader_fsm_1/N32 ) );
  NOR2X1 U268 ( .A(n251), .B(invader_1_coord_y[3]), .Y(\invader_fsm_1/N34 ) );
  AOI21X1 U269 ( .A(n251), .B(invader_1_coord_y[3]), .C(\invader_fsm_1/N34 ), 
        .Y(n252) );
  AOI22X1 U270 ( .A(player_bullet_coord_y[0]), .B(invader_1_coord_y[0]), .C(
        player_bullet_coord_y[1]), .D(n130), .Y(n253) );
  AOI21X1 U271 ( .A(\invader_fsm_1/N25 ), .B(n180), .C(n253), .Y(n258) );
  NAND2X1 U272 ( .A(player_bullet_coord_y[3]), .B(n125), .Y(n256) );
  NAND3X1 U273 ( .A(n256), .B(n188), .C(\invader_fsm_1/N26 ), .Y(n254) );
  OAI21X1 U274 ( .A(player_bullet_coord_y[3]), .B(n125), .C(n254), .Y(n255) );
  OAI21X1 U275 ( .A(\invader_fsm_1/N26 ), .B(n188), .C(n256), .Y(n257) );
  AOI22X1 U276 ( .A(n258), .B(n124), .C(n124), .D(n257), .Y(n259) );
  OR2X1 U277 ( .A(n259), .B(\invader_fsm_1/N28 ), .Y(\invader_fsm_1/N29 ) );
  NAND2X1 U278 ( .A(n134), .B(n185), .Y(n261) );
  NAND3X1 U279 ( .A(n261), .B(n137), .C(player_bullet_coord_x[2]), .Y(n260) );
  OAI21X1 U280 ( .A(n134), .B(n185), .C(n260), .Y(n264) );
  OAI21X1 U281 ( .A(player_bullet_coord_x[2]), .B(n137), .C(n261), .Y(n266) );
  OAI22X1 U282 ( .A(player_bullet_coord_x[1]), .B(n274), .C(
        player_bullet_coord_x[0]), .D(\invader_fsm_1/N72 ), .Y(n262) );
  OAI21X1 U283 ( .A(n139), .B(n183), .C(n262), .Y(n263) );
  OAI21X1 U284 ( .A(n264), .B(n263), .C(n132), .Y(n265) );
  AOI21X1 U285 ( .A(n133), .B(n266), .C(n265), .Y(\invader_fsm_1/N23 ) );
  AOI22X1 U286 ( .A(player_bullet_coord_x[0]), .B(\invader_fsm_1/N72 ), .C(
        player_bullet_coord_x[1]), .D(n140), .Y(n267) );
  AOI21X1 U287 ( .A(\invader_fsm_1/N13 ), .B(n183), .C(n267), .Y(n272) );
  NAND2X1 U288 ( .A(player_bullet_coord_x[3]), .B(n136), .Y(n270) );
  NAND3X1 U289 ( .A(n270), .B(n184), .C(\invader_fsm_1/N14 ), .Y(n268) );
  OAI21X1 U290 ( .A(player_bullet_coord_x[3]), .B(n136), .C(n268), .Y(n269) );
  OAI21X1 U291 ( .A(\invader_fsm_1/N14 ), .B(n184), .C(n270), .Y(n271) );
  AOI22X1 U292 ( .A(n272), .B(n135), .C(n135), .D(n271), .Y(n273) );
  OR2X1 U293 ( .A(n273), .B(\invader_fsm_1/N16 ), .Y(\invader_fsm_1/N17 ) );
  NOR2X1 U294 ( .A(invader_1_coord_x[1]), .B(\invader_fsm_1/N72 ), .Y(n275) );
  AOI21X1 U295 ( .A(\invader_fsm_1/N72 ), .B(invader_1_coord_x[1]), .C(n275), 
        .Y(n274) );
  NAND2X1 U296 ( .A(n275), .B(n138), .Y(n276) );
  OAI21X1 U297 ( .A(n275), .B(n138), .C(n276), .Y(\invader_fsm_1/N20 ) );
  NOR2X1 U298 ( .A(n276), .B(invader_1_coord_x[3]), .Y(\invader_fsm_1/N22 ) );
  AOI21X1 U299 ( .A(n276), .B(invader_1_coord_x[3]), .C(\invader_fsm_1/N22 ), 
        .Y(n277) );
  NAND3X1 U300 ( .A(\invader_fsm_2/N74 ), .B(n6), .C(\invader_fsm_2/N75 ), .Y(
        n278) );
  NAND2X1 U301 ( .A(n4), .B(n278), .Y(\invader_fsm_2/N77 ) );
  NAND2X1 U302 ( .A(n161), .B(n179), .Y(n280) );
  NAND3X1 U303 ( .A(n280), .B(n165), .C(player_bullet_coord_y[2]), .Y(n279) );
  OAI21X1 U304 ( .A(n161), .B(n179), .C(n279), .Y(n283) );
  OAI21X1 U305 ( .A(player_bullet_coord_y[2]), .B(n165), .C(n280), .Y(n285) );
  OAI22X1 U306 ( .A(player_bullet_coord_y[1]), .B(n286), .C(
        player_bullet_coord_y[0]), .D(invader_2_coord_y[0]), .Y(n281) );
  OAI21X1 U307 ( .A(n167), .B(n180), .C(n281), .Y(n282) );
  OAI21X1 U308 ( .A(n283), .B(n282), .C(n159), .Y(n284) );
  AOI21X1 U309 ( .A(n160), .B(n285), .C(n284), .Y(\invader_fsm_2/N35 ) );
  NOR2X1 U310 ( .A(invader_2_coord_y[1]), .B(invader_2_coord_y[0]), .Y(n287)
         );
  AOI21X1 U311 ( .A(invader_2_coord_y[0]), .B(invader_2_coord_y[1]), .C(n287), 
        .Y(n286) );
  NAND2X1 U312 ( .A(n287), .B(n166), .Y(n288) );
  OAI21X1 U313 ( .A(n287), .B(n166), .C(n288), .Y(\invader_fsm_2/N32 ) );
  NOR2X1 U314 ( .A(n288), .B(invader_2_coord_y[3]), .Y(\invader_fsm_2/N34 ) );
  AOI21X1 U315 ( .A(n288), .B(invader_2_coord_y[3]), .C(\invader_fsm_2/N34 ), 
        .Y(n289) );
  AOI22X1 U316 ( .A(player_bullet_coord_y[0]), .B(invader_2_coord_y[0]), .C(
        player_bullet_coord_y[1]), .D(n168), .Y(n290) );
  AOI21X1 U317 ( .A(\invader_fsm_2/N25 ), .B(n180), .C(n290), .Y(n295) );
  NAND2X1 U318 ( .A(player_bullet_coord_y[3]), .B(n163), .Y(n293) );
  NAND3X1 U319 ( .A(n293), .B(n188), .C(\invader_fsm_2/N26 ), .Y(n291) );
  OAI21X1 U320 ( .A(player_bullet_coord_y[3]), .B(n163), .C(n291), .Y(n292) );
  OAI21X1 U321 ( .A(\invader_fsm_2/N26 ), .B(n188), .C(n293), .Y(n294) );
  AOI22X1 U322 ( .A(n295), .B(n162), .C(n162), .D(n294), .Y(n296) );
  OR2X1 U323 ( .A(n296), .B(\invader_fsm_2/N28 ), .Y(\invader_fsm_2/N29 ) );
  NAND2X1 U324 ( .A(n152), .B(n185), .Y(n298) );
  NAND3X1 U325 ( .A(n298), .B(n156), .C(player_bullet_coord_x[2]), .Y(n297) );
  OAI21X1 U326 ( .A(n152), .B(n185), .C(n297), .Y(n301) );
  OAI21X1 U327 ( .A(player_bullet_coord_x[2]), .B(n156), .C(n298), .Y(n303) );
  OAI22X1 U328 ( .A(player_bullet_coord_x[1]), .B(n311), .C(
        player_bullet_coord_x[0]), .D(\invader_fsm_2/N72 ), .Y(n299) );
  OAI21X1 U329 ( .A(n155), .B(n183), .C(n299), .Y(n300) );
  OAI21X1 U330 ( .A(n301), .B(n300), .C(n150), .Y(n302) );
  AOI21X1 U331 ( .A(n151), .B(n303), .C(n302), .Y(\invader_fsm_2/N23 ) );
  AOI22X1 U332 ( .A(player_bullet_coord_x[0]), .B(\invader_fsm_2/N72 ), .C(
        player_bullet_coord_x[1]), .D(n157), .Y(n304) );
  AOI21X1 U333 ( .A(\invader_fsm_2/N13 ), .B(n183), .C(n304), .Y(n309) );
  NAND2X1 U334 ( .A(player_bullet_coord_x[3]), .B(n154), .Y(n307) );
  NAND3X1 U335 ( .A(n307), .B(n184), .C(\invader_fsm_2/N14 ), .Y(n305) );
  OAI21X1 U336 ( .A(player_bullet_coord_x[3]), .B(n154), .C(n305), .Y(n306) );
  OAI21X1 U337 ( .A(\invader_fsm_2/N14 ), .B(n184), .C(n307), .Y(n308) );
  AOI22X1 U338 ( .A(n309), .B(n153), .C(n153), .D(n308), .Y(n310) );
  OR2X1 U339 ( .A(n310), .B(\invader_fsm_2/N16 ), .Y(\invader_fsm_2/N17 ) );
  NOR2X1 U340 ( .A(invader_2_coord_x[1]), .B(\invader_fsm_2/N72 ), .Y(n312) );
  AOI21X1 U341 ( .A(\invader_fsm_2/N72 ), .B(invader_2_coord_x[1]), .C(n312), 
        .Y(n311) );
  NAND2X1 U342 ( .A(n312), .B(n158), .Y(n313) );
  OAI21X1 U343 ( .A(n312), .B(n158), .C(n313), .Y(\invader_fsm_2/N20 ) );
  NOR2X1 U344 ( .A(n313), .B(invader_2_coord_x[3]), .Y(\invader_fsm_2/N22 ) );
  AOI21X1 U345 ( .A(n313), .B(invader_2_coord_x[3]), .C(\invader_fsm_2/N22 ), 
        .Y(n314) );
  NOR2X1 U346 ( .A(invader_bullet_coord_y[3]), .B(\player_fsm/n117 ), .Y(
        \player_fsm/n116 ) );
  NAND2X1 U347 ( .A(n188), .B(\player_bullet_fsm/n31 ), .Y(
        \player_bullet_fsm/n32 ) );
  NOR2X1 U348 ( .A(\player_bullet_fsm/n46 ), .B(internal_reset), .Y(
        \player_bullet_fsm/n56 ) );
  NOR2X1 U349 ( .A(n200), .B(n198), .Y(\invader_bullet_fsm/n18 ) );
  NOR2X1 U350 ( .A(\invader_bullet_fsm/n37 ), .B(internal_reset), .Y(
        \invader_bullet_fsm/n51 ) );
  NOR2X1 U351 ( .A(n198), .B(internal_reset), .Y(\invader_bullet_fsm/n50 ) );
  NAND2X1 U352 ( .A(n203), .B(n202), .Y(\player_fsm/n121 ) );
  NAND2X1 U353 ( .A(\player_bullet_fsm/n24 ), .B(n56), .Y(
        \player_bullet_fsm/n21 ) );
  NAND2X1 U354 ( .A(n189), .B(\player_bullet_fsm/next_state[0] ), .Y(
        \player_bullet_fsm/n46 ) );
  NAND2X1 U355 ( .A(n201), .B(\player_fsm/n119 ), .Y(\player_fsm/n117 ) );
  NAND2X1 U356 ( .A(\player_bullet_fsm/n36 ), .B(player_bullet_coord_y[1]), 
        .Y(\player_bullet_fsm/n35 ) );
  NAND2X1 U357 ( .A(n57), .B(\player_bullet_fsm/n35 ), .Y(
        \player_bullet_fsm/n53 ) );
  NAND2X1 U358 ( .A(n56), .B(\player_bullet_fsm/n25 ), .Y(
        \player_bullet_fsm/n20 ) );
  NAND2X1 U359 ( .A(\invader_bullet_fsm/next_state[0] ), .B(n15), .Y(
        \invader_bullet_fsm/n29 ) );
  NAND2X1 U360 ( .A(\invader_bullet_fsm/n16 ), .B(\invader_bullet_fsm/n17 ), 
        .Y(\invader_bullet_fsm/n43 ) );
  NAND2X1 U361 ( .A(\invader_bullet_fsm/next_state[0] ), .B(
        invader_bullet_coord_y[0]), .Y(\invader_bullet_fsm/n24 ) );
  OAI21X1 U362 ( .A(\invader_bullet_fsm/n24 ), .B(n202), .C(
        \invader_bullet_fsm/n27 ), .Y(\invader_bullet_fsm/n45 ) );
  NAND2X1 U363 ( .A(\invader_bullet_fsm/n21 ), .B(\invader_bullet_fsm/n22 ), 
        .Y(\invader_bullet_fsm/n44 ) );
endmodule

