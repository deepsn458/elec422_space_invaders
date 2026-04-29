/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Tue Apr 28 22:32:19 2026
/////////////////////////////////////////////////////////////


module invader_fsm ( clka, clkb, reset, play, invader_direction, move_down, 
        player_bullet_coord_x, player_bullet_coord_y, display, 
        playerbullet_invader_collision_signal, invader_coord_x, 
        invader_coord_y, invader_outofbounds_signal, state );
  input [3:0] player_bullet_coord_x;
  input [3:0] player_bullet_coord_y;
  output [3:0] invader_coord_x;
  output [3:0] invader_coord_y;
  output [1:0] state;
  input clka, clkb, reset, play, invader_direction, move_down;
  output display, playerbullet_invader_collision_signal,
         invader_outofbounds_signal;
  wire   N13, N14, N15, N16, N17, N20, N22, N23, N25, N26, N27, N28, N29, N32,
         N34, N35, N47, N48, move_interval_toggle, N62, N74, N75, N77, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199;
  wire   [1:0] next_state;
  wire   [4:2] \add_50/carry ;
  wire   [4:2] \r410/carry ;
  assign invader_coord_y[0] = N62;

  DFFNEGX1 \invader_coord_x_reg[0]  ( .D(n110), .CLK(n113), .Q(
        invader_coord_x[0]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N47), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \state_reg[0]  ( .D(n99), .CLK(n113), .Q(state[0]) );
  DFFNEGX1 \state_reg[1]  ( .D(n100), .CLK(n113), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N48), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 display_reg ( .D(n109), .CLK(n113), .Q(display) );
  DFFNEGX1 move_interval_toggle_reg ( .D(n108), .CLK(n113), .Q(
        move_interval_toggle) );
  DFFNEGX1 \invader_coord_x_reg[1]  ( .D(n103), .CLK(n113), .Q(
        invader_coord_x[1]) );
  DFFNEGX1 \invader_coord_x_reg[2]  ( .D(n102), .CLK(n113), .Q(
        invader_coord_x[2]) );
  DFFNEGX1 \invader_coord_x_reg[3]  ( .D(n101), .CLK(n113), .Q(
        invader_coord_x[3]) );
  DFFNEGX1 \invader_coord_y_reg[1]  ( .D(n107), .CLK(n113), .Q(
        invader_coord_y[1]) );
  DFFNEGX1 \invader_coord_y_reg[0]  ( .D(n106), .CLK(n113), .Q(N62) );
  DFFNEGX1 \invader_coord_y_reg[2]  ( .D(n105), .CLK(n113), .Q(
        invader_coord_y[2]) );
  DFFNEGX1 \invader_coord_y_reg[3]  ( .D(n104), .CLK(n113), .Q(
        invader_coord_y[3]) );
  DFFNEGX1 playerbullet_invader_collision_signal_reg ( .D(n98), .CLK(n113), 
        .Q(playerbullet_invader_collision_signal) );
  DFFNEGX1 invader_outofbounds_signal_reg ( .D(n97), .CLK(n113), .Q(
        invader_outofbounds_signal) );
  AND2X2 U3 ( .A(n62), .B(n152), .Y(n59) );
  AND2X2 U4 ( .A(invader_direction), .B(n74), .Y(n61) );
  AND2X2 U5 ( .A(n74), .B(n124), .Y(n60) );
  AND2X2 U6 ( .A(n119), .B(n57), .Y(n74) );
  AND2X2 U7 ( .A(N23), .B(N17), .Y(n96) );
  OAI21X1 U47 ( .A(n57), .B(n162), .C(n58), .Y(n97) );
  AOI22X1 U48 ( .A(n59), .B(n60), .C(N77), .D(n61), .Y(n58) );
  OAI21X1 U49 ( .A(invader_coord_x[1]), .B(invader_coord_x[0]), .C(
        invader_coord_x[2]), .Y(n62) );
  OAI21X1 U50 ( .A(n63), .B(n64), .C(n65), .Y(n98) );
  NAND2X1 U51 ( .A(playerbullet_invader_collision_signal), .B(n117), .Y(n65)
         );
  OAI21X1 U52 ( .A(n146), .B(n66), .C(n67), .Y(n99) );
  NAND3X1 U53 ( .A(n66), .B(n120), .C(next_state[0]), .Y(n67) );
  OAI21X1 U54 ( .A(n66), .B(n147), .C(n68), .Y(n100) );
  NAND3X1 U55 ( .A(n66), .B(n120), .C(next_state[1]), .Y(n68) );
  OAI21X1 U56 ( .A(n57), .B(n152), .C(n69), .Y(n101) );
  AOI22X1 U57 ( .A(n141), .B(n60), .C(N15), .D(n61), .Y(n69) );
  OAI21X1 U58 ( .A(n151), .B(n57), .C(n70), .Y(n102) );
  OAI21X1 U59 ( .A(n71), .B(n123), .C(n57), .Y(n70) );
  AOI22X1 U60 ( .A(N14), .B(invader_direction), .C(N20), .D(n124), .Y(n72) );
  OAI21X1 U61 ( .A(n57), .B(n150), .C(n73), .Y(n103) );
  AOI22X1 U62 ( .A(n139), .B(n60), .C(N13), .D(n61), .Y(n73) );
  NAND3X1 U63 ( .A(n75), .B(n76), .C(n118), .Y(n104) );
  NAND3X1 U64 ( .A(n77), .B(n161), .C(n116), .Y(n76) );
  OAI21X1 U65 ( .A(n79), .B(n115), .C(invader_coord_y[3]), .Y(n75) );
  AOI21X1 U66 ( .A(n77), .B(n159), .C(n144), .Y(n79) );
  OAI21X1 U67 ( .A(n160), .B(n80), .C(n81), .Y(n105) );
  AOI21X1 U68 ( .A(n82), .B(n77), .C(n83), .Y(n81) );
  XOR2X1 U69 ( .A(n160), .B(invader_coord_y[1]), .Y(n77) );
  NOR2X1 U70 ( .A(n115), .B(n84), .Y(n82) );
  NAND2X1 U71 ( .A(n121), .B(n85), .Y(n106) );
  OAI21X1 U72 ( .A(n119), .B(n115), .C(N62), .Y(n85) );
  NOR2X1 U73 ( .A(n63), .B(reset), .Y(n83) );
  OR2X1 U74 ( .A(n86), .B(n87), .Y(n107) );
  OAI21X1 U75 ( .A(n159), .B(n80), .C(n78), .Y(n87) );
  NAND3X1 U76 ( .A(n80), .B(n159), .C(n88), .Y(n78) );
  OAI21X1 U77 ( .A(n144), .B(n125), .C(n117), .Y(n80) );
  OAI22X1 U78 ( .A(n149), .B(n66), .C(move_interval_toggle), .D(n84), .Y(n108)
         );
  NAND2X1 U79 ( .A(n88), .B(n120), .Y(n84) );
  NAND2X1 U80 ( .A(n117), .B(n144), .Y(n66) );
  OAI21X1 U81 ( .A(n71), .B(n148), .C(n118), .Y(n109) );
  OAI21X1 U82 ( .A(n57), .B(n143), .C(n89), .Y(n110) );
  OAI21X1 U83 ( .A(n71), .B(n122), .C(n57), .Y(n89) );
  AOI22X1 U84 ( .A(n143), .B(invader_direction), .C(n143), .D(n124), .Y(n90)
         );
  OAI21X1 U85 ( .A(n149), .B(n91), .C(n117), .Y(n57) );
  NAND2X1 U86 ( .A(n118), .B(n63), .Y(n71) );
  NAND2X1 U87 ( .A(next_state[1]), .B(n145), .Y(n63) );
  OAI21X1 U88 ( .A(next_state[1]), .B(next_state[0]), .C(n120), .Y(n86) );
  NAND2X1 U89 ( .A(n88), .B(n125), .Y(n91) );
  NOR2X1 U90 ( .A(n145), .B(next_state[1]), .Y(n88) );
  OAI21X1 U91 ( .A(n64), .B(n92), .C(n93), .Y(N48) );
  NAND3X1 U92 ( .A(n120), .B(n146), .C(state[1]), .Y(n93) );
  OAI21X1 U93 ( .A(n126), .B(n64), .C(n94), .Y(N47) );
  NAND3X1 U94 ( .A(play), .B(n120), .C(n95), .Y(n94) );
  NOR2X1 U95 ( .A(state[1]), .B(state[0]), .Y(n95) );
  NAND3X1 U96 ( .A(n120), .B(n147), .C(state[0]), .Y(n64) );
  NAND3X1 U97 ( .A(N35), .B(N29), .C(n96), .Y(n92) );
  HAX1 \add_50/U1_1_1  ( .A(invader_coord_y[1]), .B(N62), .YC(
        \add_50/carry [2]), .YS(N25) );
  HAX1 \add_50/U1_1_2  ( .A(invader_coord_y[2]), .B(\add_50/carry [2]), .YC(
        \add_50/carry [3]), .YS(N26) );
  HAX1 \add_50/U1_1_3  ( .A(invader_coord_y[3]), .B(\add_50/carry [3]), .YC(
        N28), .YS(N27) );
  HAX1 \r410/U1_1_1  ( .A(invader_coord_x[1]), .B(invader_coord_x[0]), .YC(
        \r410/carry [2]), .YS(N13) );
  HAX1 \r410/U1_1_2  ( .A(invader_coord_x[2]), .B(\r410/carry [2]), .YC(
        \r410/carry [3]), .YS(N14) );
  HAX1 \r410/U1_1_3  ( .A(invader_coord_x[3]), .B(\r410/carry [3]), .YC(N16), 
        .YS(N15) );
  AND2X2 U98 ( .A(invader_coord_x[1]), .B(invader_coord_x[2]), .Y(n111) );
  INVX1 U99 ( .A(clkb), .Y(n112) );
  INVX2 U100 ( .A(n112), .Y(n113) );
  XOR2X1 U101 ( .A(invader_coord_x[1]), .B(invader_coord_x[2]), .Y(N74) );
  XOR2X1 U102 ( .A(n111), .B(invader_coord_x[3]), .Y(N75) );
  NAND2X1 U103 ( .A(n111), .B(invader_coord_x[3]), .Y(n114) );
  INVX2 U104 ( .A(n80), .Y(n115) );
  INVX2 U105 ( .A(n78), .Y(n116) );
  INVX2 U106 ( .A(n71), .Y(n117) );
  INVX2 U107 ( .A(n86), .Y(n118) );
  INVX2 U108 ( .A(n84), .Y(n119) );
  INVX2 U109 ( .A(reset), .Y(n120) );
  INVX2 U110 ( .A(n83), .Y(n121) );
  INVX2 U111 ( .A(n90), .Y(n122) );
  INVX2 U112 ( .A(n72), .Y(n123) );
  INVX2 U113 ( .A(invader_direction), .Y(n124) );
  INVX2 U114 ( .A(move_down), .Y(n125) );
  INVX2 U115 ( .A(n92), .Y(n126) );
  INVX2 U116 ( .A(n169), .Y(n127) );
  INVX2 U117 ( .A(n178), .Y(n128) );
  INVX2 U118 ( .A(player_bullet_coord_x[3]), .Y(n129) );
  INVX2 U119 ( .A(player_bullet_coord_x[2]), .Y(n130) );
  INVX2 U120 ( .A(player_bullet_coord_x[1]), .Y(n131) );
  INVX2 U121 ( .A(n183), .Y(n132) );
  INVX2 U122 ( .A(n196), .Y(n133) );
  INVX2 U123 ( .A(player_bullet_coord_y[3]), .Y(n134) );
  INVX2 U124 ( .A(player_bullet_coord_y[2]), .Y(n135) );
  INVX2 U125 ( .A(player_bullet_coord_y[1]), .Y(n136) );
  INVX2 U126 ( .A(N15), .Y(n137) );
  INVX2 U127 ( .A(N13), .Y(n138) );
  INVX2 U128 ( .A(n163), .Y(n139) );
  INVX2 U129 ( .A(N20), .Y(n140) );
  INVX2 U130 ( .A(n166), .Y(n141) );
  INVX2 U131 ( .A(N22), .Y(n142) );
  INVX2 U132 ( .A(invader_coord_x[0]), .Y(n143) );
  INVX2 U133 ( .A(n88), .Y(n144) );
  INVX2 U134 ( .A(next_state[0]), .Y(n145) );
  INVX2 U135 ( .A(state[0]), .Y(n146) );
  INVX2 U136 ( .A(state[1]), .Y(n147) );
  INVX2 U137 ( .A(display), .Y(n148) );
  INVX2 U138 ( .A(move_interval_toggle), .Y(n149) );
  INVX2 U139 ( .A(invader_coord_x[1]), .Y(n150) );
  INVX2 U140 ( .A(invader_coord_x[2]), .Y(n151) );
  INVX2 U141 ( .A(invader_coord_x[3]), .Y(n152) );
  INVX2 U142 ( .A(N27), .Y(n153) );
  INVX2 U143 ( .A(N25), .Y(n154) );
  INVX2 U144 ( .A(n188), .Y(n155) );
  INVX2 U145 ( .A(N32), .Y(n156) );
  INVX2 U146 ( .A(n191), .Y(n157) );
  INVX2 U147 ( .A(N34), .Y(n158) );
  INVX2 U148 ( .A(invader_coord_y[1]), .Y(n159) );
  INVX2 U149 ( .A(invader_coord_y[2]), .Y(n160) );
  INVX2 U150 ( .A(invader_coord_y[3]), .Y(n161) );
  INVX2 U151 ( .A(invader_outofbounds_signal), .Y(n162) );
  NOR2X1 U152 ( .A(invader_coord_x[1]), .B(invader_coord_x[0]), .Y(n164) );
  AOI21X1 U153 ( .A(invader_coord_x[0]), .B(invader_coord_x[1]), .C(n164), .Y(
        n163) );
  NAND2X1 U154 ( .A(n164), .B(n151), .Y(n165) );
  OAI21X1 U155 ( .A(n164), .B(n151), .C(n165), .Y(N20) );
  NOR2X1 U156 ( .A(n165), .B(invader_coord_x[3]), .Y(N22) );
  AOI21X1 U157 ( .A(n165), .B(invader_coord_x[3]), .C(N22), .Y(n166) );
  AOI22X1 U158 ( .A(player_bullet_coord_x[0]), .B(invader_coord_x[0]), .C(
        player_bullet_coord_x[1]), .D(n138), .Y(n167) );
  AOI21X1 U159 ( .A(N13), .B(n131), .C(n167), .Y(n172) );
  NAND2X1 U160 ( .A(player_bullet_coord_x[3]), .B(n137), .Y(n170) );
  NAND3X1 U161 ( .A(n170), .B(n130), .C(N14), .Y(n168) );
  OAI21X1 U162 ( .A(player_bullet_coord_x[3]), .B(n137), .C(n168), .Y(n169) );
  OAI21X1 U163 ( .A(N14), .B(n130), .C(n170), .Y(n171) );
  AOI22X1 U164 ( .A(n172), .B(n127), .C(n127), .D(n171), .Y(n173) );
  OR2X1 U165 ( .A(n173), .B(N16), .Y(N17) );
  NAND2X1 U166 ( .A(n141), .B(n129), .Y(n175) );
  NAND3X1 U167 ( .A(n175), .B(n140), .C(player_bullet_coord_x[2]), .Y(n174) );
  OAI21X1 U168 ( .A(n141), .B(n129), .C(n174), .Y(n178) );
  OAI21X1 U169 ( .A(player_bullet_coord_x[2]), .B(n140), .C(n175), .Y(n180) );
  OAI22X1 U170 ( .A(player_bullet_coord_x[1]), .B(n163), .C(
        player_bullet_coord_x[0]), .D(invader_coord_x[0]), .Y(n176) );
  OAI21X1 U171 ( .A(n139), .B(n131), .C(n176), .Y(n177) );
  OAI21X1 U172 ( .A(n178), .B(n177), .C(n142), .Y(n179) );
  AOI21X1 U173 ( .A(n128), .B(n180), .C(n179), .Y(N23) );
  AOI22X1 U174 ( .A(player_bullet_coord_y[0]), .B(N62), .C(
        player_bullet_coord_y[1]), .D(n154), .Y(n181) );
  AOI21X1 U175 ( .A(N25), .B(n136), .C(n181), .Y(n186) );
  NAND2X1 U176 ( .A(player_bullet_coord_y[3]), .B(n153), .Y(n184) );
  NAND3X1 U177 ( .A(n184), .B(n135), .C(N26), .Y(n182) );
  OAI21X1 U178 ( .A(player_bullet_coord_y[3]), .B(n153), .C(n182), .Y(n183) );
  OAI21X1 U179 ( .A(N26), .B(n135), .C(n184), .Y(n185) );
  AOI22X1 U180 ( .A(n186), .B(n132), .C(n132), .D(n185), .Y(n187) );
  OR2X1 U181 ( .A(n187), .B(N28), .Y(N29) );
  NOR2X1 U182 ( .A(invader_coord_y[1]), .B(N62), .Y(n189) );
  AOI21X1 U183 ( .A(N62), .B(invader_coord_y[1]), .C(n189), .Y(n188) );
  NAND2X1 U184 ( .A(n189), .B(n160), .Y(n190) );
  OAI21X1 U185 ( .A(n189), .B(n160), .C(n190), .Y(N32) );
  NOR2X1 U186 ( .A(n190), .B(invader_coord_y[3]), .Y(N34) );
  AOI21X1 U187 ( .A(n190), .B(invader_coord_y[3]), .C(N34), .Y(n191) );
  NAND2X1 U188 ( .A(n157), .B(n134), .Y(n193) );
  NAND3X1 U189 ( .A(n193), .B(n156), .C(player_bullet_coord_y[2]), .Y(n192) );
  OAI21X1 U190 ( .A(n157), .B(n134), .C(n192), .Y(n196) );
  OAI21X1 U191 ( .A(player_bullet_coord_y[2]), .B(n156), .C(n193), .Y(n198) );
  OAI22X1 U192 ( .A(player_bullet_coord_y[1]), .B(n188), .C(
        player_bullet_coord_y[0]), .D(N62), .Y(n194) );
  OAI21X1 U193 ( .A(n155), .B(n136), .C(n194), .Y(n195) );
  OAI21X1 U194 ( .A(n196), .B(n195), .C(n158), .Y(n197) );
  AOI21X1 U195 ( .A(n133), .B(n198), .C(n197), .Y(N35) );
  NAND3X1 U196 ( .A(N74), .B(n150), .C(N75), .Y(n199) );
  NAND2X1 U197 ( .A(n114), .B(n199), .Y(N77) );
endmodule

