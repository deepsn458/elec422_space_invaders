/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 10:46:55 2026
/////////////////////////////////////////////////////////////


module shield_fsm ( clka, clkb, reset, invader_bullet_coord_x, 
        invader_bullet_coord_y, player_bullet_coord_x, player_bullet_coord_y, 
        shield_play, hp, shield_display, invaderbullet_shield_collision, 
        playerbullet_shield_collision, shield_coord_x, shield_coord_y, state
 );
  input [3:0] invader_bullet_coord_x;
  input [3:0] invader_bullet_coord_y;
  input [3:0] player_bullet_coord_x;
  input [3:0] player_bullet_coord_y;
  output [1:0] hp;
  output [3:0] shield_coord_x;
  output [3:0] shield_coord_y;
  output [1:0] state;
  input clka, clkb, reset, shield_play;
  output shield_display, invaderbullet_shield_collision,
         playerbullet_shield_collision;
  wire   N13, N16, N17, N19, N20, N22, N28, N29, N31, N32, N34, N47, N48, N61,
         N88, N89, N102, n47, n48, n49, n50, n51, n52, n54, n55, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n79, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142;
  wire   [1:0] next_state;
  assign shield_coord_x[3] = 1'b0;
  assign shield_coord_x[0] = 1'b1;
  assign shield_coord_y[3] = 1'b0;
  assign shield_coord_y[1] = 1'b0;
  assign shield_coord_y[0] = 1'b1;
  assign N17 = invader_bullet_coord_x[0];
  assign N29 = player_bullet_coord_x[0];
  assign hp[1] = N61;

  DFFNEGX1 \hp_reg[0]  ( .D(n88), .CLK(n94), .Q(hp[0]) );
  DFFNEGX1 \hp_reg[1]  ( .D(n87), .CLK(n94), .Q(N61) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N47), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \state_reg[0]  ( .D(N88), .CLK(n94), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N48), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[1]  ( .D(N89), .CLK(n94), .Q(state[1]) );
  DFFNEGX1 \shield_coord_y_reg[2]  ( .D(n86), .CLK(n94), .Q(shield_coord_y[2])
         );
  DFFNEGX1 \shield_coord_x_reg[2]  ( .D(n85), .CLK(n94), .Q(shield_coord_x[2])
         );
  DFFNEGX1 \shield_coord_x_reg[1]  ( .D(n84), .CLK(n94), .Q(shield_coord_x[1])
         );
  DFFNEGX1 invaderbullet_shield_collision_reg ( .D(n83), .CLK(n94), .Q(
        invaderbullet_shield_collision) );
  DFFNEGX1 shield_display_reg ( .D(n81), .CLK(n94), .Q(shield_display) );
  DFFNEGX1 playerbullet_shield_collision_reg ( .D(n82), .CLK(n94), .Q(
        playerbullet_shield_collision) );
  AND2X2 U16 ( .A(N61), .B(N34), .Y(n58) );
  AND2X2 U18 ( .A(n69), .B(n65), .Y(n48) );
  AND2X2 U19 ( .A(n97), .B(next_state[0]), .Y(n69) );
  NAND2X1 U33 ( .A(n47), .B(n97), .Y(n81) );
  AOI22X1 U34 ( .A(n117), .B(n100), .C(shield_display), .D(n48), .Y(n47) );
  OAI21X1 U35 ( .A(n50), .B(n51), .C(n52), .Y(n82) );
  NAND2X1 U36 ( .A(playerbullet_shield_collision), .B(n48), .Y(n52) );
  NAND3X1 U37 ( .A(n113), .B(n54), .C(n55), .Y(n51) );
  NOR2X1 U38 ( .A(player_bullet_coord_y[3]), .B(n114), .Y(n55) );
  XOR2X1 U41 ( .A(n120), .B(player_bullet_coord_y[2]), .Y(n54) );
  NAND3X1 U43 ( .A(N28), .B(n98), .C(n58), .Y(n50) );
  OAI21X1 U44 ( .A(n60), .B(n59), .C(n61), .Y(n83) );
  NAND2X1 U45 ( .A(invaderbullet_shield_collision), .B(n48), .Y(n61) );
  NAND2X1 U46 ( .A(n117), .B(n99), .Y(n59) );
  OAI21X1 U47 ( .A(N102), .B(n122), .C(n97), .Y(n84) );
  OAI21X1 U48 ( .A(N102), .B(n121), .C(n97), .Y(n85) );
  OAI21X1 U49 ( .A(N102), .B(n120), .C(n97), .Y(n86) );
  NAND2X1 U50 ( .A(n62), .B(n97), .Y(n87) );
  AOI22X1 U51 ( .A(N61), .B(n63), .C(n96), .D(n116), .Y(n62) );
  OAI21X1 U52 ( .A(n65), .B(n115), .C(n66), .Y(n63) );
  OR2X1 U53 ( .A(n67), .B(n68), .Y(n88) );
  OAI21X1 U54 ( .A(n115), .B(n66), .C(n64), .Y(n68) );
  NAND3X1 U55 ( .A(n66), .B(n115), .C(n117), .Y(n64) );
  OAI21X1 U56 ( .A(n60), .B(n65), .C(n69), .Y(n66) );
  NOR2X1 U57 ( .A(n65), .B(n119), .Y(N89) );
  NOR2X1 U58 ( .A(reset), .B(n65), .Y(N88) );
  NOR2X1 U59 ( .A(reset), .B(n70), .Y(N48) );
  AOI22X1 U60 ( .A(n71), .B(state[0]), .C(state[1]), .D(n118), .Y(n70) );
  NOR2X1 U61 ( .A(state[1]), .B(n72), .Y(n71) );
  NOR2X1 U62 ( .A(n73), .B(n74), .Y(N47) );
  OR2X1 U63 ( .A(reset), .B(state[1]), .Y(n74) );
  AOI22X1 U64 ( .A(state[0]), .B(n72), .C(shield_play), .D(n118), .Y(n73) );
  NAND2X1 U65 ( .A(n49), .B(n115), .Y(n72) );
  NOR2X1 U66 ( .A(n60), .B(N61), .Y(n49) );
  OR2X1 U67 ( .A(n75), .B(n76), .Y(n60) );
  NAND3X1 U68 ( .A(invader_bullet_coord_y[0]), .B(n107), .C(n79), .Y(n76) );
  XOR2X1 U69 ( .A(n120), .B(invader_bullet_coord_y[2]), .Y(n79) );
  NAND3X1 U72 ( .A(N22), .B(N16), .C(n106), .Y(n75) );
  AOI21X1 U74 ( .A(n99), .B(n117), .C(n48), .Y(N102) );
  OAI21X1 U75 ( .A(next_state[1]), .B(next_state[0]), .C(n99), .Y(n67) );
  NAND2X1 U76 ( .A(next_state[0]), .B(n119), .Y(n65) );
  AND2X2 U77 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(n89) );
  AND2X2 U78 ( .A(n89), .B(invader_bullet_coord_x[3]), .Y(n90) );
  AND2X2 U79 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), .Y(
        n91) );
  AND2X2 U80 ( .A(n91), .B(player_bullet_coord_x[3]), .Y(n92) );
  INVX1 U81 ( .A(clkb), .Y(n93) );
  INVX2 U82 ( .A(n93), .Y(n94) );
  XOR2X1 U83 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), .Y(
        N31) );
  XOR2X1 U84 ( .A(n91), .B(player_bullet_coord_x[3]), .Y(N32) );
  XOR2X1 U85 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(N19) );
  XOR2X1 U86 ( .A(n89), .B(invader_bullet_coord_x[3]), .Y(N20) );
  XOR2X1 U87 ( .A(shield_coord_x[1]), .B(shield_coord_x[2]), .Y(N13) );
  NAND2X1 U88 ( .A(shield_coord_x[1]), .B(shield_coord_x[2]), .Y(n95) );
  INVX2 U89 ( .A(n64), .Y(n96) );
  INVX2 U90 ( .A(n67), .Y(n97) );
  INVX2 U91 ( .A(n59), .Y(n98) );
  INVX2 U92 ( .A(reset), .Y(n99) );
  INVX2 U93 ( .A(n49), .Y(n100) );
  INVX2 U94 ( .A(n125), .Y(n101) );
  INVX2 U95 ( .A(invader_bullet_coord_x[2]), .Y(n102) );
  INVX2 U96 ( .A(N19), .Y(n103) );
  INVX2 U97 ( .A(invader_bullet_coord_x[1]), .Y(n104) );
  INVX2 U98 ( .A(N17), .Y(n105) );
  INVX2 U99 ( .A(invader_bullet_coord_y[3]), .Y(n106) );
  INVX2 U100 ( .A(invader_bullet_coord_y[1]), .Y(n107) );
  INVX2 U101 ( .A(n135), .Y(n108) );
  INVX2 U102 ( .A(player_bullet_coord_x[2]), .Y(n109) );
  INVX2 U103 ( .A(N31), .Y(n110) );
  INVX2 U104 ( .A(player_bullet_coord_x[1]), .Y(n111) );
  INVX2 U105 ( .A(N29), .Y(n112) );
  INVX2 U106 ( .A(player_bullet_coord_y[1]), .Y(n113) );
  INVX2 U107 ( .A(player_bullet_coord_y[0]), .Y(n114) );
  INVX2 U108 ( .A(hp[0]), .Y(n115) );
  INVX2 U109 ( .A(N61), .Y(n116) );
  INVX2 U110 ( .A(n65), .Y(n117) );
  INVX2 U111 ( .A(state[0]), .Y(n118) );
  INVX2 U112 ( .A(next_state[1]), .Y(n119) );
  INVX2 U113 ( .A(shield_coord_y[2]), .Y(n120) );
  INVX2 U114 ( .A(shield_coord_x[2]), .Y(n121) );
  INVX2 U115 ( .A(shield_coord_x[1]), .Y(n122) );
  NAND2X1 U116 ( .A(player_bullet_coord_x[1]), .B(shield_coord_x[1]), .Y(n133)
         );
  NAND2X1 U117 ( .A(invader_bullet_coord_x[1]), .B(shield_coord_x[1]), .Y(n123) );
  AOI21X1 U118 ( .A(n122), .B(n104), .C(n123), .Y(n128) );
  NAND2X1 U119 ( .A(invader_bullet_coord_x[3]), .B(n95), .Y(n126) );
  NAND3X1 U120 ( .A(n126), .B(n102), .C(N13), .Y(n124) );
  OAI21X1 U121 ( .A(invader_bullet_coord_x[3]), .B(n95), .C(n124), .Y(n125) );
  OAI21X1 U122 ( .A(N13), .B(n102), .C(n126), .Y(n127) );
  AOI22X1 U123 ( .A(n128), .B(n101), .C(n101), .D(n127), .Y(N16) );
  AOI22X1 U124 ( .A(shield_coord_x[2]), .B(n103), .C(shield_coord_x[1]), .D(
        invader_bullet_coord_x[1]), .Y(n130) );
  OAI21X1 U125 ( .A(shield_coord_x[1]), .B(invader_bullet_coord_x[1]), .C(n105), .Y(n129) );
  AOI22X1 U126 ( .A(N19), .B(n121), .C(n130), .D(n129), .Y(n132) );
  NOR2X1 U127 ( .A(n90), .B(N20), .Y(n131) );
  NAND2X1 U128 ( .A(n132), .B(n131), .Y(N22) );
  AOI21X1 U129 ( .A(n122), .B(n111), .C(n133), .Y(n138) );
  NAND2X1 U130 ( .A(player_bullet_coord_x[3]), .B(n95), .Y(n136) );
  NAND3X1 U131 ( .A(n136), .B(n109), .C(N13), .Y(n134) );
  OAI21X1 U132 ( .A(player_bullet_coord_x[3]), .B(n95), .C(n134), .Y(n135) );
  OAI21X1 U133 ( .A(N13), .B(n109), .C(n136), .Y(n137) );
  AOI22X1 U134 ( .A(n138), .B(n108), .C(n108), .D(n137), .Y(N28) );
  AOI22X1 U135 ( .A(shield_coord_x[2]), .B(n110), .C(shield_coord_x[1]), .D(
        player_bullet_coord_x[1]), .Y(n140) );
  OAI21X1 U136 ( .A(shield_coord_x[1]), .B(player_bullet_coord_x[1]), .C(n112), 
        .Y(n139) );
  AOI22X1 U137 ( .A(N31), .B(n121), .C(n140), .D(n139), .Y(n142) );
  NOR2X1 U138 ( .A(n92), .B(N32), .Y(n141) );
  NAND2X1 U139 ( .A(n142), .B(n141), .Y(N34) );
endmodule

