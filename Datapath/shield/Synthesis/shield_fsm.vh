/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Tue Mar  3 15:18:13 2026
/////////////////////////////////////////////////////////////


module shield_fsm ( clka, clkb, reset, invader_bullet_coord_x, 
        invader_bullet_coord_y, shield_play, color, hp, shield_display, 
        bullet_shield_collision, state );
  input [5:0] invader_bullet_coord_x;
  input [5:0] invader_bullet_coord_y;
  output [3:0] color;
  output [1:0] hp;
  output [1:0] state;
  input clka, clkb, reset, shield_play;
  output shield_display, bullet_shield_collision;
  wire   N11, N12, N13, N14, N15, N16, N20, N21, N22, N23, N24, N39, N40, N52,
         N67, N68, N79, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n60, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121;
  wire   [5:0] shield_coord_x;
  wire   [5:0] shield_coord_y;
  wire   [1:0] next_state;
  wire   [7:0] \sub_43_2/carry ;
  wire   [7:0] \sub_43/carry ;
  assign N11 = invader_bullet_coord_x[0];
  assign hp[1] = N52;

  DFFNEGX1 \state_reg[0]  ( .D(N67), .CLK(n81), .Q(state[0]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N40), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[1]  ( .D(N68), .CLK(n81), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N39), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \shield_coord_y_reg[3]  ( .D(n76), .CLK(n81), .Q(shield_coord_y[3])
         );
  DFFNEGX1 \shield_coord_y_reg[1]  ( .D(n75), .CLK(n81), .Q(shield_coord_y[1])
         );
  DFFNEGX1 \shield_coord_x_reg[3]  ( .D(n74), .CLK(n81), .Q(shield_coord_x[3])
         );
  DFFNEGX1 \shield_coord_x_reg[1]  ( .D(n73), .CLK(n81), .Q(shield_coord_x[1])
         );
  DFFNEGX1 bullet_shield_collision_reg ( .D(n72), .CLK(n81), .Q(
        bullet_shield_collision) );
  DFFNEGX1 \color_reg[3]  ( .D(n69), .CLK(n81), .Q(color[3]) );
  DFFNEGX1 \hp_reg[0]  ( .D(n70), .CLK(n81), .Q(hp[0]) );
  DFFNEGX1 \hp_reg[1]  ( .D(n71), .CLK(n81), .Q(N52) );
  DFFNEGX1 \color_reg[2]  ( .D(n66), .CLK(n81), .Q(color[2]) );
  DFFNEGX1 \color_reg[1]  ( .D(n67), .CLK(n81), .Q(color[1]) );
  DFFNEGX1 \color_reg[0]  ( .D(n68), .CLK(n81), .Q(color[0]) );
  DFFNEGX1 shield_display_reg ( .D(n65), .CLK(n81), .Q(shield_display) );
  AND2X2 U17 ( .A(n103), .B(next_state[1]), .Y(N68) );
  OAI21X1 U35 ( .A(n113), .B(n38), .C(n39), .Y(n65) );
  OAI21X1 U36 ( .A(n102), .B(n40), .C(n101), .Y(n38) );
  OAI22X1 U37 ( .A(n41), .B(n111), .C(n83), .D(n108), .Y(n66) );
  OAI22X1 U38 ( .A(n41), .B(n112), .C(n83), .D(n111), .Y(n67) );
  OAI21X1 U39 ( .A(n83), .B(n112), .C(n42), .Y(n68) );
  NAND2X1 U40 ( .A(color[0]), .B(n84), .Y(n42) );
  OAI21X1 U41 ( .A(n108), .B(n41), .C(n39), .Y(n69) );
  OAI21X1 U42 ( .A(n41), .B(n109), .C(n44), .Y(n70) );
  AOI21X1 U43 ( .A(n43), .B(n109), .C(n99), .Y(n44) );
  OAI21X1 U44 ( .A(n45), .B(n110), .C(n46), .Y(n71) );
  AOI21X1 U45 ( .A(n47), .B(n43), .C(n99), .Y(n46) );
  NOR2X1 U46 ( .A(n102), .B(n84), .Y(n43) );
  NOR2X1 U47 ( .A(hp[0]), .B(N52), .Y(n47) );
  AOI21X1 U48 ( .A(hp[0]), .B(N67), .C(n84), .Y(n45) );
  OAI21X1 U49 ( .A(n102), .B(n48), .C(n101), .Y(n41) );
  OAI21X1 U50 ( .A(n102), .B(n48), .C(n49), .Y(n72) );
  NAND3X1 U51 ( .A(next_state[0]), .B(n102), .C(bullet_shield_collision), .Y(
        n49) );
  NAND2X1 U52 ( .A(n50), .B(n51), .Y(n48) );
  OAI21X1 U53 ( .A(N79), .B(n107), .C(n39), .Y(n73) );
  OAI21X1 U54 ( .A(N79), .B(n106), .C(n39), .Y(n74) );
  OAI21X1 U55 ( .A(N79), .B(n105), .C(n39), .Y(n75) );
  OAI21X1 U56 ( .A(N79), .B(n104), .C(n39), .Y(n76) );
  NAND2X1 U57 ( .A(shield_play), .B(N79), .Y(n39) );
  NOR2X1 U58 ( .A(next_state[0]), .B(next_state[1]), .Y(N79) );
  NOR2X1 U59 ( .A(n103), .B(next_state[1]), .Y(N67) );
  NOR2X1 U60 ( .A(reset), .B(n52), .Y(N40) );
  AOI22X1 U61 ( .A(n53), .B(state[0]), .C(state[1]), .D(n100), .Y(n52) );
  NOR2X1 U62 ( .A(state[1]), .B(n54), .Y(n53) );
  NOR2X1 U63 ( .A(n55), .B(n56), .Y(N39) );
  OR2X1 U64 ( .A(reset), .B(state[1]), .Y(n56) );
  AOI22X1 U65 ( .A(state[0]), .B(n54), .C(shield_play), .D(n100), .Y(n55) );
  OR2X1 U66 ( .A(n40), .B(hp[0]), .Y(n54) );
  NAND3X1 U67 ( .A(n51), .B(n110), .C(n50), .Y(n40) );
  NOR2X1 U68 ( .A(n57), .B(n58), .Y(n50) );
  NAND3X1 U69 ( .A(n97), .B(n60), .C(n98), .Y(n58) );
  XNOR2X1 U71 ( .A(shield_coord_y[1]), .B(invader_bullet_coord_y[1]), .Y(n60)
         );
  NAND3X1 U73 ( .A(n95), .B(n96), .C(n64), .Y(n57) );
  XNOR2X1 U74 ( .A(shield_coord_y[3]), .B(invader_bullet_coord_y[3]), .Y(n64)
         );
  OR2X1 U77 ( .A(n85), .B(n86), .Y(n51) );
  FAX1 \sub_43_2/U2_1  ( .A(shield_coord_x[1]), .B(n93), .C(n94), .YC(
        \sub_43_2/carry [2]), .YS(N20) );
  FAX1 \sub_43_2/U2_3  ( .A(shield_coord_x[3]), .B(n91), .C(n78), .YC(
        \sub_43_2/carry [4]), .YS(N22) );
  FAX1 \sub_43/U2_3  ( .A(invader_bullet_coord_x[3]), .B(n106), .C(
        \sub_43/carry [3]), .YC(\sub_43/carry [4]), .YS(N14) );
  AND2X2 U78 ( .A(\sub_43_2/carry [4]), .B(n88), .Y(n77) );
  AND2X2 U79 ( .A(\sub_43_2/carry [2]), .B(n92), .Y(n78) );
  NOR2X1 U80 ( .A(invader_bullet_coord_x[5]), .B(\sub_43/carry [5]), .Y(n79)
         );
  INVX1 U81 ( .A(clkb), .Y(n80) );
  INVX2 U82 ( .A(n80), .Y(n81) );
  OR2X1 U83 ( .A(invader_bullet_coord_x[2]), .B(\sub_43/carry [2]), .Y(
        \sub_43/carry [3]) );
  XNOR2X1 U84 ( .A(\sub_43/carry [2]), .B(invader_bullet_coord_x[2]), .Y(N13)
         );
  OR2X1 U85 ( .A(invader_bullet_coord_x[4]), .B(\sub_43/carry [4]), .Y(
        \sub_43/carry [5]) );
  XNOR2X1 U86 ( .A(\sub_43/carry [4]), .B(invader_bullet_coord_x[4]), .Y(N15)
         );
  XNOR2X1 U87 ( .A(\sub_43/carry [5]), .B(invader_bullet_coord_x[5]), .Y(N16)
         );
  OR2X1 U88 ( .A(invader_bullet_coord_x[1]), .B(n107), .Y(\sub_43/carry [2])
         );
  XNOR2X1 U89 ( .A(n107), .B(invader_bullet_coord_x[1]), .Y(N12) );
  XOR2X1 U90 ( .A(\sub_43_2/carry [2]), .B(n92), .Y(N21) );
  XOR2X1 U91 ( .A(\sub_43_2/carry [4]), .B(n88), .Y(N23) );
  XOR2X1 U92 ( .A(n77), .B(n87), .Y(N24) );
  NAND2X1 U93 ( .A(n77), .B(n87), .Y(n82) );
  INVX2 U94 ( .A(n43), .Y(n83) );
  INVX2 U95 ( .A(n41), .Y(n84) );
  INVX2 U96 ( .A(n117), .Y(n85) );
  INVX2 U97 ( .A(n121), .Y(n86) );
  INVX2 U98 ( .A(invader_bullet_coord_x[5]), .Y(n87) );
  INVX2 U99 ( .A(invader_bullet_coord_x[4]), .Y(n88) );
  INVX2 U100 ( .A(N14), .Y(n89) );
  INVX2 U101 ( .A(N22), .Y(n90) );
  INVX2 U102 ( .A(invader_bullet_coord_x[3]), .Y(n91) );
  INVX2 U103 ( .A(invader_bullet_coord_x[2]), .Y(n92) );
  INVX2 U104 ( .A(invader_bullet_coord_x[1]), .Y(n93) );
  INVX2 U105 ( .A(N11), .Y(n94) );
  INVX2 U106 ( .A(invader_bullet_coord_y[5]), .Y(n95) );
  INVX2 U107 ( .A(invader_bullet_coord_y[4]), .Y(n96) );
  INVX2 U108 ( .A(invader_bullet_coord_y[2]), .Y(n97) );
  INVX2 U109 ( .A(invader_bullet_coord_y[0]), .Y(n98) );
  INVX2 U110 ( .A(n39), .Y(n99) );
  INVX2 U111 ( .A(state[0]), .Y(n100) );
  INVX2 U112 ( .A(N79), .Y(n101) );
  INVX2 U113 ( .A(N67), .Y(n102) );
  INVX2 U114 ( .A(next_state[0]), .Y(n103) );
  INVX2 U115 ( .A(shield_coord_y[3]), .Y(n104) );
  INVX2 U116 ( .A(shield_coord_y[1]), .Y(n105) );
  INVX2 U117 ( .A(shield_coord_x[3]), .Y(n106) );
  INVX2 U118 ( .A(shield_coord_x[1]), .Y(n107) );
  INVX2 U119 ( .A(color[3]), .Y(n108) );
  INVX2 U120 ( .A(hp[0]), .Y(n109) );
  INVX2 U121 ( .A(N52), .Y(n110) );
  INVX2 U122 ( .A(color[2]), .Y(n111) );
  INVX2 U123 ( .A(color[1]), .Y(n112) );
  INVX2 U124 ( .A(shield_display), .Y(n113) );
  OAI21X1 U125 ( .A(N11), .B(N12), .C(N13), .Y(n116) );
  OR2X1 U126 ( .A(n79), .B(N16), .Y(n114) );
  NOR2X1 U127 ( .A(N15), .B(n114), .Y(n115) );
  NAND3X1 U128 ( .A(n116), .B(n89), .C(n115), .Y(n117) );
  OAI21X1 U129 ( .A(N11), .B(N20), .C(N21), .Y(n120) );
  OR2X1 U130 ( .A(n82), .B(N24), .Y(n118) );
  NOR2X1 U131 ( .A(N23), .B(n118), .Y(n119) );
  NAND3X1 U132 ( .A(n120), .B(n90), .C(n119), .Y(n121) );
endmodule

