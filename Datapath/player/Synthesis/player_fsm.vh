/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Tue Mar  3 16:14:00 2026
/////////////////////////////////////////////////////////////


module player_fsm ( clka, clkb, reset, play, invader_bullet_coord_x, 
        invader_bullet_coord_y, left_motion, right_motion, 
        player_bullet_collision, player_coord_x, player_coord_y, display, 
        state );
  input [5:0] invader_bullet_coord_x;
  input [5:0] invader_bullet_coord_y;
  output [5:0] player_coord_x;
  output [5:0] player_coord_y;
  output [1:0] state;
  input clka, clkb, reset, play, left_motion, right_motion;
  output player_bullet_collision, display;
  wire   N11, N12, N13, N14, N15, N17, N18, N25, N26, N39, N40, N52, N54, N59,
         N61, N62, N63, N66, N67, N68, N69, N70, N88, N89, N98, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n68, n69, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149;
  wire   [1:0] next_state;
  wire   [5:2] \add_100/carry ;
  wire   [7:0] \r389/carry ;
  assign player_coord_y[5] = 1'b0;
  assign player_coord_y[4] = 1'b0;
  assign player_coord_y[3] = 1'b0;
  assign player_coord_y[2] = 1'b0;
  assign player_coord_y[1] = 1'b1;
  assign player_coord_y[0] = 1'b0;

  DFFNEGX1 \state_reg[0]  ( .D(N88), .CLK(n85), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N40), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[1]  ( .D(N89), .CLK(n85), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N39), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \player_coord_x_reg[0]  ( .D(n83), .CLK(n85), .Q(player_coord_x[0])
         );
  DFFNEGX1 \player_coord_x_reg[5]  ( .D(n78), .CLK(n85), .Q(player_coord_x[5])
         );
  DFFNEGX1 \player_coord_x_reg[4]  ( .D(n79), .CLK(n85), .Q(player_coord_x[4])
         );
  DFFNEGX1 \player_coord_x_reg[1]  ( .D(n82), .CLK(n85), .Q(player_coord_x[1])
         );
  DFFNEGX1 \player_coord_x_reg[3]  ( .D(n80), .CLK(n85), .Q(player_coord_x[3])
         );
  DFFNEGX1 \player_coord_x_reg[2]  ( .D(n81), .CLK(n85), .Q(player_coord_x[2])
         );
  DFFNEGX1 player_bullet_collision_reg ( .D(n86), .CLK(n85), .Q(
        player_bullet_collision) );
  DFFNEGX1 display_reg ( .D(N98), .CLK(n85), .Q(display) );
  OAI21X1 U30 ( .A(n37), .B(n109), .C(n38), .Y(n78) );
  AOI22X1 U31 ( .A(N70), .B(n39), .C(N63), .D(n40), .Y(n38) );
  OR2X1 U32 ( .A(n41), .B(n42), .Y(n79) );
  NAND2X1 U33 ( .A(n43), .B(n44), .Y(n42) );
  OAI21X1 U34 ( .A(n45), .B(n86), .C(player_coord_x[4]), .Y(n44) );
  OAI21X1 U35 ( .A(n46), .B(n47), .C(n87), .Y(n41) );
  AOI22X1 U36 ( .A(N69), .B(n103), .C(N62), .D(n102), .Y(n46) );
  OAI21X1 U37 ( .A(n37), .B(n112), .C(n49), .Y(n80) );
  AOI22X1 U38 ( .A(N68), .B(n39), .C(N61), .D(n40), .Y(n49) );
  OAI21X1 U39 ( .A(n37), .B(n113), .C(n50), .Y(n81) );
  AOI22X1 U40 ( .A(N67), .B(n39), .C(n107), .D(n40), .Y(n50) );
  OAI21X1 U41 ( .A(n37), .B(n111), .C(n51), .Y(n82) );
  AOI22X1 U42 ( .A(N66), .B(n39), .C(N59), .D(n40), .Y(n51) );
  OAI21X1 U43 ( .A(n37), .B(n108), .C(n52), .Y(n83) );
  AOI22X1 U44 ( .A(n108), .B(n39), .C(n108), .D(n40), .Y(n52) );
  NOR2X1 U45 ( .A(n53), .B(n88), .Y(n40) );
  NOR2X1 U46 ( .A(n48), .B(n88), .Y(n39) );
  NAND3X1 U47 ( .A(N54), .B(n53), .C(right_motion), .Y(n48) );
  AOI21X1 U48 ( .A(n54), .B(n45), .C(n86), .Y(n37) );
  AOI21X1 U49 ( .A(N54), .B(right_motion), .C(n102), .Y(n45) );
  NAND2X1 U50 ( .A(left_motion), .B(N52), .Y(n53) );
  NAND2X1 U51 ( .A(n106), .B(n87), .Y(N98) );
  NOR2X1 U52 ( .A(n55), .B(n105), .Y(N89) );
  NOR2X1 U53 ( .A(n55), .B(n106), .Y(N88) );
  NOR2X1 U54 ( .A(n86), .B(n54), .Y(n55) );
  NOR2X1 U55 ( .A(n47), .B(reset), .Y(n54) );
  NAND2X1 U56 ( .A(next_state[0]), .B(n105), .Y(n47) );
  NAND3X1 U57 ( .A(n106), .B(n87), .C(next_state[1]), .Y(n56) );
  NOR2X1 U58 ( .A(reset), .B(n57), .Y(N40) );
  AOI22X1 U59 ( .A(n58), .B(state[0]), .C(state[1]), .D(n104), .Y(n57) );
  NOR2X1 U60 ( .A(state[1]), .B(n59), .Y(n58) );
  NOR2X1 U61 ( .A(n60), .B(n61), .Y(N39) );
  OR2X1 U62 ( .A(reset), .B(state[1]), .Y(n61) );
  AOI22X1 U63 ( .A(state[0]), .B(n59), .C(play), .D(n104), .Y(n60) );
  OR2X1 U64 ( .A(n62), .B(n63), .Y(n59) );
  NAND3X1 U65 ( .A(n101), .B(n100), .C(invader_bullet_coord_y[1]), .Y(n63) );
  NAND3X1 U69 ( .A(n99), .B(n68), .C(n69), .Y(n62) );
  NOR2X1 U70 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[4]), 
        .Y(n69) );
  OAI21X1 U73 ( .A(n72), .B(n73), .C(n74), .Y(n68) );
  NAND2X1 U74 ( .A(N26), .B(N25), .Y(n74) );
  NAND2X1 U75 ( .A(n75), .B(N17), .Y(n73) );
  NOR2X1 U76 ( .A(N12), .B(N11), .Y(n75) );
  NAND2X1 U77 ( .A(n76), .B(n77), .Y(n72) );
  NOR2X1 U78 ( .A(n89), .B(N15), .Y(n77) );
  NOR2X1 U79 ( .A(N14), .B(N13), .Y(n76) );
  XOR2X1 U81 ( .A(next_state[0]), .B(next_state[1]), .Y(n43) );
  HAX1 \add_100/U1_1_1  ( .A(player_coord_x[1]), .B(player_coord_x[0]), .YC(
        \add_100/carry [2]), .YS(N66) );
  HAX1 \add_100/U1_1_2  ( .A(player_coord_x[2]), .B(\add_100/carry [2]), .YC(
        \add_100/carry [3]), .YS(N67) );
  HAX1 \add_100/U1_1_3  ( .A(player_coord_x[3]), .B(\add_100/carry [3]), .YC(
        \add_100/carry [4]), .YS(N68) );
  HAX1 \add_100/U1_1_4  ( .A(player_coord_x[4]), .B(\add_100/carry [4]), .YC(
        \add_100/carry [5]), .YS(N69) );
  FAX1 \r389/U2_1  ( .A(invader_bullet_coord_x[1]), .B(n111), .C(
        \r389/carry [1]), .YC(\r389/carry [2]), .YS(N11) );
  FAX1 \r389/U2_2  ( .A(invader_bullet_coord_x[2]), .B(n113), .C(
        \r389/carry [2]), .YC(\r389/carry [3]), .YS(N12) );
  FAX1 \r389/U2_3  ( .A(invader_bullet_coord_x[3]), .B(n112), .C(
        \r389/carry [3]), .YC(\r389/carry [4]), .YS(N13) );
  FAX1 \r389/U2_4  ( .A(invader_bullet_coord_x[4]), .B(n110), .C(
        \r389/carry [4]), .YC(\r389/carry [5]), .YS(N14) );
  FAX1 \r389/U2_5  ( .A(invader_bullet_coord_x[5]), .B(n109), .C(
        \r389/carry [5]), .YC(\r389/carry [6]), .YS(N15) );
  INVX1 U82 ( .A(clkb), .Y(n84) );
  INVX2 U83 ( .A(n84), .Y(n85) );
  OR2X1 U84 ( .A(invader_bullet_coord_x[0]), .B(n108), .Y(\r389/carry [1]) );
  XNOR2X1 U85 ( .A(n108), .B(invader_bullet_coord_x[0]), .Y(N18) );
  AND2X2 U86 ( .A(n116), .B(n129), .Y(n117) );
  AND2X2 U87 ( .A(n120), .B(n135), .Y(n121) );
  AND2X2 U88 ( .A(N11), .B(N18), .Y(n138) );
  AND2X2 U89 ( .A(player_coord_x[4]), .B(player_coord_x[3]), .Y(n144) );
  AND2X2 U90 ( .A(player_coord_x[2]), .B(player_coord_x[1]), .Y(n143) );
  INVX2 U91 ( .A(n56), .Y(n86) );
  INVX2 U92 ( .A(reset), .Y(n87) );
  INVX2 U93 ( .A(n54), .Y(n88) );
  INVX2 U94 ( .A(\r389/carry [6]), .Y(n89) );
  INVX2 U95 ( .A(n137), .Y(n90) );
  INVX2 U96 ( .A(invader_bullet_coord_x[5]), .Y(n91) );
  INVX2 U97 ( .A(invader_bullet_coord_x[4]), .Y(n92) );
  INVX2 U98 ( .A(n131), .Y(n93) );
  INVX2 U99 ( .A(invader_bullet_coord_x[3]), .Y(n94) );
  INVX2 U100 ( .A(invader_bullet_coord_x[1]), .Y(n95) );
  INVX2 U101 ( .A(n114), .Y(n96) );
  INVX2 U102 ( .A(n125), .Y(n97) );
  INVX2 U103 ( .A(invader_bullet_coord_x[0]), .Y(n98) );
  INVX2 U104 ( .A(invader_bullet_coord_y[5]), .Y(n99) );
  INVX2 U105 ( .A(invader_bullet_coord_y[2]), .Y(n100) );
  INVX2 U106 ( .A(invader_bullet_coord_y[0]), .Y(n101) );
  INVX2 U107 ( .A(n53), .Y(n102) );
  INVX2 U108 ( .A(n48), .Y(n103) );
  INVX2 U109 ( .A(state[0]), .Y(n104) );
  INVX2 U110 ( .A(next_state[1]), .Y(n105) );
  INVX2 U111 ( .A(next_state[0]), .Y(n106) );
  INVX2 U112 ( .A(n146), .Y(n107) );
  INVX2 U113 ( .A(player_coord_x[0]), .Y(n108) );
  INVX2 U114 ( .A(player_coord_x[5]), .Y(n109) );
  INVX2 U115 ( .A(player_coord_x[4]), .Y(n110) );
  INVX2 U116 ( .A(player_coord_x[1]), .Y(n111) );
  INVX2 U117 ( .A(player_coord_x[3]), .Y(n112) );
  INVX2 U118 ( .A(player_coord_x[2]), .Y(n113) );
  NOR2X1 U119 ( .A(n91), .B(player_coord_x[5]), .Y(n137) );
  OR2X1 U120 ( .A(n92), .B(player_coord_x[4]), .Y(n132) );
  NAND2X1 U121 ( .A(player_coord_x[4]), .B(n92), .Y(n120) );
  NAND2X1 U122 ( .A(n132), .B(n120), .Y(n134) );
  OR2X1 U123 ( .A(n113), .B(invader_bullet_coord_x[2]), .Y(n116) );
  NAND2X1 U124 ( .A(invader_bullet_coord_x[2]), .B(n113), .Y(n126) );
  NAND2X1 U125 ( .A(n116), .B(n126), .Y(n128) );
  NAND2X1 U126 ( .A(player_coord_x[0]), .B(n98), .Y(n114) );
  OAI21X1 U127 ( .A(invader_bullet_coord_x[1]), .B(n114), .C(n111), .Y(n115)
         );
  OAI21X1 U128 ( .A(n96), .B(n95), .C(n115), .Y(n118) );
  NAND2X1 U129 ( .A(player_coord_x[3]), .B(n94), .Y(n129) );
  OAI21X1 U130 ( .A(n128), .B(n118), .C(n117), .Y(n119) );
  NOR2X1 U131 ( .A(n94), .B(player_coord_x[3]), .Y(n131) );
  NAND2X1 U132 ( .A(n119), .B(n93), .Y(n122) );
  NAND2X1 U133 ( .A(player_coord_x[5]), .B(n91), .Y(n135) );
  OAI21X1 U134 ( .A(n134), .B(n122), .C(n121), .Y(n123) );
  NAND2X1 U135 ( .A(n90), .B(n123), .Y(N17) );
  NOR2X1 U136 ( .A(n98), .B(player_coord_x[0]), .Y(n125) );
  OAI21X1 U137 ( .A(n97), .B(n95), .C(player_coord_x[1]), .Y(n124) );
  OAI21X1 U138 ( .A(invader_bullet_coord_x[1]), .B(n125), .C(n124), .Y(n127)
         );
  OAI21X1 U139 ( .A(n128), .B(n127), .C(n126), .Y(n130) );
  OAI21X1 U140 ( .A(n131), .B(n130), .C(n129), .Y(n133) );
  OAI21X1 U141 ( .A(n134), .B(n133), .C(n132), .Y(n136) );
  OAI21X1 U142 ( .A(n137), .B(n136), .C(n135), .Y(N26) );
  NAND3X1 U143 ( .A(N13), .B(N12), .C(n138), .Y(n140) );
  NAND3X1 U144 ( .A(N15), .B(N14), .C(n89), .Y(n139) );
  NOR2X1 U145 ( .A(n140), .B(n139), .Y(N25) );
  NOR2X1 U146 ( .A(player_coord_x[5]), .B(player_coord_x[4]), .Y(n142) );
  NOR2X1 U147 ( .A(player_coord_x[2]), .B(player_coord_x[1]), .Y(n141) );
  NAND3X1 U148 ( .A(n142), .B(n112), .C(n141), .Y(N52) );
  AOI21X1 U149 ( .A(n144), .B(n143), .C(player_coord_x[5]), .Y(N54) );
  NAND2X1 U150 ( .A(n111), .B(n108), .Y(n145) );
  OAI21X1 U151 ( .A(n108), .B(n111), .C(n145), .Y(N59) );
  NOR2X1 U152 ( .A(n145), .B(player_coord_x[2]), .Y(n147) );
  AOI21X1 U153 ( .A(n145), .B(player_coord_x[2]), .C(n147), .Y(n146) );
  NAND2X1 U154 ( .A(n147), .B(n112), .Y(n148) );
  OAI21X1 U155 ( .A(n147), .B(n112), .C(n148), .Y(N61) );
  XNOR2X1 U156 ( .A(player_coord_x[4]), .B(n148), .Y(N62) );
  NOR2X1 U157 ( .A(player_coord_x[4]), .B(n148), .Y(n149) );
  XOR2X1 U158 ( .A(player_coord_x[5]), .B(n149), .Y(N63) );
  XOR2X1 U159 ( .A(\add_100/carry [5]), .B(player_coord_x[5]), .Y(N70) );
endmodule

