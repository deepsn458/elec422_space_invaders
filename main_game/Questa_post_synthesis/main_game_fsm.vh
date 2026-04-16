/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Wed Apr 15 22:43:27 2026
/////////////////////////////////////////////////////////////


module main_game_fsm ( clka, clkb, global_reset, player_left_input, 
        player_right_input, player_shoot_input, player_display, 
        player_coordinate_x, player_coordinate_y, invaders_display, 
        invader1_coordinate_x, invader1_coordinate_y, invader2_coordinate_x, 
        invader2_coordinate_y, invader3_coordinate_x, invader3_coordinate_y, 
        invader4_coordinate_x, invader4_coordinate_y, invaderbullet_coord_x, 
        invaderbullet_coord_y, invaderbullet_player_collision_signal, 
        invaderbullet_shield_collision_signal, invader_outofbounds_signal_1, 
        invader_outofbounds_signal_2, invader_outofbounds_signal_3, 
        invader_outofbounds_signal_4, player_left_motion, player_right_motion, 
        closest_invader_coord_x, closest_invader_coord_y, play, reset, 
        invader_direction, playerbullet_fire, invaderbullet_fire, move_down, 
        state );
  input [5:0] player_coordinate_x;
  input [5:0] player_coordinate_y;
  input [3:0] invaders_display;
  input [5:0] invader1_coordinate_x;
  input [5:0] invader1_coordinate_y;
  input [5:0] invader2_coordinate_x;
  input [5:0] invader2_coordinate_y;
  input [5:0] invader3_coordinate_x;
  input [5:0] invader3_coordinate_y;
  input [5:0] invader4_coordinate_x;
  input [5:0] invader4_coordinate_y;
  input [5:0] invaderbullet_coord_x;
  input [5:0] invaderbullet_coord_y;
  output [5:0] closest_invader_coord_x;
  output [5:0] closest_invader_coord_y;
  output [1:0] state;
  input clka, clkb, global_reset, player_left_input, player_right_input,
         player_shoot_input, player_display,
         invaderbullet_player_collision_signal,
         invaderbullet_shield_collision_signal, invader_outofbounds_signal_1,
         invader_outofbounds_signal_2, invader_outofbounds_signal_3,
         invader_outofbounds_signal_4;
  output player_left_motion, player_right_motion, play, reset,
         invader_direction, playerbullet_fire, invaderbullet_fire, move_down;
  wire   N26, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N86, N92, N98, N110,
         N120, N121, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381;
  wire   [5:0] diff_alive1;
  wire   [5:0] diff_alive2;
  wire   [5:0] diff_alive3;
  wire   [5:0] diff_alive4;
  wire   [1:0] next_state;
  wire   [6:0] \sub_71_2/carry ;
  wire   [6:0] \sub_71/carry ;
  wire   [6:0] \sub_67_2/carry ;
  wire   [6:0] \sub_67/carry ;
  wire   [6:0] \sub_63_2/carry ;
  wire   [6:0] \sub_63/carry ;
  wire   [6:0] \sub_59_2/carry ;
  wire   [6:0] \sub_59/carry ;

  DFFNEGX1 \state_reg[0]  ( .D(n183), .CLK(n187), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N121), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[1]  ( .D(n182), .CLK(n187), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N120), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 invader_direction_reg ( .D(n181), .CLK(n187), .Q(invader_direction)
         );
  DFFNEGX1 move_down_reg ( .D(n180), .CLK(n187), .Q(move_down) );
  DFFNEGX1 invaderbullet_fire_reg ( .D(n179), .CLK(n187), .Q(
        invaderbullet_fire) );
  DFFNEGX1 playerbullet_fire_reg ( .D(n178), .CLK(n187), .Q(playerbullet_fire)
         );
  DFFNEGX1 player_left_motion_reg ( .D(n217), .CLK(n187), .Q(
        player_left_motion) );
  DFFNEGX1 player_right_motion_reg ( .D(n218), .CLK(n187), .Q(
        player_right_motion) );
  DFFNEGX1 play_reg ( .D(n177), .CLK(n187), .Q(play) );
  DFFNEGX1 reset_reg ( .D(n214), .CLK(n187), .Q(reset) );
  AOI21X1 U60 ( .A(n215), .B(reset), .C(n90), .Y(n89) );
  OAI21X1 U61 ( .A(n215), .B(n91), .C(n92), .Y(n177) );
  NAND2X1 U62 ( .A(play), .B(n215), .Y(n92) );
  AOI22X1 U63 ( .A(player_right_input), .B(n94), .C(player_right_motion), .D(
        n219), .Y(n93) );
  AOI22X1 U64 ( .A(player_left_input), .B(n94), .C(player_left_motion), .D(
        n219), .Y(n95) );
  OAI21X1 U65 ( .A(n216), .B(n221), .C(n96), .Y(n178) );
  NAND2X1 U66 ( .A(playerbullet_fire), .B(n219), .Y(n96) );
  OAI21X1 U67 ( .A(n97), .B(n295), .C(n216), .Y(n179) );
  NOR2X1 U68 ( .A(n219), .B(global_reset), .Y(n94) );
  OAI21X1 U69 ( .A(next_state[1]), .B(n293), .C(n220), .Y(n97) );
  OAI21X1 U70 ( .A(n98), .B(n99), .C(n100), .Y(n180) );
  OAI21X1 U71 ( .A(global_reset), .B(n98), .C(move_down), .Y(n100) );
  XNOR2X1 U72 ( .A(next_state[0]), .B(next_state[1]), .Y(n98) );
  OR2X1 U73 ( .A(n101), .B(n90), .Y(n181) );
  OAI21X1 U74 ( .A(next_state[1]), .B(next_state[0]), .C(n220), .Y(n90) );
  OAI22X1 U75 ( .A(invader_direction), .B(next_state[0]), .C(n294), .D(n91), 
        .Y(n101) );
  NOR2X1 U76 ( .A(n99), .B(n292), .Y(n182) );
  OAI22X1 U77 ( .A(n99), .B(n291), .C(n215), .D(n91), .Y(n183) );
  NAND2X1 U78 ( .A(next_state[0]), .B(n220), .Y(n91) );
  NAND2X1 U79 ( .A(next_state[1]), .B(n220), .Y(n99) );
  AOI22X1 U80 ( .A(n245), .B(diff_alive4[5]), .C(diff_alive3[5]), .D(N92), .Y(
        n102) );
  AOI22X1 U81 ( .A(n245), .B(diff_alive4[4]), .C(diff_alive3[4]), .D(N92), .Y(
        n103) );
  AOI22X1 U82 ( .A(n245), .B(diff_alive4[3]), .C(diff_alive3[3]), .D(N92), .Y(
        n104) );
  AOI22X1 U83 ( .A(n245), .B(diff_alive4[2]), .C(diff_alive3[2]), .D(N92), .Y(
        n105) );
  AOI22X1 U84 ( .A(n245), .B(diff_alive4[1]), .C(diff_alive3[1]), .D(N92), .Y(
        n106) );
  AOI22X1 U85 ( .A(n245), .B(diff_alive4[0]), .C(diff_alive3[0]), .D(N92), .Y(
        n107) );
  AOI22X1 U86 ( .A(n228), .B(diff_alive2[5]), .C(diff_alive1[5]), .D(N86), .Y(
        n108) );
  AOI22X1 U87 ( .A(n228), .B(diff_alive2[4]), .C(diff_alive1[4]), .D(N86), .Y(
        n109) );
  AOI22X1 U88 ( .A(n228), .B(diff_alive2[3]), .C(diff_alive1[3]), .D(N86), .Y(
        n110) );
  AOI22X1 U89 ( .A(n228), .B(diff_alive2[2]), .C(diff_alive1[2]), .D(N86), .Y(
        n111) );
  AOI22X1 U90 ( .A(n228), .B(diff_alive2[1]), .C(diff_alive1[1]), .D(N86), .Y(
        n112) );
  AOI22X1 U91 ( .A(n228), .B(diff_alive2[0]), .C(diff_alive1[0]), .D(N86), .Y(
        n113) );
  NAND2X1 U92 ( .A(n114), .B(invaders_display[3]), .Y(diff_alive4[5]) );
  AOI22X1 U93 ( .A(N81), .B(n256), .C(N75), .D(N68), .Y(n114) );
  NAND2X1 U94 ( .A(n115), .B(invaders_display[3]), .Y(diff_alive4[4]) );
  AOI22X1 U95 ( .A(N80), .B(n256), .C(N74), .D(N68), .Y(n115) );
  NAND2X1 U96 ( .A(n116), .B(invaders_display[3]), .Y(diff_alive4[3]) );
  AOI22X1 U97 ( .A(N79), .B(n256), .C(N73), .D(N68), .Y(n116) );
  NAND2X1 U98 ( .A(n117), .B(invaders_display[3]), .Y(diff_alive4[2]) );
  AOI22X1 U99 ( .A(N78), .B(n256), .C(N72), .D(N68), .Y(n117) );
  NAND2X1 U100 ( .A(n118), .B(invaders_display[3]), .Y(diff_alive4[1]) );
  AOI22X1 U101 ( .A(N77), .B(n256), .C(N71), .D(N68), .Y(n118) );
  NAND2X1 U102 ( .A(n119), .B(invaders_display[3]), .Y(diff_alive4[0]) );
  AOI22X1 U103 ( .A(N76), .B(n256), .C(N70), .D(N68), .Y(n119) );
  NAND2X1 U104 ( .A(n120), .B(invaders_display[2]), .Y(diff_alive3[5]) );
  AOI22X1 U105 ( .A(N67), .B(n252), .C(N61), .D(N54), .Y(n120) );
  NAND2X1 U106 ( .A(n121), .B(invaders_display[2]), .Y(diff_alive3[4]) );
  AOI22X1 U107 ( .A(N66), .B(n252), .C(N60), .D(N54), .Y(n121) );
  NAND2X1 U108 ( .A(n122), .B(invaders_display[2]), .Y(diff_alive3[3]) );
  AOI22X1 U109 ( .A(N65), .B(n252), .C(N59), .D(N54), .Y(n122) );
  NAND2X1 U110 ( .A(n123), .B(invaders_display[2]), .Y(diff_alive3[2]) );
  AOI22X1 U111 ( .A(N64), .B(n252), .C(N58), .D(N54), .Y(n123) );
  NAND2X1 U112 ( .A(n124), .B(invaders_display[2]), .Y(diff_alive3[1]) );
  AOI22X1 U113 ( .A(N63), .B(n252), .C(N57), .D(N54), .Y(n124) );
  NAND2X1 U114 ( .A(n125), .B(invaders_display[2]), .Y(diff_alive3[0]) );
  AOI22X1 U115 ( .A(N62), .B(n252), .C(N56), .D(N54), .Y(n125) );
  NAND2X1 U116 ( .A(n126), .B(invaders_display[1]), .Y(diff_alive2[5]) );
  AOI22X1 U117 ( .A(N53), .B(n239), .C(N47), .D(N40), .Y(n126) );
  NAND2X1 U118 ( .A(n127), .B(invaders_display[1]), .Y(diff_alive2[4]) );
  AOI22X1 U119 ( .A(N52), .B(n239), .C(N46), .D(N40), .Y(n127) );
  NAND2X1 U120 ( .A(n128), .B(invaders_display[1]), .Y(diff_alive2[3]) );
  AOI22X1 U121 ( .A(N51), .B(n239), .C(N45), .D(N40), .Y(n128) );
  NAND2X1 U122 ( .A(n129), .B(invaders_display[1]), .Y(diff_alive2[2]) );
  AOI22X1 U123 ( .A(N50), .B(n239), .C(N44), .D(N40), .Y(n129) );
  NAND2X1 U124 ( .A(n130), .B(invaders_display[1]), .Y(diff_alive2[1]) );
  AOI22X1 U125 ( .A(N49), .B(n239), .C(N43), .D(N40), .Y(n130) );
  NAND2X1 U126 ( .A(n131), .B(invaders_display[1]), .Y(diff_alive2[0]) );
  AOI22X1 U127 ( .A(N48), .B(n239), .C(N42), .D(N40), .Y(n131) );
  NAND2X1 U128 ( .A(n132), .B(invaders_display[0]), .Y(diff_alive1[5]) );
  AOI22X1 U129 ( .A(N39), .B(n235), .C(N33), .D(N26), .Y(n132) );
  NAND2X1 U130 ( .A(n133), .B(invaders_display[0]), .Y(diff_alive1[4]) );
  AOI22X1 U131 ( .A(N38), .B(n235), .C(N32), .D(N26), .Y(n133) );
  NAND2X1 U132 ( .A(n134), .B(invaders_display[0]), .Y(diff_alive1[3]) );
  AOI22X1 U133 ( .A(N37), .B(n235), .C(N31), .D(N26), .Y(n134) );
  NAND2X1 U134 ( .A(n135), .B(invaders_display[0]), .Y(diff_alive1[2]) );
  AOI22X1 U135 ( .A(N36), .B(n235), .C(N30), .D(N26), .Y(n135) );
  NAND2X1 U136 ( .A(n136), .B(invaders_display[0]), .Y(diff_alive1[1]) );
  AOI22X1 U137 ( .A(N35), .B(n235), .C(N29), .D(N26), .Y(n136) );
  NAND2X1 U138 ( .A(n137), .B(invaders_display[0]), .Y(diff_alive1[0]) );
  AOI22X1 U139 ( .A(N34), .B(n235), .C(N28), .D(N26), .Y(n137) );
  NAND2X1 U140 ( .A(n138), .B(n139), .Y(closest_invader_coord_y[5]) );
  AOI22X1 U141 ( .A(invader2_coordinate_y[5]), .B(n185), .C(
        invader1_coordinate_y[5]), .D(n184), .Y(n139) );
  AOI22X1 U142 ( .A(invader4_coordinate_y[5]), .B(n211), .C(
        invader3_coordinate_y[5]), .D(n213), .Y(n138) );
  NAND2X1 U143 ( .A(n144), .B(n145), .Y(closest_invader_coord_y[4]) );
  AOI22X1 U144 ( .A(invader2_coordinate_y[4]), .B(n185), .C(
        invader1_coordinate_y[4]), .D(n184), .Y(n145) );
  AOI22X1 U145 ( .A(invader4_coordinate_y[4]), .B(n210), .C(
        invader3_coordinate_y[4]), .D(n212), .Y(n144) );
  NAND2X1 U146 ( .A(n146), .B(n147), .Y(closest_invader_coord_y[3]) );
  AOI22X1 U147 ( .A(invader2_coordinate_y[3]), .B(n185), .C(
        invader1_coordinate_y[3]), .D(n184), .Y(n147) );
  AOI22X1 U148 ( .A(invader4_coordinate_y[3]), .B(n211), .C(
        invader3_coordinate_y[3]), .D(n213), .Y(n146) );
  NAND2X1 U149 ( .A(n148), .B(n149), .Y(closest_invader_coord_y[2]) );
  AOI22X1 U150 ( .A(invader2_coordinate_y[2]), .B(n185), .C(
        invader1_coordinate_y[2]), .D(n184), .Y(n149) );
  AOI22X1 U151 ( .A(invader4_coordinate_y[2]), .B(n210), .C(
        invader3_coordinate_y[2]), .D(n212), .Y(n148) );
  NAND2X1 U152 ( .A(n150), .B(n151), .Y(closest_invader_coord_y[1]) );
  AOI22X1 U153 ( .A(invader2_coordinate_y[1]), .B(n185), .C(
        invader1_coordinate_y[1]), .D(n184), .Y(n151) );
  AOI22X1 U154 ( .A(invader4_coordinate_y[1]), .B(n211), .C(
        invader3_coordinate_y[1]), .D(n213), .Y(n150) );
  NAND2X1 U155 ( .A(n152), .B(n153), .Y(closest_invader_coord_y[0]) );
  AOI22X1 U156 ( .A(invader2_coordinate_y[0]), .B(n185), .C(
        invader1_coordinate_y[0]), .D(n184), .Y(n153) );
  AOI22X1 U157 ( .A(invader4_coordinate_y[0]), .B(n210), .C(
        invader3_coordinate_y[0]), .D(n212), .Y(n152) );
  NAND2X1 U158 ( .A(n154), .B(n155), .Y(closest_invader_coord_x[5]) );
  AOI22X1 U159 ( .A(invader2_coordinate_x[5]), .B(n185), .C(
        invader1_coordinate_x[5]), .D(n184), .Y(n155) );
  AOI22X1 U160 ( .A(invader4_coordinate_x[5]), .B(n211), .C(
        invader3_coordinate_x[5]), .D(n213), .Y(n154) );
  NAND2X1 U161 ( .A(n156), .B(n157), .Y(closest_invader_coord_x[4]) );
  AOI22X1 U162 ( .A(invader2_coordinate_x[4]), .B(n185), .C(
        invader1_coordinate_x[4]), .D(n184), .Y(n157) );
  AOI22X1 U163 ( .A(invader4_coordinate_x[4]), .B(n210), .C(
        invader3_coordinate_x[4]), .D(n212), .Y(n156) );
  NAND2X1 U164 ( .A(n158), .B(n159), .Y(closest_invader_coord_x[3]) );
  AOI22X1 U165 ( .A(n195), .B(n185), .C(n197), .D(n184), .Y(n159) );
  AOI22X1 U166 ( .A(n191), .B(n211), .C(n193), .D(n213), .Y(n158) );
  NAND2X1 U167 ( .A(n160), .B(n161), .Y(closest_invader_coord_x[2]) );
  AOI22X1 U168 ( .A(invader2_coordinate_x[2]), .B(n185), .C(
        invader1_coordinate_x[2]), .D(n184), .Y(n161) );
  AOI22X1 U169 ( .A(invader4_coordinate_x[2]), .B(n210), .C(
        invader3_coordinate_x[2]), .D(n212), .Y(n160) );
  NAND2X1 U170 ( .A(n162), .B(n163), .Y(closest_invader_coord_x[1]) );
  AOI22X1 U171 ( .A(n194), .B(n185), .C(n196), .D(n184), .Y(n163) );
  AOI22X1 U172 ( .A(n190), .B(n211), .C(n192), .D(n213), .Y(n162) );
  NAND2X1 U173 ( .A(n164), .B(n165), .Y(closest_invader_coord_x[0]) );
  AOI22X1 U174 ( .A(invader2_coordinate_x[0]), .B(n185), .C(
        invader1_coordinate_x[0]), .D(n184), .Y(n165) );
  AOI22X1 U175 ( .A(invader4_coordinate_x[0]), .B(n210), .C(
        invader3_coordinate_x[0]), .D(n212), .Y(n164) );
  NOR2X1 U178 ( .A(n290), .B(n166), .Y(N121) );
  OAI21X1 U179 ( .A(n166), .B(n167), .C(n168), .Y(N120) );
  OAI21X1 U180 ( .A(player_shoot_input), .B(state[1]), .C(n169), .Y(n168) );
  NOR2X1 U181 ( .A(state[0]), .B(global_reset), .Y(n169) );
  NAND2X1 U182 ( .A(n170), .B(n171), .Y(n167) );
  NOR2X1 U183 ( .A(invader_outofbounds_signal_4), .B(
        invader_outofbounds_signal_3), .Y(n171) );
  NOR2X1 U184 ( .A(invader_outofbounds_signal_2), .B(
        invader_outofbounds_signal_1), .Y(n170) );
  NAND3X1 U185 ( .A(n172), .B(player_display), .C(n173), .Y(n166) );
  NOR2X1 U186 ( .A(N110), .B(n174), .Y(n173) );
  NAND2X1 U187 ( .A(n220), .B(n292), .Y(n174) );
  AOI21X1 U188 ( .A(n175), .B(n176), .C(n291), .Y(n172) );
  NOR2X1 U189 ( .A(invaders_display[3]), .B(invaders_display[2]), .Y(n176) );
  NOR2X1 U190 ( .A(invaders_display[1]), .B(invaders_display[0]), .Y(n175) );
  FAX1 \sub_71_2/U2_1  ( .A(n190), .B(n200), .C(\sub_71_2/carry [1]), .YC(
        \sub_71_2/carry [2]), .YS(N77) );
  FAX1 \sub_71_2/U2_2  ( .A(invader4_coordinate_x[2]), .B(n202), .C(
        \sub_71_2/carry [2]), .YC(\sub_71_2/carry [3]), .YS(N78) );
  FAX1 \sub_71_2/U2_3  ( .A(n191), .B(n204), .C(\sub_71_2/carry [3]), .YC(
        \sub_71_2/carry [4]), .YS(N79) );
  FAX1 \sub_71_2/U2_4  ( .A(invader4_coordinate_x[4]), .B(n206), .C(
        \sub_71_2/carry [4]), .YC(\sub_71_2/carry [5]), .YS(N80) );
  FAX1 \sub_71_2/U2_5  ( .A(invader4_coordinate_x[5]), .B(n208), .C(
        \sub_71_2/carry [5]), .YC(), .YS(N81) );
  FAX1 \sub_71/U2_1  ( .A(n201), .B(n288), .C(\sub_71/carry [1]), .YC(
        \sub_71/carry [2]), .YS(N71) );
  FAX1 \sub_71/U2_2  ( .A(n203), .B(n287), .C(\sub_71/carry [2]), .YC(
        \sub_71/carry [3]), .YS(N72) );
  FAX1 \sub_71/U2_3  ( .A(n205), .B(n286), .C(\sub_71/carry [3]), .YC(
        \sub_71/carry [4]), .YS(N73) );
  FAX1 \sub_71/U2_4  ( .A(player_coordinate_x[4]), .B(n285), .C(
        \sub_71/carry [4]), .YC(\sub_71/carry [5]), .YS(N74) );
  FAX1 \sub_71/U2_5  ( .A(n209), .B(n284), .C(\sub_71/carry [5]), .YC(), .YS(
        N75) );
  FAX1 \sub_67_2/U2_1  ( .A(n192), .B(n200), .C(\sub_67_2/carry [1]), .YC(
        \sub_67_2/carry [2]), .YS(N63) );
  FAX1 \sub_67_2/U2_2  ( .A(invader3_coordinate_x[2]), .B(n202), .C(
        \sub_67_2/carry [2]), .YC(\sub_67_2/carry [3]), .YS(N64) );
  FAX1 \sub_67_2/U2_3  ( .A(n193), .B(n204), .C(\sub_67_2/carry [3]), .YC(
        \sub_67_2/carry [4]), .YS(N65) );
  FAX1 \sub_67_2/U2_4  ( .A(invader3_coordinate_x[4]), .B(n206), .C(
        \sub_67_2/carry [4]), .YC(\sub_67_2/carry [5]), .YS(N66) );
  FAX1 \sub_67_2/U2_5  ( .A(invader3_coordinate_x[5]), .B(n208), .C(
        \sub_67_2/carry [5]), .YC(), .YS(N67) );
  FAX1 \sub_67/U2_1  ( .A(n201), .B(n282), .C(\sub_67/carry [1]), .YC(
        \sub_67/carry [2]), .YS(N57) );
  FAX1 \sub_67/U2_2  ( .A(player_coordinate_x[2]), .B(n281), .C(
        \sub_67/carry [2]), .YC(\sub_67/carry [3]), .YS(N58) );
  FAX1 \sub_67/U2_3  ( .A(n205), .B(n280), .C(\sub_67/carry [3]), .YC(
        \sub_67/carry [4]), .YS(N59) );
  FAX1 \sub_67/U2_4  ( .A(n207), .B(n279), .C(\sub_67/carry [4]), .YC(
        \sub_67/carry [5]), .YS(N60) );
  FAX1 \sub_67/U2_5  ( .A(player_coordinate_x[5]), .B(n278), .C(
        \sub_67/carry [5]), .YC(), .YS(N61) );
  FAX1 \sub_63_2/U2_1  ( .A(n194), .B(n200), .C(\sub_63_2/carry [1]), .YC(
        \sub_63_2/carry [2]), .YS(N49) );
  FAX1 \sub_63_2/U2_2  ( .A(invader2_coordinate_x[2]), .B(n202), .C(
        \sub_63_2/carry [2]), .YC(\sub_63_2/carry [3]), .YS(N50) );
  FAX1 \sub_63_2/U2_3  ( .A(n195), .B(n204), .C(\sub_63_2/carry [3]), .YC(
        \sub_63_2/carry [4]), .YS(N51) );
  FAX1 \sub_63_2/U2_4  ( .A(invader2_coordinate_x[4]), .B(n206), .C(
        \sub_63_2/carry [4]), .YC(\sub_63_2/carry [5]), .YS(N52) );
  FAX1 \sub_63_2/U2_5  ( .A(invader2_coordinate_x[5]), .B(n208), .C(
        \sub_63_2/carry [5]), .YC(), .YS(N53) );
  FAX1 \sub_63/U2_1  ( .A(n201), .B(n276), .C(\sub_63/carry [1]), .YC(
        \sub_63/carry [2]), .YS(N43) );
  FAX1 \sub_63/U2_2  ( .A(n203), .B(n275), .C(\sub_63/carry [2]), .YC(
        \sub_63/carry [3]), .YS(N44) );
  FAX1 \sub_63/U2_3  ( .A(n205), .B(n274), .C(\sub_63/carry [3]), .YC(
        \sub_63/carry [4]), .YS(N45) );
  FAX1 \sub_63/U2_4  ( .A(n207), .B(n273), .C(\sub_63/carry [4]), .YC(
        \sub_63/carry [5]), .YS(N46) );
  FAX1 \sub_63/U2_5  ( .A(n209), .B(n272), .C(\sub_63/carry [5]), .YC(), .YS(
        N47) );
  FAX1 \sub_59_2/U2_1  ( .A(n196), .B(n200), .C(\sub_59_2/carry [1]), .YC(
        \sub_59_2/carry [2]), .YS(N35) );
  FAX1 \sub_59_2/U2_2  ( .A(invader1_coordinate_x[2]), .B(n202), .C(
        \sub_59_2/carry [2]), .YC(\sub_59_2/carry [3]), .YS(N36) );
  FAX1 \sub_59_2/U2_3  ( .A(n197), .B(n204), .C(\sub_59_2/carry [3]), .YC(
        \sub_59_2/carry [4]), .YS(N37) );
  FAX1 \sub_59_2/U2_4  ( .A(invader1_coordinate_x[4]), .B(n206), .C(
        \sub_59_2/carry [4]), .YC(\sub_59_2/carry [5]), .YS(N38) );
  FAX1 \sub_59_2/U2_5  ( .A(invader1_coordinate_x[5]), .B(n208), .C(
        \sub_59_2/carry [5]), .YC(), .YS(N39) );
  FAX1 \sub_59/U2_1  ( .A(n201), .B(n270), .C(\sub_59/carry [1]), .YC(
        \sub_59/carry [2]), .YS(N29) );
  FAX1 \sub_59/U2_2  ( .A(n203), .B(n269), .C(\sub_59/carry [2]), .YC(
        \sub_59/carry [3]), .YS(N30) );
  FAX1 \sub_59/U2_3  ( .A(n205), .B(n268), .C(\sub_59/carry [3]), .YC(
        \sub_59/carry [4]), .YS(N31) );
  FAX1 \sub_59/U2_4  ( .A(n207), .B(n267), .C(\sub_59/carry [4]), .YC(
        \sub_59/carry [5]), .YS(N32) );
  FAX1 \sub_59/U2_5  ( .A(n209), .B(n266), .C(\sub_59/carry [5]), .YC(), .YS(
        N33) );
  AND2X2 U191 ( .A(N98), .B(N86), .Y(n184) );
  AND2X2 U192 ( .A(N98), .B(n228), .Y(n185) );
  INVX1 U193 ( .A(clkb), .Y(n186) );
  INVX2 U194 ( .A(n186), .Y(n187) );
  INVX2 U195 ( .A(n188), .Y(n212) );
  INVX2 U196 ( .A(n188), .Y(n213) );
  INVX2 U197 ( .A(n189), .Y(n210) );
  INVX2 U198 ( .A(n189), .Y(n211) );
  OR2X1 U199 ( .A(n245), .B(N98), .Y(n188) );
  OR2X1 U200 ( .A(N92), .B(N98), .Y(n189) );
  INVX2 U201 ( .A(n198), .Y(n199) );
  INVX2 U202 ( .A(n202), .Y(n203) );
  INVX2 U203 ( .A(n208), .Y(n209) );
  INVX2 U204 ( .A(n206), .Y(n207) );
  INVX2 U205 ( .A(player_coordinate_x[0]), .Y(n198) );
  INVX2 U206 ( .A(n200), .Y(n201) );
  INVX2 U207 ( .A(player_coordinate_x[1]), .Y(n200) );
  INVX2 U208 ( .A(n204), .Y(n205) );
  INVX2 U209 ( .A(player_coordinate_x[3]), .Y(n204) );
  INVX2 U210 ( .A(player_coordinate_x[2]), .Y(n202) );
  BUFX2 U211 ( .A(invader2_coordinate_x[1]), .Y(n194) );
  BUFX2 U212 ( .A(invader1_coordinate_x[1]), .Y(n196) );
  BUFX2 U213 ( .A(invader3_coordinate_x[1]), .Y(n192) );
  BUFX2 U214 ( .A(invader4_coordinate_x[1]), .Y(n190) );
  BUFX2 U215 ( .A(invader2_coordinate_x[3]), .Y(n195) );
  BUFX2 U216 ( .A(invader1_coordinate_x[3]), .Y(n197) );
  BUFX2 U217 ( .A(invader4_coordinate_x[3]), .Y(n191) );
  BUFX2 U218 ( .A(invader3_coordinate_x[3]), .Y(n193) );
  INVX2 U219 ( .A(player_coordinate_x[5]), .Y(n208) );
  INVX2 U220 ( .A(player_coordinate_x[4]), .Y(n206) );
  OR2X1 U221 ( .A(invader4_coordinate_x[0]), .B(n198), .Y(\sub_71_2/carry [1])
         );
  XNOR2X1 U222 ( .A(n198), .B(invader4_coordinate_x[0]), .Y(N76) );
  OR2X1 U223 ( .A(n199), .B(n289), .Y(\sub_71/carry [1]) );
  XNOR2X1 U224 ( .A(n289), .B(player_coordinate_x[0]), .Y(N70) );
  OR2X1 U225 ( .A(invader3_coordinate_x[0]), .B(n198), .Y(\sub_67_2/carry [1])
         );
  XNOR2X1 U226 ( .A(n198), .B(invader3_coordinate_x[0]), .Y(N62) );
  OR2X1 U227 ( .A(n199), .B(n283), .Y(\sub_67/carry [1]) );
  XNOR2X1 U228 ( .A(n283), .B(n199), .Y(N56) );
  OR2X1 U229 ( .A(invader2_coordinate_x[0]), .B(n198), .Y(\sub_63_2/carry [1])
         );
  XNOR2X1 U230 ( .A(n198), .B(invader2_coordinate_x[0]), .Y(N48) );
  OR2X1 U231 ( .A(n199), .B(n277), .Y(\sub_63/carry [1]) );
  XNOR2X1 U232 ( .A(n277), .B(player_coordinate_x[0]), .Y(N42) );
  OR2X1 U233 ( .A(invader1_coordinate_x[0]), .B(n198), .Y(\sub_59_2/carry [1])
         );
  XNOR2X1 U234 ( .A(n198), .B(invader1_coordinate_x[0]), .Y(N34) );
  OR2X1 U235 ( .A(n199), .B(n271), .Y(\sub_59/carry [1]) );
  XNOR2X1 U236 ( .A(n271), .B(n199), .Y(N28) );
  AND2X2 U237 ( .A(n381), .B(n380), .Y(N110) );
  INVX2 U238 ( .A(n89), .Y(n214) );
  INVX2 U239 ( .A(n99), .Y(n215) );
  INVX2 U240 ( .A(n94), .Y(n216) );
  INVX2 U241 ( .A(n95), .Y(n217) );
  INVX2 U242 ( .A(n93), .Y(n218) );
  INVX2 U243 ( .A(n97), .Y(n219) );
  INVX2 U244 ( .A(global_reset), .Y(n220) );
  INVX2 U245 ( .A(player_shoot_input), .Y(n221) );
  INVX2 U246 ( .A(n113), .Y(n222) );
  INVX2 U247 ( .A(n112), .Y(n223) );
  INVX2 U248 ( .A(n375), .Y(n224) );
  INVX2 U249 ( .A(n371), .Y(n225) );
  INVX2 U250 ( .A(n110), .Y(n226) );
  INVX2 U251 ( .A(n379), .Y(n227) );
  INVX2 U252 ( .A(N86), .Y(n228) );
  INVX2 U253 ( .A(n327), .Y(n229) );
  INVX2 U254 ( .A(diff_alive1[2]), .Y(n230) );
  INVX2 U255 ( .A(n323), .Y(n231) );
  INVX2 U256 ( .A(diff_alive1[4]), .Y(n232) );
  INVX2 U257 ( .A(n331), .Y(n233) );
  INVX2 U258 ( .A(diff_alive1[5]), .Y(n234) );
  INVX2 U259 ( .A(N26), .Y(n235) );
  INVX2 U260 ( .A(n307), .Y(n236) );
  INVX2 U261 ( .A(diff_alive2[1]), .Y(n237) );
  INVX2 U262 ( .A(diff_alive2[3]), .Y(n238) );
  INVX2 U263 ( .A(N40), .Y(n239) );
  INVX2 U264 ( .A(n319), .Y(n240) );
  INVX2 U265 ( .A(n107), .Y(n241) );
  INVX2 U266 ( .A(n105), .Y(n242) );
  INVX2 U267 ( .A(n103), .Y(n243) );
  INVX2 U268 ( .A(n102), .Y(n244) );
  INVX2 U269 ( .A(N92), .Y(n245) );
  INVX2 U270 ( .A(n363), .Y(n246) );
  INVX2 U271 ( .A(diff_alive3[2]), .Y(n247) );
  INVX2 U272 ( .A(n359), .Y(n248) );
  INVX2 U273 ( .A(diff_alive3[4]), .Y(n249) );
  INVX2 U274 ( .A(n367), .Y(n250) );
  INVX2 U275 ( .A(diff_alive3[5]), .Y(n251) );
  INVX2 U276 ( .A(N54), .Y(n252) );
  INVX2 U277 ( .A(n343), .Y(n253) );
  INVX2 U278 ( .A(diff_alive4[1]), .Y(n254) );
  INVX2 U279 ( .A(diff_alive4[3]), .Y(n255) );
  INVX2 U280 ( .A(N68), .Y(n256) );
  INVX2 U281 ( .A(n355), .Y(n257) );
  INVX2 U282 ( .A(n303), .Y(n258) );
  INVX2 U283 ( .A(n299), .Y(n259) );
  INVX2 U284 ( .A(n315), .Y(n260) );
  INVX2 U285 ( .A(n311), .Y(n261) );
  INVX2 U286 ( .A(n339), .Y(n262) );
  INVX2 U287 ( .A(n335), .Y(n263) );
  INVX2 U288 ( .A(n351), .Y(n264) );
  INVX2 U289 ( .A(n347), .Y(n265) );
  INVX2 U290 ( .A(invader1_coordinate_x[5]), .Y(n266) );
  INVX2 U291 ( .A(invader1_coordinate_x[4]), .Y(n267) );
  INVX2 U292 ( .A(n197), .Y(n268) );
  INVX2 U293 ( .A(invader1_coordinate_x[2]), .Y(n269) );
  INVX2 U294 ( .A(n196), .Y(n270) );
  INVX2 U295 ( .A(invader1_coordinate_x[0]), .Y(n271) );
  INVX2 U296 ( .A(invader2_coordinate_x[5]), .Y(n272) );
  INVX2 U297 ( .A(invader2_coordinate_x[4]), .Y(n273) );
  INVX2 U298 ( .A(n195), .Y(n274) );
  INVX2 U299 ( .A(invader2_coordinate_x[2]), .Y(n275) );
  INVX2 U300 ( .A(n194), .Y(n276) );
  INVX2 U301 ( .A(invader2_coordinate_x[0]), .Y(n277) );
  INVX2 U302 ( .A(invader3_coordinate_x[5]), .Y(n278) );
  INVX2 U303 ( .A(invader3_coordinate_x[4]), .Y(n279) );
  INVX2 U304 ( .A(n193), .Y(n280) );
  INVX2 U305 ( .A(invader3_coordinate_x[2]), .Y(n281) );
  INVX2 U306 ( .A(n192), .Y(n282) );
  INVX2 U307 ( .A(invader3_coordinate_x[0]), .Y(n283) );
  INVX2 U308 ( .A(invader4_coordinate_x[5]), .Y(n284) );
  INVX2 U309 ( .A(invader4_coordinate_x[4]), .Y(n285) );
  INVX2 U310 ( .A(n191), .Y(n286) );
  INVX2 U311 ( .A(invader4_coordinate_x[2]), .Y(n287) );
  INVX2 U312 ( .A(n190), .Y(n288) );
  INVX2 U313 ( .A(invader4_coordinate_x[0]), .Y(n289) );
  INVX2 U314 ( .A(n167), .Y(n290) );
  INVX2 U315 ( .A(state[0]), .Y(n291) );
  INVX2 U316 ( .A(state[1]), .Y(n292) );
  INVX2 U317 ( .A(next_state[0]), .Y(n293) );
  INVX2 U318 ( .A(invader_direction), .Y(n294) );
  INVX2 U319 ( .A(invaderbullet_fire), .Y(n295) );
  NOR2X1 U320 ( .A(n266), .B(n209), .Y(n307) );
  AOI22X1 U321 ( .A(n207), .B(n267), .C(n209), .D(n266), .Y(n306) );
  OAI21X1 U322 ( .A(player_coordinate_x[4]), .B(n267), .C(n236), .Y(n305) );
  NAND2X1 U323 ( .A(n197), .B(n204), .Y(n299) );
  NAND3X1 U324 ( .A(n299), .B(n269), .C(n203), .Y(n296) );
  OAI21X1 U325 ( .A(n197), .B(n204), .C(n296), .Y(n303) );
  AOI21X1 U326 ( .A(n196), .B(n200), .C(invader1_coordinate_x[0]), .Y(n297) );
  NAND2X1 U327 ( .A(n297), .B(player_coordinate_x[0]), .Y(n298) );
  OAI21X1 U328 ( .A(n196), .B(n200), .C(n298), .Y(n302) );
  NOR2X1 U329 ( .A(n203), .B(n269), .Y(n300) );
  OAI21X1 U330 ( .A(n259), .B(n300), .C(n258), .Y(n301) );
  OAI21X1 U331 ( .A(n303), .B(n302), .C(n301), .Y(n304) );
  OAI22X1 U332 ( .A(n307), .B(n306), .C(n305), .D(n304), .Y(N26) );
  NOR2X1 U333 ( .A(n272), .B(n209), .Y(n319) );
  AOI22X1 U334 ( .A(n207), .B(n273), .C(n209), .D(n272), .Y(n318) );
  OAI21X1 U335 ( .A(n207), .B(n273), .C(n240), .Y(n317) );
  NAND2X1 U336 ( .A(n195), .B(n204), .Y(n311) );
  NAND3X1 U337 ( .A(n311), .B(n275), .C(n203), .Y(n308) );
  OAI21X1 U338 ( .A(n195), .B(n204), .C(n308), .Y(n315) );
  AOI21X1 U339 ( .A(n194), .B(n200), .C(invader2_coordinate_x[0]), .Y(n309) );
  NAND2X1 U340 ( .A(n309), .B(n199), .Y(n310) );
  OAI21X1 U341 ( .A(n194), .B(n200), .C(n310), .Y(n314) );
  NOR2X1 U342 ( .A(n203), .B(n275), .Y(n312) );
  OAI21X1 U343 ( .A(n261), .B(n312), .C(n260), .Y(n313) );
  OAI21X1 U344 ( .A(n315), .B(n314), .C(n313), .Y(n316) );
  OAI22X1 U345 ( .A(n319), .B(n318), .C(n317), .D(n316), .Y(N40) );
  NOR2X1 U346 ( .A(n234), .B(diff_alive2[5]), .Y(n331) );
  AOI22X1 U347 ( .A(diff_alive2[4]), .B(n232), .C(diff_alive2[5]), .D(n234), 
        .Y(n330) );
  OAI21X1 U348 ( .A(diff_alive2[4]), .B(n232), .C(n233), .Y(n329) );
  NAND2X1 U349 ( .A(diff_alive1[3]), .B(n238), .Y(n323) );
  NAND3X1 U350 ( .A(n323), .B(n230), .C(diff_alive2[2]), .Y(n320) );
  OAI21X1 U351 ( .A(diff_alive1[3]), .B(n238), .C(n320), .Y(n327) );
  AOI21X1 U352 ( .A(diff_alive1[1]), .B(n237), .C(diff_alive1[0]), .Y(n321) );
  NAND2X1 U353 ( .A(n321), .B(diff_alive2[0]), .Y(n322) );
  OAI21X1 U354 ( .A(diff_alive1[1]), .B(n237), .C(n322), .Y(n326) );
  NOR2X1 U355 ( .A(diff_alive2[2]), .B(n230), .Y(n324) );
  OAI21X1 U356 ( .A(n231), .B(n324), .C(n229), .Y(n325) );
  OAI21X1 U357 ( .A(n327), .B(n326), .C(n325), .Y(n328) );
  OAI22X1 U358 ( .A(n331), .B(n330), .C(n329), .D(n328), .Y(N86) );
  NOR2X1 U359 ( .A(n278), .B(n209), .Y(n343) );
  AOI22X1 U360 ( .A(player_coordinate_x[4]), .B(n279), .C(n209), .D(n278), .Y(
        n342) );
  OAI21X1 U361 ( .A(n207), .B(n279), .C(n253), .Y(n341) );
  NAND2X1 U362 ( .A(n193), .B(n204), .Y(n335) );
  NAND3X1 U363 ( .A(n335), .B(n281), .C(n203), .Y(n332) );
  OAI21X1 U364 ( .A(n193), .B(n204), .C(n332), .Y(n339) );
  AOI21X1 U365 ( .A(n192), .B(n200), .C(invader3_coordinate_x[0]), .Y(n333) );
  NAND2X1 U366 ( .A(n333), .B(player_coordinate_x[0]), .Y(n334) );
  OAI21X1 U367 ( .A(n192), .B(n200), .C(n334), .Y(n338) );
  NOR2X1 U368 ( .A(n203), .B(n281), .Y(n336) );
  OAI21X1 U369 ( .A(n263), .B(n336), .C(n262), .Y(n337) );
  OAI21X1 U370 ( .A(n339), .B(n338), .C(n337), .Y(n340) );
  OAI22X1 U371 ( .A(n343), .B(n342), .C(n341), .D(n340), .Y(N54) );
  NOR2X1 U372 ( .A(n284), .B(n209), .Y(n355) );
  AOI22X1 U373 ( .A(n207), .B(n285), .C(n209), .D(n284), .Y(n354) );
  OAI21X1 U374 ( .A(n207), .B(n285), .C(n257), .Y(n353) );
  NAND2X1 U375 ( .A(n191), .B(n204), .Y(n347) );
  NAND3X1 U376 ( .A(n347), .B(n287), .C(n203), .Y(n344) );
  OAI21X1 U377 ( .A(n191), .B(n204), .C(n344), .Y(n351) );
  AOI21X1 U378 ( .A(n190), .B(n200), .C(invader4_coordinate_x[0]), .Y(n345) );
  NAND2X1 U379 ( .A(n345), .B(n199), .Y(n346) );
  OAI21X1 U380 ( .A(n190), .B(n200), .C(n346), .Y(n350) );
  NOR2X1 U381 ( .A(n203), .B(n287), .Y(n348) );
  OAI21X1 U382 ( .A(n265), .B(n348), .C(n264), .Y(n349) );
  OAI21X1 U383 ( .A(n351), .B(n350), .C(n349), .Y(n352) );
  OAI22X1 U384 ( .A(n355), .B(n354), .C(n353), .D(n352), .Y(N68) );
  NOR2X1 U385 ( .A(n251), .B(diff_alive4[5]), .Y(n367) );
  AOI22X1 U386 ( .A(diff_alive4[4]), .B(n249), .C(diff_alive4[5]), .D(n251), 
        .Y(n366) );
  OAI21X1 U387 ( .A(diff_alive4[4]), .B(n249), .C(n250), .Y(n365) );
  NAND2X1 U388 ( .A(diff_alive3[3]), .B(n255), .Y(n359) );
  NAND3X1 U389 ( .A(n359), .B(n247), .C(diff_alive4[2]), .Y(n356) );
  OAI21X1 U390 ( .A(diff_alive3[3]), .B(n255), .C(n356), .Y(n363) );
  AOI21X1 U391 ( .A(diff_alive3[1]), .B(n254), .C(diff_alive3[0]), .Y(n357) );
  NAND2X1 U392 ( .A(n357), .B(diff_alive4[0]), .Y(n358) );
  OAI21X1 U393 ( .A(diff_alive3[1]), .B(n254), .C(n358), .Y(n362) );
  NOR2X1 U394 ( .A(diff_alive4[2]), .B(n247), .Y(n360) );
  OAI21X1 U395 ( .A(n248), .B(n360), .C(n246), .Y(n361) );
  OAI21X1 U396 ( .A(n363), .B(n362), .C(n361), .Y(n364) );
  OAI22X1 U397 ( .A(n367), .B(n366), .C(n365), .D(n364), .Y(N92) );
  NOR2X1 U398 ( .A(n108), .B(n244), .Y(n379) );
  AOI22X1 U399 ( .A(n243), .B(n109), .C(n244), .D(n108), .Y(n378) );
  OAI21X1 U400 ( .A(n243), .B(n109), .C(n227), .Y(n377) );
  NAND2X1 U401 ( .A(n226), .B(n104), .Y(n371) );
  NAND3X1 U402 ( .A(n371), .B(n111), .C(n242), .Y(n368) );
  OAI21X1 U403 ( .A(n226), .B(n104), .C(n368), .Y(n375) );
  AOI21X1 U404 ( .A(n223), .B(n106), .C(n222), .Y(n369) );
  NAND2X1 U405 ( .A(n369), .B(n241), .Y(n370) );
  OAI21X1 U406 ( .A(n223), .B(n106), .C(n370), .Y(n374) );
  NOR2X1 U407 ( .A(n242), .B(n111), .Y(n372) );
  OAI21X1 U408 ( .A(n225), .B(n372), .C(n224), .Y(n373) );
  OAI21X1 U409 ( .A(n375), .B(n374), .C(n373), .Y(n376) );
  OAI22X1 U410 ( .A(n379), .B(n378), .C(n377), .D(n376), .Y(N98) );
  AOI21X1 U411 ( .A(closest_invader_coord_y[2]), .B(closest_invader_coord_y[1]), .C(closest_invader_coord_y[3]), .Y(n381) );
  NOR2X1 U412 ( .A(closest_invader_coord_y[5]), .B(closest_invader_coord_y[4]), 
        .Y(n380) );
endmodule

