/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Wed Apr 15 17:59:58 2026
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
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N86, N92, N98, N105,
         \next_state[0] , prev_invader_outofbounds, n91, n92, n93, n94, n95,
         n96, n98, n99, n100, n101, n103, n104, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n174, n175, n176, n177, n178, n180, n181, n184, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381;
  wire   [5:0] diff_alive1;
  wire   [5:0] diff_alive2;
  wire   [5:0] diff_alive3;
  wire   [5:0] diff_alive4;
  wire   [6:0] \sub_72_2/carry ;
  wire   [6:0] \sub_72/carry ;
  wire   [6:0] \sub_68_2/carry ;
  wire   [6:0] \sub_68/carry ;
  wire   [6:0] \sub_64_2/carry ;
  wire   [6:0] \sub_64/carry ;
  wire   [6:0] \sub_60_2/carry ;
  wire   [6:0] \sub_60/carry ;
  assign state[1] = 1'b0;

  DFFNEGX1 \state_reg[0]  ( .D(n223), .CLK(n192), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(n188), .CLK(clka), .Q(\next_state[0] ) );
  DFFNEGX1 prev_invader_outofbounds_reg ( .D(n190), .CLK(n192), .Q(
        prev_invader_outofbounds) );
  DFFNEGX1 move_down_reg ( .D(n181), .CLK(n192), .Q(move_down) );
  DFFNEGX1 reset_reg ( .D(n96), .CLK(n192), .Q(reset) );
  DFFNEGX1 invaderbullet_fire_reg ( .D(n220), .CLK(n192), .Q(
        invaderbullet_fire) );
  DFFNEGX1 playerbullet_fire_reg ( .D(n184), .CLK(n192), .Q(playerbullet_fire)
         );
  DFFNEGX1 invader_direction_reg ( .D(n180), .CLK(n192), .Q(invader_direction)
         );
  DFFNEGX1 player_left_motion_reg ( .D(n221), .CLK(n192), .Q(
        player_left_motion) );
  DFFNEGX1 player_right_motion_reg ( .D(n222), .CLK(n192), .Q(
        player_right_motion) );
  DFFNEGX1 play_reg ( .D(n223), .CLK(n192), .Q(play) );
  AND2X2 U33 ( .A(n224), .B(n99), .Y(n98) );
  AOI22X1 U67 ( .A(player_right_input), .B(n92), .C(player_right_motion), .D(
        n93), .Y(n91) );
  AOI22X1 U68 ( .A(player_left_input), .B(n92), .C(player_left_motion), .D(n93), .Y(n94) );
  OAI21X1 U69 ( .A(invader_direction), .B(n189), .C(n95), .Y(n180) );
  OAI21X1 U70 ( .A(n189), .B(n96), .C(invader_direction), .Y(n95) );
  OAI21X1 U72 ( .A(n96), .B(n99), .C(n100), .Y(n181) );
  NAND2X1 U77 ( .A(n103), .B(n104), .Y(n101) );
  NOR2X1 U78 ( .A(invader_outofbounds_signal_4), .B(
        invader_outofbounds_signal_3), .Y(n104) );
  NOR2X1 U79 ( .A(invader_outofbounds_signal_2), .B(
        invader_outofbounds_signal_1), .Y(n103) );
  AOI21X1 U81 ( .A(n93), .B(invaderbullet_fire), .C(n92), .Y(n107) );
  OAI21X1 U82 ( .A(n219), .B(n225), .C(n108), .Y(n184) );
  NAND2X1 U83 ( .A(playerbullet_fire), .B(n93), .Y(n108) );
  NOR2X1 U84 ( .A(n93), .B(global_reset), .Y(n92) );
  NAND2X1 U88 ( .A(\next_state[0] ), .B(n224), .Y(n96) );
  AOI22X1 U89 ( .A(n249), .B(diff_alive4[5]), .C(diff_alive3[5]), .D(N92), .Y(
        n109) );
  AOI22X1 U90 ( .A(n249), .B(diff_alive4[4]), .C(diff_alive3[4]), .D(N92), .Y(
        n110) );
  AOI22X1 U91 ( .A(n249), .B(diff_alive4[3]), .C(diff_alive3[3]), .D(N92), .Y(
        n111) );
  AOI22X1 U92 ( .A(n249), .B(diff_alive4[2]), .C(diff_alive3[2]), .D(N92), .Y(
        n112) );
  AOI22X1 U93 ( .A(n249), .B(diff_alive4[1]), .C(diff_alive3[1]), .D(N92), .Y(
        n113) );
  AOI22X1 U94 ( .A(n249), .B(diff_alive4[0]), .C(diff_alive3[0]), .D(N92), .Y(
        n114) );
  AOI22X1 U95 ( .A(n232), .B(diff_alive2[5]), .C(diff_alive1[5]), .D(N86), .Y(
        n115) );
  AOI22X1 U96 ( .A(n232), .B(diff_alive2[4]), .C(diff_alive1[4]), .D(N86), .Y(
        n116) );
  AOI22X1 U97 ( .A(n232), .B(diff_alive2[3]), .C(diff_alive1[3]), .D(N86), .Y(
        n117) );
  AOI22X1 U98 ( .A(n232), .B(diff_alive2[2]), .C(diff_alive1[2]), .D(N86), .Y(
        n118) );
  AOI22X1 U99 ( .A(n232), .B(diff_alive2[1]), .C(diff_alive1[1]), .D(N86), .Y(
        n119) );
  AOI22X1 U100 ( .A(n232), .B(diff_alive2[0]), .C(diff_alive1[0]), .D(N86), 
        .Y(n120) );
  NAND2X1 U101 ( .A(n121), .B(invaders_display[3]), .Y(diff_alive4[5]) );
  AOI22X1 U102 ( .A(N81), .B(n260), .C(N75), .D(N68), .Y(n121) );
  NAND2X1 U103 ( .A(n122), .B(invaders_display[3]), .Y(diff_alive4[4]) );
  AOI22X1 U104 ( .A(N80), .B(n260), .C(N74), .D(N68), .Y(n122) );
  NAND2X1 U105 ( .A(n123), .B(invaders_display[3]), .Y(diff_alive4[3]) );
  AOI22X1 U106 ( .A(N79), .B(n260), .C(N73), .D(N68), .Y(n123) );
  NAND2X1 U107 ( .A(n124), .B(invaders_display[3]), .Y(diff_alive4[2]) );
  AOI22X1 U108 ( .A(N78), .B(n260), .C(N72), .D(N68), .Y(n124) );
  NAND2X1 U109 ( .A(n125), .B(invaders_display[3]), .Y(diff_alive4[1]) );
  AOI22X1 U110 ( .A(N77), .B(n260), .C(N71), .D(N68), .Y(n125) );
  NAND2X1 U111 ( .A(n126), .B(invaders_display[3]), .Y(diff_alive4[0]) );
  AOI22X1 U112 ( .A(N76), .B(n260), .C(N70), .D(N68), .Y(n126) );
  NAND2X1 U113 ( .A(n127), .B(invaders_display[2]), .Y(diff_alive3[5]) );
  AOI22X1 U114 ( .A(N67), .B(n256), .C(N61), .D(N54), .Y(n127) );
  NAND2X1 U115 ( .A(n128), .B(invaders_display[2]), .Y(diff_alive3[4]) );
  AOI22X1 U116 ( .A(N66), .B(n256), .C(N60), .D(N54), .Y(n128) );
  NAND2X1 U117 ( .A(n129), .B(invaders_display[2]), .Y(diff_alive3[3]) );
  AOI22X1 U118 ( .A(N65), .B(n256), .C(N59), .D(N54), .Y(n129) );
  NAND2X1 U119 ( .A(n130), .B(invaders_display[2]), .Y(diff_alive3[2]) );
  AOI22X1 U120 ( .A(N64), .B(n256), .C(N58), .D(N54), .Y(n130) );
  NAND2X1 U121 ( .A(n131), .B(invaders_display[2]), .Y(diff_alive3[1]) );
  AOI22X1 U122 ( .A(N63), .B(n256), .C(N57), .D(N54), .Y(n131) );
  NAND2X1 U123 ( .A(n132), .B(invaders_display[2]), .Y(diff_alive3[0]) );
  AOI22X1 U124 ( .A(N62), .B(n256), .C(N56), .D(N54), .Y(n132) );
  NAND2X1 U125 ( .A(n133), .B(invaders_display[1]), .Y(diff_alive2[5]) );
  AOI22X1 U126 ( .A(N53), .B(n243), .C(N47), .D(N40), .Y(n133) );
  NAND2X1 U127 ( .A(n134), .B(invaders_display[1]), .Y(diff_alive2[4]) );
  AOI22X1 U128 ( .A(N52), .B(n243), .C(N46), .D(N40), .Y(n134) );
  NAND2X1 U129 ( .A(n135), .B(invaders_display[1]), .Y(diff_alive2[3]) );
  AOI22X1 U130 ( .A(N51), .B(n243), .C(N45), .D(N40), .Y(n135) );
  NAND2X1 U131 ( .A(n136), .B(invaders_display[1]), .Y(diff_alive2[2]) );
  AOI22X1 U132 ( .A(N50), .B(n243), .C(N44), .D(N40), .Y(n136) );
  NAND2X1 U133 ( .A(n137), .B(invaders_display[1]), .Y(diff_alive2[1]) );
  AOI22X1 U134 ( .A(N49), .B(n243), .C(N43), .D(N40), .Y(n137) );
  NAND2X1 U135 ( .A(n138), .B(invaders_display[1]), .Y(diff_alive2[0]) );
  AOI22X1 U136 ( .A(N48), .B(n243), .C(N42), .D(N40), .Y(n138) );
  NAND2X1 U137 ( .A(n139), .B(invaders_display[0]), .Y(diff_alive1[5]) );
  AOI22X1 U138 ( .A(N39), .B(n239), .C(N33), .D(N26), .Y(n139) );
  NAND2X1 U139 ( .A(n140), .B(invaders_display[0]), .Y(diff_alive1[4]) );
  AOI22X1 U140 ( .A(N38), .B(n239), .C(N32), .D(N26), .Y(n140) );
  NAND2X1 U141 ( .A(n141), .B(invaders_display[0]), .Y(diff_alive1[3]) );
  AOI22X1 U142 ( .A(N37), .B(n239), .C(N31), .D(N26), .Y(n141) );
  NAND2X1 U143 ( .A(n142), .B(invaders_display[0]), .Y(diff_alive1[2]) );
  AOI22X1 U144 ( .A(N36), .B(n239), .C(N30), .D(N26), .Y(n142) );
  NAND2X1 U145 ( .A(n143), .B(invaders_display[0]), .Y(diff_alive1[1]) );
  AOI22X1 U146 ( .A(N35), .B(n239), .C(N29), .D(N26), .Y(n143) );
  NAND2X1 U147 ( .A(n144), .B(invaders_display[0]), .Y(diff_alive1[0]) );
  AOI22X1 U148 ( .A(N34), .B(n239), .C(N28), .D(N26), .Y(n144) );
  NAND2X1 U149 ( .A(n145), .B(n146), .Y(closest_invader_coord_y[5]) );
  AOI22X1 U150 ( .A(invader2_coordinate_y[5]), .B(n187), .C(
        invader1_coordinate_y[5]), .D(n186), .Y(n146) );
  AOI22X1 U151 ( .A(invader4_coordinate_y[5]), .B(n216), .C(
        invader3_coordinate_y[5]), .D(n218), .Y(n145) );
  NAND2X1 U152 ( .A(n151), .B(n152), .Y(closest_invader_coord_y[4]) );
  AOI22X1 U153 ( .A(invader2_coordinate_y[4]), .B(n187), .C(
        invader1_coordinate_y[4]), .D(n186), .Y(n152) );
  AOI22X1 U154 ( .A(invader4_coordinate_y[4]), .B(n215), .C(
        invader3_coordinate_y[4]), .D(n217), .Y(n151) );
  NAND2X1 U155 ( .A(n153), .B(n154), .Y(closest_invader_coord_y[3]) );
  AOI22X1 U156 ( .A(invader2_coordinate_y[3]), .B(n187), .C(
        invader1_coordinate_y[3]), .D(n186), .Y(n154) );
  AOI22X1 U157 ( .A(invader4_coordinate_y[3]), .B(n216), .C(
        invader3_coordinate_y[3]), .D(n218), .Y(n153) );
  NAND2X1 U158 ( .A(n155), .B(n156), .Y(closest_invader_coord_y[2]) );
  AOI22X1 U159 ( .A(invader2_coordinate_y[2]), .B(n187), .C(
        invader1_coordinate_y[2]), .D(n186), .Y(n156) );
  AOI22X1 U160 ( .A(invader4_coordinate_y[2]), .B(n215), .C(
        invader3_coordinate_y[2]), .D(n217), .Y(n155) );
  NAND2X1 U161 ( .A(n157), .B(n158), .Y(closest_invader_coord_y[1]) );
  AOI22X1 U162 ( .A(invader2_coordinate_y[1]), .B(n187), .C(
        invader1_coordinate_y[1]), .D(n186), .Y(n158) );
  AOI22X1 U163 ( .A(invader4_coordinate_y[1]), .B(n216), .C(
        invader3_coordinate_y[1]), .D(n218), .Y(n157) );
  NAND2X1 U164 ( .A(n159), .B(n160), .Y(closest_invader_coord_y[0]) );
  AOI22X1 U165 ( .A(invader2_coordinate_y[0]), .B(n187), .C(
        invader1_coordinate_y[0]), .D(n186), .Y(n160) );
  AOI22X1 U166 ( .A(invader4_coordinate_y[0]), .B(n215), .C(
        invader3_coordinate_y[0]), .D(n217), .Y(n159) );
  NAND2X1 U167 ( .A(n161), .B(n162), .Y(closest_invader_coord_x[5]) );
  AOI22X1 U168 ( .A(invader2_coordinate_x[5]), .B(n187), .C(
        invader1_coordinate_x[5]), .D(n186), .Y(n162) );
  AOI22X1 U169 ( .A(invader4_coordinate_x[5]), .B(n216), .C(
        invader3_coordinate_x[5]), .D(n218), .Y(n161) );
  NAND2X1 U170 ( .A(n163), .B(n164), .Y(closest_invader_coord_x[4]) );
  AOI22X1 U171 ( .A(invader2_coordinate_x[4]), .B(n187), .C(
        invader1_coordinate_x[4]), .D(n186), .Y(n164) );
  AOI22X1 U172 ( .A(invader4_coordinate_x[4]), .B(n215), .C(
        invader3_coordinate_x[4]), .D(n217), .Y(n163) );
  NAND2X1 U173 ( .A(n165), .B(n166), .Y(closest_invader_coord_x[3]) );
  AOI22X1 U174 ( .A(n200), .B(n187), .C(n202), .D(n186), .Y(n166) );
  AOI22X1 U175 ( .A(n196), .B(n216), .C(n198), .D(n218), .Y(n165) );
  NAND2X1 U176 ( .A(n167), .B(n168), .Y(closest_invader_coord_x[2]) );
  AOI22X1 U177 ( .A(invader2_coordinate_x[2]), .B(n187), .C(
        invader1_coordinate_x[2]), .D(n186), .Y(n168) );
  AOI22X1 U178 ( .A(invader4_coordinate_x[2]), .B(n215), .C(
        invader3_coordinate_x[2]), .D(n217), .Y(n167) );
  NAND2X1 U179 ( .A(n169), .B(n170), .Y(closest_invader_coord_x[1]) );
  AOI22X1 U180 ( .A(n199), .B(n187), .C(n201), .D(n186), .Y(n170) );
  AOI22X1 U181 ( .A(n195), .B(n216), .C(n197), .D(n218), .Y(n169) );
  NAND2X1 U182 ( .A(n171), .B(n172), .Y(closest_invader_coord_x[0]) );
  AOI22X1 U183 ( .A(invader2_coordinate_x[0]), .B(n187), .C(
        invader1_coordinate_x[0]), .D(n186), .Y(n172) );
  AOI22X1 U184 ( .A(invader4_coordinate_x[0]), .B(n215), .C(
        invader3_coordinate_x[0]), .D(n217), .Y(n171) );
  OAI21X1 U188 ( .A(state[0]), .B(n225), .C(n175), .Y(n174) );
  NAND3X1 U189 ( .A(player_display), .B(state[0]), .C(n176), .Y(n175) );
  AOI21X1 U190 ( .A(n177), .B(n178), .C(N105), .Y(n176) );
  NOR2X1 U191 ( .A(invaders_display[3]), .B(invaders_display[2]), .Y(n178) );
  NOR2X1 U192 ( .A(invaders_display[1]), .B(invaders_display[0]), .Y(n177) );
  FAX1 \sub_72_2/U2_1  ( .A(n195), .B(n205), .C(\sub_72_2/carry [1]), .YC(
        \sub_72_2/carry [2]), .YS(N77) );
  FAX1 \sub_72_2/U2_2  ( .A(invader4_coordinate_x[2]), .B(n207), .C(
        \sub_72_2/carry [2]), .YC(\sub_72_2/carry [3]), .YS(N78) );
  FAX1 \sub_72_2/U2_3  ( .A(n196), .B(n209), .C(\sub_72_2/carry [3]), .YC(
        \sub_72_2/carry [4]), .YS(N79) );
  FAX1 \sub_72_2/U2_4  ( .A(invader4_coordinate_x[4]), .B(n211), .C(
        \sub_72_2/carry [4]), .YC(\sub_72_2/carry [5]), .YS(N80) );
  FAX1 \sub_72_2/U2_5  ( .A(invader4_coordinate_x[5]), .B(n213), .C(
        \sub_72_2/carry [5]), .YC(), .YS(N81) );
  FAX1 \sub_72/U2_1  ( .A(n206), .B(n293), .C(\sub_72/carry [1]), .YC(
        \sub_72/carry [2]), .YS(N71) );
  FAX1 \sub_72/U2_2  ( .A(n208), .B(n292), .C(\sub_72/carry [2]), .YC(
        \sub_72/carry [3]), .YS(N72) );
  FAX1 \sub_72/U2_3  ( .A(n210), .B(n291), .C(\sub_72/carry [3]), .YC(
        \sub_72/carry [4]), .YS(N73) );
  FAX1 \sub_72/U2_4  ( .A(player_coordinate_x[4]), .B(n290), .C(
        \sub_72/carry [4]), .YC(\sub_72/carry [5]), .YS(N74) );
  FAX1 \sub_72/U2_5  ( .A(n214), .B(n289), .C(\sub_72/carry [5]), .YC(), .YS(
        N75) );
  FAX1 \sub_68_2/U2_1  ( .A(n197), .B(n205), .C(\sub_68_2/carry [1]), .YC(
        \sub_68_2/carry [2]), .YS(N63) );
  FAX1 \sub_68_2/U2_2  ( .A(invader3_coordinate_x[2]), .B(n207), .C(
        \sub_68_2/carry [2]), .YC(\sub_68_2/carry [3]), .YS(N64) );
  FAX1 \sub_68_2/U2_3  ( .A(n198), .B(n209), .C(\sub_68_2/carry [3]), .YC(
        \sub_68_2/carry [4]), .YS(N65) );
  FAX1 \sub_68_2/U2_4  ( .A(invader3_coordinate_x[4]), .B(n211), .C(
        \sub_68_2/carry [4]), .YC(\sub_68_2/carry [5]), .YS(N66) );
  FAX1 \sub_68_2/U2_5  ( .A(invader3_coordinate_x[5]), .B(n213), .C(
        \sub_68_2/carry [5]), .YC(), .YS(N67) );
  FAX1 \sub_68/U2_1  ( .A(n206), .B(n287), .C(\sub_68/carry [1]), .YC(
        \sub_68/carry [2]), .YS(N57) );
  FAX1 \sub_68/U2_2  ( .A(player_coordinate_x[2]), .B(n286), .C(
        \sub_68/carry [2]), .YC(\sub_68/carry [3]), .YS(N58) );
  FAX1 \sub_68/U2_3  ( .A(n210), .B(n285), .C(\sub_68/carry [3]), .YC(
        \sub_68/carry [4]), .YS(N59) );
  FAX1 \sub_68/U2_4  ( .A(n212), .B(n284), .C(\sub_68/carry [4]), .YC(
        \sub_68/carry [5]), .YS(N60) );
  FAX1 \sub_68/U2_5  ( .A(player_coordinate_x[5]), .B(n283), .C(
        \sub_68/carry [5]), .YC(), .YS(N61) );
  FAX1 \sub_64_2/U2_1  ( .A(n199), .B(n205), .C(\sub_64_2/carry [1]), .YC(
        \sub_64_2/carry [2]), .YS(N49) );
  FAX1 \sub_64_2/U2_2  ( .A(invader2_coordinate_x[2]), .B(n207), .C(
        \sub_64_2/carry [2]), .YC(\sub_64_2/carry [3]), .YS(N50) );
  FAX1 \sub_64_2/U2_3  ( .A(n200), .B(n209), .C(\sub_64_2/carry [3]), .YC(
        \sub_64_2/carry [4]), .YS(N51) );
  FAX1 \sub_64_2/U2_4  ( .A(invader2_coordinate_x[4]), .B(n211), .C(
        \sub_64_2/carry [4]), .YC(\sub_64_2/carry [5]), .YS(N52) );
  FAX1 \sub_64_2/U2_5  ( .A(invader2_coordinate_x[5]), .B(n213), .C(
        \sub_64_2/carry [5]), .YC(), .YS(N53) );
  FAX1 \sub_64/U2_1  ( .A(n206), .B(n281), .C(\sub_64/carry [1]), .YC(
        \sub_64/carry [2]), .YS(N43) );
  FAX1 \sub_64/U2_2  ( .A(n208), .B(n280), .C(\sub_64/carry [2]), .YC(
        \sub_64/carry [3]), .YS(N44) );
  FAX1 \sub_64/U2_3  ( .A(n210), .B(n279), .C(\sub_64/carry [3]), .YC(
        \sub_64/carry [4]), .YS(N45) );
  FAX1 \sub_64/U2_4  ( .A(n212), .B(n278), .C(\sub_64/carry [4]), .YC(
        \sub_64/carry [5]), .YS(N46) );
  FAX1 \sub_64/U2_5  ( .A(n214), .B(n277), .C(\sub_64/carry [5]), .YC(), .YS(
        N47) );
  FAX1 \sub_60_2/U2_1  ( .A(n201), .B(n205), .C(\sub_60_2/carry [1]), .YC(
        \sub_60_2/carry [2]), .YS(N35) );
  FAX1 \sub_60_2/U2_2  ( .A(invader1_coordinate_x[2]), .B(n207), .C(
        \sub_60_2/carry [2]), .YC(\sub_60_2/carry [3]), .YS(N36) );
  FAX1 \sub_60_2/U2_3  ( .A(n202), .B(n209), .C(\sub_60_2/carry [3]), .YC(
        \sub_60_2/carry [4]), .YS(N37) );
  FAX1 \sub_60_2/U2_4  ( .A(invader1_coordinate_x[4]), .B(n211), .C(
        \sub_60_2/carry [4]), .YC(\sub_60_2/carry [5]), .YS(N38) );
  FAX1 \sub_60_2/U2_5  ( .A(invader1_coordinate_x[5]), .B(n213), .C(
        \sub_60_2/carry [5]), .YC(), .YS(N39) );
  FAX1 \sub_60/U2_1  ( .A(n206), .B(n275), .C(\sub_60/carry [1]), .YC(
        \sub_60/carry [2]), .YS(N29) );
  FAX1 \sub_60/U2_2  ( .A(n208), .B(n274), .C(\sub_60/carry [2]), .YC(
        \sub_60/carry [3]), .YS(N30) );
  FAX1 \sub_60/U2_3  ( .A(n210), .B(n273), .C(\sub_60/carry [3]), .YC(
        \sub_60/carry [4]), .YS(N31) );
  FAX1 \sub_60/U2_4  ( .A(n212), .B(n272), .C(\sub_60/carry [4]), .YC(
        \sub_60/carry [5]), .YS(N32) );
  FAX1 \sub_60/U2_5  ( .A(n214), .B(n271), .C(\sub_60/carry [5]), .YC(), .YS(
        N33) );
  AND2X2 U193 ( .A(N98), .B(N86), .Y(n186) );
  AND2X2 U194 ( .A(N98), .B(n232), .Y(n187) );
  AND2X2 U195 ( .A(n224), .B(n174), .Y(n188) );
  AND2X2 U196 ( .A(\next_state[0] ), .B(n98), .Y(n189) );
  OR2X2 U197 ( .A(n96), .B(n101), .Y(n190) );
  INVX1 U198 ( .A(clkb), .Y(n191) );
  INVX2 U199 ( .A(n191), .Y(n192) );
  INVX2 U200 ( .A(n193), .Y(n217) );
  INVX2 U201 ( .A(n193), .Y(n218) );
  INVX2 U202 ( .A(n194), .Y(n215) );
  INVX2 U203 ( .A(n194), .Y(n216) );
  OR2X1 U204 ( .A(n249), .B(N98), .Y(n193) );
  OR2X1 U205 ( .A(N92), .B(N98), .Y(n194) );
  INVX2 U206 ( .A(n203), .Y(n204) );
  INVX2 U207 ( .A(n207), .Y(n208) );
  INVX2 U208 ( .A(n213), .Y(n214) );
  INVX2 U209 ( .A(n211), .Y(n212) );
  INVX2 U210 ( .A(player_coordinate_x[0]), .Y(n203) );
  INVX2 U211 ( .A(n205), .Y(n206) );
  INVX2 U212 ( .A(player_coordinate_x[1]), .Y(n205) );
  INVX2 U213 ( .A(n209), .Y(n210) );
  INVX2 U214 ( .A(player_coordinate_x[3]), .Y(n209) );
  INVX2 U215 ( .A(player_coordinate_x[2]), .Y(n207) );
  BUFX2 U216 ( .A(invader2_coordinate_x[1]), .Y(n199) );
  BUFX2 U217 ( .A(invader1_coordinate_x[1]), .Y(n201) );
  BUFX2 U218 ( .A(invader3_coordinate_x[1]), .Y(n197) );
  BUFX2 U219 ( .A(invader4_coordinate_x[1]), .Y(n195) );
  BUFX2 U220 ( .A(invader2_coordinate_x[3]), .Y(n200) );
  BUFX2 U221 ( .A(invader1_coordinate_x[3]), .Y(n202) );
  BUFX2 U222 ( .A(invader4_coordinate_x[3]), .Y(n196) );
  BUFX2 U223 ( .A(invader3_coordinate_x[3]), .Y(n198) );
  INVX2 U224 ( .A(player_coordinate_x[5]), .Y(n213) );
  INVX2 U225 ( .A(player_coordinate_x[4]), .Y(n211) );
  OR2X1 U226 ( .A(invader4_coordinate_x[0]), .B(n270), .Y(\sub_72_2/carry [1])
         );
  XNOR2X1 U227 ( .A(n270), .B(invader4_coordinate_x[0]), .Y(N76) );
  OR2X1 U228 ( .A(n204), .B(n294), .Y(\sub_72/carry [1]) );
  XNOR2X1 U229 ( .A(n294), .B(player_coordinate_x[0]), .Y(N70) );
  OR2X1 U230 ( .A(invader3_coordinate_x[0]), .B(n270), .Y(\sub_68_2/carry [1])
         );
  XNOR2X1 U231 ( .A(n270), .B(invader3_coordinate_x[0]), .Y(N62) );
  OR2X1 U232 ( .A(n204), .B(n288), .Y(\sub_68/carry [1]) );
  XNOR2X1 U233 ( .A(n288), .B(n204), .Y(N56) );
  OR2X1 U234 ( .A(invader2_coordinate_x[0]), .B(n270), .Y(\sub_64_2/carry [1])
         );
  XNOR2X1 U235 ( .A(n270), .B(invader2_coordinate_x[0]), .Y(N48) );
  OR2X1 U236 ( .A(n204), .B(n282), .Y(\sub_64/carry [1]) );
  XNOR2X1 U237 ( .A(n282), .B(player_coordinate_x[0]), .Y(N42) );
  OR2X1 U238 ( .A(invader1_coordinate_x[0]), .B(n270), .Y(\sub_60_2/carry [1])
         );
  XNOR2X1 U239 ( .A(n270), .B(invader1_coordinate_x[0]), .Y(N34) );
  OR2X1 U240 ( .A(n204), .B(n276), .Y(\sub_60/carry [1]) );
  XNOR2X1 U241 ( .A(n276), .B(n204), .Y(N28) );
  AND2X2 U242 ( .A(n381), .B(n380), .Y(N105) );
  INVX2 U243 ( .A(n92), .Y(n219) );
  INVX2 U244 ( .A(n107), .Y(n220) );
  INVX2 U245 ( .A(n94), .Y(n221) );
  INVX2 U246 ( .A(n91), .Y(n222) );
  INVX2 U247 ( .A(n96), .Y(n223) );
  INVX2 U248 ( .A(global_reset), .Y(n224) );
  INVX2 U249 ( .A(player_shoot_input), .Y(n225) );
  INVX2 U250 ( .A(n120), .Y(n226) );
  INVX2 U251 ( .A(n119), .Y(n227) );
  INVX2 U252 ( .A(n375), .Y(n228) );
  INVX2 U253 ( .A(n371), .Y(n229) );
  INVX2 U254 ( .A(n117), .Y(n230) );
  INVX2 U255 ( .A(n379), .Y(n231) );
  INVX2 U256 ( .A(N86), .Y(n232) );
  INVX2 U257 ( .A(n327), .Y(n233) );
  INVX2 U258 ( .A(diff_alive1[2]), .Y(n234) );
  INVX2 U259 ( .A(n323), .Y(n235) );
  INVX2 U260 ( .A(diff_alive1[4]), .Y(n236) );
  INVX2 U261 ( .A(n331), .Y(n237) );
  INVX2 U262 ( .A(diff_alive1[5]), .Y(n238) );
  INVX2 U263 ( .A(N26), .Y(n239) );
  INVX2 U264 ( .A(n307), .Y(n240) );
  INVX2 U265 ( .A(diff_alive2[1]), .Y(n241) );
  INVX2 U266 ( .A(diff_alive2[3]), .Y(n242) );
  INVX2 U267 ( .A(N40), .Y(n243) );
  INVX2 U268 ( .A(n319), .Y(n244) );
  INVX2 U269 ( .A(n114), .Y(n245) );
  INVX2 U270 ( .A(n112), .Y(n246) );
  INVX2 U271 ( .A(n110), .Y(n247) );
  INVX2 U272 ( .A(n109), .Y(n248) );
  INVX2 U273 ( .A(N92), .Y(n249) );
  INVX2 U274 ( .A(n363), .Y(n250) );
  INVX2 U275 ( .A(diff_alive3[2]), .Y(n251) );
  INVX2 U276 ( .A(n359), .Y(n252) );
  INVX2 U277 ( .A(diff_alive3[4]), .Y(n253) );
  INVX2 U278 ( .A(n367), .Y(n254) );
  INVX2 U279 ( .A(diff_alive3[5]), .Y(n255) );
  INVX2 U280 ( .A(N54), .Y(n256) );
  INVX2 U281 ( .A(n343), .Y(n257) );
  INVX2 U282 ( .A(diff_alive4[1]), .Y(n258) );
  INVX2 U283 ( .A(diff_alive4[3]), .Y(n259) );
  INVX2 U284 ( .A(N68), .Y(n260) );
  INVX2 U285 ( .A(n355), .Y(n261) );
  INVX2 U286 ( .A(n303), .Y(n262) );
  INVX2 U287 ( .A(n299), .Y(n263) );
  INVX2 U288 ( .A(n315), .Y(n264) );
  INVX2 U289 ( .A(n311), .Y(n265) );
  INVX2 U290 ( .A(n339), .Y(n266) );
  INVX2 U291 ( .A(n335), .Y(n267) );
  INVX2 U292 ( .A(n351), .Y(n268) );
  INVX2 U293 ( .A(n347), .Y(n269) );
  INVX2 U294 ( .A(n204), .Y(n270) );
  INVX2 U295 ( .A(invader1_coordinate_x[5]), .Y(n271) );
  INVX2 U296 ( .A(invader1_coordinate_x[4]), .Y(n272) );
  INVX2 U297 ( .A(n202), .Y(n273) );
  INVX2 U298 ( .A(invader1_coordinate_x[2]), .Y(n274) );
  INVX2 U299 ( .A(n201), .Y(n275) );
  INVX2 U300 ( .A(invader1_coordinate_x[0]), .Y(n276) );
  INVX2 U301 ( .A(invader2_coordinate_x[5]), .Y(n277) );
  INVX2 U302 ( .A(invader2_coordinate_x[4]), .Y(n278) );
  INVX2 U303 ( .A(n200), .Y(n279) );
  INVX2 U304 ( .A(invader2_coordinate_x[2]), .Y(n280) );
  INVX2 U305 ( .A(n199), .Y(n281) );
  INVX2 U306 ( .A(invader2_coordinate_x[0]), .Y(n282) );
  INVX2 U307 ( .A(invader3_coordinate_x[5]), .Y(n283) );
  INVX2 U308 ( .A(invader3_coordinate_x[4]), .Y(n284) );
  INVX2 U309 ( .A(n198), .Y(n285) );
  INVX2 U310 ( .A(invader3_coordinate_x[2]), .Y(n286) );
  INVX2 U311 ( .A(n197), .Y(n287) );
  INVX2 U312 ( .A(invader3_coordinate_x[0]), .Y(n288) );
  INVX2 U313 ( .A(invader4_coordinate_x[5]), .Y(n289) );
  INVX2 U314 ( .A(invader4_coordinate_x[4]), .Y(n290) );
  INVX2 U315 ( .A(n196), .Y(n291) );
  INVX2 U316 ( .A(invader4_coordinate_x[2]), .Y(n292) );
  INVX2 U317 ( .A(n195), .Y(n293) );
  INVX2 U318 ( .A(invader4_coordinate_x[0]), .Y(n294) );
  INVX2 U319 ( .A(prev_invader_outofbounds), .Y(n295) );
  NOR2X1 U320 ( .A(n271), .B(n214), .Y(n307) );
  AOI22X1 U321 ( .A(n212), .B(n272), .C(n214), .D(n271), .Y(n306) );
  OAI21X1 U322 ( .A(player_coordinate_x[4]), .B(n272), .C(n240), .Y(n305) );
  NAND2X1 U323 ( .A(n202), .B(n209), .Y(n299) );
  NAND3X1 U324 ( .A(n299), .B(n274), .C(n208), .Y(n296) );
  OAI21X1 U325 ( .A(n202), .B(n209), .C(n296), .Y(n303) );
  AOI21X1 U326 ( .A(n201), .B(n205), .C(invader1_coordinate_x[0]), .Y(n297) );
  NAND2X1 U327 ( .A(n297), .B(player_coordinate_x[0]), .Y(n298) );
  OAI21X1 U328 ( .A(n201), .B(n205), .C(n298), .Y(n302) );
  NOR2X1 U329 ( .A(n208), .B(n274), .Y(n300) );
  OAI21X1 U330 ( .A(n263), .B(n300), .C(n262), .Y(n301) );
  OAI21X1 U331 ( .A(n303), .B(n302), .C(n301), .Y(n304) );
  OAI22X1 U332 ( .A(n307), .B(n306), .C(n305), .D(n304), .Y(N26) );
  NOR2X1 U333 ( .A(n277), .B(n214), .Y(n319) );
  AOI22X1 U334 ( .A(n212), .B(n278), .C(n214), .D(n277), .Y(n318) );
  OAI21X1 U335 ( .A(n212), .B(n278), .C(n244), .Y(n317) );
  NAND2X1 U336 ( .A(n200), .B(n209), .Y(n311) );
  NAND3X1 U337 ( .A(n311), .B(n280), .C(n208), .Y(n308) );
  OAI21X1 U338 ( .A(n200), .B(n209), .C(n308), .Y(n315) );
  AOI21X1 U339 ( .A(n199), .B(n205), .C(invader2_coordinate_x[0]), .Y(n309) );
  NAND2X1 U340 ( .A(n309), .B(n204), .Y(n310) );
  OAI21X1 U341 ( .A(n199), .B(n205), .C(n310), .Y(n314) );
  NOR2X1 U342 ( .A(n208), .B(n280), .Y(n312) );
  OAI21X1 U343 ( .A(n265), .B(n312), .C(n264), .Y(n313) );
  OAI21X1 U344 ( .A(n315), .B(n314), .C(n313), .Y(n316) );
  OAI22X1 U345 ( .A(n319), .B(n318), .C(n317), .D(n316), .Y(N40) );
  NOR2X1 U346 ( .A(n238), .B(diff_alive2[5]), .Y(n331) );
  AOI22X1 U347 ( .A(diff_alive2[4]), .B(n236), .C(diff_alive2[5]), .D(n238), 
        .Y(n330) );
  OAI21X1 U348 ( .A(diff_alive2[4]), .B(n236), .C(n237), .Y(n329) );
  NAND2X1 U349 ( .A(diff_alive1[3]), .B(n242), .Y(n323) );
  NAND3X1 U350 ( .A(n323), .B(n234), .C(diff_alive2[2]), .Y(n320) );
  OAI21X1 U351 ( .A(diff_alive1[3]), .B(n242), .C(n320), .Y(n327) );
  AOI21X1 U352 ( .A(diff_alive1[1]), .B(n241), .C(diff_alive1[0]), .Y(n321) );
  NAND2X1 U353 ( .A(n321), .B(diff_alive2[0]), .Y(n322) );
  OAI21X1 U354 ( .A(diff_alive1[1]), .B(n241), .C(n322), .Y(n326) );
  NOR2X1 U355 ( .A(diff_alive2[2]), .B(n234), .Y(n324) );
  OAI21X1 U356 ( .A(n235), .B(n324), .C(n233), .Y(n325) );
  OAI21X1 U357 ( .A(n327), .B(n326), .C(n325), .Y(n328) );
  OAI22X1 U358 ( .A(n331), .B(n330), .C(n329), .D(n328), .Y(N86) );
  NOR2X1 U359 ( .A(n283), .B(n214), .Y(n343) );
  AOI22X1 U360 ( .A(player_coordinate_x[4]), .B(n284), .C(n214), .D(n283), .Y(
        n342) );
  OAI21X1 U361 ( .A(n212), .B(n284), .C(n257), .Y(n341) );
  NAND2X1 U362 ( .A(n198), .B(n209), .Y(n335) );
  NAND3X1 U363 ( .A(n335), .B(n286), .C(n208), .Y(n332) );
  OAI21X1 U364 ( .A(n198), .B(n209), .C(n332), .Y(n339) );
  AOI21X1 U365 ( .A(n197), .B(n205), .C(invader3_coordinate_x[0]), .Y(n333) );
  NAND2X1 U366 ( .A(n333), .B(player_coordinate_x[0]), .Y(n334) );
  OAI21X1 U367 ( .A(n197), .B(n205), .C(n334), .Y(n338) );
  NOR2X1 U368 ( .A(n208), .B(n286), .Y(n336) );
  OAI21X1 U369 ( .A(n267), .B(n336), .C(n266), .Y(n337) );
  OAI21X1 U370 ( .A(n339), .B(n338), .C(n337), .Y(n340) );
  OAI22X1 U371 ( .A(n343), .B(n342), .C(n341), .D(n340), .Y(N54) );
  NOR2X1 U372 ( .A(n289), .B(n214), .Y(n355) );
  AOI22X1 U373 ( .A(n212), .B(n290), .C(n214), .D(n289), .Y(n354) );
  OAI21X1 U374 ( .A(n212), .B(n290), .C(n261), .Y(n353) );
  NAND2X1 U375 ( .A(n196), .B(n209), .Y(n347) );
  NAND3X1 U376 ( .A(n347), .B(n292), .C(n208), .Y(n344) );
  OAI21X1 U377 ( .A(n196), .B(n209), .C(n344), .Y(n351) );
  AOI21X1 U378 ( .A(n195), .B(n205), .C(invader4_coordinate_x[0]), .Y(n345) );
  NAND2X1 U379 ( .A(n345), .B(n204), .Y(n346) );
  OAI21X1 U380 ( .A(n195), .B(n205), .C(n346), .Y(n350) );
  NOR2X1 U381 ( .A(n208), .B(n292), .Y(n348) );
  OAI21X1 U382 ( .A(n269), .B(n348), .C(n268), .Y(n349) );
  OAI21X1 U383 ( .A(n351), .B(n350), .C(n349), .Y(n352) );
  OAI22X1 U384 ( .A(n355), .B(n354), .C(n353), .D(n352), .Y(N68) );
  NOR2X1 U385 ( .A(n255), .B(diff_alive4[5]), .Y(n367) );
  AOI22X1 U386 ( .A(diff_alive4[4]), .B(n253), .C(diff_alive4[5]), .D(n255), 
        .Y(n366) );
  OAI21X1 U387 ( .A(diff_alive4[4]), .B(n253), .C(n254), .Y(n365) );
  NAND2X1 U388 ( .A(diff_alive3[3]), .B(n259), .Y(n359) );
  NAND3X1 U389 ( .A(n359), .B(n251), .C(diff_alive4[2]), .Y(n356) );
  OAI21X1 U390 ( .A(diff_alive3[3]), .B(n259), .C(n356), .Y(n363) );
  AOI21X1 U391 ( .A(diff_alive3[1]), .B(n258), .C(diff_alive3[0]), .Y(n357) );
  NAND2X1 U392 ( .A(n357), .B(diff_alive4[0]), .Y(n358) );
  OAI21X1 U393 ( .A(diff_alive3[1]), .B(n258), .C(n358), .Y(n362) );
  NOR2X1 U394 ( .A(diff_alive4[2]), .B(n251), .Y(n360) );
  OAI21X1 U395 ( .A(n252), .B(n360), .C(n250), .Y(n361) );
  OAI21X1 U396 ( .A(n363), .B(n362), .C(n361), .Y(n364) );
  OAI22X1 U397 ( .A(n367), .B(n366), .C(n365), .D(n364), .Y(N92) );
  NOR2X1 U398 ( .A(n115), .B(n248), .Y(n379) );
  AOI22X1 U399 ( .A(n247), .B(n116), .C(n248), .D(n115), .Y(n378) );
  OAI21X1 U400 ( .A(n247), .B(n116), .C(n231), .Y(n377) );
  NAND2X1 U401 ( .A(n230), .B(n111), .Y(n371) );
  NAND3X1 U402 ( .A(n371), .B(n118), .C(n246), .Y(n368) );
  OAI21X1 U403 ( .A(n230), .B(n111), .C(n368), .Y(n375) );
  AOI21X1 U404 ( .A(n227), .B(n113), .C(n226), .Y(n369) );
  NAND2X1 U405 ( .A(n369), .B(n245), .Y(n370) );
  OAI21X1 U406 ( .A(n227), .B(n113), .C(n370), .Y(n374) );
  NOR2X1 U407 ( .A(n246), .B(n118), .Y(n372) );
  OAI21X1 U408 ( .A(n229), .B(n372), .C(n228), .Y(n373) );
  OAI21X1 U409 ( .A(n375), .B(n374), .C(n373), .Y(n376) );
  OAI22X1 U410 ( .A(n379), .B(n378), .C(n377), .D(n376), .Y(N98) );
  AOI21X1 U411 ( .A(closest_invader_coord_y[2]), .B(closest_invader_coord_y[1]), .C(closest_invader_coord_y[3]), .Y(n381) );
  NOR2X1 U412 ( .A(closest_invader_coord_y[5]), .B(closest_invader_coord_y[4]), 
        .Y(n380) );
  NOR2X1 U413 ( .A(\next_state[0] ), .B(global_reset), .Y(n93) );
  NAND2X1 U414 ( .A(n295), .B(n101), .Y(n99) );
  NAND2X1 U415 ( .A(n96), .B(move_down), .Y(n100) );
endmodule

