/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Fri Apr 17 17:03:41 2026
/////////////////////////////////////////////////////////////


module top ( clka, clkb, reset, player_left_input, player_right_input, 
        player_shoot_input, player_coord_x, player_coord_y, player_display, 
        invader_1_coord_x, invader_1_coord_y, invader_1_display, 
        invader_2_coord_x, invader_2_coord_y, invader_2_display, 
        invader_3_coord_x, invader_3_coord_y, invader_3_display, 
        invader_4_coord_x, invader_4_coord_y, invader_4_display, 
        shield_coord_x, shield_coord_y, shield_hp, shield_display, 
        player_bullet_coord_x, player_bullet_coord_y, player_bullet_display, 
        invader_bullet_coord_x, invader_bullet_coord_y, invader_bullet_display
 );
  output [5:0] player_coord_x;
  output [5:0] player_coord_y;
  output [5:0] invader_1_coord_x;
  output [5:0] invader_1_coord_y;
  output [5:0] invader_2_coord_x;
  output [5:0] invader_2_coord_y;
  output [5:0] invader_3_coord_x;
  output [5:0] invader_3_coord_y;
  output [5:0] invader_4_coord_x;
  output [5:0] invader_4_coord_y;
  output [5:0] shield_coord_x;
  output [5:0] shield_coord_y;
  output [1:0] shield_hp;
  output [5:0] player_bullet_coord_x;
  output [5:0] player_bullet_coord_y;
  output [5:0] invader_bullet_coord_x;
  output [5:0] invader_bullet_coord_y;
  input clka, clkb, reset, player_left_input, player_right_input,
         player_shoot_input;
  output player_display, invader_1_display, invader_2_display,
         invader_3_display, invader_4_display, shield_display,
         player_bullet_display, invader_bullet_display;
  wire   n896, playerbullet_invader_collision_signal_1,
         playerbullet_invader_collision_signal_2,
         playerbullet_invader_collision_signal_3,
         playerbullet_invader_collision_signal_4,
         playerbullet_invader_collision_signal,
         invaderbullet_player_collision_signal,
         invaderbullet_shield_collision_signal, invader_outofbounds_signal_1,
         invader_outofbounds_signal_2, invader_outofbounds_signal_3,
         invader_outofbounds_signal_4, player_left_motion, player_right_motion,
         play, internal_reset, invader_direction, playerbullet_fire, move_down,
         invader_fire, playerbullet_shield_collision_signal, n1, n2,
         \main_game_fsm/n190 , \main_game_fsm/n189 , \main_game_fsm/n188 ,
         \main_game_fsm/n187 , \main_game_fsm/n186 , \main_game_fsm/n185 ,
         \main_game_fsm/n184 , \main_game_fsm/n183 , \main_game_fsm/n182 ,
         \main_game_fsm/n181 , \main_game_fsm/n180 , \main_game_fsm/n179 ,
         \main_game_fsm/n178 , \main_game_fsm/n177 , \main_game_fsm/n176 ,
         \main_game_fsm/n175 , \main_game_fsm/n174 , \main_game_fsm/n173 ,
         \main_game_fsm/n172 , \main_game_fsm/n171 , \main_game_fsm/n170 ,
         \main_game_fsm/n169 , \main_game_fsm/n168 , \main_game_fsm/n167 ,
         \main_game_fsm/n166 , \main_game_fsm/n165 , \main_game_fsm/n164 ,
         \main_game_fsm/n163 , \main_game_fsm/n162 , \main_game_fsm/n161 ,
         \main_game_fsm/n160 , \main_game_fsm/n159 , \main_game_fsm/n158 ,
         \main_game_fsm/n157 , \main_game_fsm/n156 , \main_game_fsm/n155 ,
         \main_game_fsm/n154 , \main_game_fsm/n153 , \main_game_fsm/n152 ,
         \main_game_fsm/n151 , \main_game_fsm/n150 , \main_game_fsm/n149 ,
         \main_game_fsm/n144 , \main_game_fsm/n143 , \main_game_fsm/n142 ,
         \main_game_fsm/n141 , \main_game_fsm/n140 , \main_game_fsm/n139 ,
         \main_game_fsm/n138 , \main_game_fsm/n137 , \main_game_fsm/n136 ,
         \main_game_fsm/n135 , \main_game_fsm/n134 , \main_game_fsm/n133 ,
         \main_game_fsm/n132 , \main_game_fsm/n131 , \main_game_fsm/n130 ,
         \main_game_fsm/n129 , \main_game_fsm/n128 , \main_game_fsm/n127 ,
         \main_game_fsm/n126 , \main_game_fsm/n125 , \main_game_fsm/n124 ,
         \main_game_fsm/n123 , \main_game_fsm/n122 , \main_game_fsm/n121 ,
         \main_game_fsm/n120 , \main_game_fsm/n119 , \main_game_fsm/n118 ,
         \main_game_fsm/n117 , \main_game_fsm/n116 , \main_game_fsm/n115 ,
         \main_game_fsm/n114 , \main_game_fsm/n113 , \main_game_fsm/n112 ,
         \main_game_fsm/n111 , \main_game_fsm/n110 , \main_game_fsm/n109 ,
         \main_game_fsm/n108 , \main_game_fsm/n107 , \main_game_fsm/n106 ,
         \main_game_fsm/n105 , \main_game_fsm/n104 , \main_game_fsm/n103 ,
         \main_game_fsm/n102 , \main_game_fsm/n101 , \main_game_fsm/n100 ,
         \main_game_fsm/n99 , \main_game_fsm/n98 , \main_game_fsm/n97 ,
         \main_game_fsm/n96 , \main_game_fsm/n95 , \main_game_fsm/n94 ,
         \main_game_fsm/n93 , \main_game_fsm/n92 , \main_game_fsm/n91 ,
         \main_game_fsm/n90 , \main_game_fsm/N144 , \main_game_fsm/N143 ,
         \main_game_fsm/N123 , \main_game_fsm/N122 ,
         \main_game_fsm/prev_invader_outofbounds , \main_game_fsm/N111 ,
         \main_game_fsm/N99 , \main_game_fsm/N93 , \main_game_fsm/N87 ,
         \main_game_fsm/N82 , \main_game_fsm/N81 , \main_game_fsm/N80 ,
         \main_game_fsm/N79 , \main_game_fsm/N78 , \main_game_fsm/N77 ,
         \main_game_fsm/N76 , \main_game_fsm/N75 , \main_game_fsm/N74 ,
         \main_game_fsm/N73 , \main_game_fsm/N72 , \main_game_fsm/N71 ,
         \main_game_fsm/N69 , \main_game_fsm/N68 , \main_game_fsm/N67 ,
         \main_game_fsm/N66 , \main_game_fsm/N65 , \main_game_fsm/N64 ,
         \main_game_fsm/N63 , \main_game_fsm/N62 , \main_game_fsm/N61 ,
         \main_game_fsm/N60 , \main_game_fsm/N59 , \main_game_fsm/N58 ,
         \main_game_fsm/N57 , \main_game_fsm/N55 , \main_game_fsm/N54 ,
         \main_game_fsm/N53 , \main_game_fsm/N52 , \main_game_fsm/N51 ,
         \main_game_fsm/N50 , \main_game_fsm/N49 , \main_game_fsm/N48 ,
         \main_game_fsm/N47 , \main_game_fsm/N46 , \main_game_fsm/N45 ,
         \main_game_fsm/N44 , \main_game_fsm/N43 , \main_game_fsm/N41 ,
         \main_game_fsm/N40 , \main_game_fsm/N39 , \main_game_fsm/N38 ,
         \main_game_fsm/N37 , \main_game_fsm/N36 , \main_game_fsm/N35 ,
         \main_game_fsm/N34 , \main_game_fsm/N33 , \main_game_fsm/N32 ,
         \main_game_fsm/N31 , \main_game_fsm/N30 , \main_game_fsm/N29 ,
         \main_game_fsm/N27 , \main_game_fsm/state[0] ,
         \main_game_fsm/state[1] , \player_fsm/n88 , \player_fsm/n87 ,
         \player_fsm/n86 , \player_fsm/n85 , \player_fsm/n84 ,
         \player_fsm/n83 , \player_fsm/n82 , \player_fsm/n81 ,
         \player_fsm/n80 , \player_fsm/n79 , \player_fsm/n78 ,
         \player_fsm/n77 , \player_fsm/n76 , \player_fsm/n75 ,
         \player_fsm/n74 , \player_fsm/n73 , \player_fsm/n72 ,
         \player_fsm/n71 , \player_fsm/n70 , \player_fsm/n69 ,
         \player_fsm/n68 , \player_fsm/n67 , \player_fsm/n66 ,
         \player_fsm/n65 , \player_fsm/n64 , \player_fsm/n63 ,
         \player_fsm/n62 , \player_fsm/n61 , \player_fsm/n60 ,
         \player_fsm/n59 , \player_fsm/n58 , \player_fsm/n57 ,
         \player_fsm/n56 , \player_fsm/n55 , \player_fsm/N119 ,
         \player_fsm/N109 , \player_fsm/N108 , \player_fsm/N83 ,
         \player_fsm/N82 , \player_fsm/N81 , \player_fsm/N79 ,
         \player_fsm/N74 , \player_fsm/N72 , \player_fsm/N60 ,
         \player_fsm/N59 , \player_fsm/N47 , \player_fsm/N46 ,
         \player_fsm/N45 , \player_fsm/N44 , \player_fsm/N43 ,
         \player_fsm/N42 , \player_fsm/N41 , \player_fsm/N40 ,
         \player_fsm/N38 , \player_fsm/N37 , \player_fsm/N29 ,
         \player_fsm/N28 , \player_fsm/N27 , \player_fsm/N26 ,
         \player_fsm/N25 , \player_fsm/N24 , \player_fsm/N23 ,
         \player_fsm/N22 , \player_fsm/N20 , \player_fsm/N19 ,
         \player_fsm/N18 , \player_fsm/N17 , \player_fsm/N16 ,
         \player_fsm/N15 , \player_fsm/N14 , \player_fsm/N13 ,
         \player_fsm/state[0] , \player_fsm/state[1] , \shield_fsm/n88 ,
         \shield_fsm/n87 , \shield_fsm/n86 , \shield_fsm/n85 ,
         \shield_fsm/n84 , \shield_fsm/n81 , \shield_fsm/n78 ,
         \shield_fsm/n75 , \shield_fsm/n74 , \shield_fsm/n73 ,
         \shield_fsm/n72 , \shield_fsm/n71 , \shield_fsm/n70 ,
         \shield_fsm/n69 , \shield_fsm/n68 , \shield_fsm/n67 ,
         \shield_fsm/n66 , \shield_fsm/n65 , \shield_fsm/n64 ,
         \shield_fsm/n63 , \shield_fsm/n62 , \shield_fsm/n61 ,
         \shield_fsm/n60 , \shield_fsm/n58 , \shield_fsm/n57 ,
         \shield_fsm/n52 , \shield_fsm/n50 , \shield_fsm/n49 ,
         \shield_fsm/n48 , \shield_fsm/n47 , \shield_fsm/n46 ,
         \shield_fsm/n45 , \shield_fsm/n44 , \shield_fsm/N102 ,
         \shield_fsm/N98 , \shield_fsm/N97 , \shield_fsm/N56 ,
         \shield_fsm/N55 , \shield_fsm/N42 , \shield_fsm/N40 ,
         \shield_fsm/N38 , \shield_fsm/N37 , \shield_fsm/N35 ,
         \shield_fsm/N34 , \shield_fsm/N26 , \shield_fsm/N24 ,
         \shield_fsm/N22 , \shield_fsm/N21 , \shield_fsm/N19 ,
         \shield_fsm/N18 , \shield_fsm/state[0] , \shield_fsm/state[1] ,
         \invader_fsm_1/n116 , \invader_fsm_1/n115 , \invader_fsm_1/n114 ,
         \invader_fsm_1/n113 , \invader_fsm_1/n112 , \invader_fsm_1/n111 ,
         \invader_fsm_1/n110 , \invader_fsm_1/n109 , \invader_fsm_1/n108 ,
         \invader_fsm_1/n107 , \invader_fsm_1/n106 , \invader_fsm_1/n105 ,
         \invader_fsm_1/n104 , \invader_fsm_1/n103 , \invader_fsm_1/n102 ,
         \invader_fsm_1/n101 , \invader_fsm_1/n100 , \invader_fsm_1/n99 ,
         \invader_fsm_1/n98 , \invader_fsm_1/n97 , \invader_fsm_1/n96 ,
         \invader_fsm_1/n95 , \invader_fsm_1/n94 , \invader_fsm_1/n93 ,
         \invader_fsm_1/n92 , \invader_fsm_1/n91 , \invader_fsm_1/n90 ,
         \invader_fsm_1/n89 , \invader_fsm_1/n88 , \invader_fsm_1/n87 ,
         \invader_fsm_1/n86 , \invader_fsm_1/n85 , \invader_fsm_1/n84 ,
         \invader_fsm_1/n83 , \invader_fsm_1/n82 , \invader_fsm_1/n81 ,
         \invader_fsm_1/n80 , \invader_fsm_1/n79 , \invader_fsm_1/n78 ,
         \invader_fsm_1/n77 , \invader_fsm_1/n76 , \invader_fsm_1/n75 ,
         \invader_fsm_1/n74 , \invader_fsm_1/n73 , \invader_fsm_1/n72 ,
         \invader_fsm_1/n71 , \invader_fsm_1/n70 , \invader_fsm_1/n69 ,
         \invader_fsm_1/n68 , \invader_fsm_1/n67 , \invader_fsm_1/n66 ,
         \invader_fsm_1/n65 , \invader_fsm_1/n64 , \invader_fsm_1/n63 ,
         \invader_fsm_1/n62 , \invader_fsm_1/n61 , \invader_fsm_1/n60 ,
         \invader_fsm_1/n59 , \invader_fsm_1/n58 , \invader_fsm_1/n57 ,
         \invader_fsm_1/n56 , \invader_fsm_1/n55 , \invader_fsm_1/n54 ,
         \invader_fsm_1/n53 , \invader_fsm_1/N89 , \invader_fsm_1/N88 ,
         \invader_fsm_1/N86 , \invader_fsm_1/N84 , \invader_fsm_1/N75 ,
         \invader_fsm_1/N74 , \invader_fsm_1/N73 , \invader_fsm_1/N72 ,
         \invader_fsm_1/N70 , \invader_fsm_1/move_interval_toggle ,
         \invader_fsm_1/N56 , \invader_fsm_1/N55 , \invader_fsm_1/N43 ,
         \invader_fsm_1/N42 , \invader_fsm_1/N40 , \invader_fsm_1/N38 ,
         \invader_fsm_1/N35 , \invader_fsm_1/N34 , \invader_fsm_1/N33 ,
         \invader_fsm_1/N32 , \invader_fsm_1/N31 , \invader_fsm_1/N30 ,
         \invader_fsm_1/N29 , \invader_fsm_1/N27 , \invader_fsm_1/N26 ,
         \invader_fsm_1/N24 , \invader_fsm_1/N22 , \invader_fsm_1/N19 ,
         \invader_fsm_1/N18 , \invader_fsm_1/N17 , \invader_fsm_1/N16 ,
         \invader_fsm_1/N15 , \invader_fsm_1/N14 , \invader_fsm_1/N13 ,
         \invader_fsm_1/state[0] , \invader_fsm_1/state[1] ,
         \invader_fsm_2/n116 , \invader_fsm_2/n115 , \invader_fsm_2/n114 ,
         \invader_fsm_2/n113 , \invader_fsm_2/n112 , \invader_fsm_2/n111 ,
         \invader_fsm_2/n110 , \invader_fsm_2/n109 , \invader_fsm_2/n108 ,
         \invader_fsm_2/n107 , \invader_fsm_2/n106 , \invader_fsm_2/n105 ,
         \invader_fsm_2/n104 , \invader_fsm_2/n103 , \invader_fsm_2/n102 ,
         \invader_fsm_2/n101 , \invader_fsm_2/n100 , \invader_fsm_2/n99 ,
         \invader_fsm_2/n98 , \invader_fsm_2/n97 , \invader_fsm_2/n96 ,
         \invader_fsm_2/n95 , \invader_fsm_2/n94 , \invader_fsm_2/n93 ,
         \invader_fsm_2/n92 , \invader_fsm_2/n91 , \invader_fsm_2/n90 ,
         \invader_fsm_2/n89 , \invader_fsm_2/n88 , \invader_fsm_2/n87 ,
         \invader_fsm_2/n86 , \invader_fsm_2/n85 , \invader_fsm_2/n84 ,
         \invader_fsm_2/n83 , \invader_fsm_2/n82 , \invader_fsm_2/n81 ,
         \invader_fsm_2/n80 , \invader_fsm_2/n79 , \invader_fsm_2/n78 ,
         \invader_fsm_2/n77 , \invader_fsm_2/n76 , \invader_fsm_2/n75 ,
         \invader_fsm_2/n74 , \invader_fsm_2/n73 , \invader_fsm_2/n72 ,
         \invader_fsm_2/n71 , \invader_fsm_2/n70 , \invader_fsm_2/n69 ,
         \invader_fsm_2/n68 , \invader_fsm_2/n67 , \invader_fsm_2/n66 ,
         \invader_fsm_2/n65 , \invader_fsm_2/n64 , \invader_fsm_2/n63 ,
         \invader_fsm_2/n62 , \invader_fsm_2/n61 , \invader_fsm_2/n60 ,
         \invader_fsm_2/n59 , \invader_fsm_2/n58 , \invader_fsm_2/n57 ,
         \invader_fsm_2/n56 , \invader_fsm_2/n55 , \invader_fsm_2/n54 ,
         \invader_fsm_2/n53 , \invader_fsm_2/N89 , \invader_fsm_2/N88 ,
         \invader_fsm_2/N86 , \invader_fsm_2/N84 , \invader_fsm_2/N75 ,
         \invader_fsm_2/N74 , \invader_fsm_2/N73 , \invader_fsm_2/N72 ,
         \invader_fsm_2/N70 , \invader_fsm_2/move_interval_toggle ,
         \invader_fsm_2/N56 , \invader_fsm_2/N55 , \invader_fsm_2/N43 ,
         \invader_fsm_2/N42 , \invader_fsm_2/N40 , \invader_fsm_2/N38 ,
         \invader_fsm_2/N35 , \invader_fsm_2/N34 , \invader_fsm_2/N33 ,
         \invader_fsm_2/N32 , \invader_fsm_2/N31 , \invader_fsm_2/N30 ,
         \invader_fsm_2/N29 , \invader_fsm_2/N27 , \invader_fsm_2/N26 ,
         \invader_fsm_2/N24 , \invader_fsm_2/N22 , \invader_fsm_2/N19 ,
         \invader_fsm_2/N18 , \invader_fsm_2/N17 , \invader_fsm_2/N16 ,
         \invader_fsm_2/N15 , \invader_fsm_2/N14 , \invader_fsm_2/N13 ,
         \invader_fsm_2/state[0] , \invader_fsm_2/state[1] ,
         \invader_fsm_3/n117 , \invader_fsm_3/n116 , \invader_fsm_3/n115 ,
         \invader_fsm_3/n114 , \invader_fsm_3/n113 , \invader_fsm_3/n112 ,
         \invader_fsm_3/n111 , \invader_fsm_3/n110 , \invader_fsm_3/n109 ,
         \invader_fsm_3/n108 , \invader_fsm_3/n107 , \invader_fsm_3/n106 ,
         \invader_fsm_3/n105 , \invader_fsm_3/n104 , \invader_fsm_3/n103 ,
         \invader_fsm_3/n102 , \invader_fsm_3/n101 , \invader_fsm_3/n100 ,
         \invader_fsm_3/n99 , \invader_fsm_3/n98 , \invader_fsm_3/n97 ,
         \invader_fsm_3/n96 , \invader_fsm_3/n95 , \invader_fsm_3/n94 ,
         \invader_fsm_3/n93 , \invader_fsm_3/n92 , \invader_fsm_3/n91 ,
         \invader_fsm_3/n90 , \invader_fsm_3/n89 , \invader_fsm_3/n88 ,
         \invader_fsm_3/n87 , \invader_fsm_3/n86 , \invader_fsm_3/n85 ,
         \invader_fsm_3/n84 , \invader_fsm_3/n83 , \invader_fsm_3/n82 ,
         \invader_fsm_3/n81 , \invader_fsm_3/n80 , \invader_fsm_3/n79 ,
         \invader_fsm_3/n78 , \invader_fsm_3/n77 , \invader_fsm_3/n76 ,
         \invader_fsm_3/n75 , \invader_fsm_3/n74 , \invader_fsm_3/n73 ,
         \invader_fsm_3/n72 , \invader_fsm_3/n71 , \invader_fsm_3/n70 ,
         \invader_fsm_3/n69 , \invader_fsm_3/n68 , \invader_fsm_3/n67 ,
         \invader_fsm_3/n66 , \invader_fsm_3/n65 , \invader_fsm_3/n64 ,
         \invader_fsm_3/n63 , \invader_fsm_3/n62 , \invader_fsm_3/n61 ,
         \invader_fsm_3/n60 , \invader_fsm_3/n59 , \invader_fsm_3/n58 ,
         \invader_fsm_3/n57 , \invader_fsm_3/n56 , \invader_fsm_3/n55 ,
         \invader_fsm_3/n54 , \invader_fsm_3/N89 , \invader_fsm_3/N88 ,
         \invader_fsm_3/N86 , \invader_fsm_3/N84 , \invader_fsm_3/N75 ,
         \invader_fsm_3/N74 , \invader_fsm_3/N73 , \invader_fsm_3/N72 ,
         \invader_fsm_3/N70 , \invader_fsm_3/move_interval_toggle ,
         \invader_fsm_3/N56 , \invader_fsm_3/N55 , \invader_fsm_3/N43 ,
         \invader_fsm_3/N42 , \invader_fsm_3/N40 , \invader_fsm_3/N38 ,
         \invader_fsm_3/N35 , \invader_fsm_3/N34 , \invader_fsm_3/N33 ,
         \invader_fsm_3/N32 , \invader_fsm_3/N31 , \invader_fsm_3/N30 ,
         \invader_fsm_3/N29 , \invader_fsm_3/N27 , \invader_fsm_3/N26 ,
         \invader_fsm_3/N24 , \invader_fsm_3/N22 , \invader_fsm_3/N19 ,
         \invader_fsm_3/N18 , \invader_fsm_3/N17 , \invader_fsm_3/N16 ,
         \invader_fsm_3/N15 , \invader_fsm_3/N14 , \invader_fsm_3/N13 ,
         \invader_fsm_3/state[0] , \invader_fsm_3/state[1] ,
         \invader_fsm_4/n117 , \invader_fsm_4/n116 , \invader_fsm_4/n115 ,
         \invader_fsm_4/n114 , \invader_fsm_4/n113 , \invader_fsm_4/n112 ,
         \invader_fsm_4/n111 , \invader_fsm_4/n110 , \invader_fsm_4/n109 ,
         \invader_fsm_4/n108 , \invader_fsm_4/n107 , \invader_fsm_4/n106 ,
         \invader_fsm_4/n105 , \invader_fsm_4/n104 , \invader_fsm_4/n103 ,
         \invader_fsm_4/n102 , \invader_fsm_4/n101 , \invader_fsm_4/n100 ,
         \invader_fsm_4/n99 , \invader_fsm_4/n98 , \invader_fsm_4/n97 ,
         \invader_fsm_4/n96 , \invader_fsm_4/n95 , \invader_fsm_4/n94 ,
         \invader_fsm_4/n93 , \invader_fsm_4/n92 , \invader_fsm_4/n91 ,
         \invader_fsm_4/n90 , \invader_fsm_4/n89 , \invader_fsm_4/n88 ,
         \invader_fsm_4/n87 , \invader_fsm_4/n86 , \invader_fsm_4/n85 ,
         \invader_fsm_4/n84 , \invader_fsm_4/n83 , \invader_fsm_4/n82 ,
         \invader_fsm_4/n81 , \invader_fsm_4/n80 , \invader_fsm_4/n79 ,
         \invader_fsm_4/n78 , \invader_fsm_4/n77 , \invader_fsm_4/n76 ,
         \invader_fsm_4/n75 , \invader_fsm_4/n74 , \invader_fsm_4/n73 ,
         \invader_fsm_4/n72 , \invader_fsm_4/n71 , \invader_fsm_4/n70 ,
         \invader_fsm_4/n69 , \invader_fsm_4/n68 , \invader_fsm_4/n67 ,
         \invader_fsm_4/n66 , \invader_fsm_4/n65 , \invader_fsm_4/n64 ,
         \invader_fsm_4/n63 , \invader_fsm_4/n62 , \invader_fsm_4/n61 ,
         \invader_fsm_4/n60 , \invader_fsm_4/n59 , \invader_fsm_4/n58 ,
         \invader_fsm_4/n57 , \invader_fsm_4/n56 , \invader_fsm_4/n55 ,
         \invader_fsm_4/n54 , \invader_fsm_4/N89 , \invader_fsm_4/N88 ,
         \invader_fsm_4/N86 , \invader_fsm_4/N84 , \invader_fsm_4/N75 ,
         \invader_fsm_4/N74 , \invader_fsm_4/N73 , \invader_fsm_4/N72 ,
         \invader_fsm_4/N70 , \invader_fsm_4/move_interval_toggle ,
         \invader_fsm_4/N56 , \invader_fsm_4/N55 , \invader_fsm_4/N43 ,
         \invader_fsm_4/N42 , \invader_fsm_4/N40 , \invader_fsm_4/N38 ,
         \invader_fsm_4/N35 , \invader_fsm_4/N34 , \invader_fsm_4/N33 ,
         \invader_fsm_4/N32 , \invader_fsm_4/N31 , \invader_fsm_4/N30 ,
         \invader_fsm_4/N29 , \invader_fsm_4/N27 , \invader_fsm_4/N26 ,
         \invader_fsm_4/N24 , \invader_fsm_4/N22 , \invader_fsm_4/N19 ,
         \invader_fsm_4/N18 , \invader_fsm_4/N17 , \invader_fsm_4/N16 ,
         \invader_fsm_4/N15 , \invader_fsm_4/N14 , \invader_fsm_4/N13 ,
         \invader_fsm_4/state[0] , \invader_fsm_4/state[1] ,
         \player_bullet_fsm/n43 , \player_bullet_fsm/n42 ,
         \player_bullet_fsm/n40 , \player_bullet_fsm/n39 ,
         \player_bullet_fsm/n38 , \player_bullet_fsm/n37 ,
         \player_bullet_fsm/n36 , \player_bullet_fsm/n35 ,
         \player_bullet_fsm/n34 , \player_bullet_fsm/n32 ,
         \player_bullet_fsm/N26 , \player_bullet_fsm/N25 ,
         \player_bullet_fsm/N24 , \player_bullet_fsm/N23 ,
         \player_bullet_fsm/N22 , \player_bullet_fsm/N15 ,
         \player_bullet_fsm/next_state[0] , \player_bullet_fsm/state[0] ,
         \invader_bullet_fsm/n41 , \invader_bullet_fsm/n40 ,
         \invader_bullet_fsm/n38 , \invader_bullet_fsm/n36 ,
         \invader_bullet_fsm/n35 , \invader_bullet_fsm/n34 ,
         \invader_bullet_fsm/n33 , \invader_bullet_fsm/n32 ,
         \invader_bullet_fsm/n31 , \invader_bullet_fsm/n30 ,
         \invader_bullet_fsm/n29 , \invader_bullet_fsm/n28 ,
         \invader_bullet_fsm/n27 , \invader_bullet_fsm/n26 ,
         \invader_bullet_fsm/n25 , \invader_bullet_fsm/n24 ,
         \invader_bullet_fsm/n21 , \invader_bullet_fsm/N30 ,
         \invader_bullet_fsm/N29 , \invader_bullet_fsm/N28 ,
         \invader_bullet_fsm/N26 , \invader_bullet_fsm/N19 ,
         \invader_bullet_fsm/next_state[0] , \invader_bullet_fsm/N13 ,
         \invader_bullet_fsm/state[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895;
  wire   [5:0] closest_invader_coord_x;
  wire   [5:0] closest_invader_coord_y;
  wire   [1:0] \main_game_fsm/next_state ;
  wire   [5:0] \main_game_fsm/diff_alive4 ;
  wire   [5:0] \main_game_fsm/diff_alive3 ;
  wire   [5:0] \main_game_fsm/diff_alive2 ;
  wire   [5:0] \main_game_fsm/diff_alive1 ;
  wire   [1:0] \player_fsm/next_state ;
  wire   [1:0] \shield_fsm/next_state ;
  wire   [1:0] \invader_fsm_1/next_state ;
  wire   [1:0] \invader_fsm_2/next_state ;
  wire   [1:0] \invader_fsm_3/next_state ;
  wire   [1:0] \invader_fsm_4/next_state ;
  wire   [5:2] \player_bullet_fsm/add_89/carry ;
  wire   [6:2] \invader_fsm_4/r412/carry ;
  wire   [6:2] \invader_fsm_4/add_50/carry ;
  wire   [6:0] \invader_fsm_4/sub_124/carry ;
  wire   [6:2] \invader_fsm_3/r412/carry ;
  wire   [6:2] \invader_fsm_3/add_50/carry ;
  wire   [6:0] \invader_fsm_3/sub_124/carry ;
  wire   [6:2] \invader_fsm_2/r412/carry ;
  wire   [6:2] \invader_fsm_2/add_50/carry ;
  wire   [6:0] \invader_fsm_2/sub_124/carry ;
  wire   [6:2] \invader_fsm_1/r412/carry ;
  wire   [6:2] \invader_fsm_1/add_50/carry ;
  wire   [6:0] \invader_fsm_1/sub_124/carry ;
  wire   [6:2] \player_fsm/r403/carry ;
  wire   [6:2] \player_fsm/add_39_2/carry ;
  wire   [6:2] \player_fsm/add_40_2/carry ;
  wire   [6:0] \main_game_fsm/sub_60/carry ;
  wire   [6:0] \main_game_fsm/sub_60_2/carry ;
  wire   [6:0] \main_game_fsm/sub_64/carry ;
  wire   [6:0] \main_game_fsm/sub_64_2/carry ;
  wire   [6:0] \main_game_fsm/sub_68/carry ;
  wire   [6:0] \main_game_fsm/sub_68_2/carry ;
  wire   [6:0] \main_game_fsm/sub_72/carry ;
  wire   [6:0] \main_game_fsm/sub_72_2/carry ;
  assign player_coord_y[0] = 1'b0;
  assign player_coord_y[1] = 1'b1;
  assign player_coord_y[2] = 1'b0;
  assign player_coord_y[3] = 1'b0;
  assign player_coord_y[4] = 1'b0;
  assign player_coord_y[5] = 1'b0;
  assign player_bullet_coord_x[0] = \shield_fsm/N35 ;
  assign invader_bullet_coord_x[0] = \shield_fsm/N19 ;
  assign shield_coord_y[0] = 1'b1;
  assign shield_coord_y[1] = 1'b0;
  assign shield_coord_y[2] = 1'b1;
  assign shield_coord_y[3] = 1'b0;
  assign shield_coord_y[4] = 1'b0;
  assign shield_coord_y[5] = 1'b0;
  assign shield_coord_x[0] = 1'b1;
  assign shield_coord_x[1] = 1'b1;
  assign shield_coord_x[2] = 1'b1;
  assign shield_coord_x[3] = 1'b1;
  assign shield_coord_x[4] = 1'b0;
  assign shield_coord_x[5] = 1'b0;
  assign invader_1_coord_x[0] = \invader_fsm_1/N84 ;
  assign invader_1_coord_y[0] = \invader_fsm_1/N70 ;
  assign invader_2_coord_x[0] = \invader_fsm_2/N84 ;
  assign invader_2_coord_y[0] = \invader_fsm_2/N70 ;
  assign invader_3_coord_x[0] = \invader_fsm_3/N84 ;
  assign invader_3_coord_y[0] = \invader_fsm_3/N70 ;
  assign invader_4_coord_x[0] = \invader_fsm_4/N84 ;
  assign invader_4_coord_y[0] = \invader_fsm_4/N70 ;

  NAND2X1 U1 ( .A(n1), .B(n2), .Y(playerbullet_invader_collision_signal) );
  NOR2X1 U2 ( .A(playerbullet_invader_collision_signal_4), .B(
        playerbullet_invader_collision_signal_3), .Y(n2) );
  NOR2X1 U3 ( .A(playerbullet_invader_collision_signal_2), .B(
        playerbullet_invader_collision_signal_1), .Y(n1) );
  NOR2X1 \main_game_fsm/U199  ( .A(invader_outofbounds_signal_2), .B(
        invader_outofbounds_signal_1), .Y(\main_game_fsm/n182 ) );
  NOR2X1 \main_game_fsm/U198  ( .A(invader_outofbounds_signal_4), .B(
        invader_outofbounds_signal_3), .Y(\main_game_fsm/n183 ) );
  NAND2X1 \main_game_fsm/U197  ( .A(\main_game_fsm/n182 ), .B(
        \main_game_fsm/n183 ), .Y(\main_game_fsm/n101 ) );
  NAND2X1 \main_game_fsm/U196  ( .A(n159), .B(\main_game_fsm/n101 ), .Y(
        \main_game_fsm/n172 ) );
  OR2X1 \main_game_fsm/U195  ( .A(invader_3_display), .B(invader_4_display), 
        .Y(\main_game_fsm/n180 ) );
  OR2X1 \main_game_fsm/U194  ( .A(invader_1_display), .B(invader_2_display), 
        .Y(\main_game_fsm/n181 ) );
  OAI21X1 \main_game_fsm/U193  ( .A(\main_game_fsm/n180 ), .B(
        \main_game_fsm/n181 ), .C(player_display), .Y(\main_game_fsm/n179 ) );
  NOR2X1 \main_game_fsm/U192  ( .A(n161), .B(\main_game_fsm/n179 ), .Y(
        \main_game_fsm/n176 ) );
  OR2X1 \main_game_fsm/U191  ( .A(reset), .B(\main_game_fsm/state[1] ), .Y(
        \main_game_fsm/n178 ) );
  NOR2X1 \main_game_fsm/U190  ( .A(\main_game_fsm/N111 ), .B(
        \main_game_fsm/n178 ), .Y(\main_game_fsm/n177 ) );
  NAND2X1 \main_game_fsm/U189  ( .A(\main_game_fsm/n176 ), .B(
        \main_game_fsm/n177 ), .Y(\main_game_fsm/n173 ) );
  NOR2X1 \main_game_fsm/U188  ( .A(\main_game_fsm/state[0] ), .B(reset), .Y(
        \main_game_fsm/n175 ) );
  OAI21X1 \main_game_fsm/U187  ( .A(player_shoot_input), .B(
        \main_game_fsm/state[1] ), .C(\main_game_fsm/n175 ), .Y(
        \main_game_fsm/n174 ) );
  OAI21X1 \main_game_fsm/U186  ( .A(n158), .B(\main_game_fsm/n173 ), .C(
        \main_game_fsm/n174 ), .Y(\main_game_fsm/N122 ) );
  NOR2X1 \main_game_fsm/U185  ( .A(\main_game_fsm/n172 ), .B(
        \main_game_fsm/n173 ), .Y(\main_game_fsm/N123 ) );
  NAND2X1 \main_game_fsm/U184  ( .A(\main_game_fsm/next_state [0]), .B(n157), 
        .Y(\main_game_fsm/n92 ) );
  NAND2X1 \main_game_fsm/U183  ( .A(\main_game_fsm/next_state [1]), .B(n160), 
        .Y(\main_game_fsm/n103 ) );
  NAND2X1 \main_game_fsm/U182  ( .A(\main_game_fsm/n92 ), .B(
        \main_game_fsm/n103 ), .Y(\main_game_fsm/n102 ) );
  NAND2X1 \main_game_fsm/U181  ( .A(\main_game_fsm/n102 ), .B(n93), .Y(
        \main_game_fsm/n171 ) );
  NOR2X1 \main_game_fsm/U180  ( .A(n160), .B(\main_game_fsm/n171 ), .Y(
        \main_game_fsm/N143 ) );
  NOR2X1 \main_game_fsm/U179  ( .A(n157), .B(\main_game_fsm/n171 ), .Y(
        \main_game_fsm/N144 ) );
  AOI22X1 \main_game_fsm/U176  ( .A(\invader_fsm_4/N84 ), .B(n4), .C(
        \invader_fsm_3/N84 ), .D(n70), .Y(\main_game_fsm/n169 ) );
  AOI22X1 \main_game_fsm/U175  ( .A(\invader_fsm_2/N84 ), .B(n3), .C(
        \invader_fsm_1/N84 ), .D(n69), .Y(\main_game_fsm/n170 ) );
  NAND2X1 \main_game_fsm/U174  ( .A(\main_game_fsm/n169 ), .B(
        \main_game_fsm/n170 ), .Y(closest_invader_coord_x[0]) );
  AOI22X1 \main_game_fsm/U173  ( .A(invader_4_coord_x[1]), .B(n4), .C(
        invader_3_coord_x[1]), .D(n70), .Y(\main_game_fsm/n167 ) );
  AOI22X1 \main_game_fsm/U172  ( .A(invader_2_coord_x[1]), .B(n3), .C(
        invader_1_coord_x[1]), .D(n69), .Y(\main_game_fsm/n168 ) );
  NAND2X1 \main_game_fsm/U171  ( .A(\main_game_fsm/n167 ), .B(
        \main_game_fsm/n168 ), .Y(closest_invader_coord_x[1]) );
  AOI22X1 \main_game_fsm/U170  ( .A(invader_4_coord_x[2]), .B(n4), .C(
        invader_3_coord_x[2]), .D(n70), .Y(\main_game_fsm/n165 ) );
  AOI22X1 \main_game_fsm/U169  ( .A(invader_2_coord_x[2]), .B(n3), .C(
        invader_1_coord_x[2]), .D(n69), .Y(\main_game_fsm/n166 ) );
  NAND2X1 \main_game_fsm/U168  ( .A(\main_game_fsm/n165 ), .B(
        \main_game_fsm/n166 ), .Y(closest_invader_coord_x[2]) );
  AOI22X1 \main_game_fsm/U167  ( .A(invader_4_coord_x[3]), .B(n4), .C(
        invader_3_coord_x[3]), .D(n70), .Y(\main_game_fsm/n163 ) );
  AOI22X1 \main_game_fsm/U166  ( .A(invader_2_coord_x[3]), .B(n3), .C(
        invader_1_coord_x[3]), .D(n69), .Y(\main_game_fsm/n164 ) );
  NAND2X1 \main_game_fsm/U165  ( .A(\main_game_fsm/n163 ), .B(
        \main_game_fsm/n164 ), .Y(closest_invader_coord_x[3]) );
  AOI22X1 \main_game_fsm/U164  ( .A(invader_4_coord_x[4]), .B(n4), .C(
        invader_3_coord_x[4]), .D(n70), .Y(\main_game_fsm/n161 ) );
  AOI22X1 \main_game_fsm/U163  ( .A(invader_2_coord_x[4]), .B(n3), .C(
        invader_1_coord_x[4]), .D(n69), .Y(\main_game_fsm/n162 ) );
  NAND2X1 \main_game_fsm/U162  ( .A(\main_game_fsm/n161 ), .B(
        \main_game_fsm/n162 ), .Y(closest_invader_coord_x[4]) );
  AOI22X1 \main_game_fsm/U161  ( .A(invader_4_coord_x[5]), .B(n4), .C(
        invader_3_coord_x[5]), .D(n70), .Y(\main_game_fsm/n159 ) );
  AOI22X1 \main_game_fsm/U160  ( .A(invader_2_coord_x[5]), .B(n3), .C(
        invader_1_coord_x[5]), .D(n69), .Y(\main_game_fsm/n160 ) );
  NAND2X1 \main_game_fsm/U159  ( .A(\main_game_fsm/n159 ), .B(
        \main_game_fsm/n160 ), .Y(closest_invader_coord_x[5]) );
  AOI22X1 \main_game_fsm/U158  ( .A(\invader_fsm_4/N70 ), .B(n4), .C(
        \invader_fsm_3/N70 ), .D(n70), .Y(\main_game_fsm/n157 ) );
  AOI22X1 \main_game_fsm/U157  ( .A(\invader_fsm_2/N70 ), .B(n3), .C(
        \invader_fsm_1/N70 ), .D(n69), .Y(\main_game_fsm/n158 ) );
  NAND2X1 \main_game_fsm/U156  ( .A(\main_game_fsm/n157 ), .B(
        \main_game_fsm/n158 ), .Y(closest_invader_coord_y[0]) );
  AOI22X1 \main_game_fsm/U155  ( .A(invader_4_coord_y[1]), .B(n4), .C(
        invader_3_coord_y[1]), .D(n70), .Y(\main_game_fsm/n155 ) );
  AOI22X1 \main_game_fsm/U154  ( .A(invader_2_coord_y[1]), .B(n3), .C(
        invader_1_coord_y[1]), .D(n69), .Y(\main_game_fsm/n156 ) );
  NAND2X1 \main_game_fsm/U153  ( .A(\main_game_fsm/n155 ), .B(
        \main_game_fsm/n156 ), .Y(closest_invader_coord_y[1]) );
  AOI22X1 \main_game_fsm/U152  ( .A(invader_4_coord_y[2]), .B(n4), .C(
        invader_3_coord_y[2]), .D(n70), .Y(\main_game_fsm/n153 ) );
  AOI22X1 \main_game_fsm/U151  ( .A(invader_2_coord_y[2]), .B(n3), .C(
        invader_1_coord_y[2]), .D(n69), .Y(\main_game_fsm/n154 ) );
  NAND2X1 \main_game_fsm/U150  ( .A(\main_game_fsm/n153 ), .B(
        \main_game_fsm/n154 ), .Y(closest_invader_coord_y[2]) );
  AOI22X1 \main_game_fsm/U149  ( .A(invader_4_coord_y[3]), .B(n4), .C(
        invader_3_coord_y[3]), .D(n70), .Y(\main_game_fsm/n151 ) );
  AOI22X1 \main_game_fsm/U148  ( .A(invader_2_coord_y[3]), .B(n3), .C(
        invader_1_coord_y[3]), .D(n69), .Y(\main_game_fsm/n152 ) );
  NAND2X1 \main_game_fsm/U147  ( .A(\main_game_fsm/n151 ), .B(
        \main_game_fsm/n152 ), .Y(closest_invader_coord_y[3]) );
  AOI22X1 \main_game_fsm/U146  ( .A(invader_4_coord_y[4]), .B(n4), .C(
        invader_3_coord_y[4]), .D(n70), .Y(\main_game_fsm/n149 ) );
  AOI22X1 \main_game_fsm/U145  ( .A(invader_2_coord_y[4]), .B(n3), .C(
        invader_1_coord_y[4]), .D(n69), .Y(\main_game_fsm/n150 ) );
  NAND2X1 \main_game_fsm/U144  ( .A(\main_game_fsm/n149 ), .B(
        \main_game_fsm/n150 ), .Y(closest_invader_coord_y[4]) );
  AOI22X1 \main_game_fsm/U143  ( .A(invader_4_coord_y[5]), .B(n4), .C(
        invader_3_coord_y[5]), .D(n70), .Y(\main_game_fsm/n143 ) );
  AOI22X1 \main_game_fsm/U142  ( .A(invader_2_coord_y[5]), .B(n3), .C(
        invader_1_coord_y[5]), .D(n69), .Y(\main_game_fsm/n144 ) );
  NAND2X1 \main_game_fsm/U141  ( .A(\main_game_fsm/n143 ), .B(
        \main_game_fsm/n144 ), .Y(closest_invader_coord_y[5]) );
  AOI22X1 \main_game_fsm/U140  ( .A(\main_game_fsm/N35 ), .B(n196), .C(
        \main_game_fsm/N29 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n142 ) );
  NAND2X1 \main_game_fsm/U139  ( .A(\main_game_fsm/n142 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [0]) );
  AOI22X1 \main_game_fsm/U138  ( .A(\main_game_fsm/N36 ), .B(n196), .C(
        \main_game_fsm/N30 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n141 ) );
  NAND2X1 \main_game_fsm/U137  ( .A(\main_game_fsm/n141 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [1]) );
  AOI22X1 \main_game_fsm/U136  ( .A(\main_game_fsm/N37 ), .B(n196), .C(
        \main_game_fsm/N31 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n140 ) );
  NAND2X1 \main_game_fsm/U135  ( .A(\main_game_fsm/n140 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [2]) );
  AOI22X1 \main_game_fsm/U134  ( .A(\main_game_fsm/N38 ), .B(n196), .C(
        \main_game_fsm/N32 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n139 ) );
  NAND2X1 \main_game_fsm/U133  ( .A(\main_game_fsm/n139 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [3]) );
  AOI22X1 \main_game_fsm/U132  ( .A(\main_game_fsm/N39 ), .B(n196), .C(
        \main_game_fsm/N33 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n138 ) );
  NAND2X1 \main_game_fsm/U131  ( .A(\main_game_fsm/n138 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [4]) );
  AOI22X1 \main_game_fsm/U130  ( .A(\main_game_fsm/N40 ), .B(n196), .C(
        \main_game_fsm/N34 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n137 ) );
  NAND2X1 \main_game_fsm/U129  ( .A(\main_game_fsm/n137 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [5]) );
  AOI22X1 \main_game_fsm/U128  ( .A(\main_game_fsm/N49 ), .B(n191), .C(
        \main_game_fsm/N43 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n136 ) );
  NAND2X1 \main_game_fsm/U127  ( .A(\main_game_fsm/n136 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [0]) );
  AOI22X1 \main_game_fsm/U126  ( .A(\main_game_fsm/N50 ), .B(n191), .C(
        \main_game_fsm/N44 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n135 ) );
  NAND2X1 \main_game_fsm/U125  ( .A(\main_game_fsm/n135 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [1]) );
  AOI22X1 \main_game_fsm/U124  ( .A(\main_game_fsm/N51 ), .B(n191), .C(
        \main_game_fsm/N45 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n134 ) );
  NAND2X1 \main_game_fsm/U123  ( .A(\main_game_fsm/n134 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [2]) );
  AOI22X1 \main_game_fsm/U122  ( .A(\main_game_fsm/N52 ), .B(n191), .C(
        \main_game_fsm/N46 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n133 ) );
  NAND2X1 \main_game_fsm/U121  ( .A(\main_game_fsm/n133 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [3]) );
  AOI22X1 \main_game_fsm/U120  ( .A(\main_game_fsm/N53 ), .B(n191), .C(
        \main_game_fsm/N47 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n132 ) );
  NAND2X1 \main_game_fsm/U119  ( .A(\main_game_fsm/n132 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [4]) );
  AOI22X1 \main_game_fsm/U118  ( .A(\main_game_fsm/N54 ), .B(n191), .C(
        \main_game_fsm/N48 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n131 ) );
  NAND2X1 \main_game_fsm/U117  ( .A(\main_game_fsm/n131 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [5]) );
  AOI22X1 \main_game_fsm/U116  ( .A(\main_game_fsm/N63 ), .B(n180), .C(
        \main_game_fsm/N57 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n130 ) );
  NAND2X1 \main_game_fsm/U115  ( .A(\main_game_fsm/n130 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [0]) );
  AOI22X1 \main_game_fsm/U114  ( .A(\main_game_fsm/N64 ), .B(n180), .C(
        \main_game_fsm/N58 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n129 ) );
  NAND2X1 \main_game_fsm/U113  ( .A(\main_game_fsm/n129 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [1]) );
  AOI22X1 \main_game_fsm/U112  ( .A(\main_game_fsm/N65 ), .B(n180), .C(
        \main_game_fsm/N59 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n128 ) );
  NAND2X1 \main_game_fsm/U111  ( .A(\main_game_fsm/n128 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [2]) );
  AOI22X1 \main_game_fsm/U110  ( .A(\main_game_fsm/N66 ), .B(n180), .C(
        \main_game_fsm/N60 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n127 ) );
  NAND2X1 \main_game_fsm/U109  ( .A(\main_game_fsm/n127 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [3]) );
  AOI22X1 \main_game_fsm/U108  ( .A(\main_game_fsm/N67 ), .B(n180), .C(
        \main_game_fsm/N61 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n126 ) );
  NAND2X1 \main_game_fsm/U107  ( .A(\main_game_fsm/n126 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [4]) );
  AOI22X1 \main_game_fsm/U106  ( .A(\main_game_fsm/N68 ), .B(n180), .C(
        \main_game_fsm/N62 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n125 ) );
  NAND2X1 \main_game_fsm/U105  ( .A(\main_game_fsm/n125 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [5]) );
  AOI22X1 \main_game_fsm/U104  ( .A(\main_game_fsm/N77 ), .B(n175), .C(
        \main_game_fsm/N71 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n124 ) );
  NAND2X1 \main_game_fsm/U103  ( .A(\main_game_fsm/n124 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [0]) );
  AOI22X1 \main_game_fsm/U102  ( .A(\main_game_fsm/N78 ), .B(n175), .C(
        \main_game_fsm/N72 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n123 ) );
  NAND2X1 \main_game_fsm/U101  ( .A(\main_game_fsm/n123 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [1]) );
  AOI22X1 \main_game_fsm/U100  ( .A(\main_game_fsm/N79 ), .B(n175), .C(
        \main_game_fsm/N73 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n122 ) );
  NAND2X1 \main_game_fsm/U99  ( .A(\main_game_fsm/n122 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [2]) );
  AOI22X1 \main_game_fsm/U98  ( .A(\main_game_fsm/N80 ), .B(n175), .C(
        \main_game_fsm/N74 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n121 ) );
  NAND2X1 \main_game_fsm/U97  ( .A(\main_game_fsm/n121 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [3]) );
  AOI22X1 \main_game_fsm/U96  ( .A(\main_game_fsm/N81 ), .B(n175), .C(
        \main_game_fsm/N75 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n120 ) );
  NAND2X1 \main_game_fsm/U95  ( .A(\main_game_fsm/n120 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [4]) );
  AOI22X1 \main_game_fsm/U94  ( .A(\main_game_fsm/N82 ), .B(n175), .C(
        \main_game_fsm/N76 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n119 ) );
  NAND2X1 \main_game_fsm/U93  ( .A(\main_game_fsm/n119 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [5]) );
  AOI22X1 \main_game_fsm/U92  ( .A(n185), .B(\main_game_fsm/diff_alive2 [0]), 
        .C(\main_game_fsm/diff_alive1 [0]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n118 ) );
  AOI22X1 \main_game_fsm/U91  ( .A(n185), .B(\main_game_fsm/diff_alive2 [1]), 
        .C(\main_game_fsm/diff_alive1 [1]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n117 ) );
  AOI22X1 \main_game_fsm/U90  ( .A(n185), .B(\main_game_fsm/diff_alive2 [2]), 
        .C(\main_game_fsm/diff_alive1 [2]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n116 ) );
  AOI22X1 \main_game_fsm/U89  ( .A(n185), .B(\main_game_fsm/diff_alive2 [3]), 
        .C(\main_game_fsm/diff_alive1 [3]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n115 ) );
  AOI22X1 \main_game_fsm/U88  ( .A(n185), .B(\main_game_fsm/diff_alive2 [4]), 
        .C(\main_game_fsm/diff_alive1 [4]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n114 ) );
  AOI22X1 \main_game_fsm/U87  ( .A(n185), .B(\main_game_fsm/diff_alive2 [5]), 
        .C(\main_game_fsm/diff_alive1 [5]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n113 ) );
  AOI22X1 \main_game_fsm/U86  ( .A(n169), .B(\main_game_fsm/diff_alive4 [0]), 
        .C(\main_game_fsm/diff_alive3 [0]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n112 ) );
  AOI22X1 \main_game_fsm/U85  ( .A(n169), .B(\main_game_fsm/diff_alive4 [1]), 
        .C(\main_game_fsm/diff_alive3 [1]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n111 ) );
  AOI22X1 \main_game_fsm/U84  ( .A(n169), .B(\main_game_fsm/diff_alive4 [2]), 
        .C(\main_game_fsm/diff_alive3 [2]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n110 ) );
  AOI22X1 \main_game_fsm/U83  ( .A(n169), .B(\main_game_fsm/diff_alive4 [3]), 
        .C(\main_game_fsm/diff_alive3 [3]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n109 ) );
  AOI22X1 \main_game_fsm/U82  ( .A(n169), .B(\main_game_fsm/diff_alive4 [4]), 
        .C(\main_game_fsm/diff_alive3 [4]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n108 ) );
  AOI22X1 \main_game_fsm/U81  ( .A(n169), .B(\main_game_fsm/diff_alive4 [5]), 
        .C(\main_game_fsm/diff_alive3 [5]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n107 ) );
  XOR2X1 \main_game_fsm/U80  ( .A(\main_game_fsm/n103 ), .B(invader_direction), 
        .Y(\main_game_fsm/n106 ) );
  NAND2X1 \main_game_fsm/U79  ( .A(n160), .B(n157), .Y(\main_game_fsm/n105 )
         );
  NAND2X1 \main_game_fsm/U78  ( .A(\main_game_fsm/n106 ), .B(
        \main_game_fsm/n91 ), .Y(\main_game_fsm/n190 ) );
  NAND2X1 \main_game_fsm/U77  ( .A(n93), .B(\main_game_fsm/n92 ), .Y(
        \main_game_fsm/n98 ) );
  NAND2X1 \main_game_fsm/U76  ( .A(n92), .B(\main_game_fsm/n105 ), .Y(
        \main_game_fsm/n90 ) );
  NAND2X1 \main_game_fsm/U75  ( .A(n88), .B(\main_game_fsm/n103 ), .Y(
        \main_game_fsm/n99 ) );
  NAND2X1 \main_game_fsm/U74  ( .A(move_down), .B(n87), .Y(
        \main_game_fsm/n104 ) );
  OAI21X1 \main_game_fsm/U73  ( .A(reset), .B(\main_game_fsm/n103 ), .C(
        \main_game_fsm/n104 ), .Y(\main_game_fsm/n189 ) );
  NAND3X1 \main_game_fsm/U72  ( .A(\main_game_fsm/n101 ), .B(n93), .C(
        \main_game_fsm/n102 ), .Y(\main_game_fsm/n100 ) );
  OAI21X1 \main_game_fsm/U71  ( .A(\main_game_fsm/n99 ), .B(n159), .C(
        \main_game_fsm/n100 ), .Y(\main_game_fsm/n188 ) );
  NOR2X1 \main_game_fsm/U70  ( .A(n92), .B(reset), .Y(\main_game_fsm/n95 ) );
  OAI21X1 \main_game_fsm/U69  ( .A(\main_game_fsm/n98 ), .B(n156), .C(n89), 
        .Y(\main_game_fsm/n187 ) );
  NAND2X1 \main_game_fsm/U68  ( .A(playerbullet_fire), .B(n92), .Y(
        \main_game_fsm/n97 ) );
  OAI21X1 \main_game_fsm/U67  ( .A(n89), .B(n94), .C(\main_game_fsm/n97 ), .Y(
        \main_game_fsm/n186 ) );
  AOI22X1 \main_game_fsm/U66  ( .A(player_left_input), .B(\main_game_fsm/n95 ), 
        .C(player_left_motion), .D(n92), .Y(\main_game_fsm/n96 ) );
  AOI22X1 \main_game_fsm/U65  ( .A(player_right_input), .B(\main_game_fsm/n95 ), .C(player_right_motion), .D(n92), .Y(\main_game_fsm/n94 ) );
  NAND2X1 \main_game_fsm/U64  ( .A(play), .B(n88), .Y(\main_game_fsm/n93 ) );
  OAI21X1 \main_game_fsm/U63  ( .A(reset), .B(\main_game_fsm/n92 ), .C(
        \main_game_fsm/n93 ), .Y(\main_game_fsm/n185 ) );
  OAI21X1 \main_game_fsm/U62  ( .A(\main_game_fsm/n90 ), .B(n71), .C(
        \main_game_fsm/n91 ), .Y(\main_game_fsm/n184 ) );
  AND2X2 \main_game_fsm/U3  ( .A(n93), .B(\main_game_fsm/n105 ), .Y(
        \main_game_fsm/n91 ) );
  DFFNEGX1 \main_game_fsm/reset_reg  ( .D(\main_game_fsm/n184 ), .CLK(n86), 
        .Q(internal_reset) );
  DFFNEGX1 \main_game_fsm/play_reg  ( .D(\main_game_fsm/n185 ), .CLK(n86), .Q(
        play) );
  DFFNEGX1 \main_game_fsm/player_right_motion_reg  ( .D(n91), .CLK(n86), .Q(
        player_right_motion) );
  DFFNEGX1 \main_game_fsm/player_left_motion_reg  ( .D(n90), .CLK(n86), .Q(
        player_left_motion) );
  DFFNEGX1 \main_game_fsm/invader_direction_reg  ( .D(\main_game_fsm/n190 ), 
        .CLK(n86), .Q(invader_direction) );
  DFFNEGX1 \main_game_fsm/move_down_reg  ( .D(\main_game_fsm/n189 ), .CLK(n86), 
        .Q(move_down) );
  DFFNEGX1 \main_game_fsm/state_reg[1]  ( .D(\main_game_fsm/N144 ), .CLK(n86), 
        .Q(\main_game_fsm/state[1] ) );
  DFFNEGX1 \main_game_fsm/playerbullet_fire_reg  ( .D(\main_game_fsm/n186 ), 
        .CLK(n86), .Q(playerbullet_fire) );
  DFFNEGX1 \main_game_fsm/invaderbullet_fire_reg  ( .D(\main_game_fsm/n187 ), 
        .CLK(n86), .Q(invader_fire) );
  DFFNEGX1 \main_game_fsm/next_state_reg[1]  ( .D(\main_game_fsm/N123 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [1]) );
  DFFNEGX1 \main_game_fsm/prev_invader_outofbounds_reg  ( .D(
        \main_game_fsm/n188 ), .CLK(n86), .Q(
        \main_game_fsm/prev_invader_outofbounds ) );
  DFFNEGX1 \main_game_fsm/next_state_reg[0]  ( .D(\main_game_fsm/N122 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [0]) );
  DFFNEGX1 \main_game_fsm/state_reg[0]  ( .D(\main_game_fsm/N143 ), .CLK(n86), 
        .Q(\main_game_fsm/state[0] ) );
  NAND3X1 \player_fsm/U82  ( .A(n221), .B(n72), .C(\player_fsm/next_state [1]), 
        .Y(\player_fsm/n56 ) );
  NAND2X1 \player_fsm/U81  ( .A(\player_fsm/next_state [0]), .B(n219), .Y(
        \player_fsm/n79 ) );
  NOR2X1 \player_fsm/U80  ( .A(\player_fsm/n79 ), .B(internal_reset), .Y(
        \player_fsm/n71 ) );
  NOR2X1 \player_fsm/U79  ( .A(n144), .B(\player_fsm/n71 ), .Y(
        \player_fsm/n81 ) );
  NOR2X1 \player_fsm/U78  ( .A(\player_fsm/n81 ), .B(n221), .Y(
        \player_fsm/N108 ) );
  NOR2X1 \player_fsm/U77  ( .A(\player_fsm/n81 ), .B(n219), .Y(
        \player_fsm/N109 ) );
  XOR2X1 \player_fsm/U76  ( .A(\player_fsm/next_state [1]), .B(
        \player_fsm/next_state [0]), .Y(\player_fsm/n80 ) );
  NAND2X1 \player_fsm/U74  ( .A(\player_fsm/n79 ), .B(n23), .Y(
        \player_fsm/N119 ) );
  AOI22X1 \player_fsm/U73  ( .A(\player_fsm/N38 ), .B(\player_fsm/N37 ), .C(
        \player_fsm/N47 ), .D(\player_fsm/N46 ), .Y(\player_fsm/n77 ) );
  AOI22X1 \player_fsm/U72  ( .A(\player_fsm/N20 ), .B(\player_fsm/N19 ), .C(
        \player_fsm/N29 ), .D(\player_fsm/N28 ), .Y(\player_fsm/n78 ) );
  OR2X1 \player_fsm/U71  ( .A(\player_fsm/n77 ), .B(\player_fsm/n78 ), .Y(
        \player_fsm/n74 ) );
  AOI22X1 \player_fsm/U70  ( .A(\player_fsm/state[0] ), .B(\player_fsm/n74 ), 
        .C(play), .D(n220), .Y(\player_fsm/n75 ) );
  OR2X1 \player_fsm/U69  ( .A(internal_reset), .B(\player_fsm/state[1] ), .Y(
        \player_fsm/n76 ) );
  NOR2X1 \player_fsm/U68  ( .A(\player_fsm/n75 ), .B(\player_fsm/n76 ), .Y(
        \player_fsm/N59 ) );
  NOR2X1 \player_fsm/U67  ( .A(\player_fsm/state[1] ), .B(\player_fsm/n74 ), 
        .Y(\player_fsm/n73 ) );
  AOI22X1 \player_fsm/U66  ( .A(\player_fsm/n73 ), .B(\player_fsm/state[0] ), 
        .C(\player_fsm/state[1] ), .D(n220), .Y(\player_fsm/n72 ) );
  NOR2X1 \player_fsm/U65  ( .A(internal_reset), .B(\player_fsm/n72 ), .Y(
        \player_fsm/N60 ) );
  NAND3X1 \player_fsm/U64  ( .A(\player_fsm/N74 ), .B(n151), .C(
        player_right_motion), .Y(\player_fsm/n65 ) );
  NAND3X1 \player_fsm/U63  ( .A(\player_fsm/N72 ), .B(n149), .C(
        player_left_motion), .Y(\player_fsm/n64 ) );
  NAND2X1 \player_fsm/U62  ( .A(\player_fsm/n65 ), .B(\player_fsm/n64 ), .Y(
        \player_fsm/n62 ) );
  OAI21X1 \player_fsm/U61  ( .A(n147), .B(\player_fsm/n62 ), .C(
        \player_fsm/n56 ), .Y(\player_fsm/n70 ) );
  NOR2X1 \player_fsm/U60  ( .A(\player_fsm/n65 ), .B(n147), .Y(
        \player_fsm/n58 ) );
  NOR2X1 \player_fsm/U59  ( .A(\player_fsm/n64 ), .B(n147), .Y(
        \player_fsm/n59 ) );
  AOI22X1 \player_fsm/U58  ( .A(n60), .B(\player_fsm/n58 ), .C(n60), .D(
        \player_fsm/n59 ), .Y(\player_fsm/n69 ) );
  OAI21X1 \player_fsm/U57  ( .A(n145), .B(n60), .C(\player_fsm/n69 ), .Y(
        \player_fsm/n88 ) );
  AOI22X1 \player_fsm/U56  ( .A(\player_fsm/N13 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N79 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n68 ) );
  OAI21X1 \player_fsm/U55  ( .A(n145), .B(n66), .C(\player_fsm/n68 ), .Y(
        \player_fsm/n87 ) );
  AOI22X1 \player_fsm/U54  ( .A(\player_fsm/N14 ), .B(\player_fsm/n58 ), .C(
        n198), .D(\player_fsm/n59 ), .Y(\player_fsm/n67 ) );
  OAI21X1 \player_fsm/U53  ( .A(n145), .B(n67), .C(\player_fsm/n67 ), .Y(
        \player_fsm/n86 ) );
  AOI22X1 \player_fsm/U52  ( .A(\player_fsm/N15 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N81 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n66 ) );
  OAI21X1 \player_fsm/U51  ( .A(n145), .B(n65), .C(\player_fsm/n66 ), .Y(
        \player_fsm/n85 ) );
  AOI22X1 \player_fsm/U50  ( .A(\player_fsm/N16 ), .B(n150), .C(
        \player_fsm/N82 ), .D(n148), .Y(\player_fsm/n63 ) );
  OAI21X1 \player_fsm/U49  ( .A(n144), .B(\player_fsm/n63 ), .C(n23), .Y(
        \player_fsm/n60 ) );
  OAI22X1 \player_fsm/U48  ( .A(n63), .B(\player_fsm/n56 ), .C(
        \player_fsm/n62 ), .D(n63), .Y(\player_fsm/n61 ) );
  OR2X1 \player_fsm/U47  ( .A(\player_fsm/n60 ), .B(\player_fsm/n61 ), .Y(
        \player_fsm/n84 ) );
  AOI22X1 \player_fsm/U46  ( .A(\player_fsm/N17 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N83 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n57 ) );
  OAI21X1 \player_fsm/U45  ( .A(n145), .B(n61), .C(\player_fsm/n57 ), .Y(
        \player_fsm/n83 ) );
  NAND3X1 \player_fsm/U44  ( .A(n221), .B(n71), .C(
        invaderbullet_player_collision_signal), .Y(\player_fsm/n55 ) );
  NAND2X1 \player_fsm/U43  ( .A(\player_fsm/n55 ), .B(\player_fsm/n56 ), .Y(
        \player_fsm/n82 ) );
  DFFNEGX1 \player_fsm/invaderbullet_player_collision_signal_reg  ( .D(
        \player_fsm/n82 ), .CLK(n85), .Q(invaderbullet_player_collision_signal) );
  DFFNEGX1 \player_fsm/state_reg[1]  ( .D(\player_fsm/N109 ), .CLK(n85), .Q(
        \player_fsm/state[1] ) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[2]  ( .D(\player_fsm/n86 ), .CLK(n85), .Q(player_coord_x[2]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[1]  ( .D(\player_fsm/n87 ), .CLK(n85), .Q(player_coord_x[1]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[3]  ( .D(\player_fsm/n85 ), .CLK(n85), .Q(player_coord_x[3]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[4]  ( .D(\player_fsm/n84 ), .CLK(n85), .Q(player_coord_x[4]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[5]  ( .D(\player_fsm/n83 ), .CLK(n85), .Q(n896) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[0]  ( .D(\player_fsm/n88 ), .CLK(n85), .Q(player_coord_x[0]) );
  DFFNEGX1 \player_fsm/display_reg  ( .D(\player_fsm/N119 ), .CLK(n85), .Q(
        player_display) );
  DFFNEGX1 \player_fsm/next_state_reg[1]  ( .D(\player_fsm/N60 ), .CLK(clka), 
        .Q(\player_fsm/next_state [1]) );
  DFFNEGX1 \player_fsm/state_reg[0]  ( .D(\player_fsm/N108 ), .CLK(n85), .Q(
        \player_fsm/state[0] ) );
  DFFNEGX1 \player_fsm/next_state_reg[0]  ( .D(\player_fsm/N59 ), .CLK(clka), 
        .Q(\player_fsm/next_state [0]) );
  OAI21X1 \shield_fsm/U83  ( .A(\shield_fsm/next_state [1]), .B(
        \shield_fsm/next_state [0]), .C(n71), .Y(\shield_fsm/N102 ) );
  NOR2X1 \shield_fsm/U80  ( .A(invader_bullet_coord_y[5]), .B(
        invader_bullet_coord_y[3]), .Y(\shield_fsm/n81 ) );
  NAND3X1 \shield_fsm/U79  ( .A(\shield_fsm/N26 ), .B(\shield_fsm/N18 ), .C(
        \shield_fsm/n81 ), .Y(\shield_fsm/n74 ) );
  NOR2X1 \shield_fsm/U74  ( .A(invader_bullet_coord_y[4]), .B(n420), .Y(
        \shield_fsm/n78 ) );
  NAND3X1 \shield_fsm/U73  ( .A(n422), .B(invader_bullet_coord_y[0]), .C(
        \shield_fsm/n78 ), .Y(\shield_fsm/n75 ) );
  NOR2X1 \shield_fsm/U72  ( .A(\shield_fsm/n74 ), .B(\shield_fsm/n75 ), .Y(
        \shield_fsm/n67 ) );
  NAND3X1 \shield_fsm/U71  ( .A(n226), .B(n227), .C(\shield_fsm/n67 ), .Y(
        \shield_fsm/n71 ) );
  AOI22X1 \shield_fsm/U70  ( .A(\shield_fsm/state[0] ), .B(\shield_fsm/n71 ), 
        .C(play), .D(n223), .Y(\shield_fsm/n72 ) );
  OR2X1 \shield_fsm/U69  ( .A(internal_reset), .B(\shield_fsm/state[1] ), .Y(
        \shield_fsm/n73 ) );
  NOR2X1 \shield_fsm/U68  ( .A(\shield_fsm/n72 ), .B(\shield_fsm/n73 ), .Y(
        \shield_fsm/N55 ) );
  NOR2X1 \shield_fsm/U67  ( .A(\shield_fsm/state[1] ), .B(\shield_fsm/n71 ), 
        .Y(\shield_fsm/n70 ) );
  AOI22X1 \shield_fsm/U66  ( .A(\shield_fsm/n70 ), .B(\shield_fsm/state[0] ), 
        .C(\shield_fsm/state[1] ), .D(n223), .Y(\shield_fsm/n69 ) );
  NOR2X1 \shield_fsm/U65  ( .A(internal_reset), .B(\shield_fsm/n69 ), .Y(
        \shield_fsm/N56 ) );
  NAND2X1 \shield_fsm/U64  ( .A(\shield_fsm/next_state [0]), .B(n224), .Y(
        \shield_fsm/n61 ) );
  NOR2X1 \shield_fsm/U63  ( .A(internal_reset), .B(\shield_fsm/n61 ), .Y(
        \shield_fsm/N97 ) );
  NAND2X1 \shield_fsm/U62  ( .A(n225), .B(n72), .Y(\shield_fsm/n68 ) );
  NOR2X1 \shield_fsm/U61  ( .A(n224), .B(\shield_fsm/n68 ), .Y(
        \shield_fsm/N98 ) );
  NOR2X1 \shield_fsm/U60  ( .A(n411), .B(\shield_fsm/n61 ), .Y(
        \shield_fsm/n65 ) );
  NAND2X1 \shield_fsm/U59  ( .A(\shield_fsm/n65 ), .B(n227), .Y(
        \shield_fsm/n62 ) );
  OAI21X1 \shield_fsm/U58  ( .A(\shield_fsm/n65 ), .B(n227), .C(
        \shield_fsm/n66 ), .Y(\shield_fsm/n88 ) );
  AOI21X1 \shield_fsm/U57  ( .A(n227), .B(\shield_fsm/n65 ), .C(n226), .Y(
        \shield_fsm/n64 ) );
  NOR2X1 \shield_fsm/U56  ( .A(\shield_fsm/n64 ), .B(\shield_fsm/N102 ), .Y(
        \shield_fsm/n63 ) );
  OAI21X1 \shield_fsm/U55  ( .A(shield_hp[1]), .B(\shield_fsm/n62 ), .C(
        \shield_fsm/n63 ), .Y(\shield_fsm/n87 ) );
  NAND2X1 \shield_fsm/U54  ( .A(\shield_fsm/n61 ), .B(n143), .Y(
        \shield_fsm/n44 ) );
  NOR2X1 \shield_fsm/U53  ( .A(\shield_fsm/n44 ), .B(n225), .Y(
        \shield_fsm/n49 ) );
  NAND2X1 \shield_fsm/U52  ( .A(invaderbullet_shield_collision_signal), .B(
        \shield_fsm/n49 ), .Y(\shield_fsm/n60 ) );
  OAI21X1 \shield_fsm/U51  ( .A(n411), .B(n146), .C(\shield_fsm/n60 ), .Y(
        \shield_fsm/n86 ) );
  NAND3X1 \shield_fsm/U50  ( .A(\shield_fsm/N34 ), .B(\shield_fsm/N97 ), .C(
        \shield_fsm/N42 ), .Y(\shield_fsm/n57 ) );
  NAND2X1 \shield_fsm/U48  ( .A(n397), .B(shield_hp[1]), .Y(\shield_fsm/n58 )
         );
  OR2X1 \shield_fsm/U47  ( .A(\shield_fsm/n57 ), .B(\shield_fsm/n58 ), .Y(
        \shield_fsm/n46 ) );
  NOR2X1 \shield_fsm/U44  ( .A(player_bullet_coord_y[5]), .B(
        player_bullet_coord_y[3]), .Y(\shield_fsm/n50 ) );
  NOR2X1 \shield_fsm/U40  ( .A(n399), .B(n401), .Y(\shield_fsm/n52 ) );
  NAND3X1 \shield_fsm/U39  ( .A(\shield_fsm/n50 ), .B(n400), .C(
        \shield_fsm/n52 ), .Y(\shield_fsm/n47 ) );
  NAND2X1 \shield_fsm/U38  ( .A(playerbullet_shield_collision_signal), .B(
        \shield_fsm/n49 ), .Y(\shield_fsm/n48 ) );
  OAI21X1 \shield_fsm/U37  ( .A(\shield_fsm/n46 ), .B(\shield_fsm/n47 ), .C(
        \shield_fsm/n48 ), .Y(\shield_fsm/n85 ) );
  OAI21X1 \shield_fsm/U36  ( .A(shield_hp[1]), .B(n411), .C(\shield_fsm/N97 ), 
        .Y(\shield_fsm/n45 ) );
  OAI21X1 \shield_fsm/U35  ( .A(\shield_fsm/n44 ), .B(n222), .C(
        \shield_fsm/n45 ), .Y(\shield_fsm/n84 ) );
  AND2X2 \shield_fsm/U24  ( .A(n143), .B(\shield_fsm/n62 ), .Y(
        \shield_fsm/n66 ) );
  DFFNEGX1 \shield_fsm/invaderbullet_shield_collision_reg  ( .D(
        \shield_fsm/n86 ), .CLK(n85), .Q(invaderbullet_shield_collision_signal) );
  DFFNEGX1 \shield_fsm/playerbullet_shield_collision_reg  ( .D(
        \shield_fsm/n85 ), .CLK(n85), .Q(playerbullet_shield_collision_signal)
         );
  DFFNEGX1 \shield_fsm/shield_display_reg  ( .D(\shield_fsm/n84 ), .CLK(n85), 
        .Q(shield_display) );
  DFFNEGX1 \shield_fsm/state_reg[0]  ( .D(\shield_fsm/N97 ), .CLK(n84), .Q(
        \shield_fsm/state[0] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[1]  ( .D(\shield_fsm/N56 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [1]) );
  DFFNEGX1 \shield_fsm/state_reg[1]  ( .D(\shield_fsm/N98 ), .CLK(n84), .Q(
        \shield_fsm/state[1] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[0]  ( .D(\shield_fsm/N55 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [0]) );
  DFFNEGX1 \shield_fsm/hp_reg[1]  ( .D(\shield_fsm/n87 ), .CLK(n84), .Q(
        shield_hp[1]) );
  DFFNEGX1 \shield_fsm/hp_reg[0]  ( .D(\shield_fsm/n88 ), .CLK(n84), .Q(
        shield_hp[0]) );
  NAND3X1 \invader_fsm_1/U105  ( .A(\invader_fsm_1/N43 ), .B(
        \invader_fsm_1/N35 ), .C(\invader_fsm_1/n100 ), .Y(\invader_fsm_1/n96 ) );
  NAND3X1 \invader_fsm_1/U104  ( .A(n71), .B(n265), .C(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n70 ) );
  NOR2X1 \invader_fsm_1/U103  ( .A(\invader_fsm_1/state[1] ), .B(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n99 ) );
  NAND3X1 \invader_fsm_1/U102  ( .A(play), .B(n72), .C(\invader_fsm_1/n99 ), 
        .Y(\invader_fsm_1/n98 ) );
  OAI21X1 \invader_fsm_1/U101  ( .A(n228), .B(\invader_fsm_1/n70 ), .C(
        \invader_fsm_1/n98 ), .Y(\invader_fsm_1/N55 ) );
  NAND3X1 \invader_fsm_1/U100  ( .A(n71), .B(n268), .C(
        \invader_fsm_1/state[1] ), .Y(\invader_fsm_1/n97 ) );
  OAI21X1 \invader_fsm_1/U99  ( .A(\invader_fsm_1/n70 ), .B(
        \invader_fsm_1/n96 ), .C(\invader_fsm_1/n97 ), .Y(\invader_fsm_1/N56 )
         );
  NOR2X1 \invader_fsm_1/U98  ( .A(n269), .B(\invader_fsm_1/next_state [1]), 
        .Y(\invader_fsm_1/n68 ) );
  OR2X1 \invader_fsm_1/U97  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        internal_reset), .Y(\invader_fsm_1/n94 ) );
  OAI21X1 \invader_fsm_1/U96  ( .A(\invader_fsm_1/next_state [1]), .B(
        \invader_fsm_1/next_state [0]), .C(n72), .Y(\invader_fsm_1/n73 ) );
  NAND3X1 \invader_fsm_1/U95  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        n267), .C(n138), .Y(\invader_fsm_1/n95 ) );
  OAI21X1 \invader_fsm_1/U94  ( .A(n267), .B(\invader_fsm_1/n94 ), .C(
        \invader_fsm_1/n95 ), .Y(\invader_fsm_1/n116 ) );
  AOI22X1 \invader_fsm_1/U93  ( .A(\invader_fsm_1/N13 ), .B(invader_direction), 
        .C(n264), .D(n152), .Y(\invader_fsm_1/n93 ) );
  OAI21X1 \invader_fsm_1/U92  ( .A(\invader_fsm_1/n93 ), .B(n267), .C(n138), 
        .Y(\invader_fsm_1/n91 ) );
  NAND2X1 \invader_fsm_1/U91  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        n153), .Y(\invader_fsm_1/n92 ) );
  NAND2X1 \invader_fsm_1/U90  ( .A(\invader_fsm_1/next_state [1]), .B(n269), 
        .Y(\invader_fsm_1/n69 ) );
  NOR2X1 \invader_fsm_1/U89  ( .A(\invader_fsm_1/n73 ), .B(n266), .Y(
        \invader_fsm_1/n63 ) );
  OAI21X1 \invader_fsm_1/U88  ( .A(n267), .B(\invader_fsm_1/n92 ), .C(
        \invader_fsm_1/n63 ), .Y(\invader_fsm_1/n86 ) );
  AOI22X1 \invader_fsm_1/U87  ( .A(\invader_fsm_1/n91 ), .B(
        \invader_fsm_1/n86 ), .C(invader_1_coord_x[1]), .D(n139), .Y(
        \invader_fsm_1/n90 ) );
  AOI22X1 \invader_fsm_1/U86  ( .A(n58), .B(invader_direction), .C(n58), .D(
        n152), .Y(\invader_fsm_1/n89 ) );
  OAI21X1 \invader_fsm_1/U85  ( .A(\invader_fsm_1/n89 ), .B(n267), .C(
        \invader_fsm_1/n69 ), .Y(\invader_fsm_1/n88 ) );
  NAND3X1 \invader_fsm_1/U84  ( .A(\invader_fsm_1/n86 ), .B(n72), .C(
        \invader_fsm_1/n88 ), .Y(\invader_fsm_1/n87 ) );
  OAI21X1 \invader_fsm_1/U83  ( .A(\invader_fsm_1/n86 ), .B(n58), .C(
        \invader_fsm_1/n87 ), .Y(\invader_fsm_1/n115 ) );
  NAND2X1 \invader_fsm_1/U82  ( .A(\invader_fsm_1/next_state [0]), .B(n71), 
        .Y(\invader_fsm_1/n76 ) );
  AOI22X1 \invader_fsm_1/U81  ( .A(\invader_fsm_1/N14 ), .B(invader_direction), 
        .C(\invader_fsm_1/N22 ), .D(n152), .Y(\invader_fsm_1/n83 ) );
  NOR2X1 \invader_fsm_1/U80  ( .A(move_down), .B(\invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n85 ) );
  NAND2X1 \invader_fsm_1/U79  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        \invader_fsm_1/n85 ), .Y(\invader_fsm_1/n81 ) );
  NAND2X1 \invader_fsm_1/U78  ( .A(invader_1_coord_x[2]), .B(
        \invader_fsm_1/n81 ), .Y(\invader_fsm_1/n84 ) );
  OAI21X1 \invader_fsm_1/U77  ( .A(\invader_fsm_1/n83 ), .B(
        \invader_fsm_1/n81 ), .C(\invader_fsm_1/n84 ), .Y(\invader_fsm_1/n82 )
         );
  OR2X1 \invader_fsm_1/U76  ( .A(\invader_fsm_1/n76 ), .B(\invader_fsm_1/n82 ), 
        .Y(\invader_fsm_1/n114 ) );
  NOR2X1 \invader_fsm_1/U75  ( .A(\invader_fsm_1/n81 ), .B(\invader_fsm_1/n76 ), .Y(\invader_fsm_1/n80 ) );
  NAND2X1 \invader_fsm_1/U74  ( .A(invader_direction), .B(\invader_fsm_1/n80 ), 
        .Y(\invader_fsm_1/n53 ) );
  NOR2X1 \invader_fsm_1/U73  ( .A(\invader_fsm_1/n76 ), .B(n155), .Y(
        \invader_fsm_1/n55 ) );
  AOI22X1 \invader_fsm_1/U72  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/n55 ), .C(n257), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n79 ) );
  OAI21X1 \invader_fsm_1/U71  ( .A(\invader_fsm_1/n53 ), .B(n261), .C(
        \invader_fsm_1/n79 ), .Y(\invader_fsm_1/n113 ) );
  AOI22X1 \invader_fsm_1/U70  ( .A(invader_1_coord_x[4]), .B(
        \invader_fsm_1/n55 ), .C(\invader_fsm_1/N24 ), .D(\invader_fsm_1/n56 ), 
        .Y(\invader_fsm_1/n78 ) );
  OAI21X1 \invader_fsm_1/U69  ( .A(\invader_fsm_1/n53 ), .B(n253), .C(
        \invader_fsm_1/n78 ), .Y(\invader_fsm_1/n112 ) );
  AOI22X1 \invader_fsm_1/U68  ( .A(invader_1_coord_x[5]), .B(
        \invader_fsm_1/n55 ), .C(n248), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n77 ) );
  OAI21X1 \invader_fsm_1/U67  ( .A(\invader_fsm_1/n53 ), .B(n250), .C(
        \invader_fsm_1/n77 ), .Y(\invader_fsm_1/n111 ) );
  NAND2X1 \invader_fsm_1/U66  ( .A(\invader_fsm_1/n63 ), .B(n267), .Y(
        \invader_fsm_1/n74 ) );
  OAI22X1 \invader_fsm_1/U65  ( .A(n268), .B(\invader_fsm_1/n74 ), .C(n140), 
        .D(\invader_fsm_1/n76 ), .Y(\invader_fsm_1/n110 ) );
  NAND3X1 \invader_fsm_1/U64  ( .A(\invader_fsm_1/n74 ), .B(n72), .C(
        \invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n75 ) );
  OAI21X1 \invader_fsm_1/U63  ( .A(\invader_fsm_1/n74 ), .B(n265), .C(
        \invader_fsm_1/n75 ), .Y(\invader_fsm_1/n109 ) );
  AOI21X1 \invader_fsm_1/U62  ( .A(\invader_fsm_1/n63 ), .B(invader_1_display), 
        .C(\invader_fsm_1/n73 ), .Y(\invader_fsm_1/n72 ) );
  NAND2X1 \invader_fsm_1/U61  ( .A(playerbullet_invader_collision_signal_1), 
        .B(\invader_fsm_1/n63 ), .Y(\invader_fsm_1/n71 ) );
  OAI21X1 \invader_fsm_1/U60  ( .A(\invader_fsm_1/n69 ), .B(
        \invader_fsm_1/n70 ), .C(\invader_fsm_1/n71 ), .Y(\invader_fsm_1/n108 ) );
  AOI21X1 \invader_fsm_1/U59  ( .A(\invader_fsm_1/N70 ), .B(
        \invader_fsm_1/n68 ), .C(n266), .Y(\invader_fsm_1/n65 ) );
  OAI21X1 \invader_fsm_1/U58  ( .A(n267), .B(n153), .C(\invader_fsm_1/n63 ), 
        .Y(\invader_fsm_1/n57 ) );
  NAND2X1 \invader_fsm_1/U57  ( .A(\invader_fsm_1/n57 ), .B(n71), .Y(
        \invader_fsm_1/n66 ) );
  NAND2X1 \invader_fsm_1/U56  ( .A(\invader_fsm_1/N70 ), .B(n142), .Y(
        \invader_fsm_1/n67 ) );
  OAI21X1 \invader_fsm_1/U55  ( .A(\invader_fsm_1/n65 ), .B(
        \invader_fsm_1/n66 ), .C(\invader_fsm_1/n67 ), .Y(\invader_fsm_1/n107 ) );
  NOR2X1 \invader_fsm_1/U54  ( .A(n267), .B(n142), .Y(\invader_fsm_1/n59 ) );
  AOI22X1 \invader_fsm_1/U53  ( .A(n242), .B(\invader_fsm_1/n59 ), .C(
        invader_1_coord_y[1]), .D(n142), .Y(\invader_fsm_1/n64 ) );
  NAND2X1 \invader_fsm_1/U52  ( .A(\invader_fsm_1/n64 ), .B(n138), .Y(
        \invader_fsm_1/n106 ) );
  AOI22X1 \invader_fsm_1/U51  ( .A(\invader_fsm_1/N72 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[2]), .D(n142), .Y(
        \invader_fsm_1/n62 ) );
  NAND2X1 \invader_fsm_1/U50  ( .A(\invader_fsm_1/n62 ), .B(
        \invader_fsm_1/n63 ), .Y(\invader_fsm_1/n105 ) );
  AOI22X1 \invader_fsm_1/U49  ( .A(\invader_fsm_1/N73 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[3]), .D(n142), .Y(
        \invader_fsm_1/n61 ) );
  NAND2X1 \invader_fsm_1/U48  ( .A(\invader_fsm_1/n61 ), .B(n138), .Y(
        \invader_fsm_1/n104 ) );
  AOI22X1 \invader_fsm_1/U47  ( .A(\invader_fsm_1/N74 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[4]), .D(n142), .Y(
        \invader_fsm_1/n60 ) );
  NAND2X1 \invader_fsm_1/U46  ( .A(\invader_fsm_1/n60 ), .B(n138), .Y(
        \invader_fsm_1/n103 ) );
  NAND3X1 \invader_fsm_1/U45  ( .A(\invader_fsm_1/n59 ), .B(n72), .C(
        \invader_fsm_1/N75 ), .Y(\invader_fsm_1/n58 ) );
  OAI21X1 \invader_fsm_1/U44  ( .A(\invader_fsm_1/n57 ), .B(n231), .C(
        \invader_fsm_1/n58 ), .Y(\invader_fsm_1/n102 ) );
  AOI22X1 \invader_fsm_1/U43  ( .A(invader_outofbounds_signal_1), .B(
        \invader_fsm_1/n55 ), .C(n247), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n54 ) );
  OAI21X1 \invader_fsm_1/U42  ( .A(\invader_fsm_1/n53 ), .B(n594), .C(
        \invader_fsm_1/n54 ), .Y(\invader_fsm_1/n101 ) );
  AND2X2 \invader_fsm_1/U4  ( .A(\invader_fsm_1/N27 ), .B(\invader_fsm_1/N19 ), 
        .Y(\invader_fsm_1/n100 ) );
  AND2X2 \invader_fsm_1/U3  ( .A(\invader_fsm_1/n80 ), .B(n152), .Y(
        \invader_fsm_1/n56 ) );
  DFFNEGX1 \invader_fsm_1/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_1/n101 ), .CLK(n84), .Q(invader_outofbounds_signal_1) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[5]  ( .D(\invader_fsm_1/n102 ), 
        .CLK(n84), .Q(invader_1_coord_y[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[4]  ( .D(\invader_fsm_1/n103 ), 
        .CLK(n84), .Q(invader_1_coord_y[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[3]  ( .D(\invader_fsm_1/n104 ), 
        .CLK(n84), .Q(invader_1_coord_y[3]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[2]  ( .D(\invader_fsm_1/n105 ), 
        .CLK(n84), .Q(invader_1_coord_y[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[1]  ( .D(\invader_fsm_1/n106 ), 
        .CLK(n84), .Q(invader_1_coord_y[1]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[0]  ( .D(\invader_fsm_1/n107 ), 
        .CLK(n84), .Q(\invader_fsm_1/N70 ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[5]  ( .D(\invader_fsm_1/n111 ), 
        .CLK(n84), .Q(invader_1_coord_x[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[4]  ( .D(\invader_fsm_1/n112 ), 
        .CLK(n84), .Q(invader_1_coord_x[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[2]  ( .D(\invader_fsm_1/n114 ), 
        .CLK(n83), .Q(invader_1_coord_x[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[0]  ( .D(\invader_fsm_1/n115 ), 
        .CLK(n83), .Q(\invader_fsm_1/N84 ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[1]  ( .D(n137), .CLK(n83), .Q(
        invader_1_coord_x[1]) );
  DFFNEGX1 \invader_fsm_1/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_1/n108 ), .CLK(n83), .Q(
        playerbullet_invader_collision_signal_1) );
  DFFNEGX1 \invader_fsm_1/state_reg[1]  ( .D(\invader_fsm_1/n109 ), .CLK(n83), 
        .Q(\invader_fsm_1/state[1] ) );
  DFFNEGX1 \invader_fsm_1/display_reg  ( .D(n141), .CLK(n83), .Q(
        invader_1_display) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[1]  ( .D(\invader_fsm_1/N56 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [1]) );
  DFFNEGX1 \invader_fsm_1/state_reg[0]  ( .D(\invader_fsm_1/n110 ), .CLK(n83), 
        .Q(\invader_fsm_1/state[0] ) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[0]  ( .D(\invader_fsm_1/N55 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [0]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[3]  ( .D(\invader_fsm_1/n113 ), 
        .CLK(n83), .Q(invader_1_coord_x[3]) );
  DFFNEGX1 \invader_fsm_1/move_interval_toggle_reg  ( .D(\invader_fsm_1/n116 ), 
        .CLK(n83), .Q(\invader_fsm_1/move_interval_toggle ) );
  NAND3X1 \invader_fsm_2/U105  ( .A(\invader_fsm_2/N43 ), .B(
        \invader_fsm_2/N35 ), .C(\invader_fsm_2/n100 ), .Y(\invader_fsm_2/n96 ) );
  NAND3X1 \invader_fsm_2/U104  ( .A(n71), .B(n289), .C(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n70 ) );
  NOR2X1 \invader_fsm_2/U103  ( .A(\invader_fsm_2/state[1] ), .B(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n99 ) );
  NAND3X1 \invader_fsm_2/U102  ( .A(play), .B(n72), .C(\invader_fsm_2/n99 ), 
        .Y(\invader_fsm_2/n98 ) );
  OAI21X1 \invader_fsm_2/U101  ( .A(n270), .B(\invader_fsm_2/n70 ), .C(
        \invader_fsm_2/n98 ), .Y(\invader_fsm_2/N55 ) );
  NAND3X1 \invader_fsm_2/U100  ( .A(n71), .B(n311), .C(
        \invader_fsm_2/state[1] ), .Y(\invader_fsm_2/n97 ) );
  OAI21X1 \invader_fsm_2/U99  ( .A(\invader_fsm_2/n70 ), .B(
        \invader_fsm_2/n96 ), .C(\invader_fsm_2/n97 ), .Y(\invader_fsm_2/N56 )
         );
  NOR2X1 \invader_fsm_2/U98  ( .A(n312), .B(\invader_fsm_2/next_state [1]), 
        .Y(\invader_fsm_2/n68 ) );
  OR2X1 \invader_fsm_2/U97  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        internal_reset), .Y(\invader_fsm_2/n94 ) );
  OAI21X1 \invader_fsm_2/U96  ( .A(\invader_fsm_2/next_state [1]), .B(
        \invader_fsm_2/next_state [0]), .C(n71), .Y(\invader_fsm_2/n73 ) );
  NAND3X1 \invader_fsm_2/U95  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        n310), .C(n132), .Y(\invader_fsm_2/n95 ) );
  OAI21X1 \invader_fsm_2/U94  ( .A(n310), .B(\invader_fsm_2/n94 ), .C(
        \invader_fsm_2/n95 ), .Y(\invader_fsm_2/n116 ) );
  NOR2X1 \invader_fsm_2/U93  ( .A(move_down), .B(\invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n93 ) );
  NAND2X1 \invader_fsm_2/U92  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        \invader_fsm_2/n93 ), .Y(\invader_fsm_2/n85 ) );
  NAND2X1 \invader_fsm_2/U91  ( .A(\invader_fsm_2/next_state [0]), .B(n72), 
        .Y(\invader_fsm_2/n76 ) );
  NOR2X1 \invader_fsm_2/U90  ( .A(\invader_fsm_2/n85 ), .B(\invader_fsm_2/n76 ), .Y(\invader_fsm_2/n92 ) );
  NAND2X1 \invader_fsm_2/U89  ( .A(invader_direction), .B(\invader_fsm_2/n92 ), 
        .Y(\invader_fsm_2/n53 ) );
  NOR2X1 \invader_fsm_2/U88  ( .A(\invader_fsm_2/n76 ), .B(n154), .Y(
        \invader_fsm_2/n55 ) );
  AOI22X1 \invader_fsm_2/U87  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/n55 ), .C(n307), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n91 ) );
  OAI21X1 \invader_fsm_2/U86  ( .A(\invader_fsm_2/n53 ), .B(n305), .C(
        \invader_fsm_2/n91 ), .Y(\invader_fsm_2/n115 ) );
  NAND2X1 \invader_fsm_2/U85  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        n153), .Y(\invader_fsm_2/n90 ) );
  NAND2X1 \invader_fsm_2/U84  ( .A(\invader_fsm_2/next_state [1]), .B(n312), 
        .Y(\invader_fsm_2/n69 ) );
  NOR2X1 \invader_fsm_2/U83  ( .A(\invader_fsm_2/n73 ), .B(n309), .Y(
        \invader_fsm_2/n63 ) );
  OAI21X1 \invader_fsm_2/U82  ( .A(n310), .B(\invader_fsm_2/n90 ), .C(
        \invader_fsm_2/n63 ), .Y(\invader_fsm_2/n81 ) );
  AOI22X1 \invader_fsm_2/U81  ( .A(n308), .B(invader_direction), .C(n308), .D(
        n152), .Y(\invader_fsm_2/n89 ) );
  OAI21X1 \invader_fsm_2/U80  ( .A(\invader_fsm_2/n89 ), .B(n310), .C(
        \invader_fsm_2/n69 ), .Y(\invader_fsm_2/n88 ) );
  NAND3X1 \invader_fsm_2/U79  ( .A(\invader_fsm_2/n81 ), .B(n72), .C(
        \invader_fsm_2/n88 ), .Y(\invader_fsm_2/n87 ) );
  OAI21X1 \invader_fsm_2/U78  ( .A(\invader_fsm_2/n81 ), .B(n308), .C(
        \invader_fsm_2/n87 ), .Y(\invader_fsm_2/n114 ) );
  AOI22X1 \invader_fsm_2/U77  ( .A(\invader_fsm_2/N14 ), .B(invader_direction), 
        .C(\invader_fsm_2/N22 ), .D(n152), .Y(\invader_fsm_2/n84 ) );
  NAND2X1 \invader_fsm_2/U76  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/n85 ), .Y(\invader_fsm_2/n86 ) );
  OAI21X1 \invader_fsm_2/U75  ( .A(\invader_fsm_2/n84 ), .B(
        \invader_fsm_2/n85 ), .C(\invader_fsm_2/n86 ), .Y(\invader_fsm_2/n83 )
         );
  OR2X1 \invader_fsm_2/U74  ( .A(\invader_fsm_2/n76 ), .B(\invader_fsm_2/n83 ), 
        .Y(\invader_fsm_2/n113 ) );
  AOI22X1 \invader_fsm_2/U73  ( .A(\invader_fsm_2/N15 ), .B(invader_direction), 
        .C(n300), .D(n152), .Y(\invader_fsm_2/n82 ) );
  OAI21X1 \invader_fsm_2/U72  ( .A(\invader_fsm_2/n82 ), .B(n310), .C(n132), 
        .Y(\invader_fsm_2/n80 ) );
  AOI22X1 \invader_fsm_2/U71  ( .A(\invader_fsm_2/n80 ), .B(
        \invader_fsm_2/n81 ), .C(invader_2_coord_x[3]), .D(n133), .Y(
        \invader_fsm_2/n79 ) );
  AOI22X1 \invader_fsm_2/U70  ( .A(invader_2_coord_x[4]), .B(
        \invader_fsm_2/n55 ), .C(\invader_fsm_2/N24 ), .D(\invader_fsm_2/n56 ), 
        .Y(\invader_fsm_2/n78 ) );
  OAI21X1 \invader_fsm_2/U69  ( .A(\invader_fsm_2/n53 ), .B(n296), .C(
        \invader_fsm_2/n78 ), .Y(\invader_fsm_2/n112 ) );
  AOI22X1 \invader_fsm_2/U68  ( .A(invader_2_coord_x[5]), .B(
        \invader_fsm_2/n55 ), .C(n291), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n77 ) );
  OAI21X1 \invader_fsm_2/U67  ( .A(\invader_fsm_2/n53 ), .B(n293), .C(
        \invader_fsm_2/n77 ), .Y(\invader_fsm_2/n111 ) );
  NAND2X1 \invader_fsm_2/U66  ( .A(\invader_fsm_2/n63 ), .B(n310), .Y(
        \invader_fsm_2/n74 ) );
  OAI22X1 \invader_fsm_2/U65  ( .A(n311), .B(\invader_fsm_2/n74 ), .C(n134), 
        .D(\invader_fsm_2/n76 ), .Y(\invader_fsm_2/n110 ) );
  NAND3X1 \invader_fsm_2/U64  ( .A(\invader_fsm_2/n74 ), .B(n72), .C(
        \invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n75 ) );
  OAI21X1 \invader_fsm_2/U63  ( .A(\invader_fsm_2/n74 ), .B(n289), .C(
        \invader_fsm_2/n75 ), .Y(\invader_fsm_2/n109 ) );
  AOI21X1 \invader_fsm_2/U62  ( .A(\invader_fsm_2/n63 ), .B(invader_2_display), 
        .C(\invader_fsm_2/n73 ), .Y(\invader_fsm_2/n72 ) );
  NAND2X1 \invader_fsm_2/U61  ( .A(playerbullet_invader_collision_signal_2), 
        .B(\invader_fsm_2/n63 ), .Y(\invader_fsm_2/n71 ) );
  OAI21X1 \invader_fsm_2/U60  ( .A(\invader_fsm_2/n69 ), .B(
        \invader_fsm_2/n70 ), .C(\invader_fsm_2/n71 ), .Y(\invader_fsm_2/n108 ) );
  AOI21X1 \invader_fsm_2/U59  ( .A(\invader_fsm_2/N70 ), .B(
        \invader_fsm_2/n68 ), .C(n309), .Y(\invader_fsm_2/n65 ) );
  OAI21X1 \invader_fsm_2/U58  ( .A(n310), .B(n153), .C(\invader_fsm_2/n63 ), 
        .Y(\invader_fsm_2/n57 ) );
  NAND2X1 \invader_fsm_2/U57  ( .A(\invader_fsm_2/n57 ), .B(n72), .Y(
        \invader_fsm_2/n66 ) );
  NAND2X1 \invader_fsm_2/U56  ( .A(\invader_fsm_2/N70 ), .B(n136), .Y(
        \invader_fsm_2/n67 ) );
  OAI21X1 \invader_fsm_2/U55  ( .A(\invader_fsm_2/n65 ), .B(
        \invader_fsm_2/n66 ), .C(\invader_fsm_2/n67 ), .Y(\invader_fsm_2/n107 ) );
  NOR2X1 \invader_fsm_2/U54  ( .A(n310), .B(n136), .Y(\invader_fsm_2/n59 ) );
  AOI22X1 \invader_fsm_2/U53  ( .A(n284), .B(\invader_fsm_2/n59 ), .C(
        invader_2_coord_y[1]), .D(n136), .Y(\invader_fsm_2/n64 ) );
  NAND2X1 \invader_fsm_2/U52  ( .A(\invader_fsm_2/n64 ), .B(n132), .Y(
        \invader_fsm_2/n106 ) );
  AOI22X1 \invader_fsm_2/U51  ( .A(\invader_fsm_2/N72 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[2]), .D(n136), .Y(
        \invader_fsm_2/n62 ) );
  NAND2X1 \invader_fsm_2/U50  ( .A(\invader_fsm_2/n62 ), .B(
        \invader_fsm_2/n63 ), .Y(\invader_fsm_2/n105 ) );
  AOI22X1 \invader_fsm_2/U49  ( .A(\invader_fsm_2/N73 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[3]), .D(n136), .Y(
        \invader_fsm_2/n61 ) );
  NAND2X1 \invader_fsm_2/U48  ( .A(\invader_fsm_2/n61 ), .B(n132), .Y(
        \invader_fsm_2/n104 ) );
  AOI22X1 \invader_fsm_2/U47  ( .A(\invader_fsm_2/N74 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[4]), .D(n136), .Y(
        \invader_fsm_2/n60 ) );
  NAND2X1 \invader_fsm_2/U46  ( .A(\invader_fsm_2/n60 ), .B(n132), .Y(
        \invader_fsm_2/n103 ) );
  NAND3X1 \invader_fsm_2/U45  ( .A(\invader_fsm_2/n59 ), .B(n72), .C(
        \invader_fsm_2/N75 ), .Y(\invader_fsm_2/n58 ) );
  OAI21X1 \invader_fsm_2/U44  ( .A(\invader_fsm_2/n57 ), .B(n273), .C(
        \invader_fsm_2/n58 ), .Y(\invader_fsm_2/n102 ) );
  AOI22X1 \invader_fsm_2/U43  ( .A(invader_outofbounds_signal_2), .B(
        \invader_fsm_2/n55 ), .C(n290), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n54 ) );
  OAI21X1 \invader_fsm_2/U42  ( .A(\invader_fsm_2/n53 ), .B(n668), .C(
        \invader_fsm_2/n54 ), .Y(\invader_fsm_2/n101 ) );
  AND2X2 \invader_fsm_2/U4  ( .A(\invader_fsm_2/N27 ), .B(\invader_fsm_2/N19 ), 
        .Y(\invader_fsm_2/n100 ) );
  AND2X2 \invader_fsm_2/U3  ( .A(\invader_fsm_2/n92 ), .B(n152), .Y(
        \invader_fsm_2/n56 ) );
  DFFNEGX1 \invader_fsm_2/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_2/n101 ), .CLK(n83), .Q(invader_outofbounds_signal_2) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[5]  ( .D(\invader_fsm_2/n102 ), 
        .CLK(n83), .Q(invader_2_coord_y[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[4]  ( .D(\invader_fsm_2/n103 ), 
        .CLK(n83), .Q(invader_2_coord_y[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[3]  ( .D(\invader_fsm_2/n104 ), 
        .CLK(n83), .Q(invader_2_coord_y[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[2]  ( .D(\invader_fsm_2/n105 ), 
        .CLK(n82), .Q(invader_2_coord_y[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[1]  ( .D(\invader_fsm_2/n106 ), 
        .CLK(n82), .Q(invader_2_coord_y[1]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[0]  ( .D(\invader_fsm_2/n107 ), 
        .CLK(n82), .Q(\invader_fsm_2/N70 ) );
  DFFNEGX1 \invader_fsm_2/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_2/n108 ), .CLK(n82), .Q(
        playerbullet_invader_collision_signal_2) );
  DFFNEGX1 \invader_fsm_2/state_reg[1]  ( .D(\invader_fsm_2/n109 ), .CLK(n82), 
        .Q(\invader_fsm_2/state[1] ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[5]  ( .D(\invader_fsm_2/n111 ), 
        .CLK(n82), .Q(invader_2_coord_x[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[4]  ( .D(\invader_fsm_2/n112 ), 
        .CLK(n82), .Q(invader_2_coord_x[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[2]  ( .D(\invader_fsm_2/n113 ), 
        .CLK(n82), .Q(invader_2_coord_x[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[0]  ( .D(\invader_fsm_2/n114 ), 
        .CLK(n82), .Q(\invader_fsm_2/N84 ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[1]  ( .D(\invader_fsm_2/n115 ), 
        .CLK(n82), .Q(invader_2_coord_x[1]) );
  DFFNEGX1 \invader_fsm_2/display_reg  ( .D(n135), .CLK(n82), .Q(
        invader_2_display) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[1]  ( .D(\invader_fsm_2/N56 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [1]) );
  DFFNEGX1 \invader_fsm_2/state_reg[0]  ( .D(\invader_fsm_2/n110 ), .CLK(n82), 
        .Q(\invader_fsm_2/state[0] ) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[0]  ( .D(\invader_fsm_2/N55 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [0]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[3]  ( .D(n131), .CLK(n82), .Q(
        invader_2_coord_x[3]) );
  DFFNEGX1 \invader_fsm_2/move_interval_toggle_reg  ( .D(\invader_fsm_2/n116 ), 
        .CLK(n81), .Q(\invader_fsm_2/move_interval_toggle ) );
  NAND3X1 \invader_fsm_3/U106  ( .A(\invader_fsm_3/N43 ), .B(
        \invader_fsm_3/N35 ), .C(\invader_fsm_3/n102 ), .Y(\invader_fsm_3/n98 ) );
  NAND3X1 \invader_fsm_3/U105  ( .A(n71), .B(n349), .C(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n71 ) );
  NOR2X1 \invader_fsm_3/U104  ( .A(\invader_fsm_3/state[1] ), .B(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n101 ) );
  NAND3X1 \invader_fsm_3/U103  ( .A(play), .B(n71), .C(\invader_fsm_3/n101 ), 
        .Y(\invader_fsm_3/n100 ) );
  OAI21X1 \invader_fsm_3/U102  ( .A(n313), .B(\invader_fsm_3/n71 ), .C(
        \invader_fsm_3/n100 ), .Y(\invader_fsm_3/N55 ) );
  NAND3X1 \invader_fsm_3/U101  ( .A(n71), .B(n352), .C(
        \invader_fsm_3/state[1] ), .Y(\invader_fsm_3/n99 ) );
  OAI21X1 \invader_fsm_3/U100  ( .A(\invader_fsm_3/n71 ), .B(
        \invader_fsm_3/n98 ), .C(\invader_fsm_3/n99 ), .Y(\invader_fsm_3/N56 )
         );
  NOR2X1 \invader_fsm_3/U99  ( .A(n353), .B(\invader_fsm_3/next_state [1]), 
        .Y(\invader_fsm_3/n69 ) );
  OR2X1 \invader_fsm_3/U98  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        internal_reset), .Y(\invader_fsm_3/n96 ) );
  OAI21X1 \invader_fsm_3/U97  ( .A(\invader_fsm_3/next_state [1]), .B(
        \invader_fsm_3/next_state [0]), .C(n71), .Y(\invader_fsm_3/n74 ) );
  NAND3X1 \invader_fsm_3/U96  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        n351), .C(n125), .Y(\invader_fsm_3/n97 ) );
  OAI21X1 \invader_fsm_3/U95  ( .A(n351), .B(\invader_fsm_3/n96 ), .C(
        \invader_fsm_3/n97 ), .Y(\invader_fsm_3/n117 ) );
  AOI22X1 \invader_fsm_3/U94  ( .A(\invader_fsm_3/N13 ), .B(invader_direction), 
        .C(n346), .D(n152), .Y(\invader_fsm_3/n95 ) );
  OAI21X1 \invader_fsm_3/U93  ( .A(\invader_fsm_3/n95 ), .B(n351), .C(n125), 
        .Y(\invader_fsm_3/n93 ) );
  NAND2X1 \invader_fsm_3/U92  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        n153), .Y(\invader_fsm_3/n94 ) );
  NAND2X1 \invader_fsm_3/U91  ( .A(\invader_fsm_3/next_state [1]), .B(n353), 
        .Y(\invader_fsm_3/n70 ) );
  NOR2X1 \invader_fsm_3/U90  ( .A(\invader_fsm_3/n74 ), .B(n350), .Y(
        \invader_fsm_3/n64 ) );
  OAI21X1 \invader_fsm_3/U89  ( .A(n351), .B(\invader_fsm_3/n94 ), .C(
        \invader_fsm_3/n64 ), .Y(\invader_fsm_3/n81 ) );
  AOI22X1 \invader_fsm_3/U88  ( .A(\invader_fsm_3/n93 ), .B(
        \invader_fsm_3/n81 ), .C(invader_3_coord_x[1]), .D(n126), .Y(
        \invader_fsm_3/n92 ) );
  AOI22X1 \invader_fsm_3/U87  ( .A(n50), .B(invader_direction), .C(n50), .D(
        n152), .Y(\invader_fsm_3/n91 ) );
  OAI21X1 \invader_fsm_3/U86  ( .A(\invader_fsm_3/n91 ), .B(n351), .C(
        \invader_fsm_3/n70 ), .Y(\invader_fsm_3/n90 ) );
  NAND3X1 \invader_fsm_3/U85  ( .A(\invader_fsm_3/n81 ), .B(n72), .C(
        \invader_fsm_3/n90 ), .Y(\invader_fsm_3/n89 ) );
  OAI21X1 \invader_fsm_3/U84  ( .A(\invader_fsm_3/n81 ), .B(n50), .C(
        \invader_fsm_3/n89 ), .Y(\invader_fsm_3/n116 ) );
  AOI22X1 \invader_fsm_3/U83  ( .A(\invader_fsm_3/N14 ), .B(invader_direction), 
        .C(\invader_fsm_3/N22 ), .D(n152), .Y(\invader_fsm_3/n88 ) );
  OAI21X1 \invader_fsm_3/U82  ( .A(\invader_fsm_3/n88 ), .B(n351), .C(
        \invader_fsm_3/n70 ), .Y(\invader_fsm_3/n87 ) );
  NAND3X1 \invader_fsm_3/U81  ( .A(\invader_fsm_3/n81 ), .B(n72), .C(
        \invader_fsm_3/n87 ), .Y(\invader_fsm_3/n86 ) );
  OAI21X1 \invader_fsm_3/U80  ( .A(\invader_fsm_3/n81 ), .B(n344), .C(
        \invader_fsm_3/n86 ), .Y(\invader_fsm_3/n115 ) );
  NOR2X1 \invader_fsm_3/U79  ( .A(move_down), .B(\invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n85 ) );
  NAND2X1 \invader_fsm_3/U78  ( .A(\invader_fsm_3/next_state [0]), .B(n71), 
        .Y(\invader_fsm_3/n77 ) );
  NAND3X1 \invader_fsm_3/U77  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        \invader_fsm_3/n85 ), .C(n130), .Y(\invader_fsm_3/n84 ) );
  OR2X1 \invader_fsm_3/U76  ( .A(n152), .B(\invader_fsm_3/n84 ), .Y(
        \invader_fsm_3/n54 ) );
  AOI21X1 \invader_fsm_3/U75  ( .A(\invader_fsm_3/n85 ), .B(
        \invader_fsm_3/move_interval_toggle ), .C(\invader_fsm_3/n77 ), .Y(
        \invader_fsm_3/n56 ) );
  NOR2X1 \invader_fsm_3/U74  ( .A(\invader_fsm_3/n84 ), .B(invader_direction), 
        .Y(\invader_fsm_3/n57 ) );
  AOI22X1 \invader_fsm_3/U73  ( .A(invader_3_coord_x[3]), .B(
        \invader_fsm_3/n56 ), .C(n339), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n83 ) );
  OAI21X1 \invader_fsm_3/U72  ( .A(\invader_fsm_3/n54 ), .B(n343), .C(
        \invader_fsm_3/n83 ), .Y(\invader_fsm_3/n114 ) );
  AOI22X1 \invader_fsm_3/U71  ( .A(\invader_fsm_3/N16 ), .B(invader_direction), 
        .C(\invader_fsm_3/N24 ), .D(n152), .Y(\invader_fsm_3/n82 ) );
  OAI21X1 \invader_fsm_3/U70  ( .A(\invader_fsm_3/n82 ), .B(n351), .C(n125), 
        .Y(\invader_fsm_3/n80 ) );
  AOI22X1 \invader_fsm_3/U69  ( .A(\invader_fsm_3/n80 ), .B(
        \invader_fsm_3/n81 ), .C(invader_3_coord_x[4]), .D(n126), .Y(
        \invader_fsm_3/n79 ) );
  AOI22X1 \invader_fsm_3/U68  ( .A(invader_3_coord_x[5]), .B(
        \invader_fsm_3/n56 ), .C(n333), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n78 ) );
  OAI21X1 \invader_fsm_3/U67  ( .A(\invader_fsm_3/n54 ), .B(n335), .C(
        \invader_fsm_3/n78 ), .Y(\invader_fsm_3/n113 ) );
  NAND2X1 \invader_fsm_3/U66  ( .A(\invader_fsm_3/n64 ), .B(n351), .Y(
        \invader_fsm_3/n75 ) );
  OAI22X1 \invader_fsm_3/U65  ( .A(n352), .B(\invader_fsm_3/n75 ), .C(n127), 
        .D(\invader_fsm_3/n77 ), .Y(\invader_fsm_3/n112 ) );
  NAND3X1 \invader_fsm_3/U64  ( .A(\invader_fsm_3/n75 ), .B(n72), .C(
        \invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n76 ) );
  OAI21X1 \invader_fsm_3/U63  ( .A(\invader_fsm_3/n75 ), .B(n349), .C(
        \invader_fsm_3/n76 ), .Y(\invader_fsm_3/n111 ) );
  AOI21X1 \invader_fsm_3/U62  ( .A(\invader_fsm_3/n64 ), .B(invader_3_display), 
        .C(\invader_fsm_3/n74 ), .Y(\invader_fsm_3/n73 ) );
  NAND2X1 \invader_fsm_3/U61  ( .A(playerbullet_invader_collision_signal_3), 
        .B(\invader_fsm_3/n64 ), .Y(\invader_fsm_3/n72 ) );
  OAI21X1 \invader_fsm_3/U60  ( .A(\invader_fsm_3/n70 ), .B(
        \invader_fsm_3/n71 ), .C(\invader_fsm_3/n72 ), .Y(\invader_fsm_3/n110 ) );
  AOI21X1 \invader_fsm_3/U59  ( .A(\invader_fsm_3/N70 ), .B(
        \invader_fsm_3/n69 ), .C(n350), .Y(\invader_fsm_3/n66 ) );
  OAI21X1 \invader_fsm_3/U58  ( .A(n351), .B(n153), .C(\invader_fsm_3/n64 ), 
        .Y(\invader_fsm_3/n58 ) );
  NAND2X1 \invader_fsm_3/U57  ( .A(\invader_fsm_3/n58 ), .B(n72), .Y(
        \invader_fsm_3/n67 ) );
  NAND2X1 \invader_fsm_3/U56  ( .A(\invader_fsm_3/N70 ), .B(n129), .Y(
        \invader_fsm_3/n68 ) );
  OAI21X1 \invader_fsm_3/U55  ( .A(\invader_fsm_3/n66 ), .B(
        \invader_fsm_3/n67 ), .C(\invader_fsm_3/n68 ), .Y(\invader_fsm_3/n109 ) );
  NOR2X1 \invader_fsm_3/U54  ( .A(n351), .B(n129), .Y(\invader_fsm_3/n60 ) );
  AOI22X1 \invader_fsm_3/U53  ( .A(n327), .B(\invader_fsm_3/n60 ), .C(
        invader_3_coord_y[1]), .D(n129), .Y(\invader_fsm_3/n65 ) );
  NAND2X1 \invader_fsm_3/U52  ( .A(\invader_fsm_3/n65 ), .B(n125), .Y(
        \invader_fsm_3/n108 ) );
  AOI22X1 \invader_fsm_3/U51  ( .A(\invader_fsm_3/N72 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[2]), .D(n129), .Y(
        \invader_fsm_3/n63 ) );
  NAND2X1 \invader_fsm_3/U50  ( .A(\invader_fsm_3/n63 ), .B(
        \invader_fsm_3/n64 ), .Y(\invader_fsm_3/n107 ) );
  AOI22X1 \invader_fsm_3/U49  ( .A(\invader_fsm_3/N73 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[3]), .D(n129), .Y(
        \invader_fsm_3/n62 ) );
  NAND2X1 \invader_fsm_3/U48  ( .A(\invader_fsm_3/n62 ), .B(n125), .Y(
        \invader_fsm_3/n106 ) );
  AOI22X1 \invader_fsm_3/U47  ( .A(\invader_fsm_3/N74 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[4]), .D(n129), .Y(
        \invader_fsm_3/n61 ) );
  NAND2X1 \invader_fsm_3/U46  ( .A(\invader_fsm_3/n61 ), .B(n125), .Y(
        \invader_fsm_3/n105 ) );
  NAND3X1 \invader_fsm_3/U45  ( .A(\invader_fsm_3/n60 ), .B(n72), .C(
        \invader_fsm_3/N75 ), .Y(\invader_fsm_3/n59 ) );
  OAI21X1 \invader_fsm_3/U44  ( .A(\invader_fsm_3/n58 ), .B(n316), .C(
        \invader_fsm_3/n59 ), .Y(\invader_fsm_3/n104 ) );
  AOI22X1 \invader_fsm_3/U43  ( .A(invader_outofbounds_signal_3), .B(
        \invader_fsm_3/n56 ), .C(n332), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n55 ) );
  OAI21X1 \invader_fsm_3/U42  ( .A(\invader_fsm_3/n54 ), .B(n742), .C(
        \invader_fsm_3/n55 ), .Y(\invader_fsm_3/n103 ) );
  AND2X2 \invader_fsm_3/U3  ( .A(\invader_fsm_3/N27 ), .B(\invader_fsm_3/N19 ), 
        .Y(\invader_fsm_3/n102 ) );
  DFFNEGX1 \invader_fsm_3/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_3/n103 ), .CLK(n81), .Q(invader_outofbounds_signal_3) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[5]  ( .D(\invader_fsm_3/n104 ), 
        .CLK(n81), .Q(invader_3_coord_y[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[4]  ( .D(\invader_fsm_3/n105 ), 
        .CLK(n81), .Q(invader_3_coord_y[4]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[3]  ( .D(\invader_fsm_3/n106 ), 
        .CLK(n81), .Q(invader_3_coord_y[3]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[2]  ( .D(\invader_fsm_3/n107 ), 
        .CLK(n81), .Q(invader_3_coord_y[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[1]  ( .D(\invader_fsm_3/n108 ), 
        .CLK(n81), .Q(invader_3_coord_y[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[0]  ( .D(\invader_fsm_3/n109 ), 
        .CLK(n81), .Q(\invader_fsm_3/N70 ) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[5]  ( .D(\invader_fsm_3/n113 ), 
        .CLK(n81), .Q(invader_3_coord_x[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[2]  ( .D(\invader_fsm_3/n115 ), 
        .CLK(n81), .Q(invader_3_coord_x[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[1]  ( .D(n123), .CLK(n81), .Q(
        invader_3_coord_x[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[0]  ( .D(\invader_fsm_3/n116 ), 
        .CLK(n81), .Q(\invader_fsm_3/N84 ) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[4]  ( .D(n124), .CLK(n81), .Q(
        invader_3_coord_x[4]) );
  DFFNEGX1 \invader_fsm_3/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_3/n110 ), .CLK(n80), .Q(
        playerbullet_invader_collision_signal_3) );
  DFFNEGX1 \invader_fsm_3/state_reg[1]  ( .D(\invader_fsm_3/n111 ), .CLK(n80), 
        .Q(\invader_fsm_3/state[1] ) );
  DFFNEGX1 \invader_fsm_3/display_reg  ( .D(n128), .CLK(n80), .Q(
        invader_3_display) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[1]  ( .D(\invader_fsm_3/N56 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [1]) );
  DFFNEGX1 \invader_fsm_3/state_reg[0]  ( .D(\invader_fsm_3/n112 ), .CLK(n80), 
        .Q(\invader_fsm_3/state[0] ) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[0]  ( .D(\invader_fsm_3/N55 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [0]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[3]  ( .D(\invader_fsm_3/n114 ), 
        .CLK(n80), .Q(invader_3_coord_x[3]) );
  DFFNEGX1 \invader_fsm_3/move_interval_toggle_reg  ( .D(\invader_fsm_3/n117 ), 
        .CLK(n80), .Q(\invader_fsm_3/move_interval_toggle ) );
  NAND3X1 \invader_fsm_4/U106  ( .A(\invader_fsm_4/N43 ), .B(
        \invader_fsm_4/N35 ), .C(\invader_fsm_4/n102 ), .Y(\invader_fsm_4/n98 ) );
  NAND3X1 \invader_fsm_4/U105  ( .A(n71), .B(n373), .C(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n71 ) );
  NOR2X1 \invader_fsm_4/U104  ( .A(\invader_fsm_4/state[1] ), .B(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n101 ) );
  NAND3X1 \invader_fsm_4/U103  ( .A(play), .B(n71), .C(\invader_fsm_4/n101 ), 
        .Y(\invader_fsm_4/n100 ) );
  OAI21X1 \invader_fsm_4/U102  ( .A(n354), .B(\invader_fsm_4/n71 ), .C(
        \invader_fsm_4/n100 ), .Y(\invader_fsm_4/N55 ) );
  NAND3X1 \invader_fsm_4/U101  ( .A(n71), .B(n393), .C(
        \invader_fsm_4/state[1] ), .Y(\invader_fsm_4/n99 ) );
  OAI21X1 \invader_fsm_4/U100  ( .A(\invader_fsm_4/n71 ), .B(
        \invader_fsm_4/n98 ), .C(\invader_fsm_4/n99 ), .Y(\invader_fsm_4/N56 )
         );
  NOR2X1 \invader_fsm_4/U99  ( .A(n394), .B(\invader_fsm_4/next_state [1]), 
        .Y(\invader_fsm_4/n69 ) );
  OR2X1 \invader_fsm_4/U98  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        internal_reset), .Y(\invader_fsm_4/n96 ) );
  OAI21X1 \invader_fsm_4/U97  ( .A(\invader_fsm_4/next_state [1]), .B(
        \invader_fsm_4/next_state [0]), .C(n72), .Y(\invader_fsm_4/n74 ) );
  NAND3X1 \invader_fsm_4/U96  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        n392), .C(n117), .Y(\invader_fsm_4/n97 ) );
  OAI21X1 \invader_fsm_4/U95  ( .A(n392), .B(\invader_fsm_4/n96 ), .C(
        \invader_fsm_4/n97 ), .Y(\invader_fsm_4/n117 ) );
  NOR2X1 \invader_fsm_4/U94  ( .A(move_down), .B(\invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n95 ) );
  NAND2X1 \invader_fsm_4/U93  ( .A(\invader_fsm_4/next_state [0]), .B(n71), 
        .Y(\invader_fsm_4/n77 ) );
  NAND3X1 \invader_fsm_4/U92  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        \invader_fsm_4/n95 ), .C(n122), .Y(\invader_fsm_4/n94 ) );
  OR2X1 \invader_fsm_4/U91  ( .A(n152), .B(\invader_fsm_4/n94 ), .Y(
        \invader_fsm_4/n54 ) );
  AOI21X1 \invader_fsm_4/U90  ( .A(\invader_fsm_4/n95 ), .B(
        \invader_fsm_4/move_interval_toggle ), .C(\invader_fsm_4/n77 ), .Y(
        \invader_fsm_4/n56 ) );
  NOR2X1 \invader_fsm_4/U89  ( .A(\invader_fsm_4/n94 ), .B(invader_direction), 
        .Y(\invader_fsm_4/n57 ) );
  AOI22X1 \invader_fsm_4/U88  ( .A(invader_4_coord_x[1]), .B(
        \invader_fsm_4/n56 ), .C(n389), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n93 ) );
  OAI21X1 \invader_fsm_4/U87  ( .A(\invader_fsm_4/n54 ), .B(n387), .C(
        \invader_fsm_4/n93 ), .Y(\invader_fsm_4/n116 ) );
  NAND2X1 \invader_fsm_4/U86  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        n153), .Y(\invader_fsm_4/n92 ) );
  NAND2X1 \invader_fsm_4/U85  ( .A(\invader_fsm_4/next_state [1]), .B(n394), 
        .Y(\invader_fsm_4/n70 ) );
  NOR2X1 \invader_fsm_4/U84  ( .A(\invader_fsm_4/n74 ), .B(n391), .Y(
        \invader_fsm_4/n64 ) );
  OAI21X1 \invader_fsm_4/U83  ( .A(n392), .B(\invader_fsm_4/n92 ), .C(
        \invader_fsm_4/n64 ), .Y(\invader_fsm_4/n81 ) );
  AOI22X1 \invader_fsm_4/U82  ( .A(n390), .B(invader_direction), .C(n390), .D(
        n152), .Y(\invader_fsm_4/n91 ) );
  OAI21X1 \invader_fsm_4/U81  ( .A(\invader_fsm_4/n91 ), .B(n392), .C(
        \invader_fsm_4/n70 ), .Y(\invader_fsm_4/n90 ) );
  NAND3X1 \invader_fsm_4/U80  ( .A(\invader_fsm_4/n81 ), .B(n71), .C(
        \invader_fsm_4/n90 ), .Y(\invader_fsm_4/n89 ) );
  OAI21X1 \invader_fsm_4/U79  ( .A(\invader_fsm_4/n81 ), .B(n390), .C(
        \invader_fsm_4/n89 ), .Y(\invader_fsm_4/n115 ) );
  AOI22X1 \invader_fsm_4/U78  ( .A(\invader_fsm_4/N14 ), .B(invader_direction), 
        .C(\invader_fsm_4/N22 ), .D(n152), .Y(\invader_fsm_4/n88 ) );
  OAI21X1 \invader_fsm_4/U77  ( .A(\invader_fsm_4/n88 ), .B(n392), .C(
        \invader_fsm_4/n70 ), .Y(\invader_fsm_4/n87 ) );
  NAND3X1 \invader_fsm_4/U76  ( .A(\invader_fsm_4/n81 ), .B(n71), .C(
        \invader_fsm_4/n87 ), .Y(\invader_fsm_4/n86 ) );
  OAI21X1 \invader_fsm_4/U75  ( .A(\invader_fsm_4/n81 ), .B(n386), .C(
        \invader_fsm_4/n86 ), .Y(\invader_fsm_4/n114 ) );
  AOI22X1 \invader_fsm_4/U74  ( .A(\invader_fsm_4/N15 ), .B(invader_direction), 
        .C(n380), .D(n152), .Y(\invader_fsm_4/n85 ) );
  OAI21X1 \invader_fsm_4/U73  ( .A(\invader_fsm_4/n85 ), .B(n392), .C(n117), 
        .Y(\invader_fsm_4/n84 ) );
  AOI22X1 \invader_fsm_4/U72  ( .A(\invader_fsm_4/n84 ), .B(
        \invader_fsm_4/n81 ), .C(invader_4_coord_x[3]), .D(n118), .Y(
        \invader_fsm_4/n83 ) );
  AOI22X1 \invader_fsm_4/U71  ( .A(\invader_fsm_4/N16 ), .B(invader_direction), 
        .C(\invader_fsm_4/N24 ), .D(n152), .Y(\invader_fsm_4/n82 ) );
  OAI21X1 \invader_fsm_4/U70  ( .A(\invader_fsm_4/n82 ), .B(n392), .C(n117), 
        .Y(\invader_fsm_4/n80 ) );
  AOI22X1 \invader_fsm_4/U69  ( .A(\invader_fsm_4/n80 ), .B(
        \invader_fsm_4/n81 ), .C(invader_4_coord_x[4]), .D(n118), .Y(
        \invader_fsm_4/n79 ) );
  AOI22X1 \invader_fsm_4/U68  ( .A(invader_4_coord_x[5]), .B(
        \invader_fsm_4/n56 ), .C(n375), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n78 ) );
  OAI21X1 \invader_fsm_4/U67  ( .A(\invader_fsm_4/n54 ), .B(n377), .C(
        \invader_fsm_4/n78 ), .Y(\invader_fsm_4/n113 ) );
  NAND2X1 \invader_fsm_4/U66  ( .A(\invader_fsm_4/n64 ), .B(n392), .Y(
        \invader_fsm_4/n75 ) );
  OAI22X1 \invader_fsm_4/U65  ( .A(n393), .B(\invader_fsm_4/n75 ), .C(n119), 
        .D(\invader_fsm_4/n77 ), .Y(\invader_fsm_4/n112 ) );
  NAND3X1 \invader_fsm_4/U64  ( .A(\invader_fsm_4/n75 ), .B(n72), .C(
        \invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n76 ) );
  OAI21X1 \invader_fsm_4/U63  ( .A(\invader_fsm_4/n75 ), .B(n373), .C(
        \invader_fsm_4/n76 ), .Y(\invader_fsm_4/n111 ) );
  AOI21X1 \invader_fsm_4/U62  ( .A(\invader_fsm_4/n64 ), .B(invader_4_display), 
        .C(\invader_fsm_4/n74 ), .Y(\invader_fsm_4/n73 ) );
  NAND2X1 \invader_fsm_4/U61  ( .A(playerbullet_invader_collision_signal_4), 
        .B(\invader_fsm_4/n64 ), .Y(\invader_fsm_4/n72 ) );
  OAI21X1 \invader_fsm_4/U60  ( .A(\invader_fsm_4/n70 ), .B(
        \invader_fsm_4/n71 ), .C(\invader_fsm_4/n72 ), .Y(\invader_fsm_4/n110 ) );
  AOI21X1 \invader_fsm_4/U59  ( .A(\invader_fsm_4/N70 ), .B(
        \invader_fsm_4/n69 ), .C(n391), .Y(\invader_fsm_4/n66 ) );
  OAI21X1 \invader_fsm_4/U58  ( .A(n392), .B(n153), .C(\invader_fsm_4/n64 ), 
        .Y(\invader_fsm_4/n58 ) );
  NAND2X1 \invader_fsm_4/U57  ( .A(\invader_fsm_4/n58 ), .B(n71), .Y(
        \invader_fsm_4/n67 ) );
  NAND2X1 \invader_fsm_4/U56  ( .A(\invader_fsm_4/N70 ), .B(n121), .Y(
        \invader_fsm_4/n68 ) );
  OAI21X1 \invader_fsm_4/U55  ( .A(\invader_fsm_4/n66 ), .B(
        \invader_fsm_4/n67 ), .C(\invader_fsm_4/n68 ), .Y(\invader_fsm_4/n109 ) );
  NOR2X1 \invader_fsm_4/U54  ( .A(n392), .B(n121), .Y(\invader_fsm_4/n60 ) );
  AOI22X1 \invader_fsm_4/U53  ( .A(n368), .B(\invader_fsm_4/n60 ), .C(
        invader_4_coord_y[1]), .D(n121), .Y(\invader_fsm_4/n65 ) );
  NAND2X1 \invader_fsm_4/U52  ( .A(\invader_fsm_4/n65 ), .B(n117), .Y(
        \invader_fsm_4/n108 ) );
  AOI22X1 \invader_fsm_4/U51  ( .A(\invader_fsm_4/N72 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[2]), .D(n121), .Y(
        \invader_fsm_4/n63 ) );
  NAND2X1 \invader_fsm_4/U50  ( .A(\invader_fsm_4/n63 ), .B(
        \invader_fsm_4/n64 ), .Y(\invader_fsm_4/n107 ) );
  AOI22X1 \invader_fsm_4/U49  ( .A(\invader_fsm_4/N73 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[3]), .D(n121), .Y(
        \invader_fsm_4/n62 ) );
  NAND2X1 \invader_fsm_4/U48  ( .A(\invader_fsm_4/n62 ), .B(n117), .Y(
        \invader_fsm_4/n106 ) );
  AOI22X1 \invader_fsm_4/U47  ( .A(\invader_fsm_4/N74 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[4]), .D(n121), .Y(
        \invader_fsm_4/n61 ) );
  NAND2X1 \invader_fsm_4/U46  ( .A(\invader_fsm_4/n61 ), .B(n117), .Y(
        \invader_fsm_4/n105 ) );
  NAND3X1 \invader_fsm_4/U45  ( .A(\invader_fsm_4/n60 ), .B(n71), .C(
        \invader_fsm_4/N75 ), .Y(\invader_fsm_4/n59 ) );
  OAI21X1 \invader_fsm_4/U44  ( .A(\invader_fsm_4/n58 ), .B(n357), .C(
        \invader_fsm_4/n59 ), .Y(\invader_fsm_4/n104 ) );
  AOI22X1 \invader_fsm_4/U43  ( .A(invader_outofbounds_signal_4), .B(
        \invader_fsm_4/n56 ), .C(n374), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n55 ) );
  OAI21X1 \invader_fsm_4/U42  ( .A(\invader_fsm_4/n54 ), .B(n816), .C(
        \invader_fsm_4/n55 ), .Y(\invader_fsm_4/n103 ) );
  AND2X2 \invader_fsm_4/U3  ( .A(\invader_fsm_4/N27 ), .B(\invader_fsm_4/N19 ), 
        .Y(\invader_fsm_4/n102 ) );
  DFFNEGX1 \invader_fsm_4/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_4/n103 ), .CLK(n80), .Q(invader_outofbounds_signal_4) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[5]  ( .D(\invader_fsm_4/n104 ), 
        .CLK(n80), .Q(invader_4_coord_y[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[4]  ( .D(\invader_fsm_4/n105 ), 
        .CLK(n80), .Q(invader_4_coord_y[4]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[3]  ( .D(\invader_fsm_4/n106 ), 
        .CLK(n80), .Q(invader_4_coord_y[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[2]  ( .D(\invader_fsm_4/n107 ), 
        .CLK(n80), .Q(invader_4_coord_y[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[1]  ( .D(\invader_fsm_4/n108 ), 
        .CLK(n80), .Q(invader_4_coord_y[1]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[0]  ( .D(\invader_fsm_4/n109 ), 
        .CLK(n80), .Q(\invader_fsm_4/N70 ) );
  DFFNEGX1 \invader_fsm_4/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_4/n110 ), .CLK(n79), .Q(
        playerbullet_invader_collision_signal_4) );
  DFFNEGX1 \invader_fsm_4/state_reg[1]  ( .D(\invader_fsm_4/n111 ), .CLK(n79), 
        .Q(\invader_fsm_4/state[1] ) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[5]  ( .D(\invader_fsm_4/n113 ), 
        .CLK(n79), .Q(invader_4_coord_x[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[3]  ( .D(n115), .CLK(n79), .Q(
        invader_4_coord_x[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[2]  ( .D(\invader_fsm_4/n114 ), 
        .CLK(n79), .Q(invader_4_coord_x[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[0]  ( .D(\invader_fsm_4/n115 ), 
        .CLK(n79), .Q(\invader_fsm_4/N84 ) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[1]  ( .D(\invader_fsm_4/n116 ), 
        .CLK(n79), .Q(invader_4_coord_x[1]) );
  DFFNEGX1 \invader_fsm_4/display_reg  ( .D(n120), .CLK(n79), .Q(
        invader_4_display) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[1]  ( .D(\invader_fsm_4/N56 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [1]) );
  DFFNEGX1 \invader_fsm_4/state_reg[0]  ( .D(\invader_fsm_4/n112 ), .CLK(n79), 
        .Q(\invader_fsm_4/state[0] ) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[0]  ( .D(\invader_fsm_4/N55 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [0]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[4]  ( .D(n116), .CLK(n79), .Q(
        invader_4_coord_x[4]) );
  DFFNEGX1 \invader_fsm_4/move_interval_toggle_reg  ( .D(\invader_fsm_4/n117 ), 
        .CLK(n79), .Q(\invader_fsm_4/move_interval_toggle ) );
  NOR2X1 \player_bullet_fsm/U53  ( .A(n396), .B(n406), .Y(
        \player_bullet_fsm/n42 ) );
  NOR2X1 \player_bullet_fsm/U52  ( .A(playerbullet_shield_collision_signal), 
        .B(playerbullet_invader_collision_signal), .Y(\player_bullet_fsm/n43 )
         );
  AOI22X1 \player_bullet_fsm/U51  ( .A(\player_bullet_fsm/n42 ), .B(
        \player_bullet_fsm/n43 ), .C(playerbullet_fire), .D(n406), .Y(
        \player_bullet_fsm/n40 ) );
  NOR2X1 \player_bullet_fsm/U49  ( .A(\player_bullet_fsm/n40 ), .B(
        internal_reset), .Y(\player_bullet_fsm/N15 ) );
  NAND2X1 \player_bullet_fsm/U48  ( .A(\player_bullet_fsm/next_state[0] ), .B(
        n72), .Y(\player_bullet_fsm/n39 ) );
  AOI22X1 \player_bullet_fsm/U44  ( .A(player_bullet_coord_x[5]), .B(n114), 
        .C(player_coord_x[5]), .D(\player_bullet_fsm/n39 ), .Y(
        \player_bullet_fsm/n38 ) );
  AOI22X1 \player_bullet_fsm/U43  ( .A(player_bullet_coord_x[4]), .B(n114), 
        .C(player_coord_x[4]), .D(\player_bullet_fsm/n39 ), .Y(
        \player_bullet_fsm/n37 ) );
  AOI22X1 \player_bullet_fsm/U42  ( .A(player_bullet_coord_x[3]), .B(n114), 
        .C(player_coord_x[3]), .D(\player_bullet_fsm/n39 ), .Y(
        \player_bullet_fsm/n36 ) );
  AOI22X1 \player_bullet_fsm/U41  ( .A(player_bullet_coord_x[2]), .B(n114), 
        .C(n68), .D(\player_bullet_fsm/n39 ), .Y(\player_bullet_fsm/n35 ) );
  AOI22X1 \player_bullet_fsm/U40  ( .A(player_bullet_coord_x[1]), .B(n114), 
        .C(player_coord_x[1]), .D(\player_bullet_fsm/n39 ), .Y(
        \player_bullet_fsm/n34 ) );
  AOI22X1 \player_bullet_fsm/U39  ( .A(\shield_fsm/N35 ), .B(n114), .C(
        player_coord_x[0]), .D(\player_bullet_fsm/n39 ), .Y(
        \player_bullet_fsm/n32 ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[4]  ( .D(n39), .CLK(
        n79), .Q(player_bullet_coord_y[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[3]  ( .D(n38), .CLK(
        n79), .Q(player_bullet_coord_y[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[2]  ( .D(n37), .CLK(
        n78), .Q(player_bullet_coord_y[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[1]  ( .D(n28), .CLK(
        n78), .Q(player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[0]  ( .D(n36), .CLK(
        n78), .Q(player_bullet_coord_y[0]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[5]  ( .D(n35), .CLK(
        n78), .Q(player_bullet_coord_y[5]) );
  DFFNEGX1 \player_bullet_fsm/display_reg  ( .D(n114), .CLK(n78), .Q(
        player_bullet_display) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[0]  ( .D(n108), .CLK(
        n78), .Q(\shield_fsm/N35 ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[1]  ( .D(n109), .CLK(
        n78), .Q(player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[2]  ( .D(n110), .CLK(
        n78), .Q(player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[3]  ( .D(n111), .CLK(
        n78), .Q(player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[4]  ( .D(n112), .CLK(
        n78), .Q(player_bullet_coord_x[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[5]  ( .D(n113), .CLK(
        n78), .Q(player_bullet_coord_x[5]) );
  DFFNEGX1 \player_bullet_fsm/next_state_reg[0]  ( .D(\player_bullet_fsm/N15 ), 
        .CLK(clka), .Q(\player_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \player_bullet_fsm/state_reg[0]  ( .D(n114), .CLK(n78), .Q(
        \player_bullet_fsm/state[0] ) );
  NOR2X1 \invader_bullet_fsm/U52  ( .A(\invader_bullet_fsm/N13 ), .B(n424), 
        .Y(\invader_bullet_fsm/n40 ) );
  NOR2X1 \invader_bullet_fsm/U51  ( .A(invaderbullet_shield_collision_signal), 
        .B(invaderbullet_player_collision_signal), .Y(\invader_bullet_fsm/n41 ) );
  AOI22X1 \invader_bullet_fsm/U50  ( .A(\invader_bullet_fsm/n40 ), .B(
        \invader_bullet_fsm/n41 ), .C(invader_fire), .D(n424), .Y(
        \invader_bullet_fsm/n38 ) );
  NOR2X1 \invader_bullet_fsm/U48  ( .A(\invader_bullet_fsm/n38 ), .B(
        internal_reset), .Y(\invader_bullet_fsm/N19 ) );
  NAND2X1 \invader_bullet_fsm/U47  ( .A(\invader_bullet_fsm/next_state[0] ), 
        .B(n72), .Y(\invader_bullet_fsm/n29 ) );
  AOI22X1 \invader_bullet_fsm/U42  ( .A(\shield_fsm/N19 ), .B(n107), .C(
        closest_invader_coord_x[0]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n36 ) );
  AOI22X1 \invader_bullet_fsm/U41  ( .A(invader_bullet_coord_x[5]), .B(n107), 
        .C(closest_invader_coord_x[5]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n35 ) );
  AOI22X1 \invader_bullet_fsm/U40  ( .A(invader_bullet_coord_x[4]), .B(n107), 
        .C(closest_invader_coord_x[4]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n34 ) );
  AOI22X1 \invader_bullet_fsm/U39  ( .A(invader_bullet_coord_x[3]), .B(n107), 
        .C(closest_invader_coord_x[3]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n33 ) );
  AOI22X1 \invader_bullet_fsm/U38  ( .A(invader_bullet_coord_x[2]), .B(n107), 
        .C(closest_invader_coord_x[2]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n32 ) );
  AOI22X1 \invader_bullet_fsm/U37  ( .A(invader_bullet_coord_x[1]), .B(n107), 
        .C(closest_invader_coord_x[1]), .D(\invader_bullet_fsm/n31 ), .Y(
        \invader_bullet_fsm/n30 ) );
  AOI22X1 \invader_bullet_fsm/U36  ( .A(closest_invader_coord_y[0]), .B(
        \invader_bullet_fsm/n29 ), .C(n423), .D(n107), .Y(
        \invader_bullet_fsm/n28 ) );
  AOI22X1 \invader_bullet_fsm/U34  ( .A(closest_invader_coord_y[1]), .B(
        \invader_bullet_fsm/n29 ), .C(\invader_bullet_fsm/N26 ), .D(n107), .Y(
        \invader_bullet_fsm/n27 ) );
  AOI22X1 \invader_bullet_fsm/U32  ( .A(closest_invader_coord_y[2]), .B(
        \invader_bullet_fsm/n29 ), .C(n419), .D(n107), .Y(
        \invader_bullet_fsm/n26 ) );
  AOI22X1 \invader_bullet_fsm/U30  ( .A(closest_invader_coord_y[3]), .B(
        \invader_bullet_fsm/n29 ), .C(\invader_bullet_fsm/N28 ), .D(n107), .Y(
        \invader_bullet_fsm/n25 ) );
  AOI22X1 \invader_bullet_fsm/U28  ( .A(closest_invader_coord_y[4]), .B(
        \invader_bullet_fsm/n29 ), .C(\invader_bullet_fsm/N29 ), .D(n107), .Y(
        \invader_bullet_fsm/n24 ) );
  AOI22X1 \invader_bullet_fsm/U26  ( .A(closest_invader_coord_y[5]), .B(
        \invader_bullet_fsm/n29 ), .C(\invader_bullet_fsm/N30 ), .D(n107), .Y(
        \invader_bullet_fsm/n21 ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[1]  ( .D(n100), 
        .CLK(n78), .Q(invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[2]  ( .D(n99), .CLK(
        n77), .Q(invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[3]  ( .D(n98), .CLK(
        n77), .Q(invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[4]  ( .D(n97), .CLK(
        n77), .Q(invader_bullet_coord_x[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[5]  ( .D(n96), .CLK(
        n77), .Q(invader_bullet_coord_x[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[0]  ( .D(n95), .CLK(
        n77), .Q(\shield_fsm/N19 ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[5]  ( .D(n101), 
        .CLK(n77), .Q(invader_bullet_coord_y[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[4]  ( .D(n102), 
        .CLK(n77), .Q(invader_bullet_coord_y[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[3]  ( .D(n103), 
        .CLK(n77), .Q(invader_bullet_coord_y[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[2]  ( .D(n104), 
        .CLK(n77), .Q(invader_bullet_coord_y[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[1]  ( .D(n105), 
        .CLK(n77), .Q(invader_bullet_coord_y[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[0]  ( .D(n106), 
        .CLK(n77), .Q(invader_bullet_coord_y[0]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_display_reg  ( .D(n107), .CLK(
        n77), .Q(invader_bullet_display) );
  DFFNEGX1 \invader_bullet_fsm/next_state_reg[0]  ( .D(
        \invader_bullet_fsm/N19 ), .CLK(clka), .Q(
        \invader_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/state_reg[0]  ( .D(n107), .CLK(n77), .Q(
        \invader_bullet_fsm/state[0] ) );
  HAX1 \player_bullet_fsm/add_89/U1_1_1  ( .A(player_bullet_coord_y[1]), .B(
        player_bullet_coord_y[0]), .YC(\player_bullet_fsm/add_89/carry [2]), 
        .YS(\player_bullet_fsm/N22 ) );
  HAX1 \player_bullet_fsm/add_89/U1_1_2  ( .A(player_bullet_coord_y[2]), .B(
        \player_bullet_fsm/add_89/carry [2]), .YC(
        \player_bullet_fsm/add_89/carry [3]), .YS(\player_bullet_fsm/N23 ) );
  HAX1 \player_bullet_fsm/add_89/U1_1_3  ( .A(player_bullet_coord_y[3]), .B(
        \player_bullet_fsm/add_89/carry [3]), .YC(
        \player_bullet_fsm/add_89/carry [4]), .YS(\player_bullet_fsm/N24 ) );
  HAX1 \player_bullet_fsm/add_89/U1_1_4  ( .A(player_bullet_coord_y[4]), .B(
        \player_bullet_fsm/add_89/carry [4]), .YC(
        \player_bullet_fsm/add_89/carry [5]), .YS(\player_bullet_fsm/N25 ) );
  HAX1 \invader_fsm_4/r412/U1_1_1  ( .A(invader_4_coord_x[1]), .B(
        \invader_fsm_4/N84 ), .YC(\invader_fsm_4/r412/carry [2]), .YS(
        \invader_fsm_4/N13 ) );
  HAX1 \invader_fsm_4/r412/U1_1_2  ( .A(invader_4_coord_x[2]), .B(
        \invader_fsm_4/r412/carry [2]), .YC(\invader_fsm_4/r412/carry [3]), 
        .YS(\invader_fsm_4/N14 ) );
  HAX1 \invader_fsm_4/r412/U1_1_3  ( .A(invader_4_coord_x[3]), .B(
        \invader_fsm_4/r412/carry [3]), .YC(\invader_fsm_4/r412/carry [4]), 
        .YS(\invader_fsm_4/N15 ) );
  HAX1 \invader_fsm_4/r412/U1_1_4  ( .A(invader_4_coord_x[4]), .B(
        \invader_fsm_4/r412/carry [4]), .YC(\invader_fsm_4/r412/carry [5]), 
        .YS(\invader_fsm_4/N16 ) );
  HAX1 \invader_fsm_4/r412/U1_1_5  ( .A(invader_4_coord_x[5]), .B(
        \invader_fsm_4/r412/carry [5]), .YC(\invader_fsm_4/N18 ), .YS(
        \invader_fsm_4/N17 ) );
  HAX1 \invader_fsm_4/add_50/U1_1_1  ( .A(invader_4_coord_y[1]), .B(
        \invader_fsm_4/N70 ), .YC(\invader_fsm_4/add_50/carry [2]), .YS(
        \invader_fsm_4/N29 ) );
  HAX1 \invader_fsm_4/add_50/U1_1_2  ( .A(invader_4_coord_y[2]), .B(
        \invader_fsm_4/add_50/carry [2]), .YC(\invader_fsm_4/add_50/carry [3]), 
        .YS(\invader_fsm_4/N30 ) );
  HAX1 \invader_fsm_4/add_50/U1_1_3  ( .A(invader_4_coord_y[3]), .B(
        \invader_fsm_4/add_50/carry [3]), .YC(\invader_fsm_4/add_50/carry [4]), 
        .YS(\invader_fsm_4/N31 ) );
  HAX1 \invader_fsm_4/add_50/U1_1_4  ( .A(invader_4_coord_y[4]), .B(
        \invader_fsm_4/add_50/carry [4]), .YC(\invader_fsm_4/add_50/carry [5]), 
        .YS(\invader_fsm_4/N32 ) );
  HAX1 \invader_fsm_4/add_50/U1_1_5  ( .A(invader_4_coord_y[5]), .B(
        \invader_fsm_4/add_50/carry [5]), .YC(\invader_fsm_4/N34 ), .YS(
        \invader_fsm_4/N33 ) );
  HAX1 \invader_fsm_3/r412/U1_1_1  ( .A(invader_3_coord_x[1]), .B(
        \invader_fsm_3/N84 ), .YC(\invader_fsm_3/r412/carry [2]), .YS(
        \invader_fsm_3/N13 ) );
  HAX1 \invader_fsm_3/r412/U1_1_2  ( .A(invader_3_coord_x[2]), .B(
        \invader_fsm_3/r412/carry [2]), .YC(\invader_fsm_3/r412/carry [3]), 
        .YS(\invader_fsm_3/N14 ) );
  HAX1 \invader_fsm_3/r412/U1_1_3  ( .A(invader_3_coord_x[3]), .B(
        \invader_fsm_3/r412/carry [3]), .YC(\invader_fsm_3/r412/carry [4]), 
        .YS(\invader_fsm_3/N15 ) );
  HAX1 \invader_fsm_3/r412/U1_1_4  ( .A(invader_3_coord_x[4]), .B(
        \invader_fsm_3/r412/carry [4]), .YC(\invader_fsm_3/r412/carry [5]), 
        .YS(\invader_fsm_3/N16 ) );
  HAX1 \invader_fsm_3/r412/U1_1_5  ( .A(invader_3_coord_x[5]), .B(
        \invader_fsm_3/r412/carry [5]), .YC(\invader_fsm_3/N18 ), .YS(
        \invader_fsm_3/N17 ) );
  HAX1 \invader_fsm_3/add_50/U1_1_1  ( .A(invader_3_coord_y[1]), .B(
        \invader_fsm_3/N70 ), .YC(\invader_fsm_3/add_50/carry [2]), .YS(
        \invader_fsm_3/N29 ) );
  HAX1 \invader_fsm_3/add_50/U1_1_2  ( .A(invader_3_coord_y[2]), .B(
        \invader_fsm_3/add_50/carry [2]), .YC(\invader_fsm_3/add_50/carry [3]), 
        .YS(\invader_fsm_3/N30 ) );
  HAX1 \invader_fsm_3/add_50/U1_1_3  ( .A(invader_3_coord_y[3]), .B(
        \invader_fsm_3/add_50/carry [3]), .YC(\invader_fsm_3/add_50/carry [4]), 
        .YS(\invader_fsm_3/N31 ) );
  HAX1 \invader_fsm_3/add_50/U1_1_4  ( .A(invader_3_coord_y[4]), .B(
        \invader_fsm_3/add_50/carry [4]), .YC(\invader_fsm_3/add_50/carry [5]), 
        .YS(\invader_fsm_3/N32 ) );
  HAX1 \invader_fsm_3/add_50/U1_1_5  ( .A(invader_3_coord_y[5]), .B(
        \invader_fsm_3/add_50/carry [5]), .YC(\invader_fsm_3/N34 ), .YS(
        \invader_fsm_3/N33 ) );
  HAX1 \invader_fsm_2/r412/U1_1_1  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/N84 ), .YC(\invader_fsm_2/r412/carry [2]), .YS(
        \invader_fsm_2/N13 ) );
  HAX1 \invader_fsm_2/r412/U1_1_2  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/r412/carry [2]), .YC(\invader_fsm_2/r412/carry [3]), 
        .YS(\invader_fsm_2/N14 ) );
  HAX1 \invader_fsm_2/r412/U1_1_3  ( .A(invader_2_coord_x[3]), .B(
        \invader_fsm_2/r412/carry [3]), .YC(\invader_fsm_2/r412/carry [4]), 
        .YS(\invader_fsm_2/N15 ) );
  HAX1 \invader_fsm_2/r412/U1_1_4  ( .A(invader_2_coord_x[4]), .B(
        \invader_fsm_2/r412/carry [4]), .YC(\invader_fsm_2/r412/carry [5]), 
        .YS(\invader_fsm_2/N16 ) );
  HAX1 \invader_fsm_2/r412/U1_1_5  ( .A(invader_2_coord_x[5]), .B(
        \invader_fsm_2/r412/carry [5]), .YC(\invader_fsm_2/N18 ), .YS(
        \invader_fsm_2/N17 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_1  ( .A(invader_2_coord_y[1]), .B(
        \invader_fsm_2/N70 ), .YC(\invader_fsm_2/add_50/carry [2]), .YS(
        \invader_fsm_2/N29 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_2  ( .A(invader_2_coord_y[2]), .B(
        \invader_fsm_2/add_50/carry [2]), .YC(\invader_fsm_2/add_50/carry [3]), 
        .YS(\invader_fsm_2/N30 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_3  ( .A(invader_2_coord_y[3]), .B(
        \invader_fsm_2/add_50/carry [3]), .YC(\invader_fsm_2/add_50/carry [4]), 
        .YS(\invader_fsm_2/N31 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_4  ( .A(invader_2_coord_y[4]), .B(
        \invader_fsm_2/add_50/carry [4]), .YC(\invader_fsm_2/add_50/carry [5]), 
        .YS(\invader_fsm_2/N32 ) );
  HAX1 \invader_fsm_2/add_50/U1_1_5  ( .A(invader_2_coord_y[5]), .B(
        \invader_fsm_2/add_50/carry [5]), .YC(\invader_fsm_2/N34 ), .YS(
        \invader_fsm_2/N33 ) );
  HAX1 \invader_fsm_1/r412/U1_1_1  ( .A(invader_1_coord_x[1]), .B(
        \invader_fsm_1/N84 ), .YC(\invader_fsm_1/r412/carry [2]), .YS(
        \invader_fsm_1/N13 ) );
  HAX1 \invader_fsm_1/r412/U1_1_2  ( .A(invader_1_coord_x[2]), .B(
        \invader_fsm_1/r412/carry [2]), .YC(\invader_fsm_1/r412/carry [3]), 
        .YS(\invader_fsm_1/N14 ) );
  HAX1 \invader_fsm_1/r412/U1_1_3  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/r412/carry [3]), .YC(\invader_fsm_1/r412/carry [4]), 
        .YS(\invader_fsm_1/N15 ) );
  HAX1 \invader_fsm_1/r412/U1_1_4  ( .A(invader_1_coord_x[4]), .B(
        \invader_fsm_1/r412/carry [4]), .YC(\invader_fsm_1/r412/carry [5]), 
        .YS(\invader_fsm_1/N16 ) );
  HAX1 \invader_fsm_1/r412/U1_1_5  ( .A(invader_1_coord_x[5]), .B(
        \invader_fsm_1/r412/carry [5]), .YC(\invader_fsm_1/N18 ), .YS(
        \invader_fsm_1/N17 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_1  ( .A(invader_1_coord_y[1]), .B(
        \invader_fsm_1/N70 ), .YC(\invader_fsm_1/add_50/carry [2]), .YS(
        \invader_fsm_1/N29 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_2  ( .A(invader_1_coord_y[2]), .B(
        \invader_fsm_1/add_50/carry [2]), .YC(\invader_fsm_1/add_50/carry [3]), 
        .YS(\invader_fsm_1/N30 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_3  ( .A(invader_1_coord_y[3]), .B(
        \invader_fsm_1/add_50/carry [3]), .YC(\invader_fsm_1/add_50/carry [4]), 
        .YS(\invader_fsm_1/N31 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_4  ( .A(invader_1_coord_y[4]), .B(
        \invader_fsm_1/add_50/carry [4]), .YC(\invader_fsm_1/add_50/carry [5]), 
        .YS(\invader_fsm_1/N32 ) );
  HAX1 \invader_fsm_1/add_50/U1_1_5  ( .A(invader_1_coord_y[5]), .B(
        \invader_fsm_1/add_50/carry [5]), .YC(\invader_fsm_1/N34 ), .YS(
        \invader_fsm_1/N33 ) );
  HAX1 \player_fsm/r403/U1_1_1  ( .A(player_coord_x[1]), .B(player_coord_x[0]), 
        .YC(\player_fsm/r403/carry [2]), .YS(\player_fsm/N13 ) );
  HAX1 \player_fsm/r403/U1_1_2  ( .A(n68), .B(\player_fsm/r403/carry [2]), 
        .YC(\player_fsm/r403/carry [3]), .YS(\player_fsm/N14 ) );
  HAX1 \player_fsm/r403/U1_1_3  ( .A(player_coord_x[3]), .B(
        \player_fsm/r403/carry [3]), .YC(\player_fsm/r403/carry [4]), .YS(
        \player_fsm/N15 ) );
  HAX1 \player_fsm/r403/U1_1_4  ( .A(player_coord_x[4]), .B(
        \player_fsm/r403/carry [4]), .YC(\player_fsm/r403/carry [5]), .YS(
        \player_fsm/N16 ) );
  HAX1 \player_fsm/r403/U1_1_5  ( .A(player_coord_x[5]), .B(
        \player_fsm/r403/carry [5]), .YC(\player_fsm/N18 ), .YS(
        \player_fsm/N17 ) );
  HAX1 \player_fsm/add_39_2/U1_1_1  ( .A(invader_bullet_coord_x[1]), .B(
        \shield_fsm/N19 ), .YC(\player_fsm/add_39_2/carry [2]), .YS(
        \player_fsm/N22 ) );
  HAX1 \player_fsm/add_39_2/U1_1_2  ( .A(invader_bullet_coord_x[2]), .B(
        \player_fsm/add_39_2/carry [2]), .YC(\player_fsm/add_39_2/carry [3]), 
        .YS(\player_fsm/N23 ) );
  HAX1 \player_fsm/add_39_2/U1_1_3  ( .A(invader_bullet_coord_x[3]), .B(
        \player_fsm/add_39_2/carry [3]), .YC(\player_fsm/add_39_2/carry [4]), 
        .YS(\player_fsm/N24 ) );
  HAX1 \player_fsm/add_39_2/U1_1_4  ( .A(invader_bullet_coord_x[4]), .B(
        \player_fsm/add_39_2/carry [4]), .YC(\player_fsm/add_39_2/carry [5]), 
        .YS(\player_fsm/N25 ) );
  HAX1 \player_fsm/add_39_2/U1_1_5  ( .A(invader_bullet_coord_x[5]), .B(
        \player_fsm/add_39_2/carry [5]), .YC(\player_fsm/N27 ), .YS(
        \player_fsm/N26 ) );
  HAX1 \player_fsm/add_40_2/U1_1_1  ( .A(invader_bullet_coord_y[1]), .B(
        invader_bullet_coord_y[0]), .YC(\player_fsm/add_40_2/carry [2]), .YS(
        \player_fsm/N40 ) );
  HAX1 \player_fsm/add_40_2/U1_1_2  ( .A(invader_bullet_coord_y[2]), .B(
        \player_fsm/add_40_2/carry [2]), .YC(\player_fsm/add_40_2/carry [3]), 
        .YS(\player_fsm/N41 ) );
  HAX1 \player_fsm/add_40_2/U1_1_3  ( .A(invader_bullet_coord_y[3]), .B(
        \player_fsm/add_40_2/carry [3]), .YC(\player_fsm/add_40_2/carry [4]), 
        .YS(\player_fsm/N42 ) );
  HAX1 \player_fsm/add_40_2/U1_1_4  ( .A(invader_bullet_coord_y[4]), .B(
        \player_fsm/add_40_2/carry [4]), .YC(\player_fsm/add_40_2/carry [5]), 
        .YS(\player_fsm/N43 ) );
  HAX1 \player_fsm/add_40_2/U1_1_5  ( .A(invader_bullet_coord_y[5]), .B(
        \player_fsm/add_40_2/carry [5]), .YC(\player_fsm/N45 ), .YS(
        \player_fsm/N44 ) );
  FAX1 \main_game_fsm/sub_60/U2_1  ( .A(player_coord_x[1]), .B(n57), .C(
        \main_game_fsm/sub_60/carry [1]), .YC(\main_game_fsm/sub_60/carry [2]), 
        .YS(\main_game_fsm/N30 ) );
  FAX1 \main_game_fsm/sub_60/U2_2  ( .A(player_coord_x[2]), .B(n258), .C(
        \main_game_fsm/sub_60/carry [2]), .YC(\main_game_fsm/sub_60/carry [3]), 
        .YS(\main_game_fsm/N31 ) );
  FAX1 \main_game_fsm/sub_60/U2_3  ( .A(player_coord_x[3]), .B(n56), .C(
        \main_game_fsm/sub_60/carry [3]), .YC(\main_game_fsm/sub_60/carry [4]), 
        .YS(\main_game_fsm/N32 ) );
  FAX1 \main_game_fsm/sub_60/U2_4  ( .A(player_coord_x[4]), .B(n252), .C(
        \main_game_fsm/sub_60/carry [4]), .YC(\main_game_fsm/sub_60/carry [5]), 
        .YS(\main_game_fsm/N33 ) );
  FAX1 \main_game_fsm/sub_60/U2_5  ( .A(player_coord_x[5]), .B(n59), .C(
        \main_game_fsm/sub_60/carry [5]), .YC(), .YS(\main_game_fsm/N34 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_1  ( .A(invader_1_coord_x[1]), .B(n66), .C(
        \main_game_fsm/sub_60_2/carry [1]), .YC(
        \main_game_fsm/sub_60_2/carry [2]), .YS(\main_game_fsm/N36 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_2  ( .A(invader_1_coord_x[2]), .B(n67), .C(
        \main_game_fsm/sub_60_2/carry [2]), .YC(
        \main_game_fsm/sub_60_2/carry [3]), .YS(\main_game_fsm/N37 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_3  ( .A(invader_1_coord_x[3]), .B(n65), .C(
        \main_game_fsm/sub_60_2/carry [3]), .YC(
        \main_game_fsm/sub_60_2/carry [4]), .YS(\main_game_fsm/N38 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_4  ( .A(invader_1_coord_x[4]), .B(n63), .C(
        \main_game_fsm/sub_60_2/carry [4]), .YC(
        \main_game_fsm/sub_60_2/carry [5]), .YS(\main_game_fsm/N39 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_5  ( .A(invader_1_coord_x[5]), .B(n61), .C(
        \main_game_fsm/sub_60_2/carry [5]), .YC(), .YS(\main_game_fsm/N40 ) );
  FAX1 \main_game_fsm/sub_64/U2_1  ( .A(player_coord_x[1]), .B(n54), .C(
        \main_game_fsm/sub_64/carry [1]), .YC(\main_game_fsm/sub_64/carry [2]), 
        .YS(\main_game_fsm/N44 ) );
  FAX1 \main_game_fsm/sub_64/U2_2  ( .A(n68), .B(n301), .C(
        \main_game_fsm/sub_64/carry [2]), .YC(\main_game_fsm/sub_64/carry [3]), 
        .YS(\main_game_fsm/N45 ) );
  FAX1 \main_game_fsm/sub_64/U2_3  ( .A(player_coord_x[3]), .B(n53), .C(
        \main_game_fsm/sub_64/carry [3]), .YC(\main_game_fsm/sub_64/carry [4]), 
        .YS(\main_game_fsm/N46 ) );
  FAX1 \main_game_fsm/sub_64/U2_4  ( .A(n64), .B(n295), .C(
        \main_game_fsm/sub_64/carry [4]), .YC(\main_game_fsm/sub_64/carry [5]), 
        .YS(\main_game_fsm/N47 ) );
  FAX1 \main_game_fsm/sub_64/U2_5  ( .A(n896), .B(n55), .C(
        \main_game_fsm/sub_64/carry [5]), .YC(), .YS(\main_game_fsm/N48 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_1  ( .A(invader_2_coord_x[1]), .B(n66), .C(
        \main_game_fsm/sub_64_2/carry [1]), .YC(
        \main_game_fsm/sub_64_2/carry [2]), .YS(\main_game_fsm/N50 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_2  ( .A(invader_2_coord_x[2]), .B(n67), .C(
        \main_game_fsm/sub_64_2/carry [2]), .YC(
        \main_game_fsm/sub_64_2/carry [3]), .YS(\main_game_fsm/N51 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_3  ( .A(invader_2_coord_x[3]), .B(n65), .C(
        \main_game_fsm/sub_64_2/carry [3]), .YC(
        \main_game_fsm/sub_64_2/carry [4]), .YS(\main_game_fsm/N52 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_4  ( .A(invader_2_coord_x[4]), .B(n63), .C(
        \main_game_fsm/sub_64_2/carry [4]), .YC(
        \main_game_fsm/sub_64_2/carry [5]), .YS(\main_game_fsm/N53 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_5  ( .A(invader_2_coord_x[5]), .B(n61), .C(
        \main_game_fsm/sub_64_2/carry [5]), .YC(), .YS(\main_game_fsm/N54 ) );
  FAX1 \main_game_fsm/sub_68/U2_1  ( .A(player_coord_x[1]), .B(n51), .C(
        \main_game_fsm/sub_68/carry [1]), .YC(\main_game_fsm/sub_68/carry [2]), 
        .YS(\main_game_fsm/N58 ) );
  FAX1 \main_game_fsm/sub_68/U2_2  ( .A(player_coord_x[2]), .B(n344), .C(
        \main_game_fsm/sub_68/carry [2]), .YC(\main_game_fsm/sub_68/carry [3]), 
        .YS(\main_game_fsm/N59 ) );
  FAX1 \main_game_fsm/sub_68/U2_3  ( .A(player_coord_x[3]), .B(n49), .C(
        \main_game_fsm/sub_68/carry [3]), .YC(\main_game_fsm/sub_68/carry [4]), 
        .YS(\main_game_fsm/N60 ) );
  FAX1 \main_game_fsm/sub_68/U2_4  ( .A(player_coord_x[4]), .B(n348), .C(
        \main_game_fsm/sub_68/carry [4]), .YC(\main_game_fsm/sub_68/carry [5]), 
        .YS(\main_game_fsm/N61 ) );
  FAX1 \main_game_fsm/sub_68/U2_5  ( .A(player_coord_x[5]), .B(n52), .C(
        \main_game_fsm/sub_68/carry [5]), .YC(), .YS(\main_game_fsm/N62 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_1  ( .A(invader_3_coord_x[1]), .B(n66), .C(
        \main_game_fsm/sub_68_2/carry [1]), .YC(
        \main_game_fsm/sub_68_2/carry [2]), .YS(\main_game_fsm/N64 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_2  ( .A(invader_3_coord_x[2]), .B(n67), .C(
        \main_game_fsm/sub_68_2/carry [2]), .YC(
        \main_game_fsm/sub_68_2/carry [3]), .YS(\main_game_fsm/N65 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_3  ( .A(invader_3_coord_x[3]), .B(n65), .C(
        \main_game_fsm/sub_68_2/carry [3]), .YC(
        \main_game_fsm/sub_68_2/carry [4]), .YS(\main_game_fsm/N66 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_4  ( .A(invader_3_coord_x[4]), .B(n63), .C(
        \main_game_fsm/sub_68_2/carry [4]), .YC(
        \main_game_fsm/sub_68_2/carry [5]), .YS(\main_game_fsm/N67 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_5  ( .A(invader_3_coord_x[5]), .B(n61), .C(
        \main_game_fsm/sub_68_2/carry [5]), .YC(), .YS(\main_game_fsm/N68 ) );
  FAX1 \main_game_fsm/sub_72/U2_1  ( .A(player_coord_x[1]), .B(n46), .C(
        \main_game_fsm/sub_72/carry [1]), .YC(\main_game_fsm/sub_72/carry [2]), 
        .YS(\main_game_fsm/N72 ) );
  FAX1 \main_game_fsm/sub_72/U2_2  ( .A(n68), .B(n386), .C(
        \main_game_fsm/sub_72/carry [2]), .YC(\main_game_fsm/sub_72/carry [3]), 
        .YS(\main_game_fsm/N73 ) );
  FAX1 \main_game_fsm/sub_72/U2_3  ( .A(player_coord_x[3]), .B(n47), .C(
        \main_game_fsm/sub_72/carry [3]), .YC(\main_game_fsm/sub_72/carry [4]), 
        .YS(\main_game_fsm/N74 ) );
  FAX1 \main_game_fsm/sub_72/U2_4  ( .A(n64), .B(n395), .C(
        \main_game_fsm/sub_72/carry [4]), .YC(\main_game_fsm/sub_72/carry [5]), 
        .YS(\main_game_fsm/N75 ) );
  FAX1 \main_game_fsm/sub_72/U2_5  ( .A(n896), .B(n48), .C(
        \main_game_fsm/sub_72/carry [5]), .YC(), .YS(\main_game_fsm/N76 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_1  ( .A(invader_4_coord_x[1]), .B(n66), .C(
        \main_game_fsm/sub_72_2/carry [1]), .YC(
        \main_game_fsm/sub_72_2/carry [2]), .YS(\main_game_fsm/N78 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_2  ( .A(invader_4_coord_x[2]), .B(n67), .C(
        \main_game_fsm/sub_72_2/carry [2]), .YC(
        \main_game_fsm/sub_72_2/carry [3]), .YS(\main_game_fsm/N79 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_3  ( .A(invader_4_coord_x[3]), .B(n65), .C(
        \main_game_fsm/sub_72_2/carry [3]), .YC(
        \main_game_fsm/sub_72_2/carry [4]), .YS(\main_game_fsm/N80 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_4  ( .A(invader_4_coord_x[4]), .B(n63), .C(
        \main_game_fsm/sub_72_2/carry [4]), .YC(
        \main_game_fsm/sub_72_2/carry [5]), .YS(\main_game_fsm/N81 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_5  ( .A(invader_4_coord_x[5]), .B(n61), .C(
        \main_game_fsm/sub_72_2/carry [5]), .YC(), .YS(\main_game_fsm/N82 ) );
  AND2X2 U4 ( .A(\main_game_fsm/N99 ), .B(n185), .Y(n3) );
  NOR2X1 U5 ( .A(\main_game_fsm/N93 ), .B(\main_game_fsm/N99 ), .Y(n4) );
  AND2X2 U6 ( .A(n19), .B(invader_3_coord_x[4]), .Y(n5) );
  AND2X2 U7 ( .A(n18), .B(invader_4_coord_x[4]), .Y(n6) );
  AND2X2 U8 ( .A(n21), .B(invader_1_coord_x[4]), .Y(n7) );
  AND2X2 U9 ( .A(n20), .B(invader_2_coord_x[4]), .Y(n8) );
  AND2X2 U10 ( .A(n22), .B(player_bullet_coord_x[4]), .Y(n9) );
  AND2X2 U11 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(n10) );
  AND2X2 U12 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), .Y(
        n11) );
  AND2X2 U13 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(n12) );
  AND2X2 U14 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(n13) );
  AND2X2 U15 ( .A(invader_3_coord_x[1]), .B(invader_3_coord_x[2]), .Y(n14) );
  AND2X2 U16 ( .A(invader_4_coord_x[1]), .B(invader_4_coord_x[2]), .Y(n15) );
  AND2X2 U17 ( .A(n10), .B(invader_bullet_coord_x[3]), .Y(n16) );
  AND2X2 U18 ( .A(n16), .B(invader_bullet_coord_x[4]), .Y(n17) );
  AND2X2 U19 ( .A(n15), .B(invader_4_coord_x[3]), .Y(n18) );
  AND2X2 U20 ( .A(n14), .B(invader_3_coord_x[3]), .Y(n19) );
  AND2X2 U21 ( .A(n13), .B(invader_2_coord_x[3]), .Y(n20) );
  AND2X2 U22 ( .A(n12), .B(invader_1_coord_x[3]), .Y(n21) );
  AND2X2 U23 ( .A(n11), .B(player_bullet_coord_x[3]), .Y(n22) );
  AND2X2 U24 ( .A(\player_fsm/n80 ), .B(n72), .Y(n23) );
  AND2X2 U25 ( .A(n7), .B(invader_1_coord_x[5]), .Y(n24) );
  AND2X2 U26 ( .A(n8), .B(invader_2_coord_x[5]), .Y(n25) );
  AND2X2 U27 ( .A(n5), .B(invader_3_coord_x[5]), .Y(n26) );
  AND2X2 U28 ( .A(n6), .B(invader_4_coord_x[5]), .Y(n27) );
  OR2X2 U29 ( .A(\player_bullet_fsm/N22 ), .B(\player_bullet_fsm/n39 ), .Y(n28) );
  AND2X2 U30 ( .A(n17), .B(invader_bullet_coord_x[5]), .Y(n29) );
  AND2X2 U31 ( .A(n9), .B(player_bullet_coord_x[5]), .Y(n30) );
  XNOR2X1 U32 ( .A(n12), .B(invader_1_coord_x[3]), .Y(n31) );
  XNOR2X1 U33 ( .A(n13), .B(invader_2_coord_x[3]), .Y(n32) );
  XNOR2X1 U34 ( .A(n14), .B(invader_3_coord_x[3]), .Y(n33) );
  XNOR2X1 U35 ( .A(n15), .B(invader_4_coord_x[3]), .Y(n34) );
  AND2X2 U36 ( .A(\player_bullet_fsm/N26 ), .B(n114), .Y(n35) );
  AND2X2 U37 ( .A(n401), .B(n114), .Y(n36) );
  AND2X2 U38 ( .A(\player_bullet_fsm/N23 ), .B(n114), .Y(n37) );
  AND2X2 U39 ( .A(\player_bullet_fsm/N24 ), .B(n114), .Y(n38) );
  AND2X2 U40 ( .A(\player_bullet_fsm/N25 ), .B(n114), .Y(n39) );
  XNOR2X1 U41 ( .A(n16), .B(invader_bullet_coord_x[4]), .Y(n40) );
  XNOR2X1 U42 ( .A(n22), .B(player_bullet_coord_x[4]), .Y(n41) );
  INVX2 U43 ( .A(n42), .Y(n70) );
  OR2X1 U44 ( .A(n169), .B(\main_game_fsm/N99 ), .Y(n42) );
  INVX2 U45 ( .A(n43), .Y(n69) );
  INVX2 U46 ( .A(invader_direction), .Y(n152) );
  NAND2X1 U47 ( .A(\main_game_fsm/N99 ), .B(\main_game_fsm/N87 ), .Y(n43) );
  INVX2 U48 ( .A(player_bullet_coord_y[4]), .Y(n397) );
  BUFX2 U49 ( .A(n73), .Y(n77) );
  BUFX2 U50 ( .A(n73), .Y(n78) );
  BUFX2 U51 ( .A(n73), .Y(n79) );
  BUFX2 U52 ( .A(n74), .Y(n80) );
  BUFX2 U53 ( .A(n74), .Y(n81) );
  BUFX2 U54 ( .A(n74), .Y(n82) );
  BUFX2 U55 ( .A(n75), .Y(n83) );
  BUFX2 U56 ( .A(n75), .Y(n84) );
  BUFX2 U57 ( .A(n75), .Y(n85) );
  INVX2 U58 ( .A(\player_bullet_fsm/n39 ), .Y(n114) );
  INVX2 U59 ( .A(\invader_fsm_4/n69 ), .Y(n392) );
  INVX2 U60 ( .A(\invader_fsm_3/n69 ), .Y(n351) );
  INVX2 U61 ( .A(n63), .Y(n64) );
  INVX2 U62 ( .A(n61), .Y(player_coord_x[5]) );
  INVX2 U63 ( .A(n67), .Y(n68) );
  INVX2 U64 ( .A(internal_reset), .Y(n71) );
  INVX2 U65 ( .A(internal_reset), .Y(n72) );
  BUFX2 U66 ( .A(n76), .Y(n86) );
  BUFX2 U67 ( .A(clkb), .Y(n76) );
  INVX2 U68 ( .A(player_bullet_coord_y[2]), .Y(n399) );
  INVX2 U69 ( .A(player_bullet_coord_x[1]), .Y(n403) );
  INVX2 U70 ( .A(player_bullet_coord_y[1]), .Y(n400) );
  INVX2 U71 ( .A(player_bullet_coord_y[0]), .Y(n401) );
  INVX2 U72 ( .A(\invader_fsm_3/N84 ), .Y(n50) );
  INVX2 U73 ( .A(player_coord_x[3]), .Y(n65) );
  INVX2 U74 ( .A(\invader_fsm_1/N84 ), .Y(n58) );
  INVX2 U75 ( .A(player_coord_x[0]), .Y(n60) );
  INVX2 U76 ( .A(invader_4_coord_x[1]), .Y(n46) );
  INVX2 U77 ( .A(invader_2_coord_x[1]), .Y(n54) );
  INVX2 U78 ( .A(player_coord_x[1]), .Y(n66) );
  INVX2 U79 ( .A(invader_4_coord_x[3]), .Y(n47) );
  INVX2 U80 ( .A(invader_3_coord_x[3]), .Y(n49) );
  INVX2 U81 ( .A(invader_2_coord_x[3]), .Y(n53) );
  INVX2 U82 ( .A(invader_1_coord_x[3]), .Y(n56) );
  INVX2 U83 ( .A(player_bullet_coord_x[4]), .Y(n44) );
  INVX2 U84 ( .A(n896), .Y(n61) );
  INVX2 U85 ( .A(invader_3_coord_x[1]), .Y(n51) );
  INVX2 U86 ( .A(player_bullet_coord_y[5]), .Y(n45) );
  INVX2 U87 ( .A(invader_1_coord_x[1]), .Y(n57) );
  INVX2 U88 ( .A(invader_4_coord_x[5]), .Y(n48) );
  INVX2 U89 ( .A(invader_3_coord_x[5]), .Y(n52) );
  INVX2 U90 ( .A(invader_2_coord_x[5]), .Y(n55) );
  INVX2 U91 ( .A(invader_1_coord_x[5]), .Y(n59) );
  INVX2 U92 ( .A(player_coord_x[4]), .Y(n63) );
  INVX2 U93 ( .A(player_coord_x[2]), .Y(n67) );
  BUFX2 U94 ( .A(clkb), .Y(n73) );
  BUFX2 U95 ( .A(clkb), .Y(n74) );
  BUFX2 U96 ( .A(clkb), .Y(n75) );
  OR2X1 U97 ( .A(invader_4_coord_y[2]), .B(invader_4_coord_y[1]), .Y(
        \invader_fsm_4/sub_124/carry [3]) );
  XNOR2X1 U98 ( .A(invader_4_coord_y[1]), .B(invader_4_coord_y[2]), .Y(
        \invader_fsm_4/N72 ) );
  OR2X1 U99 ( .A(invader_4_coord_y[3]), .B(\invader_fsm_4/sub_124/carry [3]), 
        .Y(\invader_fsm_4/sub_124/carry [4]) );
  XNOR2X1 U100 ( .A(\invader_fsm_4/sub_124/carry [3]), .B(invader_4_coord_y[3]), .Y(\invader_fsm_4/N73 ) );
  OR2X1 U101 ( .A(invader_4_coord_y[4]), .B(\invader_fsm_4/sub_124/carry [4]), 
        .Y(\invader_fsm_4/sub_124/carry [5]) );
  XNOR2X1 U102 ( .A(\invader_fsm_4/sub_124/carry [4]), .B(invader_4_coord_y[4]), .Y(\invader_fsm_4/N74 ) );
  XNOR2X1 U103 ( .A(invader_4_coord_y[5]), .B(\invader_fsm_4/sub_124/carry [5]), .Y(\invader_fsm_4/N75 ) );
  OR2X1 U104 ( .A(invader_3_coord_y[2]), .B(invader_3_coord_y[1]), .Y(
        \invader_fsm_3/sub_124/carry [3]) );
  XNOR2X1 U105 ( .A(invader_3_coord_y[1]), .B(invader_3_coord_y[2]), .Y(
        \invader_fsm_3/N72 ) );
  OR2X1 U106 ( .A(invader_3_coord_y[3]), .B(\invader_fsm_3/sub_124/carry [3]), 
        .Y(\invader_fsm_3/sub_124/carry [4]) );
  XNOR2X1 U107 ( .A(\invader_fsm_3/sub_124/carry [3]), .B(invader_3_coord_y[3]), .Y(\invader_fsm_3/N73 ) );
  OR2X1 U108 ( .A(invader_3_coord_y[4]), .B(\invader_fsm_3/sub_124/carry [4]), 
        .Y(\invader_fsm_3/sub_124/carry [5]) );
  XNOR2X1 U109 ( .A(\invader_fsm_3/sub_124/carry [4]), .B(invader_3_coord_y[4]), .Y(\invader_fsm_3/N74 ) );
  XNOR2X1 U110 ( .A(invader_3_coord_y[5]), .B(\invader_fsm_3/sub_124/carry [5]), .Y(\invader_fsm_3/N75 ) );
  OR2X1 U111 ( .A(invader_2_coord_y[2]), .B(invader_2_coord_y[1]), .Y(
        \invader_fsm_2/sub_124/carry [3]) );
  XNOR2X1 U112 ( .A(invader_2_coord_y[1]), .B(invader_2_coord_y[2]), .Y(
        \invader_fsm_2/N72 ) );
  OR2X1 U113 ( .A(invader_2_coord_y[3]), .B(\invader_fsm_2/sub_124/carry [3]), 
        .Y(\invader_fsm_2/sub_124/carry [4]) );
  XNOR2X1 U114 ( .A(\invader_fsm_2/sub_124/carry [3]), .B(invader_2_coord_y[3]), .Y(\invader_fsm_2/N73 ) );
  OR2X1 U115 ( .A(invader_2_coord_y[4]), .B(\invader_fsm_2/sub_124/carry [4]), 
        .Y(\invader_fsm_2/sub_124/carry [5]) );
  XNOR2X1 U116 ( .A(\invader_fsm_2/sub_124/carry [4]), .B(invader_2_coord_y[4]), .Y(\invader_fsm_2/N74 ) );
  XNOR2X1 U117 ( .A(invader_2_coord_y[5]), .B(\invader_fsm_2/sub_124/carry [5]), .Y(\invader_fsm_2/N75 ) );
  OR2X1 U118 ( .A(invader_1_coord_y[2]), .B(invader_1_coord_y[1]), .Y(
        \invader_fsm_1/sub_124/carry [3]) );
  XNOR2X1 U119 ( .A(invader_1_coord_y[1]), .B(invader_1_coord_y[2]), .Y(
        \invader_fsm_1/N72 ) );
  OR2X1 U120 ( .A(invader_1_coord_y[3]), .B(\invader_fsm_1/sub_124/carry [3]), 
        .Y(\invader_fsm_1/sub_124/carry [4]) );
  XNOR2X1 U121 ( .A(\invader_fsm_1/sub_124/carry [3]), .B(invader_1_coord_y[3]), .Y(\invader_fsm_1/N73 ) );
  OR2X1 U122 ( .A(invader_1_coord_y[4]), .B(\invader_fsm_1/sub_124/carry [4]), 
        .Y(\invader_fsm_1/sub_124/carry [5]) );
  XNOR2X1 U123 ( .A(\invader_fsm_1/sub_124/carry [4]), .B(invader_1_coord_y[4]), .Y(\invader_fsm_1/N74 ) );
  XNOR2X1 U124 ( .A(invader_1_coord_y[5]), .B(\invader_fsm_1/sub_124/carry [5]), .Y(\invader_fsm_1/N75 ) );
  OR2X1 U125 ( .A(player_coord_x[0]), .B(n58), .Y(
        \main_game_fsm/sub_60/carry [1]) );
  XNOR2X1 U126 ( .A(n58), .B(player_coord_x[0]), .Y(\main_game_fsm/N29 ) );
  OR2X1 U127 ( .A(\invader_fsm_1/N84 ), .B(n60), .Y(
        \main_game_fsm/sub_60_2/carry [1]) );
  XNOR2X1 U128 ( .A(n60), .B(\invader_fsm_1/N84 ), .Y(\main_game_fsm/N35 ) );
  OR2X1 U129 ( .A(player_coord_x[0]), .B(n308), .Y(
        \main_game_fsm/sub_64/carry [1]) );
  XNOR2X1 U130 ( .A(n308), .B(player_coord_x[0]), .Y(\main_game_fsm/N43 ) );
  OR2X1 U131 ( .A(\invader_fsm_2/N84 ), .B(n60), .Y(
        \main_game_fsm/sub_64_2/carry [1]) );
  XNOR2X1 U132 ( .A(n60), .B(\invader_fsm_2/N84 ), .Y(\main_game_fsm/N49 ) );
  OR2X1 U133 ( .A(player_coord_x[0]), .B(n50), .Y(
        \main_game_fsm/sub_68/carry [1]) );
  XNOR2X1 U134 ( .A(n50), .B(player_coord_x[0]), .Y(\main_game_fsm/N57 ) );
  OR2X1 U135 ( .A(\invader_fsm_3/N84 ), .B(n60), .Y(
        \main_game_fsm/sub_68_2/carry [1]) );
  XNOR2X1 U136 ( .A(n60), .B(\invader_fsm_3/N84 ), .Y(\main_game_fsm/N63 ) );
  OR2X1 U137 ( .A(player_coord_x[0]), .B(n390), .Y(
        \main_game_fsm/sub_72/carry [1]) );
  XNOR2X1 U138 ( .A(n390), .B(player_coord_x[0]), .Y(\main_game_fsm/N71 ) );
  OR2X1 U139 ( .A(\invader_fsm_4/N84 ), .B(n60), .Y(
        \main_game_fsm/sub_72_2/carry [1]) );
  XNOR2X1 U140 ( .A(n60), .B(\invader_fsm_4/N84 ), .Y(\main_game_fsm/N77 ) );
  XOR2X1 U141 ( .A(invader_4_coord_x[1]), .B(invader_4_coord_x[2]), .Y(
        \invader_fsm_4/N86 ) );
  XOR2X1 U142 ( .A(n18), .B(invader_4_coord_x[4]), .Y(\invader_fsm_4/N88 ) );
  XOR2X1 U143 ( .A(n6), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N89 ) );
  XOR2X1 U144 ( .A(invader_3_coord_x[1]), .B(invader_3_coord_x[2]), .Y(
        \invader_fsm_3/N86 ) );
  XOR2X1 U145 ( .A(n19), .B(invader_3_coord_x[4]), .Y(\invader_fsm_3/N88 ) );
  XOR2X1 U146 ( .A(n5), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N89 ) );
  XOR2X1 U147 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(
        \invader_fsm_2/N86 ) );
  XOR2X1 U148 ( .A(n20), .B(invader_2_coord_x[4]), .Y(\invader_fsm_2/N88 ) );
  XOR2X1 U149 ( .A(n8), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N89 ) );
  XOR2X1 U150 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(
        \invader_fsm_1/N86 ) );
  XOR2X1 U151 ( .A(n21), .B(invader_1_coord_x[4]), .Y(\invader_fsm_1/N88 ) );
  XOR2X1 U152 ( .A(n7), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N89 ) );
  XOR2X1 U153 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(\shield_fsm/N21 ) );
  XOR2X1 U154 ( .A(n10), .B(invader_bullet_coord_x[3]), .Y(\shield_fsm/N22 )
         );
  XOR2X1 U155 ( .A(n17), .B(invader_bullet_coord_x[5]), .Y(\shield_fsm/N24 )
         );
  XOR2X1 U156 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), 
        .Y(\shield_fsm/N37 ) );
  XOR2X1 U157 ( .A(n11), .B(player_bullet_coord_x[3]), .Y(\shield_fsm/N38 ) );
  XOR2X1 U158 ( .A(n9), .B(player_bullet_coord_x[5]), .Y(\shield_fsm/N40 ) );
  AND2X2 U159 ( .A(n426), .B(n425), .Y(\main_game_fsm/N111 ) );
  AND2X2 U160 ( .A(n522), .B(n521), .Y(\player_fsm/N37 ) );
  AND2X2 U161 ( .A(n554), .B(n567), .Y(n555) );
  AND2X2 U162 ( .A(n558), .B(n573), .Y(n559) );
  AND2X2 U163 ( .A(player_coord_x[3]), .B(n68), .Y(n576) );
  AND2X2 U164 ( .A(n403), .B(\shield_fsm/N35 ), .Y(n577) );
  AND2X2 U165 ( .A(n581), .B(n580), .Y(\shield_fsm/N34 ) );
  AND2X2 U166 ( .A(n412), .B(\shield_fsm/N19 ), .Y(n582) );
  AND2X2 U167 ( .A(n586), .B(n585), .Y(\shield_fsm/N18 ) );
  AND2X2 U168 ( .A(n895), .B(n894), .Y(\invader_bullet_fsm/N13 ) );
  INVX2 U169 ( .A(\main_game_fsm/n99 ), .Y(n87) );
  INVX2 U170 ( .A(\main_game_fsm/n90 ), .Y(n88) );
  INVX2 U171 ( .A(\main_game_fsm/n95 ), .Y(n89) );
  INVX2 U172 ( .A(\main_game_fsm/n96 ), .Y(n90) );
  INVX2 U173 ( .A(\main_game_fsm/n94 ), .Y(n91) );
  INVX2 U174 ( .A(\main_game_fsm/n98 ), .Y(n92) );
  INVX2 U175 ( .A(reset), .Y(n93) );
  INVX2 U176 ( .A(player_shoot_input), .Y(n94) );
  INVX2 U177 ( .A(\invader_bullet_fsm/n36 ), .Y(n95) );
  INVX2 U178 ( .A(\invader_bullet_fsm/n35 ), .Y(n96) );
  INVX2 U179 ( .A(\invader_bullet_fsm/n34 ), .Y(n97) );
  INVX2 U180 ( .A(\invader_bullet_fsm/n33 ), .Y(n98) );
  INVX2 U181 ( .A(\invader_bullet_fsm/n32 ), .Y(n99) );
  INVX2 U182 ( .A(\invader_bullet_fsm/n30 ), .Y(n100) );
  INVX2 U183 ( .A(\invader_bullet_fsm/n21 ), .Y(n101) );
  INVX2 U184 ( .A(\invader_bullet_fsm/n24 ), .Y(n102) );
  INVX2 U185 ( .A(\invader_bullet_fsm/n25 ), .Y(n103) );
  INVX2 U186 ( .A(\invader_bullet_fsm/n26 ), .Y(n104) );
  INVX2 U187 ( .A(\invader_bullet_fsm/n27 ), .Y(n105) );
  INVX2 U188 ( .A(\invader_bullet_fsm/n28 ), .Y(n106) );
  INVX2 U189 ( .A(\invader_bullet_fsm/n29 ), .Y(n107) );
  INVX2 U190 ( .A(\player_bullet_fsm/n32 ), .Y(n108) );
  INVX2 U191 ( .A(\player_bullet_fsm/n34 ), .Y(n109) );
  INVX2 U192 ( .A(\player_bullet_fsm/n35 ), .Y(n110) );
  INVX2 U193 ( .A(\player_bullet_fsm/n36 ), .Y(n111) );
  INVX2 U194 ( .A(\player_bullet_fsm/n37 ), .Y(n112) );
  INVX2 U195 ( .A(\player_bullet_fsm/n38 ), .Y(n113) );
  INVX2 U196 ( .A(\invader_fsm_4/n83 ), .Y(n115) );
  INVX2 U197 ( .A(\invader_fsm_4/n79 ), .Y(n116) );
  INVX2 U198 ( .A(\invader_fsm_4/n74 ), .Y(n117) );
  INVX2 U199 ( .A(\invader_fsm_4/n81 ), .Y(n118) );
  INVX2 U200 ( .A(\invader_fsm_4/n75 ), .Y(n119) );
  INVX2 U201 ( .A(\invader_fsm_4/n73 ), .Y(n120) );
  INVX2 U202 ( .A(\invader_fsm_4/n58 ), .Y(n121) );
  INVX2 U203 ( .A(\invader_fsm_4/n77 ), .Y(n122) );
  INVX2 U204 ( .A(\invader_fsm_3/n92 ), .Y(n123) );
  INVX2 U205 ( .A(\invader_fsm_3/n79 ), .Y(n124) );
  INVX2 U206 ( .A(\invader_fsm_3/n74 ), .Y(n125) );
  INVX2 U207 ( .A(\invader_fsm_3/n81 ), .Y(n126) );
  INVX2 U208 ( .A(\invader_fsm_3/n75 ), .Y(n127) );
  INVX2 U209 ( .A(\invader_fsm_3/n73 ), .Y(n128) );
  INVX2 U210 ( .A(\invader_fsm_3/n58 ), .Y(n129) );
  INVX2 U211 ( .A(\invader_fsm_3/n77 ), .Y(n130) );
  INVX2 U212 ( .A(\invader_fsm_2/n79 ), .Y(n131) );
  INVX2 U213 ( .A(\invader_fsm_2/n73 ), .Y(n132) );
  INVX2 U214 ( .A(\invader_fsm_2/n81 ), .Y(n133) );
  INVX2 U215 ( .A(\invader_fsm_2/n74 ), .Y(n134) );
  INVX2 U216 ( .A(\invader_fsm_2/n72 ), .Y(n135) );
  INVX2 U217 ( .A(\invader_fsm_2/n57 ), .Y(n136) );
  INVX2 U218 ( .A(\invader_fsm_1/n90 ), .Y(n137) );
  INVX2 U219 ( .A(\invader_fsm_1/n73 ), .Y(n138) );
  INVX2 U220 ( .A(\invader_fsm_1/n86 ), .Y(n139) );
  INVX2 U221 ( .A(\invader_fsm_1/n74 ), .Y(n140) );
  INVX2 U222 ( .A(\invader_fsm_1/n72 ), .Y(n141) );
  INVX2 U223 ( .A(\invader_fsm_1/n57 ), .Y(n142) );
  INVX2 U224 ( .A(\shield_fsm/N102 ), .Y(n143) );
  INVX2 U225 ( .A(\player_fsm/n56 ), .Y(n144) );
  INVX2 U226 ( .A(\player_fsm/n70 ), .Y(n145) );
  INVX2 U227 ( .A(\shield_fsm/N97 ), .Y(n146) );
  INVX2 U228 ( .A(\player_fsm/n71 ), .Y(n147) );
  INVX2 U229 ( .A(\player_fsm/n64 ), .Y(n148) );
  INVX2 U230 ( .A(player_right_motion), .Y(n149) );
  INVX2 U231 ( .A(\player_fsm/n65 ), .Y(n150) );
  INVX2 U232 ( .A(player_left_motion), .Y(n151) );
  INVX2 U233 ( .A(move_down), .Y(n153) );
  INVX2 U234 ( .A(\invader_fsm_2/n85 ), .Y(n154) );
  INVX2 U235 ( .A(\invader_fsm_1/n81 ), .Y(n155) );
  INVX2 U236 ( .A(invader_fire), .Y(n156) );
  INVX2 U237 ( .A(\main_game_fsm/next_state [1]), .Y(n157) );
  INVX2 U238 ( .A(\main_game_fsm/n172 ), .Y(n158) );
  INVX2 U239 ( .A(\main_game_fsm/prev_invader_outofbounds ), .Y(n159) );
  INVX2 U240 ( .A(\main_game_fsm/next_state [0]), .Y(n160) );
  INVX2 U241 ( .A(\main_game_fsm/state[0] ), .Y(n161) );
  INVX2 U242 ( .A(\main_game_fsm/n112 ), .Y(n162) );
  INVX2 U243 ( .A(n434), .Y(n163) );
  INVX2 U244 ( .A(\main_game_fsm/n110 ), .Y(n164) );
  INVX2 U245 ( .A(n430), .Y(n165) );
  INVX2 U246 ( .A(\main_game_fsm/n108 ), .Y(n166) );
  INVX2 U247 ( .A(n438), .Y(n167) );
  INVX2 U248 ( .A(\main_game_fsm/n107 ), .Y(n168) );
  INVX2 U249 ( .A(\main_game_fsm/N93 ), .Y(n169) );
  INVX2 U250 ( .A(n450), .Y(n170) );
  INVX2 U251 ( .A(n446), .Y(n171) );
  INVX2 U252 ( .A(n442), .Y(n172) );
  INVX2 U253 ( .A(\main_game_fsm/diff_alive4 [3]), .Y(n173) );
  INVX2 U254 ( .A(\main_game_fsm/diff_alive4 [1]), .Y(n174) );
  INVX2 U255 ( .A(\main_game_fsm/N69 ), .Y(n175) );
  INVX2 U256 ( .A(n458), .Y(n176) );
  INVX2 U257 ( .A(\main_game_fsm/diff_alive3 [5]), .Y(n177) );
  INVX2 U258 ( .A(\main_game_fsm/diff_alive3 [4]), .Y(n178) );
  INVX2 U259 ( .A(\main_game_fsm/diff_alive3 [2]), .Y(n179) );
  INVX2 U260 ( .A(\main_game_fsm/N55 ), .Y(n180) );
  INVX2 U261 ( .A(n470), .Y(n181) );
  INVX2 U262 ( .A(\main_game_fsm/n118 ), .Y(n182) );
  INVX2 U263 ( .A(\main_game_fsm/n117 ), .Y(n183) );
  INVX2 U264 ( .A(\main_game_fsm/n115 ), .Y(n184) );
  INVX2 U265 ( .A(\main_game_fsm/N87 ), .Y(n185) );
  INVX2 U266 ( .A(n486), .Y(n186) );
  INVX2 U267 ( .A(n482), .Y(n187) );
  INVX2 U268 ( .A(n478), .Y(n188) );
  INVX2 U269 ( .A(\main_game_fsm/diff_alive2 [3]), .Y(n189) );
  INVX2 U270 ( .A(\main_game_fsm/diff_alive2 [1]), .Y(n190) );
  INVX2 U271 ( .A(\main_game_fsm/N41 ), .Y(n191) );
  INVX2 U272 ( .A(n494), .Y(n192) );
  INVX2 U273 ( .A(\main_game_fsm/diff_alive1 [5]), .Y(n193) );
  INVX2 U274 ( .A(\main_game_fsm/diff_alive1 [4]), .Y(n194) );
  INVX2 U275 ( .A(\main_game_fsm/diff_alive1 [2]), .Y(n195) );
  INVX2 U276 ( .A(\main_game_fsm/N27 ), .Y(n196) );
  INVX2 U277 ( .A(n506), .Y(n197) );
  INVX2 U278 ( .A(n512), .Y(n198) );
  INVX2 U279 ( .A(n529), .Y(n199) );
  INVX2 U280 ( .A(\player_fsm/N18 ), .Y(n200) );
  INVX2 U281 ( .A(\player_fsm/N17 ), .Y(n201) );
  INVX2 U282 ( .A(n542), .Y(n202) );
  INVX2 U283 ( .A(n538), .Y(n203) );
  INVX2 U284 ( .A(\player_fsm/N15 ), .Y(n204) );
  INVX2 U285 ( .A(\player_fsm/N13 ), .Y(n205) );
  INVX2 U286 ( .A(n454), .Y(n206) );
  INVX2 U287 ( .A(n466), .Y(n207) );
  INVX2 U288 ( .A(n490), .Y(n208) );
  INVX2 U289 ( .A(n502), .Y(n209) );
  INVX2 U290 ( .A(n525), .Y(n210) );
  INVX2 U291 ( .A(n569), .Y(n211) );
  INVX2 U292 ( .A(n462), .Y(n212) );
  INVX2 U293 ( .A(n474), .Y(n213) );
  INVX2 U294 ( .A(n498), .Y(n214) );
  INVX2 U295 ( .A(n510), .Y(n215) );
  INVX2 U296 ( .A(n575), .Y(n216) );
  INVX2 U297 ( .A(n552), .Y(n217) );
  INVX2 U298 ( .A(n563), .Y(n218) );
  INVX2 U299 ( .A(\player_fsm/next_state [1]), .Y(n219) );
  INVX2 U300 ( .A(\player_fsm/state[0] ), .Y(n220) );
  INVX2 U301 ( .A(\player_fsm/next_state [0]), .Y(n221) );
  INVX2 U302 ( .A(shield_display), .Y(n222) );
  INVX2 U303 ( .A(\shield_fsm/state[0] ), .Y(n223) );
  INVX2 U304 ( .A(\shield_fsm/next_state [1]), .Y(n224) );
  INVX2 U305 ( .A(\shield_fsm/next_state [0]), .Y(n225) );
  INVX2 U306 ( .A(shield_hp[1]), .Y(n226) );
  INVX2 U307 ( .A(shield_hp[0]), .Y(n227) );
  INVX2 U308 ( .A(\invader_fsm_1/n96 ), .Y(n228) );
  INVX2 U309 ( .A(\invader_fsm_1/N34 ), .Y(n229) );
  INVX2 U310 ( .A(\invader_fsm_1/N33 ), .Y(n230) );
  INVX2 U311 ( .A(invader_1_coord_y[5]), .Y(n231) );
  INVX2 U312 ( .A(\invader_fsm_1/N40 ), .Y(n232) );
  INVX2 U313 ( .A(invader_1_coord_y[4]), .Y(n233) );
  INVX2 U314 ( .A(n604), .Y(n234) );
  INVX2 U315 ( .A(n600), .Y(n235) );
  INVX2 U316 ( .A(n611), .Y(n236) );
  INVX2 U317 ( .A(n621), .Y(n237) );
  INVX2 U318 ( .A(n617), .Y(n238) );
  INVX2 U319 ( .A(\invader_fsm_1/N31 ), .Y(n239) );
  INVX2 U320 ( .A(\invader_fsm_1/N38 ), .Y(n240) );
  INVX2 U321 ( .A(invader_1_coord_y[2]), .Y(n241) );
  INVX2 U322 ( .A(invader_1_coord_y[1]), .Y(n242) );
  INVX2 U323 ( .A(n599), .Y(n243) );
  INVX2 U324 ( .A(n608), .Y(n244) );
  INVX2 U325 ( .A(\invader_fsm_1/N29 ), .Y(n245) );
  INVX2 U326 ( .A(\invader_fsm_1/N70 ), .Y(n246) );
  INVX2 U327 ( .A(n589), .Y(n247) );
  INVX2 U328 ( .A(n660), .Y(n248) );
  INVX2 U329 ( .A(\invader_fsm_1/N18 ), .Y(n249) );
  INVX2 U330 ( .A(\invader_fsm_1/N17 ), .Y(n250) );
  INVX2 U331 ( .A(\invader_fsm_1/N24 ), .Y(n251) );
  INVX2 U332 ( .A(invader_1_coord_x[4]), .Y(n252) );
  INVX2 U333 ( .A(\invader_fsm_1/N16 ), .Y(n253) );
  INVX2 U334 ( .A(n637), .Y(n254) );
  INVX2 U335 ( .A(\invader_fsm_1/N22 ), .Y(n255) );
  INVX2 U336 ( .A(n633), .Y(n256) );
  INVX2 U337 ( .A(n657), .Y(n257) );
  INVX2 U338 ( .A(invader_1_coord_x[2]), .Y(n258) );
  INVX2 U339 ( .A(n647), .Y(n259) );
  INVX2 U340 ( .A(n643), .Y(n260) );
  INVX2 U341 ( .A(\invader_fsm_1/N15 ), .Y(n261) );
  INVX2 U342 ( .A(\invader_fsm_1/N13 ), .Y(n262) );
  INVX2 U343 ( .A(n632), .Y(n263) );
  INVX2 U344 ( .A(n654), .Y(n264) );
  INVX2 U345 ( .A(\invader_fsm_1/state[1] ), .Y(n265) );
  INVX2 U346 ( .A(\invader_fsm_1/n69 ), .Y(n266) );
  INVX2 U347 ( .A(\invader_fsm_1/n68 ), .Y(n267) );
  INVX2 U348 ( .A(\invader_fsm_1/state[0] ), .Y(n268) );
  INVX2 U349 ( .A(\invader_fsm_1/next_state [0]), .Y(n269) );
  INVX2 U350 ( .A(\invader_fsm_2/n96 ), .Y(n270) );
  INVX2 U351 ( .A(\invader_fsm_2/N34 ), .Y(n271) );
  INVX2 U352 ( .A(\invader_fsm_2/N33 ), .Y(n272) );
  INVX2 U353 ( .A(invader_2_coord_y[5]), .Y(n273) );
  INVX2 U354 ( .A(\invader_fsm_2/N40 ), .Y(n274) );
  INVX2 U355 ( .A(invader_2_coord_y[4]), .Y(n275) );
  INVX2 U356 ( .A(n678), .Y(n276) );
  INVX2 U357 ( .A(n674), .Y(n277) );
  INVX2 U358 ( .A(n685), .Y(n278) );
  INVX2 U359 ( .A(n695), .Y(n279) );
  INVX2 U360 ( .A(n691), .Y(n280) );
  INVX2 U361 ( .A(\invader_fsm_2/N31 ), .Y(n281) );
  INVX2 U362 ( .A(\invader_fsm_2/N38 ), .Y(n282) );
  INVX2 U363 ( .A(invader_2_coord_y[2]), .Y(n283) );
  INVX2 U364 ( .A(invader_2_coord_y[1]), .Y(n284) );
  INVX2 U365 ( .A(n673), .Y(n285) );
  INVX2 U366 ( .A(n682), .Y(n286) );
  INVX2 U367 ( .A(\invader_fsm_2/N29 ), .Y(n287) );
  INVX2 U368 ( .A(\invader_fsm_2/N70 ), .Y(n288) );
  INVX2 U369 ( .A(\invader_fsm_2/state[1] ), .Y(n289) );
  INVX2 U370 ( .A(n663), .Y(n290) );
  INVX2 U371 ( .A(n734), .Y(n291) );
  INVX2 U372 ( .A(\invader_fsm_2/N18 ), .Y(n292) );
  INVX2 U373 ( .A(\invader_fsm_2/N17 ), .Y(n293) );
  INVX2 U374 ( .A(\invader_fsm_2/N24 ), .Y(n294) );
  INVX2 U375 ( .A(invader_2_coord_x[4]), .Y(n295) );
  INVX2 U376 ( .A(\invader_fsm_2/N16 ), .Y(n296) );
  INVX2 U377 ( .A(n711), .Y(n297) );
  INVX2 U378 ( .A(\invader_fsm_2/N22 ), .Y(n298) );
  INVX2 U379 ( .A(n707), .Y(n299) );
  INVX2 U380 ( .A(n731), .Y(n300) );
  INVX2 U381 ( .A(invader_2_coord_x[2]), .Y(n301) );
  INVX2 U382 ( .A(n721), .Y(n302) );
  INVX2 U383 ( .A(n717), .Y(n303) );
  INVX2 U384 ( .A(\invader_fsm_2/N15 ), .Y(n304) );
  INVX2 U385 ( .A(\invader_fsm_2/N13 ), .Y(n305) );
  INVX2 U386 ( .A(n706), .Y(n306) );
  INVX2 U387 ( .A(n728), .Y(n307) );
  INVX2 U388 ( .A(\invader_fsm_2/N84 ), .Y(n308) );
  INVX2 U389 ( .A(\invader_fsm_2/n69 ), .Y(n309) );
  INVX2 U390 ( .A(\invader_fsm_2/n68 ), .Y(n310) );
  INVX2 U391 ( .A(\invader_fsm_2/state[0] ), .Y(n311) );
  INVX2 U392 ( .A(\invader_fsm_2/next_state [0]), .Y(n312) );
  INVX2 U393 ( .A(\invader_fsm_3/n98 ), .Y(n313) );
  INVX2 U394 ( .A(\invader_fsm_3/N34 ), .Y(n314) );
  INVX2 U395 ( .A(\invader_fsm_3/N33 ), .Y(n315) );
  INVX2 U396 ( .A(invader_3_coord_y[5]), .Y(n316) );
  INVX2 U397 ( .A(\invader_fsm_3/N40 ), .Y(n317) );
  INVX2 U398 ( .A(invader_3_coord_y[4]), .Y(n318) );
  INVX2 U399 ( .A(n752), .Y(n319) );
  INVX2 U400 ( .A(n748), .Y(n320) );
  INVX2 U401 ( .A(n759), .Y(n321) );
  INVX2 U402 ( .A(n769), .Y(n322) );
  INVX2 U403 ( .A(n765), .Y(n323) );
  INVX2 U404 ( .A(\invader_fsm_3/N31 ), .Y(n324) );
  INVX2 U405 ( .A(\invader_fsm_3/N38 ), .Y(n325) );
  INVX2 U406 ( .A(invader_3_coord_y[2]), .Y(n326) );
  INVX2 U407 ( .A(invader_3_coord_y[1]), .Y(n327) );
  INVX2 U408 ( .A(n747), .Y(n328) );
  INVX2 U409 ( .A(n756), .Y(n329) );
  INVX2 U410 ( .A(\invader_fsm_3/N29 ), .Y(n330) );
  INVX2 U411 ( .A(\invader_fsm_3/N70 ), .Y(n331) );
  INVX2 U412 ( .A(n737), .Y(n332) );
  INVX2 U413 ( .A(n808), .Y(n333) );
  INVX2 U414 ( .A(\invader_fsm_3/N18 ), .Y(n334) );
  INVX2 U415 ( .A(\invader_fsm_3/N17 ), .Y(n335) );
  INVX2 U416 ( .A(n785), .Y(n336) );
  INVX2 U417 ( .A(\invader_fsm_3/N22 ), .Y(n337) );
  INVX2 U418 ( .A(n781), .Y(n338) );
  INVX2 U419 ( .A(n805), .Y(n339) );
  INVX2 U420 ( .A(\invader_fsm_3/N24 ), .Y(n340) );
  INVX2 U421 ( .A(n795), .Y(n341) );
  INVX2 U422 ( .A(n791), .Y(n342) );
  INVX2 U423 ( .A(\invader_fsm_3/N15 ), .Y(n343) );
  INVX2 U424 ( .A(invader_3_coord_x[2]), .Y(n344) );
  INVX2 U425 ( .A(n780), .Y(n345) );
  INVX2 U426 ( .A(n802), .Y(n346) );
  INVX2 U427 ( .A(\invader_fsm_3/N13 ), .Y(n347) );
  INVX2 U428 ( .A(invader_3_coord_x[4]), .Y(n348) );
  INVX2 U429 ( .A(\invader_fsm_3/state[1] ), .Y(n349) );
  INVX2 U430 ( .A(\invader_fsm_3/n70 ), .Y(n350) );
  INVX2 U431 ( .A(\invader_fsm_3/state[0] ), .Y(n352) );
  INVX2 U432 ( .A(\invader_fsm_3/next_state [0]), .Y(n353) );
  INVX2 U433 ( .A(\invader_fsm_4/n98 ), .Y(n354) );
  INVX2 U434 ( .A(\invader_fsm_4/N34 ), .Y(n355) );
  INVX2 U435 ( .A(\invader_fsm_4/N33 ), .Y(n356) );
  INVX2 U436 ( .A(invader_4_coord_y[5]), .Y(n357) );
  INVX2 U437 ( .A(\invader_fsm_4/N40 ), .Y(n358) );
  INVX2 U438 ( .A(invader_4_coord_y[4]), .Y(n359) );
  INVX2 U439 ( .A(n826), .Y(n360) );
  INVX2 U440 ( .A(n822), .Y(n361) );
  INVX2 U441 ( .A(n833), .Y(n362) );
  INVX2 U442 ( .A(n843), .Y(n363) );
  INVX2 U443 ( .A(n839), .Y(n364) );
  INVX2 U444 ( .A(\invader_fsm_4/N31 ), .Y(n365) );
  INVX2 U445 ( .A(\invader_fsm_4/N38 ), .Y(n366) );
  INVX2 U446 ( .A(invader_4_coord_y[2]), .Y(n367) );
  INVX2 U447 ( .A(invader_4_coord_y[1]), .Y(n368) );
  INVX2 U448 ( .A(n821), .Y(n369) );
  INVX2 U449 ( .A(n830), .Y(n370) );
  INVX2 U450 ( .A(\invader_fsm_4/N29 ), .Y(n371) );
  INVX2 U451 ( .A(\invader_fsm_4/N70 ), .Y(n372) );
  INVX2 U452 ( .A(\invader_fsm_4/state[1] ), .Y(n373) );
  INVX2 U453 ( .A(n811), .Y(n374) );
  INVX2 U454 ( .A(n882), .Y(n375) );
  INVX2 U455 ( .A(\invader_fsm_4/N18 ), .Y(n376) );
  INVX2 U456 ( .A(\invader_fsm_4/N17 ), .Y(n377) );
  INVX2 U457 ( .A(n859), .Y(n378) );
  INVX2 U458 ( .A(n855), .Y(n379) );
  INVX2 U459 ( .A(n879), .Y(n380) );
  INVX2 U460 ( .A(\invader_fsm_4/N24 ), .Y(n381) );
  INVX2 U461 ( .A(n869), .Y(n382) );
  INVX2 U462 ( .A(n865), .Y(n383) );
  INVX2 U463 ( .A(\invader_fsm_4/N15 ), .Y(n384) );
  INVX2 U464 ( .A(\invader_fsm_4/N22 ), .Y(n385) );
  INVX2 U465 ( .A(invader_4_coord_x[2]), .Y(n386) );
  INVX2 U466 ( .A(\invader_fsm_4/N13 ), .Y(n387) );
  INVX2 U467 ( .A(n854), .Y(n388) );
  INVX2 U468 ( .A(n876), .Y(n389) );
  INVX2 U469 ( .A(\invader_fsm_4/N84 ), .Y(n390) );
  INVX2 U470 ( .A(\invader_fsm_4/n70 ), .Y(n391) );
  INVX2 U471 ( .A(\invader_fsm_4/state[0] ), .Y(n393) );
  INVX2 U472 ( .A(\invader_fsm_4/next_state [0]), .Y(n394) );
  INVX2 U473 ( .A(invader_4_coord_x[4]), .Y(n395) );
  INVX2 U474 ( .A(n886), .Y(n396) );
  INVX2 U475 ( .A(player_bullet_coord_y[3]), .Y(n398) );
  INVX2 U476 ( .A(\shield_fsm/N35 ), .Y(n402) );
  INVX2 U477 ( .A(player_bullet_coord_x[2]), .Y(n404) );
  INVX2 U478 ( .A(player_bullet_coord_x[3]), .Y(n405) );
  INVX2 U479 ( .A(\player_bullet_fsm/state[0] ), .Y(n406) );
  INVX2 U480 ( .A(\player_fsm/N27 ), .Y(n407) );
  INVX2 U481 ( .A(\player_fsm/N26 ), .Y(n408) );
  INVX2 U482 ( .A(\player_fsm/N24 ), .Y(n409) );
  INVX2 U483 ( .A(\player_fsm/N22 ), .Y(n410) );
  INVX2 U484 ( .A(\shield_fsm/n67 ), .Y(n411) );
  INVX2 U485 ( .A(invader_bullet_coord_x[1]), .Y(n412) );
  INVX2 U486 ( .A(invader_bullet_coord_x[2]), .Y(n413) );
  INVX2 U487 ( .A(invader_bullet_coord_x[3]), .Y(n414) );
  INVX2 U488 ( .A(invader_bullet_coord_x[4]), .Y(n415) );
  INVX2 U489 ( .A(invader_bullet_coord_x[5]), .Y(n416) );
  INVX2 U490 ( .A(\shield_fsm/N19 ), .Y(n417) );
  INVX2 U491 ( .A(invader_bullet_coord_y[3]), .Y(n418) );
  INVX2 U492 ( .A(n888), .Y(n419) );
  INVX2 U493 ( .A(invader_bullet_coord_y[2]), .Y(n420) );
  INVX2 U494 ( .A(\player_fsm/N40 ), .Y(n421) );
  INVX2 U495 ( .A(invader_bullet_coord_y[1]), .Y(n422) );
  INVX2 U496 ( .A(invader_bullet_coord_y[0]), .Y(n423) );
  INVX2 U497 ( .A(\invader_bullet_fsm/state[0] ), .Y(n424) );
  AOI21X1 U498 ( .A(closest_invader_coord_y[2]), .B(closest_invader_coord_y[1]), .C(closest_invader_coord_y[3]), .Y(n426) );
  NOR2X1 U499 ( .A(closest_invader_coord_y[5]), .B(closest_invader_coord_y[4]), 
        .Y(n425) );
  NOR2X1 U500 ( .A(\main_game_fsm/n113 ), .B(n168), .Y(n438) );
  AOI22X1 U501 ( .A(n166), .B(\main_game_fsm/n114 ), .C(n168), .D(
        \main_game_fsm/n113 ), .Y(n437) );
  OAI21X1 U502 ( .A(n166), .B(\main_game_fsm/n114 ), .C(n167), .Y(n436) );
  NAND2X1 U503 ( .A(n184), .B(\main_game_fsm/n109 ), .Y(n430) );
  NAND3X1 U504 ( .A(n430), .B(\main_game_fsm/n116 ), .C(n164), .Y(n427) );
  OAI21X1 U505 ( .A(n184), .B(\main_game_fsm/n109 ), .C(n427), .Y(n434) );
  AOI21X1 U506 ( .A(n183), .B(\main_game_fsm/n111 ), .C(n182), .Y(n428) );
  NAND2X1 U507 ( .A(n428), .B(n162), .Y(n429) );
  OAI21X1 U508 ( .A(n183), .B(\main_game_fsm/n111 ), .C(n429), .Y(n433) );
  NOR2X1 U509 ( .A(n164), .B(\main_game_fsm/n116 ), .Y(n431) );
  OAI21X1 U510 ( .A(n165), .B(n431), .C(n163), .Y(n432) );
  OAI21X1 U511 ( .A(n434), .B(n433), .C(n432), .Y(n435) );
  OAI22X1 U512 ( .A(n438), .B(n437), .C(n436), .D(n435), .Y(
        \main_game_fsm/N99 ) );
  NOR2X1 U513 ( .A(n177), .B(\main_game_fsm/diff_alive4 [5]), .Y(n450) );
  AOI22X1 U514 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n178), .C(
        \main_game_fsm/diff_alive4 [5]), .D(n177), .Y(n449) );
  OAI21X1 U515 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n178), .C(n170), .Y(
        n448) );
  NAND2X1 U516 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n173), .Y(n442) );
  NAND3X1 U517 ( .A(n442), .B(n179), .C(\main_game_fsm/diff_alive4 [2]), .Y(
        n439) );
  OAI21X1 U518 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n173), .C(n439), .Y(
        n446) );
  AOI21X1 U519 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n174), .C(
        \main_game_fsm/diff_alive3 [0]), .Y(n440) );
  NAND2X1 U520 ( .A(n440), .B(\main_game_fsm/diff_alive4 [0]), .Y(n441) );
  OAI21X1 U521 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n174), .C(n441), .Y(
        n445) );
  NOR2X1 U522 ( .A(\main_game_fsm/diff_alive4 [2]), .B(n179), .Y(n443) );
  OAI21X1 U523 ( .A(n172), .B(n443), .C(n171), .Y(n444) );
  OAI21X1 U524 ( .A(n446), .B(n445), .C(n444), .Y(n447) );
  OAI22X1 U525 ( .A(n450), .B(n449), .C(n448), .D(n447), .Y(
        \main_game_fsm/N93 ) );
  NOR2X1 U526 ( .A(n48), .B(n896), .Y(n462) );
  AOI22X1 U527 ( .A(player_coord_x[4]), .B(n395), .C(player_coord_x[5]), .D(
        n48), .Y(n461) );
  OAI21X1 U528 ( .A(player_coord_x[4]), .B(n395), .C(n212), .Y(n460) );
  NAND2X1 U529 ( .A(invader_4_coord_x[3]), .B(n65), .Y(n454) );
  NAND3X1 U530 ( .A(n454), .B(n386), .C(n68), .Y(n451) );
  OAI21X1 U531 ( .A(invader_4_coord_x[3]), .B(n65), .C(n451), .Y(n458) );
  AOI21X1 U532 ( .A(invader_4_coord_x[1]), .B(n66), .C(\invader_fsm_4/N84 ), 
        .Y(n452) );
  NAND2X1 U533 ( .A(n452), .B(player_coord_x[0]), .Y(n453) );
  OAI21X1 U534 ( .A(invader_4_coord_x[1]), .B(n66), .C(n453), .Y(n457) );
  NOR2X1 U535 ( .A(n68), .B(n386), .Y(n455) );
  OAI21X1 U536 ( .A(n206), .B(n455), .C(n176), .Y(n456) );
  OAI21X1 U537 ( .A(n458), .B(n457), .C(n456), .Y(n459) );
  OAI22X1 U538 ( .A(n462), .B(n461), .C(n460), .D(n459), .Y(
        \main_game_fsm/N69 ) );
  NOR2X1 U539 ( .A(n52), .B(player_coord_x[5]), .Y(n474) );
  AOI22X1 U540 ( .A(n64), .B(n348), .C(n896), .D(n52), .Y(n473) );
  OAI21X1 U541 ( .A(n64), .B(n348), .C(n213), .Y(n472) );
  NAND2X1 U542 ( .A(invader_3_coord_x[3]), .B(n65), .Y(n466) );
  NAND3X1 U543 ( .A(n466), .B(n344), .C(player_coord_x[2]), .Y(n463) );
  OAI21X1 U544 ( .A(invader_3_coord_x[3]), .B(n65), .C(n463), .Y(n470) );
  AOI21X1 U545 ( .A(invader_3_coord_x[1]), .B(n66), .C(\invader_fsm_3/N84 ), 
        .Y(n464) );
  NAND2X1 U546 ( .A(n464), .B(player_coord_x[0]), .Y(n465) );
  OAI21X1 U547 ( .A(invader_3_coord_x[1]), .B(n66), .C(n465), .Y(n469) );
  NOR2X1 U548 ( .A(player_coord_x[2]), .B(n344), .Y(n467) );
  OAI21X1 U549 ( .A(n207), .B(n467), .C(n181), .Y(n468) );
  OAI21X1 U550 ( .A(n470), .B(n469), .C(n468), .Y(n471) );
  OAI22X1 U551 ( .A(n474), .B(n473), .C(n472), .D(n471), .Y(
        \main_game_fsm/N55 ) );
  NOR2X1 U552 ( .A(n193), .B(\main_game_fsm/diff_alive2 [5]), .Y(n486) );
  AOI22X1 U553 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n194), .C(
        \main_game_fsm/diff_alive2 [5]), .D(n193), .Y(n485) );
  OAI21X1 U554 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n194), .C(n186), .Y(
        n484) );
  NAND2X1 U555 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n189), .Y(n478) );
  NAND3X1 U556 ( .A(n478), .B(n195), .C(\main_game_fsm/diff_alive2 [2]), .Y(
        n475) );
  OAI21X1 U557 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n189), .C(n475), .Y(
        n482) );
  AOI21X1 U558 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n190), .C(
        \main_game_fsm/diff_alive1 [0]), .Y(n476) );
  NAND2X1 U559 ( .A(n476), .B(\main_game_fsm/diff_alive2 [0]), .Y(n477) );
  OAI21X1 U560 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n190), .C(n477), .Y(
        n481) );
  NOR2X1 U561 ( .A(\main_game_fsm/diff_alive2 [2]), .B(n195), .Y(n479) );
  OAI21X1 U562 ( .A(n188), .B(n479), .C(n187), .Y(n480) );
  OAI21X1 U563 ( .A(n482), .B(n481), .C(n480), .Y(n483) );
  OAI22X1 U564 ( .A(n486), .B(n485), .C(n484), .D(n483), .Y(
        \main_game_fsm/N87 ) );
  NOR2X1 U565 ( .A(n55), .B(n896), .Y(n498) );
  AOI22X1 U566 ( .A(player_coord_x[4]), .B(n295), .C(player_coord_x[5]), .D(
        n55), .Y(n497) );
  OAI21X1 U567 ( .A(player_coord_x[4]), .B(n295), .C(n214), .Y(n496) );
  NAND2X1 U568 ( .A(invader_2_coord_x[3]), .B(n65), .Y(n490) );
  NAND3X1 U569 ( .A(n490), .B(n301), .C(n68), .Y(n487) );
  OAI21X1 U570 ( .A(invader_2_coord_x[3]), .B(n65), .C(n487), .Y(n494) );
  AOI21X1 U571 ( .A(invader_2_coord_x[1]), .B(n66), .C(\invader_fsm_2/N84 ), 
        .Y(n488) );
  NAND2X1 U572 ( .A(n488), .B(player_coord_x[0]), .Y(n489) );
  OAI21X1 U573 ( .A(invader_2_coord_x[1]), .B(n66), .C(n489), .Y(n493) );
  NOR2X1 U574 ( .A(n68), .B(n301), .Y(n491) );
  OAI21X1 U575 ( .A(n208), .B(n491), .C(n192), .Y(n492) );
  OAI21X1 U576 ( .A(n494), .B(n493), .C(n492), .Y(n495) );
  OAI22X1 U577 ( .A(n498), .B(n497), .C(n496), .D(n495), .Y(
        \main_game_fsm/N41 ) );
  NOR2X1 U578 ( .A(n59), .B(player_coord_x[5]), .Y(n510) );
  AOI22X1 U579 ( .A(n64), .B(n252), .C(n896), .D(n59), .Y(n509) );
  OAI21X1 U580 ( .A(n64), .B(n252), .C(n215), .Y(n508) );
  NAND2X1 U581 ( .A(invader_1_coord_x[3]), .B(n65), .Y(n502) );
  NAND3X1 U582 ( .A(n502), .B(n258), .C(player_coord_x[2]), .Y(n499) );
  OAI21X1 U583 ( .A(invader_1_coord_x[3]), .B(n65), .C(n499), .Y(n506) );
  AOI21X1 U584 ( .A(invader_1_coord_x[1]), .B(n66), .C(\invader_fsm_1/N84 ), 
        .Y(n500) );
  NAND2X1 U585 ( .A(n500), .B(player_coord_x[0]), .Y(n501) );
  OAI21X1 U586 ( .A(invader_1_coord_x[1]), .B(n66), .C(n501), .Y(n505) );
  NOR2X1 U587 ( .A(player_coord_x[2]), .B(n258), .Y(n503) );
  OAI21X1 U588 ( .A(n209), .B(n503), .C(n197), .Y(n504) );
  OAI21X1 U589 ( .A(n506), .B(n505), .C(n504), .Y(n507) );
  OAI22X1 U590 ( .A(n510), .B(n509), .C(n508), .D(n507), .Y(
        \main_game_fsm/N27 ) );
  NAND2X1 U591 ( .A(n66), .B(n60), .Y(n511) );
  OAI21X1 U592 ( .A(n60), .B(n66), .C(n511), .Y(\player_fsm/N79 ) );
  NOR2X1 U593 ( .A(n511), .B(n68), .Y(n513) );
  AOI21X1 U594 ( .A(n511), .B(player_coord_x[2]), .C(n513), .Y(n512) );
  NAND2X1 U595 ( .A(n513), .B(n65), .Y(n514) );
  OAI21X1 U596 ( .A(n513), .B(n65), .C(n514), .Y(\player_fsm/N81 ) );
  XNOR2X1 U597 ( .A(n64), .B(n514), .Y(\player_fsm/N82 ) );
  NOR2X1 U598 ( .A(n64), .B(n514), .Y(n515) );
  XOR2X1 U599 ( .A(n896), .B(n515), .Y(\player_fsm/N83 ) );
  NOR2X1 U600 ( .A(player_coord_x[3]), .B(player_coord_x[2]), .Y(n517) );
  NOR2X1 U601 ( .A(player_coord_x[5]), .B(player_coord_x[4]), .Y(n516) );
  NAND2X1 U602 ( .A(n517), .B(n516), .Y(\player_fsm/N72 ) );
  NOR2X1 U603 ( .A(\player_fsm/N42 ), .B(\player_fsm/N41 ), .Y(n520) );
  OR2X1 U604 ( .A(\player_fsm/N45 ), .B(\player_fsm/N44 ), .Y(n518) );
  NOR2X1 U605 ( .A(\player_fsm/N43 ), .B(n518), .Y(n519) );
  NAND3X1 U606 ( .A(n520), .B(n421), .C(n519), .Y(\player_fsm/N46 ) );
  NOR2X1 U607 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n522) );
  NOR2X1 U608 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n521) );
  OAI21X1 U609 ( .A(n896), .B(n408), .C(n407), .Y(n535) );
  NAND2X1 U610 ( .A(n896), .B(n408), .Y(n530) );
  OAI21X1 U611 ( .A(\player_fsm/N25 ), .B(n63), .C(n530), .Y(n533) );
  NAND2X1 U612 ( .A(player_coord_x[3]), .B(n409), .Y(n525) );
  NAND3X1 U613 ( .A(n525), .B(n67), .C(\player_fsm/N23 ), .Y(n523) );
  OAI21X1 U614 ( .A(player_coord_x[3]), .B(n409), .C(n523), .Y(n529) );
  OAI22X1 U615 ( .A(\player_fsm/N22 ), .B(n66), .C(n417), .D(n60), .Y(n524) );
  OAI21X1 U616 ( .A(player_coord_x[1]), .B(n410), .C(n524), .Y(n528) );
  NOR2X1 U617 ( .A(\player_fsm/N23 ), .B(n67), .Y(n526) );
  OAI21X1 U618 ( .A(n210), .B(n526), .C(n199), .Y(n527) );
  OAI21X1 U619 ( .A(n529), .B(n528), .C(n527), .Y(n532) );
  NAND3X1 U620 ( .A(n530), .B(n63), .C(\player_fsm/N25 ), .Y(n531) );
  OAI21X1 U621 ( .A(n533), .B(n532), .C(n531), .Y(n534) );
  OR2X1 U622 ( .A(n535), .B(n534), .Y(\player_fsm/N28 ) );
  OAI21X1 U623 ( .A(invader_bullet_coord_x[5]), .B(n201), .C(n200), .Y(n548)
         );
  NAND2X1 U624 ( .A(invader_bullet_coord_x[5]), .B(n201), .Y(n543) );
  OAI21X1 U625 ( .A(\player_fsm/N16 ), .B(n415), .C(n543), .Y(n546) );
  NAND2X1 U626 ( .A(invader_bullet_coord_x[3]), .B(n204), .Y(n538) );
  NAND3X1 U627 ( .A(n538), .B(n413), .C(\player_fsm/N14 ), .Y(n536) );
  OAI21X1 U628 ( .A(invader_bullet_coord_x[3]), .B(n204), .C(n536), .Y(n542)
         );
  OAI22X1 U629 ( .A(\player_fsm/N13 ), .B(n412), .C(n60), .D(n417), .Y(n537)
         );
  OAI21X1 U630 ( .A(invader_bullet_coord_x[1]), .B(n205), .C(n537), .Y(n541)
         );
  NOR2X1 U631 ( .A(\player_fsm/N14 ), .B(n413), .Y(n539) );
  OAI21X1 U632 ( .A(n203), .B(n539), .C(n202), .Y(n540) );
  OAI21X1 U633 ( .A(n542), .B(n541), .C(n540), .Y(n545) );
  NAND3X1 U634 ( .A(n543), .B(n415), .C(\player_fsm/N16 ), .Y(n544) );
  OAI21X1 U635 ( .A(n546), .B(n545), .C(n544), .Y(n547) );
  OR2X1 U636 ( .A(n548), .B(n547), .Y(\player_fsm/N19 ) );
  NOR2X1 U637 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n550) );
  NOR2X1 U638 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n549) );
  NAND2X1 U639 ( .A(n550), .B(n549), .Y(n551) );
  OR2X1 U640 ( .A(n551), .B(invader_bullet_coord_y[1]), .Y(\player_fsm/N38 )
         );
  AOI21X1 U641 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[0]), 
        .C(n551), .Y(\player_fsm/N47 ) );
  NOR2X1 U642 ( .A(n416), .B(n896), .Y(n575) );
  OR2X1 U643 ( .A(n415), .B(n64), .Y(n570) );
  NAND2X1 U644 ( .A(n64), .B(n415), .Y(n558) );
  NAND2X1 U645 ( .A(n570), .B(n558), .Y(n572) );
  OR2X1 U646 ( .A(n67), .B(invader_bullet_coord_x[2]), .Y(n554) );
  NAND2X1 U647 ( .A(invader_bullet_coord_x[2]), .B(n67), .Y(n564) );
  NAND2X1 U648 ( .A(n554), .B(n564), .Y(n566) );
  NAND2X1 U649 ( .A(player_coord_x[0]), .B(n417), .Y(n552) );
  OAI21X1 U650 ( .A(invader_bullet_coord_x[1]), .B(n552), .C(n66), .Y(n553) );
  OAI21X1 U651 ( .A(n217), .B(n412), .C(n553), .Y(n556) );
  NAND2X1 U652 ( .A(player_coord_x[3]), .B(n414), .Y(n567) );
  OAI21X1 U653 ( .A(n566), .B(n556), .C(n555), .Y(n557) );
  NOR2X1 U654 ( .A(n414), .B(player_coord_x[3]), .Y(n569) );
  NAND2X1 U655 ( .A(n557), .B(n211), .Y(n560) );
  NAND2X1 U656 ( .A(player_coord_x[5]), .B(n416), .Y(n573) );
  OAI21X1 U657 ( .A(n572), .B(n560), .C(n559), .Y(n561) );
  NAND2X1 U658 ( .A(n216), .B(n561), .Y(\player_fsm/N20 ) );
  NOR2X1 U659 ( .A(n417), .B(player_coord_x[0]), .Y(n563) );
  OAI21X1 U660 ( .A(n218), .B(n412), .C(player_coord_x[1]), .Y(n562) );
  OAI21X1 U661 ( .A(invader_bullet_coord_x[1]), .B(n563), .C(n562), .Y(n565)
         );
  OAI21X1 U662 ( .A(n566), .B(n565), .C(n564), .Y(n568) );
  OAI21X1 U663 ( .A(n569), .B(n568), .C(n567), .Y(n571) );
  OAI21X1 U664 ( .A(n572), .B(n571), .C(n570), .Y(n574) );
  OAI21X1 U665 ( .A(n575), .B(n574), .C(n573), .Y(\player_fsm/N29 ) );
  AOI21X1 U666 ( .A(n576), .B(n64), .C(player_coord_x[5]), .Y(\player_fsm/N74 ) );
  NAND3X1 U667 ( .A(\shield_fsm/N38 ), .B(\shield_fsm/N37 ), .C(n577), .Y(n579) );
  NOR2X1 U668 ( .A(n30), .B(\shield_fsm/N40 ), .Y(n578) );
  NAND3X1 U669 ( .A(n579), .B(n41), .C(n578), .Y(\shield_fsm/N42 ) );
  AOI21X1 U670 ( .A(player_bullet_coord_x[4]), .B(player_bullet_coord_x[3]), 
        .C(player_bullet_coord_x[5]), .Y(n581) );
  OAI21X1 U671 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), 
        .C(player_bullet_coord_x[4]), .Y(n580) );
  NAND3X1 U672 ( .A(\shield_fsm/N22 ), .B(\shield_fsm/N21 ), .C(n582), .Y(n584) );
  NOR2X1 U673 ( .A(n29), .B(\shield_fsm/N24 ), .Y(n583) );
  NAND3X1 U674 ( .A(n584), .B(n40), .C(n583), .Y(\shield_fsm/N26 ) );
  AOI21X1 U675 ( .A(invader_bullet_coord_x[4]), .B(invader_bullet_coord_x[3]), 
        .C(invader_bullet_coord_x[5]), .Y(n586) );
  OAI21X1 U676 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .C(invader_bullet_coord_x[4]), .Y(n585) );
  OAI21X1 U677 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(
        invader_1_coord_x[2]), .Y(n588) );
  NOR2X1 U678 ( .A(invader_1_coord_x[5]), .B(invader_1_coord_x[4]), .Y(n587)
         );
  NAND3X1 U679 ( .A(n588), .B(n56), .C(n587), .Y(n589) );
  OR2X1 U680 ( .A(\invader_fsm_1/N89 ), .B(n24), .Y(n593) );
  OAI21X1 U681 ( .A(\invader_fsm_1/N84 ), .B(n57), .C(\invader_fsm_1/N86 ), 
        .Y(n591) );
  NOR2X1 U682 ( .A(n24), .B(\invader_fsm_1/N89 ), .Y(n590) );
  OAI21X1 U683 ( .A(n31), .B(n591), .C(n590), .Y(n592) );
  OAI21X1 U684 ( .A(\invader_fsm_1/N88 ), .B(n593), .C(n592), .Y(n594) );
  NOR2X1 U685 ( .A(n614), .B(player_bullet_coord_y[5]), .Y(n596) );
  NOR2X1 U686 ( .A(\invader_fsm_1/N40 ), .B(n596), .Y(n595) );
  AOI22X1 U687 ( .A(n595), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n614), .Y(n607) );
  NOR2X1 U688 ( .A(\invader_fsm_1/N42 ), .B(n596), .Y(n597) );
  OAI21X1 U689 ( .A(player_bullet_coord_y[4]), .B(n232), .C(n597), .Y(n606) );
  NAND2X1 U690 ( .A(n236), .B(n398), .Y(n600) );
  NAND3X1 U691 ( .A(n600), .B(n240), .C(player_bullet_coord_y[2]), .Y(n598) );
  OAI21X1 U692 ( .A(n236), .B(n398), .C(n598), .Y(n604) );
  AOI22X1 U693 ( .A(n400), .B(n244), .C(n401), .D(n246), .Y(n599) );
  OAI21X1 U694 ( .A(n244), .B(n400), .C(n243), .Y(n603) );
  NOR2X1 U695 ( .A(player_bullet_coord_y[2]), .B(n240), .Y(n601) );
  OAI21X1 U696 ( .A(n235), .B(n601), .C(n234), .Y(n602) );
  OAI21X1 U697 ( .A(n604), .B(n603), .C(n602), .Y(n605) );
  OAI22X1 U698 ( .A(\invader_fsm_1/N42 ), .B(n607), .C(n606), .D(n605), .Y(
        \invader_fsm_1/N43 ) );
  NOR2X1 U699 ( .A(invader_1_coord_y[1]), .B(\invader_fsm_1/N70 ), .Y(n609) );
  AOI21X1 U700 ( .A(\invader_fsm_1/N70 ), .B(invader_1_coord_y[1]), .C(n609), 
        .Y(n608) );
  NAND2X1 U701 ( .A(n609), .B(n241), .Y(n610) );
  OAI21X1 U702 ( .A(n609), .B(n241), .C(n610), .Y(\invader_fsm_1/N38 ) );
  NOR2X1 U703 ( .A(n610), .B(invader_1_coord_y[3]), .Y(n612) );
  AOI21X1 U704 ( .A(n610), .B(invader_1_coord_y[3]), .C(n612), .Y(n611) );
  NAND2X1 U705 ( .A(n612), .B(n233), .Y(n613) );
  OAI21X1 U706 ( .A(n612), .B(n233), .C(n613), .Y(\invader_fsm_1/N40 ) );
  NOR2X1 U707 ( .A(n613), .B(invader_1_coord_y[5]), .Y(\invader_fsm_1/N42 ) );
  AOI21X1 U708 ( .A(n613), .B(invader_1_coord_y[5]), .C(\invader_fsm_1/N42 ), 
        .Y(n614) );
  OAI21X1 U709 ( .A(player_bullet_coord_y[5]), .B(n230), .C(n229), .Y(n627) );
  NAND2X1 U710 ( .A(player_bullet_coord_y[5]), .B(n230), .Y(n622) );
  OAI21X1 U711 ( .A(\invader_fsm_1/N32 ), .B(n397), .C(n622), .Y(n625) );
  NAND2X1 U712 ( .A(player_bullet_coord_y[3]), .B(n239), .Y(n617) );
  NAND3X1 U713 ( .A(n617), .B(n399), .C(\invader_fsm_1/N30 ), .Y(n615) );
  OAI21X1 U714 ( .A(player_bullet_coord_y[3]), .B(n239), .C(n615), .Y(n621) );
  OAI22X1 U715 ( .A(\invader_fsm_1/N29 ), .B(n400), .C(n246), .D(n401), .Y(
        n616) );
  OAI21X1 U716 ( .A(player_bullet_coord_y[1]), .B(n245), .C(n616), .Y(n620) );
  NOR2X1 U717 ( .A(\invader_fsm_1/N30 ), .B(n399), .Y(n618) );
  OAI21X1 U718 ( .A(n238), .B(n618), .C(n237), .Y(n619) );
  OAI21X1 U719 ( .A(n621), .B(n620), .C(n619), .Y(n624) );
  NAND3X1 U720 ( .A(n622), .B(n397), .C(\invader_fsm_1/N32 ), .Y(n623) );
  OAI21X1 U721 ( .A(n625), .B(n624), .C(n623), .Y(n626) );
  OR2X1 U722 ( .A(n627), .B(n626), .Y(\invader_fsm_1/N35 ) );
  NOR2X1 U723 ( .A(n660), .B(player_bullet_coord_x[5]), .Y(n629) );
  NOR2X1 U724 ( .A(\invader_fsm_1/N24 ), .B(n629), .Y(n628) );
  AOI22X1 U725 ( .A(n628), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n660), .Y(n640) );
  NOR2X1 U726 ( .A(\invader_fsm_1/N26 ), .B(n629), .Y(n630) );
  OAI21X1 U727 ( .A(player_bullet_coord_x[4]), .B(n251), .C(n630), .Y(n639) );
  NAND2X1 U728 ( .A(n257), .B(n405), .Y(n633) );
  NAND3X1 U729 ( .A(n633), .B(n255), .C(player_bullet_coord_x[2]), .Y(n631) );
  OAI21X1 U730 ( .A(n257), .B(n405), .C(n631), .Y(n637) );
  AOI22X1 U731 ( .A(n403), .B(n264), .C(n402), .D(n58), .Y(n632) );
  OAI21X1 U732 ( .A(n264), .B(n403), .C(n263), .Y(n636) );
  NOR2X1 U733 ( .A(player_bullet_coord_x[2]), .B(n255), .Y(n634) );
  OAI21X1 U734 ( .A(n256), .B(n634), .C(n254), .Y(n635) );
  OAI21X1 U735 ( .A(n637), .B(n636), .C(n635), .Y(n638) );
  OAI22X1 U736 ( .A(\invader_fsm_1/N26 ), .B(n640), .C(n639), .D(n638), .Y(
        \invader_fsm_1/N27 ) );
  OAI21X1 U737 ( .A(player_bullet_coord_x[5]), .B(n250), .C(n249), .Y(n653) );
  NAND2X1 U738 ( .A(player_bullet_coord_x[5]), .B(n250), .Y(n648) );
  OAI21X1 U739 ( .A(\invader_fsm_1/N16 ), .B(n44), .C(n648), .Y(n651) );
  NAND2X1 U740 ( .A(player_bullet_coord_x[3]), .B(n261), .Y(n643) );
  NAND3X1 U741 ( .A(n643), .B(n404), .C(\invader_fsm_1/N14 ), .Y(n641) );
  OAI21X1 U742 ( .A(player_bullet_coord_x[3]), .B(n261), .C(n641), .Y(n647) );
  OAI22X1 U743 ( .A(\invader_fsm_1/N13 ), .B(n403), .C(n58), .D(n402), .Y(n642) );
  OAI21X1 U744 ( .A(player_bullet_coord_x[1]), .B(n262), .C(n642), .Y(n646) );
  NOR2X1 U745 ( .A(\invader_fsm_1/N14 ), .B(n404), .Y(n644) );
  OAI21X1 U746 ( .A(n260), .B(n644), .C(n259), .Y(n645) );
  OAI21X1 U747 ( .A(n647), .B(n646), .C(n645), .Y(n650) );
  NAND3X1 U748 ( .A(n648), .B(n44), .C(\invader_fsm_1/N16 ), .Y(n649) );
  OAI21X1 U749 ( .A(n651), .B(n650), .C(n649), .Y(n652) );
  OR2X1 U750 ( .A(n653), .B(n652), .Y(\invader_fsm_1/N19 ) );
  NOR2X1 U751 ( .A(invader_1_coord_x[1]), .B(\invader_fsm_1/N84 ), .Y(n655) );
  AOI21X1 U752 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(n655), 
        .Y(n654) );
  NAND2X1 U753 ( .A(n655), .B(n258), .Y(n656) );
  OAI21X1 U754 ( .A(n655), .B(n258), .C(n656), .Y(\invader_fsm_1/N22 ) );
  NOR2X1 U755 ( .A(n656), .B(invader_1_coord_x[3]), .Y(n658) );
  AOI21X1 U756 ( .A(n656), .B(invader_1_coord_x[3]), .C(n658), .Y(n657) );
  NAND2X1 U757 ( .A(n658), .B(n252), .Y(n659) );
  OAI21X1 U758 ( .A(n658), .B(n252), .C(n659), .Y(\invader_fsm_1/N24 ) );
  NOR2X1 U759 ( .A(n659), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N26 ) );
  AOI21X1 U760 ( .A(n659), .B(invader_1_coord_x[5]), .C(\invader_fsm_1/N26 ), 
        .Y(n660) );
  OAI21X1 U761 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(
        invader_2_coord_x[2]), .Y(n662) );
  NOR2X1 U762 ( .A(invader_2_coord_x[5]), .B(invader_2_coord_x[4]), .Y(n661)
         );
  NAND3X1 U763 ( .A(n662), .B(n53), .C(n661), .Y(n663) );
  OR2X1 U764 ( .A(\invader_fsm_2/N89 ), .B(n25), .Y(n667) );
  OAI21X1 U765 ( .A(\invader_fsm_2/N84 ), .B(n54), .C(\invader_fsm_2/N86 ), 
        .Y(n665) );
  NOR2X1 U766 ( .A(n25), .B(\invader_fsm_2/N89 ), .Y(n664) );
  OAI21X1 U767 ( .A(n32), .B(n665), .C(n664), .Y(n666) );
  OAI21X1 U768 ( .A(\invader_fsm_2/N88 ), .B(n667), .C(n666), .Y(n668) );
  NOR2X1 U769 ( .A(n688), .B(player_bullet_coord_y[5]), .Y(n670) );
  NOR2X1 U770 ( .A(\invader_fsm_2/N40 ), .B(n670), .Y(n669) );
  AOI22X1 U771 ( .A(n669), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n688), .Y(n681) );
  NOR2X1 U772 ( .A(\invader_fsm_2/N42 ), .B(n670), .Y(n671) );
  OAI21X1 U773 ( .A(player_bullet_coord_y[4]), .B(n274), .C(n671), .Y(n680) );
  NAND2X1 U774 ( .A(n278), .B(n398), .Y(n674) );
  NAND3X1 U775 ( .A(n674), .B(n282), .C(player_bullet_coord_y[2]), .Y(n672) );
  OAI21X1 U776 ( .A(n278), .B(n398), .C(n672), .Y(n678) );
  AOI22X1 U777 ( .A(n400), .B(n286), .C(n401), .D(n288), .Y(n673) );
  OAI21X1 U778 ( .A(n286), .B(n400), .C(n285), .Y(n677) );
  NOR2X1 U779 ( .A(player_bullet_coord_y[2]), .B(n282), .Y(n675) );
  OAI21X1 U780 ( .A(n277), .B(n675), .C(n276), .Y(n676) );
  OAI21X1 U781 ( .A(n678), .B(n677), .C(n676), .Y(n679) );
  OAI22X1 U782 ( .A(\invader_fsm_2/N42 ), .B(n681), .C(n680), .D(n679), .Y(
        \invader_fsm_2/N43 ) );
  NOR2X1 U783 ( .A(invader_2_coord_y[1]), .B(\invader_fsm_2/N70 ), .Y(n683) );
  AOI21X1 U784 ( .A(\invader_fsm_2/N70 ), .B(invader_2_coord_y[1]), .C(n683), 
        .Y(n682) );
  NAND2X1 U785 ( .A(n683), .B(n283), .Y(n684) );
  OAI21X1 U786 ( .A(n683), .B(n283), .C(n684), .Y(\invader_fsm_2/N38 ) );
  NOR2X1 U787 ( .A(n684), .B(invader_2_coord_y[3]), .Y(n686) );
  AOI21X1 U788 ( .A(n684), .B(invader_2_coord_y[3]), .C(n686), .Y(n685) );
  NAND2X1 U789 ( .A(n686), .B(n275), .Y(n687) );
  OAI21X1 U790 ( .A(n686), .B(n275), .C(n687), .Y(\invader_fsm_2/N40 ) );
  NOR2X1 U791 ( .A(n687), .B(invader_2_coord_y[5]), .Y(\invader_fsm_2/N42 ) );
  AOI21X1 U792 ( .A(n687), .B(invader_2_coord_y[5]), .C(\invader_fsm_2/N42 ), 
        .Y(n688) );
  OAI21X1 U793 ( .A(player_bullet_coord_y[5]), .B(n272), .C(n271), .Y(n701) );
  NAND2X1 U794 ( .A(player_bullet_coord_y[5]), .B(n272), .Y(n696) );
  OAI21X1 U795 ( .A(\invader_fsm_2/N32 ), .B(n397), .C(n696), .Y(n699) );
  NAND2X1 U796 ( .A(player_bullet_coord_y[3]), .B(n281), .Y(n691) );
  NAND3X1 U797 ( .A(n691), .B(n399), .C(\invader_fsm_2/N30 ), .Y(n689) );
  OAI21X1 U798 ( .A(player_bullet_coord_y[3]), .B(n281), .C(n689), .Y(n695) );
  OAI22X1 U799 ( .A(\invader_fsm_2/N29 ), .B(n400), .C(n288), .D(n401), .Y(
        n690) );
  OAI21X1 U800 ( .A(player_bullet_coord_y[1]), .B(n287), .C(n690), .Y(n694) );
  NOR2X1 U801 ( .A(\invader_fsm_2/N30 ), .B(n399), .Y(n692) );
  OAI21X1 U802 ( .A(n280), .B(n692), .C(n279), .Y(n693) );
  OAI21X1 U803 ( .A(n695), .B(n694), .C(n693), .Y(n698) );
  NAND3X1 U804 ( .A(n696), .B(n397), .C(\invader_fsm_2/N32 ), .Y(n697) );
  OAI21X1 U805 ( .A(n699), .B(n698), .C(n697), .Y(n700) );
  OR2X1 U806 ( .A(n701), .B(n700), .Y(\invader_fsm_2/N35 ) );
  NOR2X1 U807 ( .A(n734), .B(player_bullet_coord_x[5]), .Y(n703) );
  NOR2X1 U808 ( .A(\invader_fsm_2/N24 ), .B(n703), .Y(n702) );
  AOI22X1 U809 ( .A(n702), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n734), .Y(n714) );
  NOR2X1 U810 ( .A(\invader_fsm_2/N26 ), .B(n703), .Y(n704) );
  OAI21X1 U811 ( .A(player_bullet_coord_x[4]), .B(n294), .C(n704), .Y(n713) );
  NAND2X1 U812 ( .A(n300), .B(n405), .Y(n707) );
  NAND3X1 U813 ( .A(n707), .B(n298), .C(player_bullet_coord_x[2]), .Y(n705) );
  OAI21X1 U814 ( .A(n300), .B(n405), .C(n705), .Y(n711) );
  AOI22X1 U815 ( .A(n403), .B(n307), .C(n402), .D(n308), .Y(n706) );
  OAI21X1 U816 ( .A(n307), .B(n403), .C(n306), .Y(n710) );
  NOR2X1 U817 ( .A(player_bullet_coord_x[2]), .B(n298), .Y(n708) );
  OAI21X1 U818 ( .A(n299), .B(n708), .C(n297), .Y(n709) );
  OAI21X1 U819 ( .A(n711), .B(n710), .C(n709), .Y(n712) );
  OAI22X1 U820 ( .A(\invader_fsm_2/N26 ), .B(n714), .C(n713), .D(n712), .Y(
        \invader_fsm_2/N27 ) );
  OAI21X1 U821 ( .A(player_bullet_coord_x[5]), .B(n293), .C(n292), .Y(n727) );
  NAND2X1 U822 ( .A(player_bullet_coord_x[5]), .B(n293), .Y(n722) );
  OAI21X1 U823 ( .A(\invader_fsm_2/N16 ), .B(n44), .C(n722), .Y(n725) );
  NAND2X1 U824 ( .A(player_bullet_coord_x[3]), .B(n304), .Y(n717) );
  NAND3X1 U825 ( .A(n717), .B(n404), .C(\invader_fsm_2/N14 ), .Y(n715) );
  OAI21X1 U826 ( .A(player_bullet_coord_x[3]), .B(n304), .C(n715), .Y(n721) );
  OAI22X1 U827 ( .A(\invader_fsm_2/N13 ), .B(n403), .C(n308), .D(n402), .Y(
        n716) );
  OAI21X1 U828 ( .A(player_bullet_coord_x[1]), .B(n305), .C(n716), .Y(n720) );
  NOR2X1 U829 ( .A(\invader_fsm_2/N14 ), .B(n404), .Y(n718) );
  OAI21X1 U830 ( .A(n303), .B(n718), .C(n302), .Y(n719) );
  OAI21X1 U831 ( .A(n721), .B(n720), .C(n719), .Y(n724) );
  NAND3X1 U832 ( .A(n722), .B(n44), .C(\invader_fsm_2/N16 ), .Y(n723) );
  OAI21X1 U833 ( .A(n725), .B(n724), .C(n723), .Y(n726) );
  OR2X1 U834 ( .A(n727), .B(n726), .Y(\invader_fsm_2/N19 ) );
  NOR2X1 U835 ( .A(invader_2_coord_x[1]), .B(\invader_fsm_2/N84 ), .Y(n729) );
  AOI21X1 U836 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(n729), 
        .Y(n728) );
  NAND2X1 U837 ( .A(n729), .B(n301), .Y(n730) );
  OAI21X1 U838 ( .A(n729), .B(n301), .C(n730), .Y(\invader_fsm_2/N22 ) );
  NOR2X1 U839 ( .A(n730), .B(invader_2_coord_x[3]), .Y(n732) );
  AOI21X1 U840 ( .A(n730), .B(invader_2_coord_x[3]), .C(n732), .Y(n731) );
  NAND2X1 U841 ( .A(n732), .B(n295), .Y(n733) );
  OAI21X1 U842 ( .A(n732), .B(n295), .C(n733), .Y(\invader_fsm_2/N24 ) );
  NOR2X1 U843 ( .A(n733), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N26 ) );
  AOI21X1 U844 ( .A(n733), .B(invader_2_coord_x[5]), .C(\invader_fsm_2/N26 ), 
        .Y(n734) );
  OAI21X1 U845 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(
        invader_3_coord_x[2]), .Y(n736) );
  NOR2X1 U846 ( .A(invader_3_coord_x[5]), .B(invader_3_coord_x[4]), .Y(n735)
         );
  NAND3X1 U847 ( .A(n736), .B(n49), .C(n735), .Y(n737) );
  OR2X1 U848 ( .A(\invader_fsm_3/N89 ), .B(n26), .Y(n741) );
  OAI21X1 U849 ( .A(\invader_fsm_3/N84 ), .B(n51), .C(\invader_fsm_3/N86 ), 
        .Y(n739) );
  NOR2X1 U850 ( .A(n26), .B(\invader_fsm_3/N89 ), .Y(n738) );
  OAI21X1 U851 ( .A(n33), .B(n739), .C(n738), .Y(n740) );
  OAI21X1 U852 ( .A(\invader_fsm_3/N88 ), .B(n741), .C(n740), .Y(n742) );
  NOR2X1 U853 ( .A(n762), .B(player_bullet_coord_y[5]), .Y(n744) );
  NOR2X1 U854 ( .A(\invader_fsm_3/N40 ), .B(n744), .Y(n743) );
  AOI22X1 U855 ( .A(n743), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n762), .Y(n755) );
  NOR2X1 U856 ( .A(\invader_fsm_3/N42 ), .B(n744), .Y(n745) );
  OAI21X1 U857 ( .A(player_bullet_coord_y[4]), .B(n317), .C(n745), .Y(n754) );
  NAND2X1 U858 ( .A(n321), .B(n398), .Y(n748) );
  NAND3X1 U859 ( .A(n748), .B(n325), .C(player_bullet_coord_y[2]), .Y(n746) );
  OAI21X1 U860 ( .A(n321), .B(n398), .C(n746), .Y(n752) );
  AOI22X1 U861 ( .A(n400), .B(n329), .C(n401), .D(n331), .Y(n747) );
  OAI21X1 U862 ( .A(n329), .B(n400), .C(n328), .Y(n751) );
  NOR2X1 U863 ( .A(player_bullet_coord_y[2]), .B(n325), .Y(n749) );
  OAI21X1 U864 ( .A(n320), .B(n749), .C(n319), .Y(n750) );
  OAI21X1 U865 ( .A(n752), .B(n751), .C(n750), .Y(n753) );
  OAI22X1 U866 ( .A(\invader_fsm_3/N42 ), .B(n755), .C(n754), .D(n753), .Y(
        \invader_fsm_3/N43 ) );
  NOR2X1 U867 ( .A(invader_3_coord_y[1]), .B(\invader_fsm_3/N70 ), .Y(n757) );
  AOI21X1 U868 ( .A(\invader_fsm_3/N70 ), .B(invader_3_coord_y[1]), .C(n757), 
        .Y(n756) );
  NAND2X1 U869 ( .A(n757), .B(n326), .Y(n758) );
  OAI21X1 U870 ( .A(n757), .B(n326), .C(n758), .Y(\invader_fsm_3/N38 ) );
  NOR2X1 U871 ( .A(n758), .B(invader_3_coord_y[3]), .Y(n760) );
  AOI21X1 U872 ( .A(n758), .B(invader_3_coord_y[3]), .C(n760), .Y(n759) );
  NAND2X1 U873 ( .A(n760), .B(n318), .Y(n761) );
  OAI21X1 U874 ( .A(n760), .B(n318), .C(n761), .Y(\invader_fsm_3/N40 ) );
  NOR2X1 U875 ( .A(n761), .B(invader_3_coord_y[5]), .Y(\invader_fsm_3/N42 ) );
  AOI21X1 U876 ( .A(n761), .B(invader_3_coord_y[5]), .C(\invader_fsm_3/N42 ), 
        .Y(n762) );
  OAI21X1 U877 ( .A(player_bullet_coord_y[5]), .B(n315), .C(n314), .Y(n775) );
  NAND2X1 U878 ( .A(player_bullet_coord_y[5]), .B(n315), .Y(n770) );
  OAI21X1 U879 ( .A(\invader_fsm_3/N32 ), .B(n397), .C(n770), .Y(n773) );
  NAND2X1 U880 ( .A(player_bullet_coord_y[3]), .B(n324), .Y(n765) );
  NAND3X1 U881 ( .A(n765), .B(n399), .C(\invader_fsm_3/N30 ), .Y(n763) );
  OAI21X1 U882 ( .A(player_bullet_coord_y[3]), .B(n324), .C(n763), .Y(n769) );
  OAI22X1 U883 ( .A(\invader_fsm_3/N29 ), .B(n400), .C(n331), .D(n401), .Y(
        n764) );
  OAI21X1 U884 ( .A(player_bullet_coord_y[1]), .B(n330), .C(n764), .Y(n768) );
  NOR2X1 U885 ( .A(\invader_fsm_3/N30 ), .B(n399), .Y(n766) );
  OAI21X1 U886 ( .A(n323), .B(n766), .C(n322), .Y(n767) );
  OAI21X1 U887 ( .A(n769), .B(n768), .C(n767), .Y(n772) );
  NAND3X1 U888 ( .A(n770), .B(n397), .C(\invader_fsm_3/N32 ), .Y(n771) );
  OAI21X1 U889 ( .A(n773), .B(n772), .C(n771), .Y(n774) );
  OR2X1 U890 ( .A(n775), .B(n774), .Y(\invader_fsm_3/N35 ) );
  NOR2X1 U891 ( .A(n808), .B(player_bullet_coord_x[5]), .Y(n777) );
  NOR2X1 U892 ( .A(\invader_fsm_3/N24 ), .B(n777), .Y(n776) );
  AOI22X1 U893 ( .A(n776), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n808), .Y(n788) );
  NOR2X1 U894 ( .A(\invader_fsm_3/N26 ), .B(n777), .Y(n778) );
  OAI21X1 U895 ( .A(player_bullet_coord_x[4]), .B(n340), .C(n778), .Y(n787) );
  NAND2X1 U896 ( .A(n339), .B(n405), .Y(n781) );
  NAND3X1 U897 ( .A(n781), .B(n337), .C(player_bullet_coord_x[2]), .Y(n779) );
  OAI21X1 U898 ( .A(n339), .B(n405), .C(n779), .Y(n785) );
  AOI22X1 U899 ( .A(n403), .B(n346), .C(n402), .D(n50), .Y(n780) );
  OAI21X1 U900 ( .A(n346), .B(n403), .C(n345), .Y(n784) );
  NOR2X1 U901 ( .A(player_bullet_coord_x[2]), .B(n337), .Y(n782) );
  OAI21X1 U902 ( .A(n338), .B(n782), .C(n336), .Y(n783) );
  OAI21X1 U903 ( .A(n785), .B(n784), .C(n783), .Y(n786) );
  OAI22X1 U904 ( .A(\invader_fsm_3/N26 ), .B(n788), .C(n787), .D(n786), .Y(
        \invader_fsm_3/N27 ) );
  OAI21X1 U905 ( .A(player_bullet_coord_x[5]), .B(n335), .C(n334), .Y(n801) );
  NAND2X1 U906 ( .A(player_bullet_coord_x[5]), .B(n335), .Y(n796) );
  OAI21X1 U907 ( .A(\invader_fsm_3/N16 ), .B(n44), .C(n796), .Y(n799) );
  NAND2X1 U908 ( .A(player_bullet_coord_x[3]), .B(n343), .Y(n791) );
  NAND3X1 U909 ( .A(n791), .B(n404), .C(\invader_fsm_3/N14 ), .Y(n789) );
  OAI21X1 U910 ( .A(player_bullet_coord_x[3]), .B(n343), .C(n789), .Y(n795) );
  OAI22X1 U911 ( .A(\invader_fsm_3/N13 ), .B(n403), .C(n50), .D(n402), .Y(n790) );
  OAI21X1 U912 ( .A(player_bullet_coord_x[1]), .B(n347), .C(n790), .Y(n794) );
  NOR2X1 U913 ( .A(\invader_fsm_3/N14 ), .B(n404), .Y(n792) );
  OAI21X1 U914 ( .A(n342), .B(n792), .C(n341), .Y(n793) );
  OAI21X1 U915 ( .A(n795), .B(n794), .C(n793), .Y(n798) );
  NAND3X1 U916 ( .A(n796), .B(n44), .C(\invader_fsm_3/N16 ), .Y(n797) );
  OAI21X1 U917 ( .A(n799), .B(n798), .C(n797), .Y(n800) );
  OR2X1 U918 ( .A(n801), .B(n800), .Y(\invader_fsm_3/N19 ) );
  NOR2X1 U919 ( .A(invader_3_coord_x[1]), .B(\invader_fsm_3/N84 ), .Y(n803) );
  AOI21X1 U920 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(n803), 
        .Y(n802) );
  NAND2X1 U921 ( .A(n803), .B(n344), .Y(n804) );
  OAI21X1 U922 ( .A(n803), .B(n344), .C(n804), .Y(\invader_fsm_3/N22 ) );
  NOR2X1 U923 ( .A(n804), .B(invader_3_coord_x[3]), .Y(n806) );
  AOI21X1 U924 ( .A(n804), .B(invader_3_coord_x[3]), .C(n806), .Y(n805) );
  NAND2X1 U925 ( .A(n806), .B(n348), .Y(n807) );
  OAI21X1 U926 ( .A(n806), .B(n348), .C(n807), .Y(\invader_fsm_3/N24 ) );
  NOR2X1 U927 ( .A(n807), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N26 ) );
  AOI21X1 U928 ( .A(n807), .B(invader_3_coord_x[5]), .C(\invader_fsm_3/N26 ), 
        .Y(n808) );
  OAI21X1 U929 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(
        invader_4_coord_x[2]), .Y(n810) );
  NOR2X1 U930 ( .A(invader_4_coord_x[5]), .B(invader_4_coord_x[4]), .Y(n809)
         );
  NAND3X1 U931 ( .A(n810), .B(n47), .C(n809), .Y(n811) );
  OR2X1 U932 ( .A(\invader_fsm_4/N89 ), .B(n27), .Y(n815) );
  OAI21X1 U933 ( .A(\invader_fsm_4/N84 ), .B(n46), .C(\invader_fsm_4/N86 ), 
        .Y(n813) );
  NOR2X1 U934 ( .A(n27), .B(\invader_fsm_4/N89 ), .Y(n812) );
  OAI21X1 U935 ( .A(n34), .B(n813), .C(n812), .Y(n814) );
  OAI21X1 U936 ( .A(\invader_fsm_4/N88 ), .B(n815), .C(n814), .Y(n816) );
  NOR2X1 U937 ( .A(n836), .B(player_bullet_coord_y[5]), .Y(n818) );
  NOR2X1 U938 ( .A(\invader_fsm_4/N40 ), .B(n818), .Y(n817) );
  AOI22X1 U939 ( .A(n817), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n836), .Y(n829) );
  NOR2X1 U940 ( .A(\invader_fsm_4/N42 ), .B(n818), .Y(n819) );
  OAI21X1 U941 ( .A(player_bullet_coord_y[4]), .B(n358), .C(n819), .Y(n828) );
  NAND2X1 U942 ( .A(n362), .B(n398), .Y(n822) );
  NAND3X1 U943 ( .A(n822), .B(n366), .C(player_bullet_coord_y[2]), .Y(n820) );
  OAI21X1 U944 ( .A(n362), .B(n398), .C(n820), .Y(n826) );
  AOI22X1 U945 ( .A(n400), .B(n370), .C(n401), .D(n372), .Y(n821) );
  OAI21X1 U946 ( .A(n370), .B(n400), .C(n369), .Y(n825) );
  NOR2X1 U947 ( .A(player_bullet_coord_y[2]), .B(n366), .Y(n823) );
  OAI21X1 U948 ( .A(n361), .B(n823), .C(n360), .Y(n824) );
  OAI21X1 U949 ( .A(n826), .B(n825), .C(n824), .Y(n827) );
  OAI22X1 U950 ( .A(\invader_fsm_4/N42 ), .B(n829), .C(n828), .D(n827), .Y(
        \invader_fsm_4/N43 ) );
  NOR2X1 U951 ( .A(invader_4_coord_y[1]), .B(\invader_fsm_4/N70 ), .Y(n831) );
  AOI21X1 U952 ( .A(\invader_fsm_4/N70 ), .B(invader_4_coord_y[1]), .C(n831), 
        .Y(n830) );
  NAND2X1 U953 ( .A(n831), .B(n367), .Y(n832) );
  OAI21X1 U954 ( .A(n831), .B(n367), .C(n832), .Y(\invader_fsm_4/N38 ) );
  NOR2X1 U955 ( .A(n832), .B(invader_4_coord_y[3]), .Y(n834) );
  AOI21X1 U956 ( .A(n832), .B(invader_4_coord_y[3]), .C(n834), .Y(n833) );
  NAND2X1 U957 ( .A(n834), .B(n359), .Y(n835) );
  OAI21X1 U958 ( .A(n834), .B(n359), .C(n835), .Y(\invader_fsm_4/N40 ) );
  NOR2X1 U959 ( .A(n835), .B(invader_4_coord_y[5]), .Y(\invader_fsm_4/N42 ) );
  AOI21X1 U960 ( .A(n835), .B(invader_4_coord_y[5]), .C(\invader_fsm_4/N42 ), 
        .Y(n836) );
  OAI21X1 U961 ( .A(player_bullet_coord_y[5]), .B(n356), .C(n355), .Y(n849) );
  NAND2X1 U962 ( .A(player_bullet_coord_y[5]), .B(n356), .Y(n844) );
  OAI21X1 U963 ( .A(\invader_fsm_4/N32 ), .B(n397), .C(n844), .Y(n847) );
  NAND2X1 U964 ( .A(player_bullet_coord_y[3]), .B(n365), .Y(n839) );
  NAND3X1 U965 ( .A(n839), .B(n399), .C(\invader_fsm_4/N30 ), .Y(n837) );
  OAI21X1 U966 ( .A(player_bullet_coord_y[3]), .B(n365), .C(n837), .Y(n843) );
  OAI22X1 U967 ( .A(\invader_fsm_4/N29 ), .B(n400), .C(n372), .D(n401), .Y(
        n838) );
  OAI21X1 U968 ( .A(player_bullet_coord_y[1]), .B(n371), .C(n838), .Y(n842) );
  NOR2X1 U969 ( .A(\invader_fsm_4/N30 ), .B(n399), .Y(n840) );
  OAI21X1 U970 ( .A(n364), .B(n840), .C(n363), .Y(n841) );
  OAI21X1 U971 ( .A(n843), .B(n842), .C(n841), .Y(n846) );
  NAND3X1 U972 ( .A(n844), .B(n397), .C(\invader_fsm_4/N32 ), .Y(n845) );
  OAI21X1 U973 ( .A(n847), .B(n846), .C(n845), .Y(n848) );
  OR2X1 U974 ( .A(n849), .B(n848), .Y(\invader_fsm_4/N35 ) );
  NOR2X1 U975 ( .A(n882), .B(player_bullet_coord_x[5]), .Y(n851) );
  NOR2X1 U976 ( .A(\invader_fsm_4/N24 ), .B(n851), .Y(n850) );
  AOI22X1 U977 ( .A(n850), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n882), .Y(n862) );
  NOR2X1 U978 ( .A(\invader_fsm_4/N26 ), .B(n851), .Y(n852) );
  OAI21X1 U979 ( .A(player_bullet_coord_x[4]), .B(n381), .C(n852), .Y(n861) );
  NAND2X1 U980 ( .A(n380), .B(n405), .Y(n855) );
  NAND3X1 U981 ( .A(n855), .B(n385), .C(player_bullet_coord_x[2]), .Y(n853) );
  OAI21X1 U982 ( .A(n380), .B(n405), .C(n853), .Y(n859) );
  AOI22X1 U983 ( .A(n403), .B(n389), .C(n402), .D(n390), .Y(n854) );
  OAI21X1 U984 ( .A(n389), .B(n403), .C(n388), .Y(n858) );
  NOR2X1 U985 ( .A(player_bullet_coord_x[2]), .B(n385), .Y(n856) );
  OAI21X1 U986 ( .A(n379), .B(n856), .C(n378), .Y(n857) );
  OAI21X1 U987 ( .A(n859), .B(n858), .C(n857), .Y(n860) );
  OAI22X1 U988 ( .A(\invader_fsm_4/N26 ), .B(n862), .C(n861), .D(n860), .Y(
        \invader_fsm_4/N27 ) );
  OAI21X1 U989 ( .A(player_bullet_coord_x[5]), .B(n377), .C(n376), .Y(n875) );
  NAND2X1 U990 ( .A(player_bullet_coord_x[5]), .B(n377), .Y(n870) );
  OAI21X1 U991 ( .A(\invader_fsm_4/N16 ), .B(n44), .C(n870), .Y(n873) );
  NAND2X1 U992 ( .A(player_bullet_coord_x[3]), .B(n384), .Y(n865) );
  NAND3X1 U993 ( .A(n865), .B(n404), .C(\invader_fsm_4/N14 ), .Y(n863) );
  OAI21X1 U994 ( .A(player_bullet_coord_x[3]), .B(n384), .C(n863), .Y(n869) );
  OAI22X1 U995 ( .A(\invader_fsm_4/N13 ), .B(n403), .C(n390), .D(n402), .Y(
        n864) );
  OAI21X1 U996 ( .A(player_bullet_coord_x[1]), .B(n387), .C(n864), .Y(n868) );
  NOR2X1 U997 ( .A(\invader_fsm_4/N14 ), .B(n404), .Y(n866) );
  OAI21X1 U998 ( .A(n383), .B(n866), .C(n382), .Y(n867) );
  OAI21X1 U999 ( .A(n869), .B(n868), .C(n867), .Y(n872) );
  NAND3X1 U1000 ( .A(n870), .B(n44), .C(\invader_fsm_4/N16 ), .Y(n871) );
  OAI21X1 U1001 ( .A(n873), .B(n872), .C(n871), .Y(n874) );
  OR2X1 U1002 ( .A(n875), .B(n874), .Y(\invader_fsm_4/N19 ) );
  NOR2X1 U1003 ( .A(invader_4_coord_x[1]), .B(\invader_fsm_4/N84 ), .Y(n877)
         );
  AOI21X1 U1004 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(n877), 
        .Y(n876) );
  NAND2X1 U1005 ( .A(n877), .B(n386), .Y(n878) );
  OAI21X1 U1006 ( .A(n877), .B(n386), .C(n878), .Y(\invader_fsm_4/N22 ) );
  NOR2X1 U1007 ( .A(n878), .B(invader_4_coord_x[3]), .Y(n880) );
  AOI21X1 U1008 ( .A(n878), .B(invader_4_coord_x[3]), .C(n880), .Y(n879) );
  NAND2X1 U1009 ( .A(n880), .B(n395), .Y(n881) );
  OAI21X1 U1010 ( .A(n880), .B(n395), .C(n881), .Y(\invader_fsm_4/N24 ) );
  NOR2X1 U1011 ( .A(n881), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N26 )
         );
  AOI21X1 U1012 ( .A(n881), .B(invader_4_coord_x[5]), .C(\invader_fsm_4/N26 ), 
        .Y(n882) );
  XOR2X1 U1013 ( .A(\player_bullet_fsm/add_89/carry [5]), .B(
        player_bullet_coord_y[5]), .Y(\player_bullet_fsm/N26 ) );
  NAND2X1 U1014 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), 
        .Y(n884) );
  NAND2X1 U1015 ( .A(player_bullet_coord_y[3]), .B(player_bullet_coord_y[2]), 
        .Y(n883) );
  OAI21X1 U1016 ( .A(n884), .B(n883), .C(n45), .Y(n885) );
  OAI21X1 U1017 ( .A(player_bullet_coord_y[5]), .B(player_bullet_coord_y[4]), 
        .C(n885), .Y(n886) );
  NAND2X1 U1018 ( .A(n422), .B(n423), .Y(n887) );
  OAI21X1 U1019 ( .A(n423), .B(n422), .C(n887), .Y(\invader_bullet_fsm/N26 )
         );
  NOR2X1 U1020 ( .A(n887), .B(invader_bullet_coord_y[2]), .Y(n889) );
  AOI21X1 U1021 ( .A(n887), .B(invader_bullet_coord_y[2]), .C(n889), .Y(n888)
         );
  NAND2X1 U1022 ( .A(n889), .B(n418), .Y(n890) );
  OAI21X1 U1023 ( .A(n889), .B(n418), .C(n890), .Y(\invader_bullet_fsm/N28 )
         );
  XNOR2X1 U1024 ( .A(invader_bullet_coord_y[4]), .B(n890), .Y(
        \invader_bullet_fsm/N29 ) );
  NOR2X1 U1025 ( .A(invader_bullet_coord_y[4]), .B(n890), .Y(n891) );
  XOR2X1 U1026 ( .A(invader_bullet_coord_y[5]), .B(n891), .Y(
        \invader_bullet_fsm/N30 ) );
  OR2X1 U1027 ( .A(invader_bullet_coord_y[2]), .B(invader_bullet_coord_y[1]), 
        .Y(n892) );
  NOR2X1 U1028 ( .A(invader_bullet_coord_y[0]), .B(n892), .Y(n895) );
  OR2X1 U1029 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n893) );
  NOR2X1 U1030 ( .A(invader_bullet_coord_y[3]), .B(n893), .Y(n894) );
  NAND2X1 U1031 ( .A(\invader_bullet_fsm/next_state[0] ), .B(n72), .Y(
        \invader_bullet_fsm/n31 ) );
endmodule

