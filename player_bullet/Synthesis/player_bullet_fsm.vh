/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon Mar  2 23:24:14 2026
/////////////////////////////////////////////////////////////


module player_bullet_fsm ( clka, clkb, reset, fire, player_coord_x, 
        player_coord_y, player_bullet_collision, shield_bullet_collision, 
        display, player_bullet_coord_x, player_bullet_coord_y, state );
  input [5:0] player_coord_x;
  input [5:0] player_coord_y;
  output [5:0] player_bullet_coord_x;
  output [5:0] player_bullet_coord_y;
  output [1:0] state;
  input clka, clkb, reset, fire, player_bullet_collision,
         shield_bullet_collision;
  output display;
  wire   \next_state[0] , N15, N22, N23, N24, N25, N26, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n45, n46,
         \add_88/carry[2] , n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83;
  assign state[1] = 1'b0;

  DFFNEGX1 \player_bullet_coord_y_reg[0]  ( .D(n68), .CLK(n61), .Q(
        player_bullet_coord_y[0]) );
  DFFNEGX1 \player_bullet_coord_y_reg[5]  ( .D(n73), .CLK(n61), .Q(
        player_bullet_coord_y[5]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N15), .CLK(clka), .Q(\next_state[0] ) );
  DFFNEGX1 \state_reg[0]  ( .D(n55), .CLK(n61), .Q(state[0]) );
  DFFNEGX1 \player_bullet_coord_y_reg[1]  ( .D(n69), .CLK(n61), .Q(
        player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_coord_y_reg[2]  ( .D(n70), .CLK(n61), .Q(
        player_bullet_coord_y[2]) );
  DFFNEGX1 \player_bullet_coord_y_reg[3]  ( .D(n71), .CLK(n61), .Q(
        player_bullet_coord_y[3]) );
  DFFNEGX1 \player_bullet_coord_y_reg[4]  ( .D(n72), .CLK(n61), .Q(
        player_bullet_coord_y[4]) );
  DFFNEGX1 \player_bullet_coord_x_reg[5]  ( .D(n62), .CLK(n61), .Q(
        player_bullet_coord_x[5]) );
  DFFNEGX1 \player_bullet_coord_x_reg[4]  ( .D(n63), .CLK(n61), .Q(
        player_bullet_coord_x[4]) );
  DFFNEGX1 \player_bullet_coord_x_reg[3]  ( .D(n64), .CLK(n61), .Q(
        player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_coord_x_reg[2]  ( .D(n65), .CLK(n61), .Q(
        player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_coord_x_reg[1]  ( .D(n66), .CLK(n61), .Q(
        player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_coord_x_reg[0]  ( .D(n67), .CLK(n61), .Q(
        player_bullet_coord_x[0]) );
  DFFNEGX1 display_reg ( .D(n55), .CLK(n61), .Q(display) );
  AOI22X1 U28 ( .A(player_coord_x[0]), .B(n29), .C(player_bullet_coord_x[0]), 
        .D(n30), .Y(n28) );
  AOI22X1 U29 ( .A(player_coord_x[1]), .B(n29), .C(player_bullet_coord_x[1]), 
        .D(n30), .Y(n31) );
  AOI22X1 U30 ( .A(player_coord_x[2]), .B(n29), .C(player_bullet_coord_x[2]), 
        .D(n30), .Y(n32) );
  AOI22X1 U31 ( .A(player_coord_x[3]), .B(n29), .C(player_bullet_coord_x[3]), 
        .D(n30), .Y(n33) );
  AOI22X1 U32 ( .A(player_coord_x[4]), .B(n29), .C(player_bullet_coord_x[4]), 
        .D(n30), .Y(n34) );
  AOI22X1 U33 ( .A(player_coord_x[5]), .B(n29), .C(player_bullet_coord_x[5]), 
        .D(n30), .Y(n35) );
  NOR2X1 U34 ( .A(n30), .B(reset), .Y(n29) );
  AOI22X1 U38 ( .A(player_coord_y[5]), .B(n56), .C(N26), .D(n55), .Y(n36) );
  AOI22X1 U40 ( .A(player_coord_y[4]), .B(n56), .C(N25), .D(n55), .Y(n37) );
  AOI22X1 U42 ( .A(player_coord_y[3]), .B(n56), .C(N24), .D(n55), .Y(n38) );
  AOI22X1 U44 ( .A(player_coord_y[2]), .B(n56), .C(N23), .D(n55), .Y(n39) );
  AOI22X1 U46 ( .A(player_coord_y[1]), .B(n56), .C(N22), .D(n55), .Y(n40) );
  AOI22X1 U48 ( .A(player_coord_y[0]), .B(n56), .C(n76), .D(n55), .Y(n41) );
  NOR2X1 U51 ( .A(n43), .B(reset), .Y(N15) );
  AOI22X1 U53 ( .A(n45), .B(n46), .C(fire), .D(n79), .Y(n43) );
  NOR2X1 U54 ( .A(shield_bullet_collision), .B(player_bullet_collision), .Y(
        n46) );
  NOR2X1 U55 ( .A(n75), .B(n79), .Y(n45) );
  AND2X2 U56 ( .A(n74), .B(\next_state[0] ), .Y(n55) );
  AND2X2 U57 ( .A(n78), .B(n74), .Y(n56) );
  AND2X2 U58 ( .A(\add_88/carry[2] ), .B(player_bullet_coord_y[2]), .Y(n57) );
  AND2X2 U59 ( .A(n57), .B(player_bullet_coord_y[3]), .Y(n58) );
  AND2X2 U60 ( .A(n58), .B(player_bullet_coord_y[4]), .Y(n59) );
  INVX1 U61 ( .A(clkb), .Y(n60) );
  INVX2 U62 ( .A(n60), .Y(n61) );
  OR2X1 U63 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), .Y(
        \add_88/carry[2] ) );
  XNOR2X1 U64 ( .A(player_bullet_coord_y[0]), .B(player_bullet_coord_y[1]), 
        .Y(N22) );
  XOR2X1 U65 ( .A(\add_88/carry[2] ), .B(player_bullet_coord_y[2]), .Y(N23) );
  XOR2X1 U66 ( .A(n57), .B(player_bullet_coord_y[3]), .Y(N24) );
  XOR2X1 U67 ( .A(n58), .B(player_bullet_coord_y[4]), .Y(N25) );
  XOR2X1 U68 ( .A(player_bullet_coord_y[5]), .B(n59), .Y(N26) );
  INVX2 U69 ( .A(n35), .Y(n62) );
  INVX2 U70 ( .A(n34), .Y(n63) );
  INVX2 U71 ( .A(n33), .Y(n64) );
  INVX2 U72 ( .A(n32), .Y(n65) );
  INVX2 U73 ( .A(n31), .Y(n66) );
  INVX2 U74 ( .A(n28), .Y(n67) );
  INVX2 U75 ( .A(n41), .Y(n68) );
  INVX2 U76 ( .A(n40), .Y(n69) );
  INVX2 U77 ( .A(n39), .Y(n70) );
  INVX2 U78 ( .A(n38), .Y(n71) );
  INVX2 U79 ( .A(n37), .Y(n72) );
  INVX2 U80 ( .A(n36), .Y(n73) );
  INVX2 U81 ( .A(reset), .Y(n74) );
  INVX2 U82 ( .A(n83), .Y(n75) );
  INVX2 U83 ( .A(player_bullet_coord_y[0]), .Y(n76) );
  INVX2 U84 ( .A(player_bullet_coord_y[5]), .Y(n77) );
  INVX2 U85 ( .A(\next_state[0] ), .Y(n78) );
  INVX2 U86 ( .A(state[0]), .Y(n79) );
  NAND2X1 U87 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), 
        .Y(n81) );
  NAND2X1 U88 ( .A(player_bullet_coord_y[3]), .B(player_bullet_coord_y[2]), 
        .Y(n80) );
  OAI21X1 U89 ( .A(n81), .B(n80), .C(n77), .Y(n82) );
  OAI21X1 U90 ( .A(player_bullet_coord_y[5]), .B(player_bullet_coord_y[4]), 
        .C(n82), .Y(n83) );
  NOR2X1 U91 ( .A(reset), .B(n78), .Y(n30) );
endmodule

