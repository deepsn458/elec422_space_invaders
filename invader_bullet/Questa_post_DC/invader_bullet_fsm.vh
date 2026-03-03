/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Tue Mar  3 17:04:12 2026
/////////////////////////////////////////////////////////////


module invader_bullet_fsm ( clka, clkb, reset, player_collision_signal, 
        shield_collision_signal, invader_fire, closest_invader_coord_x, 
        closest_invader_coord_y, invader_bullet_display, 
        invader_bullet_coord_x, invader_bullet_coord_y, state );
  input [5:0] closest_invader_coord_x;
  input [5:0] closest_invader_coord_y;
  output [5:0] invader_bullet_coord_x;
  output [5:0] invader_bullet_coord_y;
  output [1:0] state;
  input clka, clkb, reset, player_collision_signal, shield_collision_signal,
         invader_fire;
  output invader_bullet_display;
  wire   N30, N31, N57, N60, N61, N62, N66, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88;
  wire   [1:0] next_state;
  wire   [6:0] \sub_97/carry ;
  assign invader_bullet_coord_y[0] = N57;

  DFFNEGX1 \invader_bullet_coord_y_reg[0]  ( .D(n64), .CLK(n67), .Q(N57) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N30), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \state_reg[1]  ( .D(N66), .CLK(n67), .Q(state[1]) );
  DFFNEGX1 \next_state_reg[1]  ( .D(N31), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \state_reg[0]  ( .D(n81), .CLK(n67), .Q(state[0]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[2]  ( .D(n61), .CLK(n67), .Q(
        invader_bullet_coord_y[2]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[5]  ( .D(n63), .CLK(n67), .Q(
        invader_bullet_coord_y[5]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[4]  ( .D(n59), .CLK(n67), .Q(
        invader_bullet_coord_y[4]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[3]  ( .D(n60), .CLK(n67), .Q(
        invader_bullet_coord_y[3]) );
  DFFNEGX1 \invader_bullet_coord_y_reg[1]  ( .D(n62), .CLK(n67), .Q(
        invader_bullet_coord_y[1]) );
  DFFNEGX1 invader_bullet_display_reg ( .D(n58), .CLK(n67), .Q(
        invader_bullet_display) );
  DFFNEGX1 \invader_bullet_coord_x_reg[5]  ( .D(n71), .CLK(n67), .Q(
        invader_bullet_coord_x[5]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[4]  ( .D(n72), .CLK(n67), .Q(
        invader_bullet_coord_x[4]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[3]  ( .D(n73), .CLK(n67), .Q(
        invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[2]  ( .D(n57), .CLK(n67), .Q(
        invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[1]  ( .D(n74), .CLK(n67), .Q(
        invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_coord_x_reg[0]  ( .D(n56), .CLK(n67), .Q(
        invader_bullet_coord_x[0]) );
  OAI21X1 U27 ( .A(n80), .B(n78), .C(n26), .Y(n56) );
  AOI21X1 U28 ( .A(invader_bullet_coord_x[0]), .B(n80), .C(n27), .Y(n26) );
  AOI22X1 U29 ( .A(closest_invader_coord_x[1]), .B(n75), .C(
        invader_bullet_coord_x[1]), .D(n80), .Y(n28) );
  OAI21X1 U30 ( .A(n80), .B(n77), .C(n29), .Y(n57) );
  AOI21X1 U31 ( .A(invader_bullet_coord_x[2]), .B(n80), .C(n27), .Y(n29) );
  AOI22X1 U32 ( .A(closest_invader_coord_x[3]), .B(n75), .C(
        invader_bullet_coord_x[3]), .D(n80), .Y(n30) );
  AOI22X1 U33 ( .A(closest_invader_coord_x[4]), .B(n75), .C(
        invader_bullet_coord_x[4]), .D(n80), .Y(n31) );
  AOI22X1 U34 ( .A(closest_invader_coord_x[5]), .B(n75), .C(
        invader_bullet_coord_x[5]), .D(n80), .Y(n32) );
  NAND2X1 U35 ( .A(n33), .B(n34), .Y(n58) );
  NAND3X1 U36 ( .A(n35), .B(n80), .C(invader_bullet_display), .Y(n33) );
  OAI21X1 U37 ( .A(invader_bullet_coord_y[5]), .B(n68), .C(n81), .Y(n35) );
  OAI21X1 U38 ( .A(n37), .B(n86), .C(n38), .Y(n59) );
  AOI22X1 U39 ( .A(closest_invader_coord_y[4]), .B(n75), .C(N61), .D(n39), .Y(
        n38) );
  OAI21X1 U40 ( .A(n37), .B(n87), .C(n40), .Y(n60) );
  AOI22X1 U41 ( .A(closest_invader_coord_y[3]), .B(n75), .C(N60), .D(n39), .Y(
        n40) );
  OAI22X1 U42 ( .A(n37), .B(n84), .C(n70), .D(n41), .Y(n61) );
  AOI21X1 U43 ( .A(closest_invader_coord_y[2]), .B(n42), .C(n43), .Y(n41) );
  OAI21X1 U44 ( .A(n44), .B(n65), .C(n76), .Y(n43) );
  OAI21X1 U45 ( .A(n37), .B(n88), .C(n45), .Y(n62) );
  AOI22X1 U46 ( .A(closest_invader_coord_y[1]), .B(n75), .C(n88), .D(n39), .Y(
        n45) );
  OAI21X1 U47 ( .A(n37), .B(n85), .C(n46), .Y(n63) );
  AOI22X1 U48 ( .A(closest_invader_coord_y[5]), .B(n75), .C(N62), .D(n39), .Y(
        n46) );
  NOR2X1 U49 ( .A(n44), .B(n70), .Y(n39) );
  NAND2X1 U50 ( .A(invader_fire), .B(n42), .Y(n34) );
  OAI22X1 U51 ( .A(n37), .B(n79), .C(n70), .D(n47), .Y(n64) );
  AOI21X1 U52 ( .A(closest_invader_coord_y[0]), .B(n42), .C(n48), .Y(n47) );
  OAI21X1 U53 ( .A(n44), .B(n79), .C(n76), .Y(n48) );
  NOR2X1 U54 ( .A(n80), .B(invader_fire), .Y(n27) );
  OAI21X1 U55 ( .A(n44), .B(n49), .C(n80), .Y(n37) );
  NOR2X1 U56 ( .A(next_state[0]), .B(next_state[1]), .Y(n42) );
  NAND2X1 U57 ( .A(n36), .B(n85), .Y(n49) );
  NOR2X1 U58 ( .A(next_state[0]), .B(n82), .Y(N66) );
  NAND2X1 U59 ( .A(next_state[0]), .B(n82), .Y(n44) );
  NOR2X1 U60 ( .A(reset), .B(n50), .Y(N31) );
  AOI22X1 U61 ( .A(n51), .B(state[0]), .C(state[1]), .D(n83), .Y(n50) );
  NOR2X1 U62 ( .A(state[1]), .B(n36), .Y(n51) );
  NOR3X1 U63 ( .A(reset), .B(state[1]), .C(n52), .Y(N30) );
  AOI22X1 U64 ( .A(n83), .B(invader_fire), .C(state[0]), .D(n69), .Y(n52) );
  OAI21X1 U65 ( .A(n54), .B(n55), .C(n36), .Y(n53) );
  NOR2X1 U66 ( .A(player_collision_signal), .B(shield_collision_signal), .Y(
        n36) );
  NAND3X1 U67 ( .A(n88), .B(n84), .C(n79), .Y(n55) );
  NAND3X1 U68 ( .A(n86), .B(n85), .C(n87), .Y(n54) );
  XOR2X1 U69 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[2]), 
        .Y(n65) );
  INVX1 U70 ( .A(clkb), .Y(n66) );
  INVX2 U71 ( .A(n66), .Y(n67) );
  INVX2 U72 ( .A(n42), .Y(n80) );
  OR2X1 U73 ( .A(invader_bullet_coord_y[2]), .B(invader_bullet_coord_y[1]), 
        .Y(\sub_97/carry [3]) );
  OR2X1 U74 ( .A(invader_bullet_coord_y[3]), .B(\sub_97/carry [3]), .Y(
        \sub_97/carry [4]) );
  XNOR2X1 U75 ( .A(\sub_97/carry [3]), .B(invader_bullet_coord_y[3]), .Y(N60)
         );
  OR2X1 U76 ( .A(invader_bullet_coord_y[4]), .B(\sub_97/carry [4]), .Y(
        \sub_97/carry [5]) );
  XNOR2X1 U77 ( .A(\sub_97/carry [4]), .B(invader_bullet_coord_y[4]), .Y(N61)
         );
  XNOR2X1 U78 ( .A(invader_bullet_coord_y[5]), .B(\sub_97/carry [5]), .Y(N62)
         );
  INVX2 U79 ( .A(n36), .Y(n68) );
  INVX2 U80 ( .A(n53), .Y(n69) );
  INVX2 U81 ( .A(n37), .Y(n70) );
  INVX2 U82 ( .A(n32), .Y(n71) );
  INVX2 U83 ( .A(n31), .Y(n72) );
  INVX2 U84 ( .A(n30), .Y(n73) );
  INVX2 U85 ( .A(n28), .Y(n74) );
  INVX2 U86 ( .A(n34), .Y(n75) );
  INVX2 U87 ( .A(n27), .Y(n76) );
  INVX2 U88 ( .A(closest_invader_coord_x[2]), .Y(n77) );
  INVX2 U89 ( .A(closest_invader_coord_x[0]), .Y(n78) );
  INVX2 U90 ( .A(N57), .Y(n79) );
  INVX2 U91 ( .A(n44), .Y(n81) );
  INVX2 U92 ( .A(next_state[1]), .Y(n82) );
  INVX2 U93 ( .A(state[0]), .Y(n83) );
  INVX2 U94 ( .A(invader_bullet_coord_y[2]), .Y(n84) );
  INVX2 U95 ( .A(invader_bullet_coord_y[5]), .Y(n85) );
  INVX2 U96 ( .A(invader_bullet_coord_y[4]), .Y(n86) );
  INVX2 U97 ( .A(invader_bullet_coord_y[3]), .Y(n87) );
  INVX2 U98 ( .A(invader_bullet_coord_y[1]), .Y(n88) );
endmodule

