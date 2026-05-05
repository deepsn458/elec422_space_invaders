/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 11:25:22 2026
/////////////////////////////////////////////////////////////


module main_game_fsm ( clka, clkb, global_reset, player_left_input, 
        player_right_input, player_shoot_input, player_display, 
        player_coordinate_x, player_coordinate_y, invaders_display, 
        invader1_coordinate_x, invader1_coordinate_y, invader2_coordinate_x, 
        invader2_coordinate_y, invaderbullet_coord_x, invaderbullet_coord_y, 
        invaderbullet_player_collision_signal, 
        invaderbullet_shield_collision_signal, invader_outofbounds_signal_1, 
        invader_outofbounds_signal_2, player_left_motion, player_right_motion, 
        closest_invader_coord_x, closest_invader_coord_y, play, reset, 
        invader_direction, playerbullet_fire, invaderbullet_fire, move_down, 
        state );
  input [3:0] player_coordinate_x;
  input [3:0] player_coordinate_y;
  input [1:0] invaders_display;
  input [3:0] invader1_coordinate_x;
  input [3:0] invader1_coordinate_y;
  input [3:0] invader2_coordinate_x;
  input [3:0] invader2_coordinate_y;
  input [3:0] invaderbullet_coord_x;
  input [3:0] invaderbullet_coord_y;
  output [3:0] closest_invader_coord_x;
  output [3:0] closest_invader_coord_y;
  output [1:0] state;
  input clka, clkb, global_reset, player_left_input, player_right_input,
         player_shoot_input, player_display,
         invaderbullet_player_collision_signal,
         invaderbullet_shield_collision_signal, invader_outofbounds_signal_1,
         invader_outofbounds_signal_2;
  output player_left_motion, player_right_motion, play, reset,
         invader_direction, playerbullet_fire, invaderbullet_fire, move_down;
  wire   temp_player_left_motion, temp_player_right_motion,
         temp_playerbullet_fire, prev_invader_outofbounds, N70, N71, N72, N73,
         next_player_left_motion, next_player_right_motion,
         next_playerbullet_fire, N78, N79, N80, N81, N82, N105, N106, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177;
  wire   [1:0] next_state;

  DFFNEGX1 \state_reg[0]  ( .D(N105), .CLK(n176), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N78), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 prev_invader_outofbounds_reg ( .D(n29), .CLK(n176), .Q(
        prev_invader_outofbounds) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N79), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 reset_reg ( .D(n28), .CLK(n176), .Q(reset) );
  DFFNEGX1 move_down_reg ( .D(n172), .CLK(n176), .Q(move_down) );
  DFFNEGX1 \state_reg[1]  ( .D(N106), .CLK(n176), .Q(state[1]) );
  DFFNEGX1 invaderbullet_fire_reg ( .D(n171), .CLK(n176), .Q(
        invaderbullet_fire) );
  DFFNEGX1 play_reg ( .D(n174), .CLK(n176), .Q(play) );
  DFFNEGX1 invader_direction_reg ( .D(n173), .CLK(n176), .Q(invader_direction)
         );
  LATCH temp_playerbullet_fire_reg ( .CLK(N70), .D(N73), .Q(
        temp_playerbullet_fire) );
  DFFNEGX1 next_playerbullet_fire_reg ( .D(N82), .CLK(clka), .Q(
        next_playerbullet_fire) );
  LATCH temp_player_right_motion_reg ( .CLK(N70), .D(N72), .Q(
        temp_player_right_motion) );
  DFFNEGX1 next_player_right_motion_reg ( .D(N81), .CLK(clka), .Q(
        next_player_right_motion) );
  LATCH temp_player_left_motion_reg ( .CLK(N70), .D(N71), .Q(
        temp_player_left_motion) );
  DFFNEGX1 next_player_left_motion_reg ( .D(N80), .CLK(clka), .Q(
        next_player_left_motion) );
  DFFNEGX1 player_left_motion_reg ( .D(n30), .CLK(n176), .Q(player_left_motion) );
  DFFNEGX1 playerbullet_fire_reg ( .D(n27), .CLK(n176), .Q(playerbullet_fire)
         );
  DFFNEGX1 player_right_motion_reg ( .D(n26), .CLK(n176), .Q(
        player_right_motion) );
  AND2X2 U3 ( .A(temp_playerbullet_fire), .B(n42), .Y(N82) );
  AND2X2 U4 ( .A(temp_player_right_motion), .B(n42), .Y(N81) );
  AND2X2 U5 ( .A(temp_player_left_motion), .B(n42), .Y(N80) );
  AND2X2 U6 ( .A(n101), .B(player_shoot_input), .Y(N73) );
  AND2X2 U7 ( .A(player_right_input), .B(n101), .Y(N72) );
  AND2X2 U8 ( .A(player_left_input), .B(n101), .Y(N71) );
  INVX2 U9 ( .A(n77), .Y(n26) );
  INVX2 U10 ( .A(n79), .Y(n27) );
  INVX2 U11 ( .A(n83), .Y(n28) );
  INVX2 U12 ( .A(n81), .Y(n29) );
  INVX2 U13 ( .A(n80), .Y(n30) );
  INVX2 U14 ( .A(n76), .Y(n31) );
  INVX2 U15 ( .A(next_state[1]), .Y(n32) );
  INVX2 U16 ( .A(n82), .Y(n33) );
  INVX2 U17 ( .A(n85), .Y(n34) );
  INVX2 U18 ( .A(next_state[0]), .Y(n35) );
  INVX2 U19 ( .A(invaderbullet_fire), .Y(n36) );
  INVX2 U20 ( .A(play), .Y(n37) );
  INVX2 U21 ( .A(prev_invader_outofbounds), .Y(n38) );
  INVX2 U22 ( .A(n102), .Y(n39) );
  INVX2 U23 ( .A(state[1]), .Y(n40) );
  INVX2 U24 ( .A(state[0]), .Y(n41) );
  INVX2 U25 ( .A(global_reset), .Y(n42) );
  INVX2 U26 ( .A(n106), .Y(n43) );
  INVX2 U27 ( .A(n93), .Y(closest_invader_coord_y[1]) );
  INVX2 U28 ( .A(n92), .Y(closest_invader_coord_y[2]) );
  INVX2 U29 ( .A(n91), .Y(closest_invader_coord_y[3]) );
  INVX2 U30 ( .A(n96), .Y(closest_invader_coord_x[3]) );
  INVX2 U31 ( .A(n94), .Y(closest_invader_coord_y[0]) );
  INVX2 U33 ( .A(n109), .Y(n50) );
  INVX2 U34 ( .A(n113), .Y(n51) );
  INVX2 U35 ( .A(n117), .Y(n52) );
  INVX2 U36 ( .A(n130), .Y(n53) );
  INVX2 U37 ( .A(n152), .Y(n54) );
  INVX2 U38 ( .A(n111), .Y(n55) );
  INVX2 U39 ( .A(n115), .Y(n56) );
  INVX2 U40 ( .A(n119), .Y(n57) );
  INVX2 U41 ( .A(n135), .Y(n58) );
  INVX2 U42 ( .A(player_coordinate_x[3]), .Y(n59) );
  INVX2 U43 ( .A(n163), .Y(n60) );
  INVX2 U44 ( .A(player_coordinate_x[2]), .Y(n61) );
  INVX2 U45 ( .A(player_coordinate_x[1]), .Y(n62) );
  INVX2 U46 ( .A(n123), .Y(n63) );
  INVX2 U47 ( .A(n126), .Y(n64) );
  INVX2 U48 ( .A(n124), .Y(n65) );
  INVX2 U49 ( .A(player_coordinate_x[0]), .Y(n66) );
  INVX2 U50 ( .A(n125), .Y(n67) );
  INVX2 U51 ( .A(invaders_display[1]), .Y(n68) );
  INVX2 U52 ( .A(invader1_coordinate_x[2]), .Y(n69) );
  INVX2 U53 ( .A(invader1_coordinate_x[1]), .Y(n70) );
  INVX2 U54 ( .A(invader1_coordinate_x[0]), .Y(n71) );
  INVX2 U55 ( .A(invader2_coordinate_x[2]), .Y(n72) );
  INVX2 U56 ( .A(invader2_coordinate_x[1]), .Y(n73) );
  INVX2 U57 ( .A(invader2_coordinate_x[0]), .Y(n74) );
  INVX2 U58 ( .A(n105), .Y(n75) );
  OAI21X1 U59 ( .A(global_reset), .B(n36), .C(n76), .Y(n171) );
  AOI22X1 U60 ( .A(next_player_right_motion), .B(n33), .C(player_right_motion), 
        .D(n78), .Y(n77) );
  AOI22X1 U61 ( .A(next_playerbullet_fire), .B(n33), .C(playerbullet_fire), 
        .D(n78), .Y(n79) );
  AOI22X1 U62 ( .A(next_player_left_motion), .B(n33), .C(player_left_motion), 
        .D(n78), .Y(n80) );
  AOI22X1 U63 ( .A(n78), .B(prev_invader_outofbounds), .C(n75), .D(n33), .Y(
        n81) );
  AOI21X1 U64 ( .A(n78), .B(reset), .C(n84), .Y(n83) );
  OAI21X1 U65 ( .A(global_reset), .B(n85), .C(n86), .Y(n172) );
  NAND2X1 U66 ( .A(move_down), .B(n78), .Y(n86) );
  OR2X1 U67 ( .A(n84), .B(n87), .Y(n173) );
  OAI21X1 U68 ( .A(invader_direction), .B(n85), .C(n88), .Y(n87) );
  OAI21X1 U69 ( .A(n31), .B(n78), .C(invader_direction), .Y(n88) );
  OAI21X1 U70 ( .A(n89), .B(n37), .C(n76), .Y(n174) );
  NAND3X1 U71 ( .A(n42), .B(n32), .C(next_state[0]), .Y(n76) );
  AOI21X1 U72 ( .A(n34), .B(n42), .C(n78), .Y(n89) );
  NOR2X1 U73 ( .A(n90), .B(n84), .Y(n78) );
  OAI21X1 U74 ( .A(next_state[1]), .B(next_state[0]), .C(n42), .Y(n84) );
  AOI22X1 U75 ( .A(invader1_coordinate_y[0]), .B(n177), .C(
        invader2_coordinate_y[0]), .D(n95), .Y(n94) );
  AOI22X1 U76 ( .A(n95), .B(invader2_coordinate_x[3]), .C(
        invader1_coordinate_x[3]), .D(n177), .Y(n96) );
  OAI22X1 U77 ( .A(n177), .B(n72), .C(n69), .D(n95), .Y(
        closest_invader_coord_x[2]) );
  OAI22X1 U78 ( .A(n177), .B(n73), .C(n70), .D(n95), .Y(
        closest_invader_coord_x[1]) );
  OAI22X1 U79 ( .A(n177), .B(n74), .C(n71), .D(n95), .Y(
        closest_invader_coord_x[0]) );
  NOR2X1 U80 ( .A(n97), .B(n98), .Y(N79) );
  NAND2X1 U81 ( .A(n39), .B(n42), .Y(n98) );
  AOI21X1 U82 ( .A(n99), .B(n100), .C(global_reset), .Y(N78) );
  NAND3X1 U83 ( .A(n41), .B(n40), .C(player_shoot_input), .Y(n100) );
  OAI21X1 U84 ( .A(n102), .B(n97), .C(n99), .Y(n101) );
  NAND2X1 U85 ( .A(n43), .B(n103), .Y(n99) );
  OAI21X1 U86 ( .A(state[0]), .B(n40), .C(n104), .Y(n103) );
  OAI21X1 U87 ( .A(n105), .B(prev_invader_outofbounds), .C(n39), .Y(n104) );
  NAND3X1 U88 ( .A(n75), .B(n38), .C(n43), .Y(n97) );
  NAND3X1 U89 ( .A(n107), .B(n108), .C(player_display), .Y(n106) );
  OAI21X1 U90 ( .A(n93), .B(n92), .C(n91), .Y(n108) );
  AOI22X1 U91 ( .A(invader1_coordinate_y[3]), .B(n177), .C(
        invader2_coordinate_y[3]), .D(n95), .Y(n91) );
  AOI22X1 U92 ( .A(invader1_coordinate_y[2]), .B(n177), .C(
        invader2_coordinate_y[2]), .D(n95), .Y(n92) );
  AOI22X1 U93 ( .A(invader1_coordinate_y[1]), .B(n177), .C(
        invader2_coordinate_y[1]), .D(n95), .Y(n93) );
  OAI21X1 U94 ( .A(n55), .B(n109), .C(n110), .Y(n95) );
  OAI21X1 U95 ( .A(n50), .B(n111), .C(n112), .Y(n110) );
  OAI21X1 U96 ( .A(n56), .B(n113), .C(n114), .Y(n112) );
  OAI21X1 U97 ( .A(n51), .B(n115), .C(n116), .Y(n114) );
  OAI21X1 U98 ( .A(n57), .B(n117), .C(n118), .Y(n116) );
  OAI22X1 U99 ( .A(n52), .B(n119), .C(n120), .D(n121), .Y(n118) );
  OAI21X1 U100 ( .A(n68), .B(n122), .C(invaders_display[0]), .Y(n121) );
  NAND2X1 U101 ( .A(n123), .B(n124), .Y(n122) );
  NAND2X1 U102 ( .A(n125), .B(n126), .Y(n120) );
  NAND2X1 U103 ( .A(n127), .B(invaders_display[1]), .Y(n117) );
  AOI22X1 U104 ( .A(n53), .B(n128), .C(n129), .D(n130), .Y(n127) );
  XOR2X1 U105 ( .A(n65), .B(n131), .Y(n129) );
  XOR2X1 U106 ( .A(n63), .B(n131), .Y(n128) );
  XOR2X1 U107 ( .A(invader2_coordinate_x[1]), .B(player_coordinate_x[1]), .Y(
        n131) );
  NAND2X1 U108 ( .A(n132), .B(invaders_display[0]), .Y(n119) );
  AOI22X1 U109 ( .A(n58), .B(n133), .C(n134), .D(n135), .Y(n132) );
  XOR2X1 U110 ( .A(n64), .B(n136), .Y(n134) );
  XOR2X1 U111 ( .A(n67), .B(n136), .Y(n133) );
  XOR2X1 U112 ( .A(invader1_coordinate_x[1]), .B(player_coordinate_x[1]), .Y(
        n136) );
  NAND2X1 U113 ( .A(n137), .B(invaders_display[1]), .Y(n113) );
  AOI22X1 U114 ( .A(n138), .B(n53), .C(n139), .D(n130), .Y(n137) );
  XNOR2X1 U115 ( .A(n140), .B(n141), .Y(n139) );
  XNOR2X1 U116 ( .A(n142), .B(n140), .Y(n138) );
  NAND2X1 U117 ( .A(n143), .B(invaders_display[0]), .Y(n115) );
  AOI22X1 U118 ( .A(n144), .B(n58), .C(n145), .D(n135), .Y(n143) );
  XNOR2X1 U119 ( .A(n146), .B(n147), .Y(n145) );
  XNOR2X1 U120 ( .A(n148), .B(n146), .Y(n144) );
  NAND2X1 U121 ( .A(n149), .B(invaders_display[1]), .Y(n109) );
  AOI22X1 U122 ( .A(n150), .B(n53), .C(n151), .D(n152), .Y(n149) );
  AOI21X1 U123 ( .A(n153), .B(n154), .C(n53), .Y(n151) );
  OAI21X1 U124 ( .A(player_coordinate_x[2]), .B(n72), .C(n141), .Y(n154) );
  OAI21X1 U125 ( .A(invader2_coordinate_x[1]), .B(n65), .C(n155), .Y(n141) );
  OAI21X1 U126 ( .A(n73), .B(n124), .C(player_coordinate_x[1]), .Y(n155) );
  NAND2X1 U127 ( .A(invader2_coordinate_x[0]), .B(n66), .Y(n124) );
  OAI21X1 U128 ( .A(invader2_coordinate_x[3]), .B(n59), .C(n156), .Y(n130) );
  NAND2X1 U129 ( .A(n54), .B(n157), .Y(n156) );
  OAI21X1 U130 ( .A(n140), .B(n142), .C(n153), .Y(n157) );
  OAI21X1 U131 ( .A(player_coordinate_x[2]), .B(n72), .C(n153), .Y(n140) );
  NOR2X1 U132 ( .A(n158), .B(n54), .Y(n150) );
  XOR2X1 U133 ( .A(invader2_coordinate_x[3]), .B(player_coordinate_x[3]), .Y(
        n152) );
  AOI22X1 U134 ( .A(n142), .B(n153), .C(invader2_coordinate_x[2]), .D(n61), 
        .Y(n158) );
  NAND2X1 U135 ( .A(player_coordinate_x[2]), .B(n72), .Y(n153) );
  OAI21X1 U136 ( .A(n63), .B(n73), .C(n159), .Y(n142) );
  OAI21X1 U137 ( .A(invader2_coordinate_x[1]), .B(n123), .C(n62), .Y(n159) );
  NAND2X1 U138 ( .A(player_coordinate_x[0]), .B(n74), .Y(n123) );
  NAND2X1 U139 ( .A(n160), .B(invaders_display[0]), .Y(n111) );
  AOI22X1 U140 ( .A(n161), .B(n58), .C(n162), .D(n163), .Y(n160) );
  AOI21X1 U141 ( .A(n164), .B(n165), .C(n58), .Y(n162) );
  OAI21X1 U142 ( .A(player_coordinate_x[2]), .B(n69), .C(n147), .Y(n165) );
  OAI21X1 U143 ( .A(invader1_coordinate_x[1]), .B(n64), .C(n166), .Y(n147) );
  OAI21X1 U144 ( .A(n70), .B(n126), .C(player_coordinate_x[1]), .Y(n166) );
  NAND2X1 U145 ( .A(invader1_coordinate_x[0]), .B(n66), .Y(n126) );
  OAI21X1 U146 ( .A(invader1_coordinate_x[3]), .B(n59), .C(n167), .Y(n135) );
  NAND2X1 U147 ( .A(n60), .B(n168), .Y(n167) );
  OAI21X1 U148 ( .A(n146), .B(n148), .C(n164), .Y(n168) );
  OAI21X1 U149 ( .A(player_coordinate_x[2]), .B(n69), .C(n164), .Y(n146) );
  NOR2X1 U150 ( .A(n169), .B(n60), .Y(n161) );
  XOR2X1 U151 ( .A(invader1_coordinate_x[3]), .B(player_coordinate_x[3]), .Y(
        n163) );
  AOI22X1 U152 ( .A(n148), .B(n164), .C(invader1_coordinate_x[2]), .D(n61), 
        .Y(n169) );
  NAND2X1 U153 ( .A(player_coordinate_x[2]), .B(n69), .Y(n164) );
  OAI21X1 U154 ( .A(n67), .B(n70), .C(n170), .Y(n148) );
  OAI21X1 U155 ( .A(invader1_coordinate_x[1]), .B(n125), .C(n62), .Y(n170) );
  NAND2X1 U156 ( .A(player_coordinate_x[0]), .B(n71), .Y(n125) );
  OR2X1 U157 ( .A(invaders_display[0]), .B(invaders_display[1]), .Y(n107) );
  NOR2X1 U158 ( .A(invader_outofbounds_signal_1), .B(
        invader_outofbounds_signal_2), .Y(n105) );
  NAND2X1 U159 ( .A(state[0]), .B(n102), .Y(N70) );
  NAND2X1 U160 ( .A(state[0]), .B(n40), .Y(n102) );
  NOR2X1 U161 ( .A(n32), .B(n82), .Y(N106) );
  NOR2X1 U162 ( .A(n35), .B(n82), .Y(N105) );
  NAND2X1 U163 ( .A(n90), .B(n42), .Y(n82) );
  OAI21X1 U164 ( .A(next_state[1]), .B(n35), .C(n85), .Y(n90) );
  NAND2X1 U165 ( .A(next_state[1]), .B(n35), .Y(n85) );
  INVX1 U166 ( .A(clkb), .Y(n175) );
  INVX2 U167 ( .A(n175), .Y(n176) );
  INVX2 U168 ( .A(n95), .Y(n177) );
endmodule

