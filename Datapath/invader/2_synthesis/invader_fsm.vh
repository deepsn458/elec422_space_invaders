/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon Mar  2 23:19:48 2026
/////////////////////////////////////////////////////////////


module invader_fsm ( clka, clkb, reset, play, move_down, x_offset, 
        player_bullet_coord_x, player_bullet_coord_y, alive, 
        player_bullet_collision_signal, invader_coord_x, invader_coord_y, 
        state );
  input [5:0] x_offset;
  input [5:0] player_bullet_coord_x;
  input [5:0] player_bullet_coord_y;
  output [5:0] invader_coord_x;
  output [5:0] invader_coord_y;
  output [1:0] state;
  input clka, clkb, reset, play, move_down;
  output alive, player_bullet_collision_signal;
  wire   N10, N11, N12, N13, N14, N15, N16, N19, N21, N23, N24, N26, N27, N28,
         N29, N30, N31, N32, N35, N37, N39, N40, N52, N53, N65, N66, N67, N68,
         N69, N70, N71, N72, N73, N74, N75, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, \sub_100/carry[3] , \sub_100/carry[4] ,
         \sub_100/carry[5] , n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212;
  wire   [1:0] next_state;
  wire   [5:1] \add_102/carry ;
  wire   [6:2] \add_43/carry ;
  wire   [6:2] \add_42/carry ;

  DFFNEGX1 \state_reg[0]  ( .D(n82), .CLK(n86), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N53), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[1]  ( .D(n119), .CLK(n86), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N52), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \invader_coord_y_reg[1]  ( .D(n88), .CLK(n86), .Q(
        invader_coord_y[1]) );
  DFFNEGX1 \invader_coord_y_reg[0]  ( .D(n79), .CLK(n86), .Q(
        invader_coord_y[0]) );
  DFFNEGX1 \invader_coord_y_reg[2]  ( .D(n78), .CLK(n86), .Q(
        invader_coord_y[2]) );
  DFFNEGX1 \invader_coord_y_reg[3]  ( .D(n77), .CLK(n86), .Q(
        invader_coord_y[3]) );
  DFFNEGX1 \invader_coord_y_reg[4]  ( .D(n76), .CLK(n86), .Q(
        invader_coord_y[4]) );
  DFFNEGX1 \invader_coord_y_reg[5]  ( .D(n87), .CLK(n86), .Q(
        invader_coord_y[5]) );
  DFFNEGX1 \invader_coord_x_reg[4]  ( .D(n94), .CLK(n86), .Q(
        invader_coord_x[4]) );
  DFFNEGX1 \invader_coord_x_reg[0]  ( .D(n81), .CLK(n86), .Q(
        invader_coord_x[0]) );
  DFFNEGX1 \invader_coord_x_reg[1]  ( .D(n92), .CLK(n86), .Q(
        invader_coord_x[1]) );
  DFFNEGX1 \invader_coord_x_reg[2]  ( .D(n80), .CLK(n86), .Q(
        invader_coord_x[2]) );
  DFFNEGX1 \invader_coord_x_reg[3]  ( .D(n93), .CLK(n86), .Q(
        invader_coord_x[3]) );
  DFFNEGX1 \invader_coord_x_reg[5]  ( .D(n91), .CLK(n86), .Q(
        invader_coord_x[5]) );
  DFFNEGX1 player_bullet_collision_signal_reg ( .D(n75), .CLK(n86), .Q(
        player_bullet_collision_signal) );
  DFFNEGX1 alive_reg ( .D(n121), .CLK(n86), .Q(alive) );
  AND2X2 U3 ( .A(N24), .B(N16), .Y(n74) );
  AOI21X1 U36 ( .A(n46), .B(alive), .C(n47), .Y(n45) );
  OAI21X1 U37 ( .A(n117), .B(n48), .C(n49), .Y(n75) );
  NAND2X1 U38 ( .A(player_bullet_collision_signal), .B(next_state[0]), .Y(n49)
         );
  OAI21X1 U39 ( .A(n51), .B(n135), .C(n52), .Y(n76) );
  AOI21X1 U40 ( .A(N68), .B(n53), .C(n47), .Y(n52) );
  OAI21X1 U41 ( .A(n51), .B(n134), .C(n54), .Y(n77) );
  AOI21X1 U42 ( .A(N67), .B(n53), .C(n47), .Y(n54) );
  OAI21X1 U43 ( .A(n51), .B(n133), .C(n55), .Y(n78) );
  AOI21X1 U44 ( .A(N66), .B(n53), .C(n122), .Y(n55) );
  AOI22X1 U45 ( .A(N65), .B(n53), .C(invader_coord_y[1]), .D(n89), .Y(n56) );
  NAND2X1 U46 ( .A(n57), .B(n46), .Y(n79) );
  AOI22X1 U47 ( .A(n132), .B(n53), .C(invader_coord_y[0]), .D(n89), .Y(n57) );
  AOI22X1 U48 ( .A(N69), .B(n53), .C(invader_coord_y[5]), .D(n89), .Y(n58) );
  NOR2X1 U49 ( .A(n59), .B(n89), .Y(n53) );
  OAI21X1 U50 ( .A(n59), .B(n90), .C(n46), .Y(n51) );
  AOI22X1 U51 ( .A(N74), .B(n61), .C(invader_coord_x[4]), .D(n95), .Y(n60) );
  AOI22X1 U52 ( .A(N73), .B(n61), .C(invader_coord_x[3]), .D(n95), .Y(n62) );
  NAND2X1 U53 ( .A(n63), .B(n46), .Y(n80) );
  AOI22X1 U54 ( .A(N72), .B(n61), .C(invader_coord_x[2]), .D(n95), .Y(n63) );
  AOI22X1 U55 ( .A(N71), .B(n61), .C(invader_coord_x[1]), .D(n95), .Y(n64) );
  NAND2X1 U56 ( .A(n65), .B(n46), .Y(n81) );
  AOI22X1 U57 ( .A(N70), .B(n61), .C(invader_coord_x[0]), .D(n95), .Y(n65) );
  AOI22X1 U58 ( .A(N75), .B(n61), .C(invader_coord_x[5]), .D(n95), .Y(n66) );
  NOR2X1 U59 ( .A(n59), .B(n95), .Y(n61) );
  OAI21X1 U60 ( .A(move_down), .B(n59), .C(n46), .Y(n67) );
  AOI22X1 U61 ( .A(n69), .B(next_state[1]), .C(n120), .D(state[1]), .Y(n68) );
  OAI22X1 U62 ( .A(n120), .B(n123), .C(n118), .D(n69), .Y(n82) );
  NAND2X1 U63 ( .A(n46), .B(n59), .Y(n69) );
  OR2X1 U64 ( .A(n123), .B(next_state[1]), .Y(n59) );
  NOR2X1 U65 ( .A(n47), .B(n122), .Y(n46) );
  NAND2X1 U66 ( .A(next_state[1]), .B(n123), .Y(n48) );
  NOR2X1 U67 ( .A(next_state[0]), .B(next_state[1]), .Y(n47) );
  NOR2X1 U68 ( .A(reset), .B(n70), .Y(N53) );
  AOI22X1 U69 ( .A(n96), .B(n50), .C(state[1]), .D(n118), .Y(n70) );
  NOR2X1 U70 ( .A(reset), .B(n72), .Y(N52) );
  AOI22X1 U71 ( .A(n73), .B(play), .C(n50), .D(n71), .Y(n72) );
  NAND3X1 U72 ( .A(N40), .B(N32), .C(n74), .Y(n71) );
  NOR2X1 U73 ( .A(n118), .B(state[1]), .Y(n50) );
  NOR2X1 U74 ( .A(state[1]), .B(state[0]), .Y(n73) );
  FAX1 \add_102/U1_1  ( .A(invader_coord_x[1]), .B(x_offset[1]), .C(n84), .YC(
        \add_102/carry [2]), .YS(N71) );
  FAX1 \add_102/U1_2  ( .A(invader_coord_x[2]), .B(x_offset[2]), .C(
        \add_102/carry [2]), .YC(\add_102/carry [3]), .YS(N72) );
  FAX1 \add_102/U1_3  ( .A(invader_coord_x[3]), .B(x_offset[3]), .C(
        \add_102/carry [3]), .YC(\add_102/carry [4]), .YS(N73) );
  FAX1 \add_102/U1_4  ( .A(invader_coord_x[4]), .B(x_offset[4]), .C(
        \add_102/carry [4]), .YC(\add_102/carry [5]), .YS(N74) );
  FAX1 \add_102/U1_5  ( .A(invader_coord_x[5]), .B(x_offset[5]), .C(
        \add_102/carry [5]), .YC(), .YS(N75) );
  HAX1 \add_43/U1_1_1  ( .A(invader_coord_y[1]), .B(invader_coord_y[0]), .YC(
        \add_43/carry [2]), .YS(N26) );
  HAX1 \add_43/U1_1_2  ( .A(invader_coord_y[2]), .B(\add_43/carry [2]), .YC(
        \add_43/carry [3]), .YS(N27) );
  HAX1 \add_43/U1_1_3  ( .A(invader_coord_y[3]), .B(\add_43/carry [3]), .YC(
        \add_43/carry [4]), .YS(N28) );
  HAX1 \add_43/U1_1_4  ( .A(invader_coord_y[4]), .B(\add_43/carry [4]), .YC(
        \add_43/carry [5]), .YS(N29) );
  HAX1 \add_43/U1_1_5  ( .A(invader_coord_y[5]), .B(\add_43/carry [5]), .YC(
        N31), .YS(N30) );
  HAX1 \add_42/U1_1_1  ( .A(invader_coord_x[1]), .B(invader_coord_x[0]), .YC(
        \add_42/carry [2]), .YS(N10) );
  HAX1 \add_42/U1_1_2  ( .A(invader_coord_x[2]), .B(\add_42/carry [2]), .YC(
        \add_42/carry [3]), .YS(N11) );
  HAX1 \add_42/U1_1_3  ( .A(invader_coord_x[3]), .B(\add_42/carry [3]), .YC(
        \add_42/carry [4]), .YS(N12) );
  HAX1 \add_42/U1_1_4  ( .A(invader_coord_x[4]), .B(\add_42/carry [4]), .YC(
        \add_42/carry [5]), .YS(N13) );
  HAX1 \add_42/U1_1_5  ( .A(invader_coord_x[5]), .B(\add_42/carry [5]), .YC(
        N15), .YS(N14) );
  AND2X2 U75 ( .A(invader_coord_y[0]), .B(invader_coord_y[1]), .Y(n83) );
  AND2X2 U76 ( .A(x_offset[0]), .B(invader_coord_x[0]), .Y(n84) );
  INVX1 U77 ( .A(clkb), .Y(n85) );
  INVX2 U78 ( .A(n85), .Y(n86) );
  OR2X1 U79 ( .A(invader_coord_y[2]), .B(n83), .Y(\sub_100/carry[3] ) );
  XNOR2X1 U80 ( .A(n83), .B(invader_coord_y[2]), .Y(N66) );
  OR2X1 U81 ( .A(invader_coord_y[3]), .B(\sub_100/carry[3] ), .Y(
        \sub_100/carry[4] ) );
  XNOR2X1 U82 ( .A(\sub_100/carry[3] ), .B(invader_coord_y[3]), .Y(N67) );
  OR2X1 U83 ( .A(invader_coord_y[4]), .B(\sub_100/carry[4] ), .Y(
        \sub_100/carry[5] ) );
  XNOR2X1 U84 ( .A(\sub_100/carry[4] ), .B(invader_coord_y[4]), .Y(N68) );
  XNOR2X1 U85 ( .A(invader_coord_y[5]), .B(\sub_100/carry[5] ), .Y(N69) );
  XOR2X1 U86 ( .A(x_offset[0]), .B(invader_coord_x[0]), .Y(N70) );
  XOR2X1 U87 ( .A(invader_coord_y[0]), .B(invader_coord_y[1]), .Y(N65) );
  INVX2 U88 ( .A(n58), .Y(n87) );
  INVX2 U89 ( .A(n56), .Y(n88) );
  INVX2 U90 ( .A(n51), .Y(n89) );
  INVX2 U91 ( .A(move_down), .Y(n90) );
  INVX2 U92 ( .A(n66), .Y(n91) );
  INVX2 U93 ( .A(n64), .Y(n92) );
  INVX2 U94 ( .A(n62), .Y(n93) );
  INVX2 U95 ( .A(n60), .Y(n94) );
  INVX2 U96 ( .A(n67), .Y(n95) );
  INVX2 U97 ( .A(n71), .Y(n96) );
  INVX2 U98 ( .A(player_bullet_coord_x[4]), .Y(n97) );
  INVX2 U99 ( .A(n153), .Y(n98) );
  INVX2 U100 ( .A(n149), .Y(n99) );
  INVX2 U101 ( .A(n176), .Y(n100) );
  INVX2 U102 ( .A(n172), .Y(n101) );
  INVX2 U103 ( .A(player_bullet_coord_x[3]), .Y(n102) );
  INVX2 U104 ( .A(player_bullet_coord_x[2]), .Y(n103) );
  INVX2 U105 ( .A(n171), .Y(n104) );
  INVX2 U106 ( .A(player_bullet_coord_x[1]), .Y(n105) );
  INVX2 U107 ( .A(player_bullet_coord_x[0]), .Y(n106) );
  INVX2 U108 ( .A(player_bullet_coord_y[4]), .Y(n107) );
  INVX2 U109 ( .A(n186), .Y(n108) );
  INVX2 U110 ( .A(n182), .Y(n109) );
  INVX2 U111 ( .A(n209), .Y(n110) );
  INVX2 U112 ( .A(n205), .Y(n111) );
  INVX2 U113 ( .A(player_bullet_coord_y[3]), .Y(n112) );
  INVX2 U114 ( .A(player_bullet_coord_y[2]), .Y(n113) );
  INVX2 U115 ( .A(n204), .Y(n114) );
  INVX2 U116 ( .A(player_bullet_coord_y[1]), .Y(n115) );
  INVX2 U117 ( .A(player_bullet_coord_y[0]), .Y(n116) );
  INVX2 U118 ( .A(n50), .Y(n117) );
  INVX2 U119 ( .A(state[0]), .Y(n118) );
  INVX2 U120 ( .A(n68), .Y(n119) );
  INVX2 U121 ( .A(n69), .Y(n120) );
  INVX2 U122 ( .A(n45), .Y(n121) );
  INVX2 U123 ( .A(n48), .Y(n122) );
  INVX2 U124 ( .A(next_state[0]), .Y(n123) );
  INVX2 U125 ( .A(N31), .Y(n124) );
  INVX2 U126 ( .A(N30), .Y(n125) );
  INVX2 U127 ( .A(N28), .Y(n126) );
  INVX2 U128 ( .A(N26), .Y(n127) );
  INVX2 U129 ( .A(n193), .Y(n128) );
  INVX2 U130 ( .A(N35), .Y(n129) );
  INVX2 U131 ( .A(n196), .Y(n130) );
  INVX2 U132 ( .A(N37), .Y(n131) );
  INVX2 U133 ( .A(invader_coord_y[0]), .Y(n132) );
  INVX2 U134 ( .A(invader_coord_y[2]), .Y(n133) );
  INVX2 U135 ( .A(invader_coord_y[3]), .Y(n134) );
  INVX2 U136 ( .A(invader_coord_y[4]), .Y(n135) );
  INVX2 U137 ( .A(N15), .Y(n136) );
  INVX2 U138 ( .A(N14), .Y(n137) );
  INVX2 U139 ( .A(N21), .Y(n138) );
  INVX2 U140 ( .A(invader_coord_x[4]), .Y(n139) );
  INVX2 U141 ( .A(N12), .Y(n140) );
  INVX2 U142 ( .A(N10), .Y(n141) );
  INVX2 U143 ( .A(invader_coord_x[0]), .Y(n142) );
  INVX2 U144 ( .A(n160), .Y(n143) );
  INVX2 U145 ( .A(N19), .Y(n144) );
  INVX2 U146 ( .A(n163), .Y(n145) );
  INVX2 U147 ( .A(invader_coord_x[2]), .Y(n146) );
  OAI21X1 U148 ( .A(player_bullet_coord_x[5]), .B(n137), .C(n136), .Y(n159) );
  NAND2X1 U149 ( .A(player_bullet_coord_x[5]), .B(n137), .Y(n154) );
  OAI21X1 U150 ( .A(N13), .B(n97), .C(n154), .Y(n157) );
  NAND2X1 U151 ( .A(player_bullet_coord_x[3]), .B(n140), .Y(n149) );
  NAND3X1 U152 ( .A(n149), .B(n103), .C(N11), .Y(n147) );
  OAI21X1 U153 ( .A(player_bullet_coord_x[3]), .B(n140), .C(n147), .Y(n153) );
  OAI22X1 U154 ( .A(N10), .B(n105), .C(n142), .D(n106), .Y(n148) );
  OAI21X1 U155 ( .A(player_bullet_coord_x[1]), .B(n141), .C(n148), .Y(n152) );
  NOR2X1 U156 ( .A(N11), .B(n103), .Y(n150) );
  OAI21X1 U157 ( .A(n99), .B(n150), .C(n98), .Y(n151) );
  OAI21X1 U158 ( .A(n153), .B(n152), .C(n151), .Y(n156) );
  NAND3X1 U159 ( .A(n154), .B(n97), .C(N13), .Y(n155) );
  OAI21X1 U160 ( .A(n157), .B(n156), .C(n155), .Y(n158) );
  OR2X1 U161 ( .A(n159), .B(n158), .Y(N16) );
  NOR2X1 U162 ( .A(invader_coord_x[1]), .B(invader_coord_x[0]), .Y(n161) );
  AOI21X1 U163 ( .A(invader_coord_x[0]), .B(invader_coord_x[1]), .C(n161), .Y(
        n160) );
  NAND2X1 U164 ( .A(n161), .B(n146), .Y(n162) );
  OAI21X1 U165 ( .A(n161), .B(n146), .C(n162), .Y(N19) );
  NOR2X1 U166 ( .A(n162), .B(invader_coord_x[3]), .Y(n164) );
  AOI21X1 U167 ( .A(n162), .B(invader_coord_x[3]), .C(n164), .Y(n163) );
  NAND2X1 U168 ( .A(n164), .B(n139), .Y(n165) );
  OAI21X1 U169 ( .A(n164), .B(n139), .C(n165), .Y(N21) );
  NOR2X1 U170 ( .A(n165), .B(invader_coord_x[5]), .Y(N23) );
  AOI21X1 U171 ( .A(n165), .B(invader_coord_x[5]), .C(N23), .Y(n166) );
  NOR2X1 U172 ( .A(n166), .B(player_bullet_coord_x[5]), .Y(n168) );
  NOR2X1 U173 ( .A(N21), .B(n168), .Y(n167) );
  AOI22X1 U174 ( .A(n167), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n166), .Y(n179) );
  NOR2X1 U175 ( .A(N23), .B(n168), .Y(n169) );
  OAI21X1 U176 ( .A(player_bullet_coord_x[4]), .B(n138), .C(n169), .Y(n178) );
  NAND2X1 U177 ( .A(n145), .B(n102), .Y(n172) );
  NAND3X1 U178 ( .A(n172), .B(n144), .C(player_bullet_coord_x[2]), .Y(n170) );
  OAI21X1 U179 ( .A(n145), .B(n102), .C(n170), .Y(n176) );
  AOI22X1 U180 ( .A(n105), .B(n143), .C(n106), .D(n142), .Y(n171) );
  OAI21X1 U181 ( .A(n143), .B(n105), .C(n104), .Y(n175) );
  NOR2X1 U182 ( .A(player_bullet_coord_x[2]), .B(n144), .Y(n173) );
  OAI21X1 U183 ( .A(n101), .B(n173), .C(n100), .Y(n174) );
  OAI21X1 U184 ( .A(n176), .B(n175), .C(n174), .Y(n177) );
  OAI22X1 U185 ( .A(N23), .B(n179), .C(n178), .D(n177), .Y(N24) );
  OAI21X1 U186 ( .A(player_bullet_coord_y[5]), .B(n125), .C(n124), .Y(n192) );
  NAND2X1 U187 ( .A(player_bullet_coord_y[5]), .B(n125), .Y(n187) );
  OAI21X1 U188 ( .A(N29), .B(n107), .C(n187), .Y(n190) );
  NAND2X1 U189 ( .A(player_bullet_coord_y[3]), .B(n126), .Y(n182) );
  NAND3X1 U190 ( .A(n182), .B(n113), .C(N27), .Y(n180) );
  OAI21X1 U191 ( .A(player_bullet_coord_y[3]), .B(n126), .C(n180), .Y(n186) );
  OAI22X1 U192 ( .A(N26), .B(n115), .C(n132), .D(n116), .Y(n181) );
  OAI21X1 U193 ( .A(player_bullet_coord_y[1]), .B(n127), .C(n181), .Y(n185) );
  NOR2X1 U194 ( .A(N27), .B(n113), .Y(n183) );
  OAI21X1 U195 ( .A(n109), .B(n183), .C(n108), .Y(n184) );
  OAI21X1 U196 ( .A(n186), .B(n185), .C(n184), .Y(n189) );
  NAND3X1 U197 ( .A(n187), .B(n107), .C(N29), .Y(n188) );
  OAI21X1 U198 ( .A(n190), .B(n189), .C(n188), .Y(n191) );
  OR2X1 U199 ( .A(n192), .B(n191), .Y(N32) );
  NOR2X1 U200 ( .A(invader_coord_y[1]), .B(invader_coord_y[0]), .Y(n194) );
  AOI21X1 U201 ( .A(invader_coord_y[0]), .B(invader_coord_y[1]), .C(n194), .Y(
        n193) );
  NAND2X1 U202 ( .A(n194), .B(n133), .Y(n195) );
  OAI21X1 U203 ( .A(n194), .B(n133), .C(n195), .Y(N35) );
  NOR2X1 U204 ( .A(n195), .B(invader_coord_y[3]), .Y(n197) );
  AOI21X1 U205 ( .A(n195), .B(invader_coord_y[3]), .C(n197), .Y(n196) );
  NAND2X1 U206 ( .A(n197), .B(n135), .Y(n198) );
  OAI21X1 U207 ( .A(n197), .B(n135), .C(n198), .Y(N37) );
  NOR2X1 U208 ( .A(n198), .B(invader_coord_y[5]), .Y(N39) );
  AOI21X1 U209 ( .A(n198), .B(invader_coord_y[5]), .C(N39), .Y(n199) );
  NOR2X1 U210 ( .A(n199), .B(player_bullet_coord_y[5]), .Y(n201) );
  NOR2X1 U211 ( .A(N37), .B(n201), .Y(n200) );
  AOI22X1 U212 ( .A(n200), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n199), .Y(n212) );
  NOR2X1 U213 ( .A(N39), .B(n201), .Y(n202) );
  OAI21X1 U214 ( .A(player_bullet_coord_y[4]), .B(n131), .C(n202), .Y(n211) );
  NAND2X1 U215 ( .A(n130), .B(n112), .Y(n205) );
  NAND3X1 U216 ( .A(n205), .B(n129), .C(player_bullet_coord_y[2]), .Y(n203) );
  OAI21X1 U217 ( .A(n130), .B(n112), .C(n203), .Y(n209) );
  AOI22X1 U218 ( .A(n115), .B(n128), .C(n116), .D(n132), .Y(n204) );
  OAI21X1 U219 ( .A(n128), .B(n115), .C(n114), .Y(n208) );
  NOR2X1 U220 ( .A(player_bullet_coord_y[2]), .B(n129), .Y(n206) );
  OAI21X1 U221 ( .A(n111), .B(n206), .C(n110), .Y(n207) );
  OAI21X1 U222 ( .A(n209), .B(n208), .C(n207), .Y(n210) );
  OAI22X1 U223 ( .A(N39), .B(n212), .C(n211), .D(n210), .Y(N40) );
endmodule

