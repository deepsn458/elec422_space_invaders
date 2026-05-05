/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 08:27:04 2026
/////////////////////////////////////////////////////////////


module player_fsm ( clka, clkb, reset, play, invader_bullet_coord_x, 
        invader_bullet_coord_y, player_left_input, player_right_input, 
        invaderbullet_player_collision_signal, player_coord_x, player_coord_y, 
        display, state );
  input [3:0] invader_bullet_coord_x;
  input [3:0] invader_bullet_coord_y;
  output [3:0] player_coord_x;
  output [3:0] player_coord_y;
  output [1:0] state;
  input clka, clkb, reset, play, player_left_input, player_right_input;
  output invaderbullet_player_collision_signal, display;
  wire   N13, N14, N15, N16, N17, N20, N21, N22, N23, N24, N31, N51, N52, N90,
         N91, N97, N102, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n116, n117, n119, n121, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182;
  wire   [1:0] next_state;
  wire   [4:2] \add_39_2/carry ;
  wire   [4:2] \r399/carry ;
  assign player_coord_y[3] = 1'b0;
  assign player_coord_y[2] = 1'b0;
  assign player_coord_y[1] = 1'b0;
  assign player_coord_y[0] = 1'b0;

  DFFNEGX1 \next_state_reg[0]  ( .D(N51), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \state_reg[0]  ( .D(N90), .CLK(n134), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N52), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 invaderbullet_player_collision_signal_reg ( .D(n135), .CLK(n134), 
        .Q(invaderbullet_player_collision_signal) );
  DFFNEGX1 \state_reg[1]  ( .D(N91), .CLK(n134), .Q(state[1]) );
  DFFNEGX1 \player_coord_x_reg[0]  ( .D(n132), .CLK(n134), .Q(
        player_coord_x[0]) );
  DFFNEGX1 \player_coord_x_reg[2]  ( .D(n130), .CLK(n134), .Q(
        player_coord_x[2]) );
  DFFNEGX1 \player_coord_x_reg[3]  ( .D(n129), .CLK(n134), .Q(
        player_coord_x[3]) );
  DFFNEGX1 \player_coord_x_reg[1]  ( .D(n131), .CLK(n134), .Q(
        player_coord_x[1]) );
  DFFNEGX1 display_reg ( .D(N97), .CLK(n134), .Q(display) );
  AND2X2 U21 ( .A(n92), .B(n137), .Y(n75) );
  OAI21X1 U48 ( .A(n166), .B(n65), .C(n66), .Y(n129) );
  NAND2X1 U49 ( .A(n67), .B(n68), .Y(n66) );
  NOR2X1 U50 ( .A(reset), .B(n69), .Y(n67) );
  AOI22X1 U51 ( .A(N15), .B(n70), .C(player_coord_x[3]), .D(n71), .Y(n69) );
  OAI21X1 U52 ( .A(n165), .B(n72), .C(n152), .Y(n71) );
  NAND2X1 U53 ( .A(n74), .B(n75), .Y(n130) );
  AOI22X1 U54 ( .A(n68), .B(n76), .C(n135), .D(player_coord_x[2]), .Y(n74) );
  OAI21X1 U55 ( .A(n151), .B(n162), .C(n77), .Y(n76) );
  AOI22X1 U56 ( .A(n154), .B(n165), .C(player_coord_x[2]), .D(n73), .Y(n77) );
  OAI21X1 U57 ( .A(n155), .B(n70), .C(n78), .Y(n73) );
  OAI21X1 U58 ( .A(player_coord_x[0]), .B(player_coord_x[1]), .C(n155), .Y(n78) );
  OR2X1 U59 ( .A(n79), .B(n80), .Y(n131) );
  OAI21X1 U60 ( .A(n136), .B(n167), .C(n75), .Y(n80) );
  OAI21X1 U61 ( .A(n135), .B(n82), .C(n83), .Y(n79) );
  NAND3X1 U62 ( .A(player_coord_x[1]), .B(player_coord_x[0]), .C(n155), .Y(n83) );
  AOI21X1 U63 ( .A(N13), .B(n70), .C(n154), .Y(n82) );
  NAND3X1 U64 ( .A(n164), .B(n167), .C(n155), .Y(n84) );
  NAND2X1 U65 ( .A(n85), .B(n75), .Y(n132) );
  AOI22X1 U66 ( .A(n68), .B(n86), .C(player_coord_x[0]), .D(n81), .Y(n85) );
  OAI21X1 U67 ( .A(n155), .B(n70), .C(n65), .Y(n81) );
  OAI21X1 U68 ( .A(player_coord_x[0]), .B(n72), .C(n87), .Y(n86) );
  NAND2X1 U69 ( .A(n164), .B(n70), .Y(n87) );
  NOR2X1 U70 ( .A(n156), .B(n88), .Y(n70) );
  OAI21X1 U71 ( .A(n166), .B(n89), .C(n153), .Y(n88) );
  OAI21X1 U72 ( .A(player_coord_x[1]), .B(player_coord_x[0]), .C(
        player_coord_x[2]), .Y(n89) );
  NAND3X1 U73 ( .A(n90), .B(n156), .C(player_left_input), .Y(n72) );
  OAI21X1 U74 ( .A(n164), .B(n167), .C(n91), .Y(n90) );
  NOR2X1 U75 ( .A(player_coord_x[3]), .B(player_coord_x[2]), .Y(n91) );
  NAND2X1 U76 ( .A(n75), .B(n157), .Y(N97) );
  XNOR2X1 U77 ( .A(n160), .B(next_state[0]), .Y(n92) );
  NAND2X1 U78 ( .A(n93), .B(n137), .Y(n65) );
  NOR2X1 U79 ( .A(N102), .B(n160), .Y(N91) );
  NOR2X1 U80 ( .A(N102), .B(n158), .Y(N90) );
  NOR2X1 U81 ( .A(reset), .B(n94), .Y(N52) );
  AOI22X1 U82 ( .A(n95), .B(state[0]), .C(state[1]), .D(n159), .Y(n94) );
  NOR2X1 U83 ( .A(state[1]), .B(n96), .Y(n95) );
  NOR2X1 U84 ( .A(n97), .B(n98), .Y(N51) );
  OR2X1 U85 ( .A(reset), .B(state[1]), .Y(n98) );
  AOI22X1 U86 ( .A(state[0]), .B(n96), .C(play), .D(n159), .Y(n97) );
  OR2X1 U87 ( .A(n99), .B(n100), .Y(n96) );
  AOI22X1 U88 ( .A(N17), .B(n101), .C(N24), .D(n102), .Y(n100) );
  OAI21X1 U89 ( .A(invader_bullet_coord_x[3]), .B(n103), .C(n104), .Y(n102) );
  OAI21X1 U90 ( .A(n142), .B(n141), .C(player_coord_x[3]), .Y(n104) );
  OAI21X1 U91 ( .A(player_coord_x[2]), .B(n143), .C(n105), .Y(n103) );
  NAND2X1 U92 ( .A(n106), .B(n107), .Y(n105) );
  OAI21X1 U93 ( .A(n146), .B(n108), .C(n109), .Y(n107) );
  NAND2X1 U94 ( .A(n110), .B(n164), .Y(n108) );
  OAI21X1 U95 ( .A(player_coord_x[3]), .B(n141), .C(n111), .Y(n101) );
  OAI21X1 U96 ( .A(invader_bullet_coord_x[3]), .B(n166), .C(n112), .Y(n111) );
  AOI22X1 U97 ( .A(n106), .B(n113), .C(player_coord_x[2]), .D(n143), .Y(n112)
         );
  OAI21X1 U98 ( .A(n164), .B(n114), .C(n110), .Y(n113) );
  OR2X1 U99 ( .A(n167), .B(invader_bullet_coord_x[1]), .Y(n110) );
  NAND2X1 U100 ( .A(n109), .B(n146), .Y(n114) );
  NAND2X1 U101 ( .A(invader_bullet_coord_x[1]), .B(n167), .Y(n109) );
  XNOR2X1 U102 ( .A(invader_bullet_coord_x[2]), .B(player_coord_x[2]), .Y(n106) );
  NAND2X1 U106 ( .A(n148), .B(n121), .Y(n119) );
  OAI21X1 U116 ( .A(n68), .B(n93), .C(n137), .Y(N102) );
  NOR2X1 U117 ( .A(n160), .B(next_state[0]), .Y(n93) );
  NOR2X1 U118 ( .A(n158), .B(next_state[1]), .Y(n68) );
  HAX1 \add_39_2/U1_1_1  ( .A(invader_bullet_coord_x[1]), .B(
        invader_bullet_coord_x[0]), .YC(\add_39_2/carry [2]), .YS(N20) );
  HAX1 \add_39_2/U1_1_2  ( .A(invader_bullet_coord_x[2]), .B(
        \add_39_2/carry [2]), .YC(\add_39_2/carry [3]), .YS(N21) );
  HAX1 \add_39_2/U1_1_3  ( .A(invader_bullet_coord_x[3]), .B(
        \add_39_2/carry [3]), .YC(N23), .YS(N22) );
  HAX1 \r399/U1_1_1  ( .A(player_coord_x[1]), .B(player_coord_x[0]), .YC(
        \r399/carry [2]), .YS(N13) );
  HAX1 \r399/U1_1_2  ( .A(player_coord_x[2]), .B(\r399/carry [2]), .YC(
        \r399/carry [3]), .YS(N14) );
  HAX1 \r399/U1_1_3  ( .A(player_coord_x[3]), .B(\r399/carry [3]), .YC(N16), 
        .YS(N15) );
  INVX1 U119 ( .A(clkb), .Y(n133) );
  INVX2 U120 ( .A(n133), .Y(n134) );
  INVX2 U121 ( .A(n65), .Y(n135) );
  INVX2 U122 ( .A(n81), .Y(n136) );
  INVX2 U123 ( .A(reset), .Y(n137) );
  INVX2 U124 ( .A(n170), .Y(n138) );
  INVX2 U125 ( .A(n177), .Y(n139) );
  INVX2 U126 ( .A(N22), .Y(n140) );
  INVX2 U127 ( .A(invader_bullet_coord_x[3]), .Y(n141) );
  INVX2 U128 ( .A(n103), .Y(n142) );
  INVX2 U129 ( .A(invader_bullet_coord_x[2]), .Y(n143) );
  INVX2 U130 ( .A(invader_bullet_coord_x[1]), .Y(n144) );
  INVX2 U131 ( .A(N20), .Y(n145) );
  INVX2 U132 ( .A(invader_bullet_coord_x[0]), .Y(n146) );
  INVX2 U133 ( .A(invader_bullet_coord_y[3]), .Y(n147) );
  INVX2 U134 ( .A(invader_bullet_coord_y[2]), .Y(n148) );
  INVX2 U135 ( .A(invader_bullet_coord_y[1]), .Y(n149) );
  INVX2 U136 ( .A(invader_bullet_coord_y[0]), .Y(n150) );
  INVX2 U137 ( .A(n70), .Y(n151) );
  INVX2 U138 ( .A(n73), .Y(n152) );
  INVX2 U139 ( .A(player_left_input), .Y(n153) );
  INVX2 U140 ( .A(n84), .Y(n154) );
  INVX2 U141 ( .A(n72), .Y(n155) );
  INVX2 U142 ( .A(player_right_input), .Y(n156) );
  INVX2 U143 ( .A(n68), .Y(n157) );
  INVX2 U144 ( .A(next_state[0]), .Y(n158) );
  INVX2 U145 ( .A(state[0]), .Y(n159) );
  INVX2 U146 ( .A(next_state[1]), .Y(n160) );
  INVX2 U147 ( .A(N15), .Y(n161) );
  INVX2 U148 ( .A(N14), .Y(n162) );
  INVX2 U149 ( .A(N13), .Y(n163) );
  INVX2 U150 ( .A(player_coord_x[0]), .Y(n164) );
  INVX2 U151 ( .A(player_coord_x[2]), .Y(n165) );
  INVX2 U152 ( .A(player_coord_x[3]), .Y(n166) );
  INVX2 U153 ( .A(player_coord_x[1]), .Y(n167) );
  NOR2X1 U154 ( .A(invader_bullet_coord_y[1]), .B(n182), .Y(N31) );
  NOR2X1 U155 ( .A(n116), .B(N31), .Y(n99) );
  NAND2X1 U156 ( .A(n148), .B(n147), .Y(n182) );
  AOI22X1 U157 ( .A(invader_bullet_coord_x[0]), .B(player_coord_x[0]), .C(
        invader_bullet_coord_x[1]), .D(n163), .Y(n168) );
  AOI21X1 U158 ( .A(N13), .B(n144), .C(n168), .Y(n173) );
  NAND2X1 U159 ( .A(invader_bullet_coord_x[3]), .B(n161), .Y(n171) );
  NAND3X1 U160 ( .A(n171), .B(n143), .C(N14), .Y(n169) );
  OAI21X1 U161 ( .A(invader_bullet_coord_x[3]), .B(n161), .C(n169), .Y(n170)
         );
  OAI21X1 U162 ( .A(N14), .B(n143), .C(n171), .Y(n172) );
  AOI22X1 U163 ( .A(n173), .B(n138), .C(n138), .D(n172), .Y(n174) );
  OR2X1 U164 ( .A(n174), .B(N16), .Y(N17) );
  AOI22X1 U165 ( .A(player_coord_x[0]), .B(invader_bullet_coord_x[0]), .C(
        player_coord_x[1]), .D(n145), .Y(n175) );
  AOI21X1 U166 ( .A(N20), .B(n167), .C(n175), .Y(n180) );
  NAND2X1 U167 ( .A(player_coord_x[3]), .B(n140), .Y(n178) );
  NAND3X1 U168 ( .A(n178), .B(n165), .C(N21), .Y(n176) );
  OAI21X1 U169 ( .A(player_coord_x[3]), .B(n140), .C(n176), .Y(n177) );
  OAI21X1 U170 ( .A(N21), .B(n165), .C(n178), .Y(n179) );
  AOI22X1 U171 ( .A(n180), .B(n139), .C(n139), .D(n179), .Y(n181) );
  OR2X1 U172 ( .A(n181), .B(N23), .Y(N24) );
  NOR2X1 U173 ( .A(invader_bullet_coord_y[3]), .B(n117), .Y(n116) );
  NAND2X1 U174 ( .A(n150), .B(n149), .Y(n121) );
  NAND2X1 U175 ( .A(n148), .B(n119), .Y(n117) );
endmodule

