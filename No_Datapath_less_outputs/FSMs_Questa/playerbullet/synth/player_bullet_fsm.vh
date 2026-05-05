/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 10:35:19 2026
/////////////////////////////////////////////////////////////


module player_bullet_fsm ( clka, clkb, reset, fire, player_coord_x, 
        player_coord_y, player_bullet_collision, shield_bullet_collision, 
        display, player_bullet_coord_x, player_bullet_coord_y, state );
  input [3:0] player_coord_x;
  input [3:0] player_coord_y;
  output [3:0] player_bullet_coord_x;
  output [3:0] player_bullet_coord_y;
  input clka, clkb, reset, fire, player_bullet_collision,
         shield_bullet_collision;
  output display, state;
  wire   \next_state[0] , N13, n5, n6, n7, n8, n10, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n24, n25, n27, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n40, n41, n42, n43, n45, n46, n48, n49, n50,
         n51, n52, n53, n55, n56, n57, n58;

  DFFNEGX1 \player_bullet_coord_y_reg[0]  ( .D(n56), .CLK(n58), .Q(
        player_bullet_coord_y[0]) );
  DFFNEGX1 \player_bullet_coord_y_reg[2]  ( .D(n52), .CLK(n58), .Q(
        player_bullet_coord_y[2]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N13), .CLK(clka), .Q(\next_state[0] ) );
  DFFNEGX1 display_reg ( .D(n8), .CLK(n58), .Q(display) );
  DFFNEGX1 state_reg ( .D(n8), .CLK(n58), .Q(state) );
  DFFNEGX1 \player_bullet_coord_x_reg[3]  ( .D(n55), .CLK(n58), .Q(
        player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_coord_x_reg[2]  ( .D(n5), .CLK(n58), .Q(
        player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_coord_x_reg[1]  ( .D(n6), .CLK(n58), .Q(
        player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_coord_x_reg[0]  ( .D(n7), .CLK(n58), .Q(
        player_bullet_coord_x[0]) );
  DFFNEGX1 \player_bullet_coord_y_reg[1]  ( .D(n53), .CLK(n58), .Q(
        player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_coord_y_reg[3]  ( .D(n51), .CLK(n58), .Q(
        player_bullet_coord_y[3]) );
  AND2X2 U7 ( .A(player_coord_y[3]), .B(n10), .Y(n22) );
  INVX2 U9 ( .A(n43), .Y(n5) );
  INVX2 U10 ( .A(n42), .Y(n6) );
  INVX2 U11 ( .A(n40), .Y(n7) );
  INVX2 U12 ( .A(n33), .Y(n8) );
  INVX2 U13 ( .A(\next_state[0] ), .Y(n10) );
  INVX2 U15 ( .A(state), .Y(n12) );
  INVX2 U16 ( .A(n50), .Y(n13) );
  INVX2 U17 ( .A(player_bullet_coord_x[3]), .Y(n14) );
  INVX2 U18 ( .A(player_bullet_coord_y[3]), .Y(n15) );
  INVX2 U19 ( .A(player_bullet_coord_y[2]), .Y(n16) );
  INVX2 U20 ( .A(player_bullet_coord_y[1]), .Y(n17) );
  INVX2 U21 ( .A(player_bullet_coord_y[0]), .Y(n18) );
  INVX2 U22 ( .A(reset), .Y(n19) );
  OAI21X1 U23 ( .A(n20), .B(n15), .C(n21), .Y(n51) );
  AOI22X1 U24 ( .A(n22), .B(n19), .C(n24), .D(n8), .Y(n21) );
  NOR2X1 U25 ( .A(player_bullet_coord_y[3]), .B(n25), .Y(n24) );
  AOI22X1 U29 ( .A(player_coord_y[2]), .B(n29), .C(n8), .D(n30), .Y(n27) );
  OAI21X1 U30 ( .A(n31), .B(n16), .C(n32), .Y(n30) );
  NOR2X1 U32 ( .A(n17), .B(n18), .Y(n31) );
  NOR2X1 U33 ( .A(reset), .B(\next_state[0] ), .Y(n29) );
  NOR2X1 U36 ( .A(player_bullet_coord_y[0]), .B(n10), .Y(n36) );
  AOI21X1 U37 ( .A(player_coord_y[1]), .B(n10), .C(n37), .Y(n34) );
  OAI21X1 U38 ( .A(n18), .B(n38), .C(n19), .Y(n37) );
  NAND2X1 U39 ( .A(\next_state[0] ), .B(n17), .Y(n38) );
  AOI22X1 U41 ( .A(player_coord_x[0]), .B(n41), .C(player_bullet_coord_x[0]), 
        .D(n8), .Y(n40) );
  AOI22X1 U42 ( .A(player_coord_x[1]), .B(n41), .C(player_bullet_coord_x[1]), 
        .D(n8), .Y(n42) );
  AOI22X1 U43 ( .A(player_coord_x[2]), .B(n41), .C(player_bullet_coord_x[2]), 
        .D(n8), .Y(n43) );
  NOR2X1 U44 ( .A(n8), .B(reset), .Y(n41) );
  OAI21X1 U45 ( .A(n33), .B(n14), .C(n45), .Y(n55) );
  OAI21X1 U46 ( .A(player_coord_x[3]), .B(reset), .C(n33), .Y(n45) );
  AOI22X1 U50 ( .A(player_coord_y[0]), .B(n10), .C(\next_state[0] ), .D(n18), 
        .Y(n46) );
  NAND2X1 U52 ( .A(\next_state[0] ), .B(n19), .Y(n33) );
  NOR2X1 U53 ( .A(reset), .B(n48), .Y(N13) );
  AOI22X1 U54 ( .A(n13), .B(n49), .C(fire), .D(n12), .Y(n48) );
  NOR2X1 U55 ( .A(shield_bullet_collision), .B(player_bullet_collision), .Y(
        n49) );
  OAI21X1 U56 ( .A(n15), .B(n25), .C(state), .Y(n50) );
  NAND3X1 U57 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), 
        .C(player_bullet_coord_y[2]), .Y(n25) );
  INVX1 U58 ( .A(clkb), .Y(n57) );
  INVX2 U59 ( .A(n57), .Y(n58) );
  INVX2 U60 ( .A(n27), .Y(n52) );
  NAND2X1 U61 ( .A(n16), .B(n31), .Y(n32) );
  NOR2X1 U62 ( .A(n46), .B(reset), .Y(n56) );
  NAND2X1 U63 ( .A(n36), .B(player_bullet_coord_y[1]), .Y(n35) );
  NAND2X1 U64 ( .A(n34), .B(n35), .Y(n53) );
  NAND2X1 U65 ( .A(n8), .B(n25), .Y(n20) );
endmodule

