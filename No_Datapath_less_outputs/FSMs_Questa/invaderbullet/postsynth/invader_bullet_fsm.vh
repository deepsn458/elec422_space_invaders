/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Thu Apr 30 01:18:41 2026
/////////////////////////////////////////////////////////////


module invader_bullet_fsm ( clka, clkb, reset, 
        invaderbullet_player_collision_signal, 
        invaderbullet_shield_collision_signal, invader_fire, 
        closest_invader_coord_x, closest_invader_coord_y, 
        invader_bullet_display, invader_bullet_coord_x, invader_bullet_coord_y, 
        state );
  input [3:0] closest_invader_coord_x;
  input [3:0] closest_invader_coord_y;
  output [3:0] invader_bullet_coord_x;
  output [3:0] invader_bullet_coord_y;
  output [1:0] state;
  input clka, clkb, reset, invaderbullet_player_collision_signal,
         invaderbullet_shield_collision_signal, invader_fire;
  output invader_bullet_display;
  wire   \next_state[0] , N19, N36, n5, n6, n7, n8, n9, n10, n11, n12, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29,
         n30, n31, n32, n33, n34, n37, n38, n40, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n53, n54;
  assign state[1] = 1'b0;

  DFFNEGX1 \invader_bullet_coord_y_reg[0]  ( .D(n37), .CLK(n54), .Q(
        invader_bullet_coord_y[0]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[3]  ( .D(n44), .CLK(n54), .Q(
        invader_bullet_coord_y[3]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N19), .CLK(clka), .Q(\next_state[0] ) );
  DFFNEGX1 \invader_bullet_coord_x_reg[1]  ( .D(n47), .CLK(n54), .Q(
        invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[2]  ( .D(n48), .CLK(n54), .Q(
        invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[3]  ( .D(n49), .CLK(n54), .Q(
        invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[0]  ( .D(n50), .CLK(n54), .Q(
        invader_bullet_coord_x[0]) );
  DFFNEGX1 \state_reg[0]  ( .D(N36), .CLK(n54), .Q(state[0]) );
  DFFNEGX1 invader_bullet_display_reg ( .D(n51), .CLK(n54), .Q(
        invader_bullet_display) );
  DFFNEGX1 \invader_bullet_coord_y_reg[1]  ( .D(n46), .CLK(n54), .Q(
        invader_bullet_coord_y[1]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[2]  ( .D(n45), .CLK(n54), .Q(
        invader_bullet_coord_y[2]) );
  INVX2 U8 ( .A(\next_state[0] ), .Y(n5) );
  INVX2 U9 ( .A(state[0]), .Y(n6) );
  INVX2 U10 ( .A(invader_bullet_coord_x[3]), .Y(n7) );
  INVX2 U11 ( .A(invader_bullet_coord_x[2]), .Y(n8) );
  INVX2 U12 ( .A(invader_bullet_coord_x[1]), .Y(n9) );
  INVX2 U13 ( .A(invader_bullet_coord_x[0]), .Y(n10) );
  INVX2 U14 ( .A(n20), .Y(n11) );
  INVX2 U15 ( .A(invader_bullet_coord_y[2]), .Y(n12) );
  INVX2 U17 ( .A(invader_bullet_coord_y[0]), .Y(n14) );
  INVX2 U18 ( .A(reset), .Y(n15) );
  INVX2 U19 ( .A(closest_invader_coord_y[2]), .Y(n16) );
  AOI21X1 U21 ( .A(invader_bullet_coord_y[3]), .B(n19), .C(reset), .Y(n18) );
  AOI22X1 U23 ( .A(n21), .B(\next_state[0] ), .C(closest_invader_coord_y[3]), 
        .D(n5), .Y(n17) );
  OAI21X1 U26 ( .A(n25), .B(n12), .C(n26), .Y(n24) );
  NOR2X1 U28 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[0]), 
        .Y(n25) );
  OAI21X1 U29 ( .A(\next_state[0] ), .B(n16), .C(n15), .Y(n23) );
  AOI22X1 U31 ( .A(\next_state[0] ), .B(n29), .C(closest_invader_coord_y[1]), 
        .D(n5), .Y(n27) );
  OAI21X1 U32 ( .A(n30), .B(n9), .C(n31), .Y(n47) );
  NAND3X1 U33 ( .A(n30), .B(n15), .C(closest_invader_coord_x[1]), .Y(n31) );
  OAI21X1 U34 ( .A(n30), .B(n8), .C(n32), .Y(n48) );
  NAND3X1 U35 ( .A(n30), .B(n15), .C(closest_invader_coord_x[2]), .Y(n32) );
  OAI21X1 U36 ( .A(n30), .B(n7), .C(n33), .Y(n49) );
  OAI21X1 U37 ( .A(closest_invader_coord_x[3]), .B(reset), .C(n30), .Y(n33) );
  OAI21X1 U38 ( .A(n30), .B(n10), .C(n34), .Y(n50) );
  OAI21X1 U39 ( .A(closest_invader_coord_x[0]), .B(reset), .C(n30), .Y(n34) );
  OAI21X1 U45 ( .A(invader_bullet_coord_y[0]), .B(n5), .C(n38), .Y(n37) );
  AOI21X1 U46 ( .A(closest_invader_coord_y[0]), .B(n5), .C(reset), .Y(n38) );
  NOR2X1 U47 ( .A(n5), .B(reset), .Y(N36) );
  NOR2X1 U49 ( .A(n40), .B(reset), .Y(N19) );
  AOI22X1 U51 ( .A(n42), .B(n43), .C(invader_fire), .D(n6), .Y(n40) );
  NOR2X1 U52 ( .A(invaderbullet_shield_collision_signal), .B(
        invaderbullet_player_collision_signal), .Y(n43) );
  NOR2X1 U53 ( .A(n21), .B(n6), .Y(n42) );
  NOR2X1 U54 ( .A(n20), .B(invader_bullet_coord_y[3]), .Y(n21) );
  NAND3X1 U55 ( .A(n14), .B(n12), .C(n29), .Y(n20) );
  XNOR2X1 U56 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[0]), 
        .Y(n29) );
  INVX1 U57 ( .A(clkb), .Y(n53) );
  INVX2 U58 ( .A(n53), .Y(n54) );
  NOR2X1 U59 ( .A(n5), .B(reset), .Y(n51) );
  NOR2X1 U60 ( .A(n27), .B(reset), .Y(n46) );
  NAND2X1 U61 ( .A(n12), .B(n25), .Y(n26) );
  AOI21X1 U62 ( .A(\next_state[0] ), .B(n24), .C(n23), .Y(n22) );
  INVX2 U63 ( .A(n22), .Y(n45) );
  NOR2X1 U64 ( .A(n11), .B(n5), .Y(n19) );
  NAND2X1 U65 ( .A(\next_state[0] ), .B(n15), .Y(n30) );
  NAND2X1 U66 ( .A(n17), .B(n18), .Y(n44) );
endmodule

