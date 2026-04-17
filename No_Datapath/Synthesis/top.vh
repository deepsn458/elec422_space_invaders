/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Fri Apr 17 17:45:05 2026
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
  wire   n895, n896, n897, playerbullet_invader_collision_signal_1,
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
         \main_game_fsm/n151 , \main_game_fsm/n150 , \main_game_fsm/n145 ,
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
         \main_game_fsm/n90 , \main_game_fsm/N145 , \main_game_fsm/N144 ,
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
         \player_fsm/state[0] , \player_fsm/state[1] , \shield_fsm/n90 ,
         \shield_fsm/n89 , \shield_fsm/n88 , \shield_fsm/n87 ,
         \shield_fsm/n86 , \shield_fsm/n83 , \shield_fsm/n80 ,
         \shield_fsm/n77 , \shield_fsm/n76 , \shield_fsm/n75 ,
         \shield_fsm/n74 , \shield_fsm/n73 , \shield_fsm/n72 ,
         \shield_fsm/n71 , \shield_fsm/n70 , \shield_fsm/n69 ,
         \shield_fsm/n68 , \shield_fsm/n67 , \shield_fsm/n66 ,
         \shield_fsm/n65 , \shield_fsm/n64 , \shield_fsm/n63 ,
         \shield_fsm/n62 , \shield_fsm/n61 , \shield_fsm/n59 ,
         \shield_fsm/n58 , \shield_fsm/n53 , \shield_fsm/n51 ,
         \shield_fsm/n50 , \shield_fsm/n49 , \shield_fsm/n48 ,
         \shield_fsm/n47 , \shield_fsm/n46 , \shield_fsm/n45 ,
         \shield_fsm/n44 , \shield_fsm/N102 , \shield_fsm/N98 ,
         \shield_fsm/N97 , \shield_fsm/N56 , \shield_fsm/N55 ,
         \shield_fsm/N42 , \shield_fsm/N40 , \shield_fsm/N38 ,
         \shield_fsm/N37 , \shield_fsm/N35 , \shield_fsm/N34 ,
         \shield_fsm/N26 , \shield_fsm/N24 , \shield_fsm/N22 ,
         \shield_fsm/N21 , \shield_fsm/N19 , \shield_fsm/N18 ,
         \shield_fsm/state[0] , \shield_fsm/state[1] , \invader_fsm_1/n116 ,
         \invader_fsm_1/n115 , \invader_fsm_1/n114 , \invader_fsm_1/n113 ,
         \invader_fsm_1/n112 , \invader_fsm_1/n111 , \invader_fsm_1/n110 ,
         \invader_fsm_1/n109 , \invader_fsm_1/n108 , \invader_fsm_1/n107 ,
         \invader_fsm_1/n106 , \invader_fsm_1/n105 , \invader_fsm_1/n104 ,
         \invader_fsm_1/n103 , \invader_fsm_1/n102 , \invader_fsm_1/n101 ,
         \invader_fsm_1/n100 , \invader_fsm_1/n99 , \invader_fsm_1/n98 ,
         \invader_fsm_1/n97 , \invader_fsm_1/n96 , \invader_fsm_1/n95 ,
         \invader_fsm_1/n94 , \invader_fsm_1/n93 , \invader_fsm_1/n92 ,
         \invader_fsm_1/n91 , \invader_fsm_1/n90 , \invader_fsm_1/n89 ,
         \invader_fsm_1/n88 , \invader_fsm_1/n87 , \invader_fsm_1/n86 ,
         \invader_fsm_1/n85 , \invader_fsm_1/n84 , \invader_fsm_1/n83 ,
         \invader_fsm_1/n82 , \invader_fsm_1/n81 , \invader_fsm_1/n80 ,
         \invader_fsm_1/n79 , \invader_fsm_1/n78 , \invader_fsm_1/n77 ,
         \invader_fsm_1/n76 , \invader_fsm_1/n75 , \invader_fsm_1/n74 ,
         \invader_fsm_1/n73 , \invader_fsm_1/n72 , \invader_fsm_1/n71 ,
         \invader_fsm_1/n70 , \invader_fsm_1/n69 , \invader_fsm_1/n68 ,
         \invader_fsm_1/n67 , \invader_fsm_1/n66 , \invader_fsm_1/n65 ,
         \invader_fsm_1/n64 , \invader_fsm_1/n63 , \invader_fsm_1/n62 ,
         \invader_fsm_1/n61 , \invader_fsm_1/n60 , \invader_fsm_1/n59 ,
         \invader_fsm_1/n58 , \invader_fsm_1/n57 , \invader_fsm_1/n56 ,
         \invader_fsm_1/n55 , \invader_fsm_1/n54 , \invader_fsm_1/n53 ,
         \invader_fsm_1/N89 , \invader_fsm_1/N88 , \invader_fsm_1/N86 ,
         \invader_fsm_1/N84 , \invader_fsm_1/N75 , \invader_fsm_1/N74 ,
         \invader_fsm_1/N73 , \invader_fsm_1/N72 , \invader_fsm_1/N70 ,
         \invader_fsm_1/move_interval_toggle , \invader_fsm_1/N56 ,
         \invader_fsm_1/N55 , \invader_fsm_1/N43 , \invader_fsm_1/N42 ,
         \invader_fsm_1/N40 , \invader_fsm_1/N38 , \invader_fsm_1/N35 ,
         \invader_fsm_1/N34 , \invader_fsm_1/N33 , \invader_fsm_1/N32 ,
         \invader_fsm_1/N31 , \invader_fsm_1/N30 , \invader_fsm_1/N29 ,
         \invader_fsm_1/N27 , \invader_fsm_1/N26 , \invader_fsm_1/N24 ,
         \invader_fsm_1/N22 , \invader_fsm_1/N19 , \invader_fsm_1/N18 ,
         \invader_fsm_1/N17 , \invader_fsm_1/N16 , \invader_fsm_1/N15 ,
         \invader_fsm_1/N14 , \invader_fsm_1/N13 , \invader_fsm_1/state[0] ,
         \invader_fsm_1/state[1] , \invader_fsm_2/n116 , \invader_fsm_2/n115 ,
         \invader_fsm_2/n114 , \invader_fsm_2/n113 , \invader_fsm_2/n112 ,
         \invader_fsm_2/n111 , \invader_fsm_2/n110 , \invader_fsm_2/n109 ,
         \invader_fsm_2/n108 , \invader_fsm_2/n107 , \invader_fsm_2/n106 ,
         \invader_fsm_2/n105 , \invader_fsm_2/n104 , \invader_fsm_2/n103 ,
         \invader_fsm_2/n102 , \invader_fsm_2/n101 , \invader_fsm_2/n100 ,
         \invader_fsm_2/n99 , \invader_fsm_2/n98 , \invader_fsm_2/n97 ,
         \invader_fsm_2/n96 , \invader_fsm_2/n95 , \invader_fsm_2/n94 ,
         \invader_fsm_2/n93 , \invader_fsm_2/n92 , \invader_fsm_2/n91 ,
         \invader_fsm_2/n90 , \invader_fsm_2/n89 , \invader_fsm_2/n88 ,
         \invader_fsm_2/n87 , \invader_fsm_2/n86 , \invader_fsm_2/n85 ,
         \invader_fsm_2/n84 , \invader_fsm_2/n83 , \invader_fsm_2/n82 ,
         \invader_fsm_2/n81 , \invader_fsm_2/n80 , \invader_fsm_2/n79 ,
         \invader_fsm_2/n78 , \invader_fsm_2/n77 , \invader_fsm_2/n76 ,
         \invader_fsm_2/n75 , \invader_fsm_2/n74 , \invader_fsm_2/n73 ,
         \invader_fsm_2/n72 , \invader_fsm_2/n71 , \invader_fsm_2/n70 ,
         \invader_fsm_2/n69 , \invader_fsm_2/n68 , \invader_fsm_2/n67 ,
         \invader_fsm_2/n66 , \invader_fsm_2/n65 , \invader_fsm_2/n64 ,
         \invader_fsm_2/n63 , \invader_fsm_2/n62 , \invader_fsm_2/n61 ,
         \invader_fsm_2/n60 , \invader_fsm_2/n59 , \invader_fsm_2/n58 ,
         \invader_fsm_2/n57 , \invader_fsm_2/n56 , \invader_fsm_2/n55 ,
         \invader_fsm_2/n54 , \invader_fsm_2/n53 , \invader_fsm_2/N89 ,
         \invader_fsm_2/N88 , \invader_fsm_2/N86 , \invader_fsm_2/N84 ,
         \invader_fsm_2/N75 , \invader_fsm_2/N74 , \invader_fsm_2/N73 ,
         \invader_fsm_2/N72 , \invader_fsm_2/N70 ,
         \invader_fsm_2/move_interval_toggle , \invader_fsm_2/N56 ,
         \invader_fsm_2/N55 , \invader_fsm_2/N43 , \invader_fsm_2/N42 ,
         \invader_fsm_2/N40 , \invader_fsm_2/N38 , \invader_fsm_2/N35 ,
         \invader_fsm_2/N34 , \invader_fsm_2/N33 , \invader_fsm_2/N32 ,
         \invader_fsm_2/N31 , \invader_fsm_2/N30 , \invader_fsm_2/N29 ,
         \invader_fsm_2/N27 , \invader_fsm_2/N26 , \invader_fsm_2/N24 ,
         \invader_fsm_2/N22 , \invader_fsm_2/N19 , \invader_fsm_2/N18 ,
         \invader_fsm_2/N17 , \invader_fsm_2/N16 , \invader_fsm_2/N15 ,
         \invader_fsm_2/N14 , \invader_fsm_2/N13 , \invader_fsm_2/state[0] ,
         \invader_fsm_2/state[1] , \invader_fsm_3/n117 , \invader_fsm_3/n116 ,
         \invader_fsm_3/n115 , \invader_fsm_3/n114 , \invader_fsm_3/n113 ,
         \invader_fsm_3/n112 , \invader_fsm_3/n111 , \invader_fsm_3/n110 ,
         \invader_fsm_3/n109 , \invader_fsm_3/n108 , \invader_fsm_3/n107 ,
         \invader_fsm_3/n106 , \invader_fsm_3/n105 , \invader_fsm_3/n104 ,
         \invader_fsm_3/n103 , \invader_fsm_3/n102 , \invader_fsm_3/n101 ,
         \invader_fsm_3/n100 , \invader_fsm_3/n99 , \invader_fsm_3/n98 ,
         \invader_fsm_3/n97 , \invader_fsm_3/n96 , \invader_fsm_3/n95 ,
         \invader_fsm_3/n94 , \invader_fsm_3/n93 , \invader_fsm_3/n92 ,
         \invader_fsm_3/n91 , \invader_fsm_3/n90 , \invader_fsm_3/n89 ,
         \invader_fsm_3/n88 , \invader_fsm_3/n87 , \invader_fsm_3/n86 ,
         \invader_fsm_3/n85 , \invader_fsm_3/n84 , \invader_fsm_3/n83 ,
         \invader_fsm_3/n82 , \invader_fsm_3/n81 , \invader_fsm_3/n80 ,
         \invader_fsm_3/n79 , \invader_fsm_3/n78 , \invader_fsm_3/n77 ,
         \invader_fsm_3/n76 , \invader_fsm_3/n75 , \invader_fsm_3/n74 ,
         \invader_fsm_3/n73 , \invader_fsm_3/n72 , \invader_fsm_3/n71 ,
         \invader_fsm_3/n70 , \invader_fsm_3/n69 , \invader_fsm_3/n68 ,
         \invader_fsm_3/n67 , \invader_fsm_3/n66 , \invader_fsm_3/n65 ,
         \invader_fsm_3/n64 , \invader_fsm_3/n63 , \invader_fsm_3/n62 ,
         \invader_fsm_3/n61 , \invader_fsm_3/n60 , \invader_fsm_3/n59 ,
         \invader_fsm_3/n58 , \invader_fsm_3/n57 , \invader_fsm_3/n56 ,
         \invader_fsm_3/n55 , \invader_fsm_3/n54 , \invader_fsm_3/N89 ,
         \invader_fsm_3/N88 , \invader_fsm_3/N86 , \invader_fsm_3/N84 ,
         \invader_fsm_3/N75 , \invader_fsm_3/N74 , \invader_fsm_3/N73 ,
         \invader_fsm_3/N72 , \invader_fsm_3/N70 ,
         \invader_fsm_3/move_interval_toggle , \invader_fsm_3/N56 ,
         \invader_fsm_3/N55 , \invader_fsm_3/N43 , \invader_fsm_3/N42 ,
         \invader_fsm_3/N40 , \invader_fsm_3/N38 , \invader_fsm_3/N35 ,
         \invader_fsm_3/N34 , \invader_fsm_3/N33 , \invader_fsm_3/N32 ,
         \invader_fsm_3/N31 , \invader_fsm_3/N30 , \invader_fsm_3/N29 ,
         \invader_fsm_3/N27 , \invader_fsm_3/N26 , \invader_fsm_3/N24 ,
         \invader_fsm_3/N22 , \invader_fsm_3/N19 , \invader_fsm_3/N18 ,
         \invader_fsm_3/N17 , \invader_fsm_3/N16 , \invader_fsm_3/N15 ,
         \invader_fsm_3/N14 , \invader_fsm_3/N13 , \invader_fsm_3/state[0] ,
         \invader_fsm_3/state[1] , \invader_fsm_4/n117 , \invader_fsm_4/n116 ,
         \invader_fsm_4/n115 , \invader_fsm_4/n114 , \invader_fsm_4/n113 ,
         \invader_fsm_4/n112 , \invader_fsm_4/n111 , \invader_fsm_4/n110 ,
         \invader_fsm_4/n109 , \invader_fsm_4/n108 , \invader_fsm_4/n107 ,
         \invader_fsm_4/n106 , \invader_fsm_4/n105 , \invader_fsm_4/n104 ,
         \invader_fsm_4/n103 , \invader_fsm_4/n102 , \invader_fsm_4/n101 ,
         \invader_fsm_4/n100 , \invader_fsm_4/n99 , \invader_fsm_4/n98 ,
         \invader_fsm_4/n97 , \invader_fsm_4/n96 , \invader_fsm_4/n95 ,
         \invader_fsm_4/n94 , \invader_fsm_4/n93 , \invader_fsm_4/n92 ,
         \invader_fsm_4/n91 , \invader_fsm_4/n90 , \invader_fsm_4/n89 ,
         \invader_fsm_4/n88 , \invader_fsm_4/n87 , \invader_fsm_4/n86 ,
         \invader_fsm_4/n85 , \invader_fsm_4/n84 , \invader_fsm_4/n83 ,
         \invader_fsm_4/n82 , \invader_fsm_4/n81 , \invader_fsm_4/n80 ,
         \invader_fsm_4/n79 , \invader_fsm_4/n78 , \invader_fsm_4/n77 ,
         \invader_fsm_4/n76 , \invader_fsm_4/n75 , \invader_fsm_4/n74 ,
         \invader_fsm_4/n73 , \invader_fsm_4/n72 , \invader_fsm_4/n71 ,
         \invader_fsm_4/n70 , \invader_fsm_4/n69 , \invader_fsm_4/n68 ,
         \invader_fsm_4/n67 , \invader_fsm_4/n66 , \invader_fsm_4/n65 ,
         \invader_fsm_4/n64 , \invader_fsm_4/n63 , \invader_fsm_4/n62 ,
         \invader_fsm_4/n61 , \invader_fsm_4/n60 , \invader_fsm_4/n59 ,
         \invader_fsm_4/n58 , \invader_fsm_4/n57 , \invader_fsm_4/n56 ,
         \invader_fsm_4/n55 , \invader_fsm_4/n54 , \invader_fsm_4/N89 ,
         \invader_fsm_4/N88 , \invader_fsm_4/N86 , \invader_fsm_4/N84 ,
         \invader_fsm_4/N75 , \invader_fsm_4/N74 , \invader_fsm_4/N73 ,
         \invader_fsm_4/N72 , \invader_fsm_4/N70 ,
         \invader_fsm_4/move_interval_toggle , \invader_fsm_4/N56 ,
         \invader_fsm_4/N55 , \invader_fsm_4/N43 , \invader_fsm_4/N42 ,
         \invader_fsm_4/N40 , \invader_fsm_4/N38 , \invader_fsm_4/N35 ,
         \invader_fsm_4/N34 , \invader_fsm_4/N33 , \invader_fsm_4/N32 ,
         \invader_fsm_4/N31 , \invader_fsm_4/N30 , \invader_fsm_4/N29 ,
         \invader_fsm_4/N27 , \invader_fsm_4/N26 , \invader_fsm_4/N24 ,
         \invader_fsm_4/N22 , \invader_fsm_4/N19 , \invader_fsm_4/N18 ,
         \invader_fsm_4/N17 , \invader_fsm_4/N16 , \invader_fsm_4/N15 ,
         \invader_fsm_4/N14 , \invader_fsm_4/N13 , \invader_fsm_4/state[0] ,
         \invader_fsm_4/state[1] , \player_bullet_fsm/n50 ,
         \player_bullet_fsm/n48 , \player_bullet_fsm/n47 ,
         \player_bullet_fsm/n45 , \player_bullet_fsm/n42 ,
         \player_bullet_fsm/n35 , \player_bullet_fsm/n34 ,
         \player_bullet_fsm/n33 , \player_bullet_fsm/n32 ,
         \player_bullet_fsm/n31 , \player_bullet_fsm/n30 ,
         \player_bullet_fsm/n29 , \player_bullet_fsm/n28 ,
         \player_bullet_fsm/N26 , \player_bullet_fsm/N25 ,
         \player_bullet_fsm/N24 , \player_bullet_fsm/N23 ,
         \player_bullet_fsm/N22 , \player_bullet_fsm/N15 ,
         \player_bullet_fsm/next_state[0] , \player_bullet_fsm/state[0] ,
         \invader_bullet_fsm/n53 , \invader_bullet_fsm/n52 ,
         \invader_bullet_fsm/n51 , \invader_bullet_fsm/n50 ,
         \invader_bullet_fsm/n49 , \invader_bullet_fsm/n48 ,
         \invader_bullet_fsm/n47 , \invader_bullet_fsm/n46 ,
         \invader_bullet_fsm/n45 , \invader_bullet_fsm/n44 ,
         \invader_bullet_fsm/n43 , \invader_bullet_fsm/n41 ,
         \invader_bullet_fsm/n38 , \invader_bullet_fsm/n36 ,
         \invader_bullet_fsm/n35 , \invader_bullet_fsm/n34 ,
         \invader_bullet_fsm/n33 , \invader_bullet_fsm/n32 ,
         \invader_bullet_fsm/n31 , \invader_bullet_fsm/n29 ,
         \invader_bullet_fsm/n28 , \invader_bullet_fsm/n25 ,
         \invader_bullet_fsm/n22 , \invader_bullet_fsm/n21 ,
         \invader_bullet_fsm/n20 , \invader_bullet_fsm/n19 ,
         \invader_bullet_fsm/n18 , \invader_bullet_fsm/n16 ,
         \invader_bullet_fsm/n15 , \invader_bullet_fsm/n14 ,
         \invader_bullet_fsm/N40 , \invader_bullet_fsm/N30 ,
         \invader_bullet_fsm/N29 , \invader_bullet_fsm/N28 ,
         \invader_bullet_fsm/N26 , \invader_bullet_fsm/N19 ,
         \invader_bullet_fsm/next_state[0] , \invader_bullet_fsm/N13 ,
         \invader_bullet_fsm/state[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n66, n67, n68, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894;
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
        invader_outofbounds_signal_1), .Y(\main_game_fsm/n183 ) );
  NOR2X1 \main_game_fsm/U198  ( .A(invader_outofbounds_signal_4), .B(
        invader_outofbounds_signal_3), .Y(\main_game_fsm/n184 ) );
  NAND2X1 \main_game_fsm/U197  ( .A(\main_game_fsm/n183 ), .B(
        \main_game_fsm/n184 ), .Y(\main_game_fsm/n102 ) );
  NAND2X1 \main_game_fsm/U196  ( .A(n155), .B(\main_game_fsm/n102 ), .Y(
        \main_game_fsm/n173 ) );
  OR2X1 \main_game_fsm/U195  ( .A(invader_3_display), .B(invader_4_display), 
        .Y(\main_game_fsm/n181 ) );
  OR2X1 \main_game_fsm/U194  ( .A(invader_1_display), .B(invader_2_display), 
        .Y(\main_game_fsm/n182 ) );
  OAI21X1 \main_game_fsm/U193  ( .A(\main_game_fsm/n181 ), .B(
        \main_game_fsm/n182 ), .C(player_display), .Y(\main_game_fsm/n180 ) );
  NOR2X1 \main_game_fsm/U192  ( .A(n157), .B(\main_game_fsm/n180 ), .Y(
        \main_game_fsm/n177 ) );
  OR2X1 \main_game_fsm/U191  ( .A(reset), .B(\main_game_fsm/state[1] ), .Y(
        \main_game_fsm/n179 ) );
  NOR2X1 \main_game_fsm/U190  ( .A(\main_game_fsm/N111 ), .B(
        \main_game_fsm/n179 ), .Y(\main_game_fsm/n178 ) );
  NAND2X1 \main_game_fsm/U189  ( .A(\main_game_fsm/n177 ), .B(
        \main_game_fsm/n178 ), .Y(\main_game_fsm/n174 ) );
  NOR2X1 \main_game_fsm/U188  ( .A(\main_game_fsm/state[0] ), .B(reset), .Y(
        \main_game_fsm/n176 ) );
  OAI21X1 \main_game_fsm/U187  ( .A(player_shoot_input), .B(
        \main_game_fsm/state[1] ), .C(\main_game_fsm/n176 ), .Y(
        \main_game_fsm/n175 ) );
  OAI21X1 \main_game_fsm/U186  ( .A(n154), .B(\main_game_fsm/n174 ), .C(
        \main_game_fsm/n175 ), .Y(\main_game_fsm/N122 ) );
  NOR2X1 \main_game_fsm/U185  ( .A(\main_game_fsm/n173 ), .B(
        \main_game_fsm/n174 ), .Y(\main_game_fsm/N123 ) );
  NOR2X1 \main_game_fsm/U184  ( .A(n156), .B(\main_game_fsm/next_state [1]), 
        .Y(\main_game_fsm/n99 ) );
  NAND2X1 \main_game_fsm/U183  ( .A(\main_game_fsm/next_state [1]), .B(n156), 
        .Y(\main_game_fsm/n104 ) );
  NAND2X1 \main_game_fsm/U182  ( .A(n153), .B(\main_game_fsm/n104 ), .Y(
        \main_game_fsm/n103 ) );
  NAND2X1 \main_game_fsm/U181  ( .A(\main_game_fsm/n103 ), .B(n93), .Y(
        \main_game_fsm/n172 ) );
  NOR2X1 \main_game_fsm/U180  ( .A(n156), .B(\main_game_fsm/n172 ), .Y(
        \main_game_fsm/N144 ) );
  NOR2X1 \main_game_fsm/U179  ( .A(n152), .B(\main_game_fsm/n172 ), .Y(
        \main_game_fsm/N145 ) );
  AOI22X1 \main_game_fsm/U176  ( .A(\invader_fsm_4/N84 ), .B(n4), .C(
        \invader_fsm_3/N84 ), .D(n71), .Y(\main_game_fsm/n170 ) );
  AOI22X1 \main_game_fsm/U175  ( .A(\invader_fsm_2/N84 ), .B(n3), .C(
        \invader_fsm_1/N84 ), .D(n70), .Y(\main_game_fsm/n171 ) );
  NAND2X1 \main_game_fsm/U174  ( .A(\main_game_fsm/n170 ), .B(
        \main_game_fsm/n171 ), .Y(closest_invader_coord_x[0]) );
  AOI22X1 \main_game_fsm/U173  ( .A(invader_4_coord_x[1]), .B(n4), .C(
        invader_3_coord_x[1]), .D(n71), .Y(\main_game_fsm/n168 ) );
  AOI22X1 \main_game_fsm/U172  ( .A(invader_2_coord_x[1]), .B(n3), .C(
        invader_1_coord_x[1]), .D(n70), .Y(\main_game_fsm/n169 ) );
  NAND2X1 \main_game_fsm/U171  ( .A(\main_game_fsm/n168 ), .B(
        \main_game_fsm/n169 ), .Y(closest_invader_coord_x[1]) );
  AOI22X1 \main_game_fsm/U170  ( .A(invader_4_coord_x[2]), .B(n4), .C(
        invader_3_coord_x[2]), .D(n71), .Y(\main_game_fsm/n166 ) );
  AOI22X1 \main_game_fsm/U169  ( .A(invader_2_coord_x[2]), .B(n3), .C(
        invader_1_coord_x[2]), .D(n70), .Y(\main_game_fsm/n167 ) );
  NAND2X1 \main_game_fsm/U168  ( .A(\main_game_fsm/n166 ), .B(
        \main_game_fsm/n167 ), .Y(closest_invader_coord_x[2]) );
  AOI22X1 \main_game_fsm/U167  ( .A(invader_4_coord_x[3]), .B(n4), .C(
        invader_3_coord_x[3]), .D(n71), .Y(\main_game_fsm/n164 ) );
  AOI22X1 \main_game_fsm/U166  ( .A(invader_2_coord_x[3]), .B(n3), .C(
        invader_1_coord_x[3]), .D(n70), .Y(\main_game_fsm/n165 ) );
  NAND2X1 \main_game_fsm/U165  ( .A(\main_game_fsm/n164 ), .B(
        \main_game_fsm/n165 ), .Y(closest_invader_coord_x[3]) );
  AOI22X1 \main_game_fsm/U164  ( .A(invader_4_coord_x[4]), .B(n4), .C(
        invader_3_coord_x[4]), .D(n71), .Y(\main_game_fsm/n162 ) );
  AOI22X1 \main_game_fsm/U163  ( .A(invader_2_coord_x[4]), .B(n3), .C(
        invader_1_coord_x[4]), .D(n70), .Y(\main_game_fsm/n163 ) );
  NAND2X1 \main_game_fsm/U162  ( .A(\main_game_fsm/n162 ), .B(
        \main_game_fsm/n163 ), .Y(closest_invader_coord_x[4]) );
  AOI22X1 \main_game_fsm/U161  ( .A(invader_4_coord_x[5]), .B(n4), .C(
        invader_3_coord_x[5]), .D(n71), .Y(\main_game_fsm/n160 ) );
  AOI22X1 \main_game_fsm/U160  ( .A(invader_2_coord_x[5]), .B(n3), .C(
        invader_1_coord_x[5]), .D(n70), .Y(\main_game_fsm/n161 ) );
  NAND2X1 \main_game_fsm/U159  ( .A(\main_game_fsm/n160 ), .B(
        \main_game_fsm/n161 ), .Y(closest_invader_coord_x[5]) );
  AOI22X1 \main_game_fsm/U158  ( .A(\invader_fsm_4/N70 ), .B(n4), .C(
        \invader_fsm_3/N70 ), .D(n71), .Y(\main_game_fsm/n158 ) );
  AOI22X1 \main_game_fsm/U157  ( .A(\invader_fsm_2/N70 ), .B(n3), .C(
        \invader_fsm_1/N70 ), .D(n70), .Y(\main_game_fsm/n159 ) );
  NAND2X1 \main_game_fsm/U156  ( .A(\main_game_fsm/n158 ), .B(
        \main_game_fsm/n159 ), .Y(closest_invader_coord_y[0]) );
  AOI22X1 \main_game_fsm/U155  ( .A(invader_4_coord_y[1]), .B(n4), .C(
        invader_3_coord_y[1]), .D(n71), .Y(\main_game_fsm/n156 ) );
  AOI22X1 \main_game_fsm/U154  ( .A(invader_2_coord_y[1]), .B(n3), .C(
        invader_1_coord_y[1]), .D(n70), .Y(\main_game_fsm/n157 ) );
  NAND2X1 \main_game_fsm/U153  ( .A(\main_game_fsm/n156 ), .B(
        \main_game_fsm/n157 ), .Y(closest_invader_coord_y[1]) );
  AOI22X1 \main_game_fsm/U152  ( .A(invader_4_coord_y[2]), .B(n4), .C(
        invader_3_coord_y[2]), .D(n71), .Y(\main_game_fsm/n154 ) );
  AOI22X1 \main_game_fsm/U151  ( .A(invader_2_coord_y[2]), .B(n3), .C(
        invader_1_coord_y[2]), .D(n70), .Y(\main_game_fsm/n155 ) );
  NAND2X1 \main_game_fsm/U150  ( .A(\main_game_fsm/n154 ), .B(
        \main_game_fsm/n155 ), .Y(closest_invader_coord_y[2]) );
  AOI22X1 \main_game_fsm/U149  ( .A(invader_4_coord_y[3]), .B(n4), .C(
        invader_3_coord_y[3]), .D(n71), .Y(\main_game_fsm/n152 ) );
  AOI22X1 \main_game_fsm/U148  ( .A(invader_2_coord_y[3]), .B(n3), .C(
        invader_1_coord_y[3]), .D(n70), .Y(\main_game_fsm/n153 ) );
  NAND2X1 \main_game_fsm/U147  ( .A(\main_game_fsm/n152 ), .B(
        \main_game_fsm/n153 ), .Y(closest_invader_coord_y[3]) );
  AOI22X1 \main_game_fsm/U146  ( .A(invader_4_coord_y[4]), .B(n4), .C(
        invader_3_coord_y[4]), .D(n71), .Y(\main_game_fsm/n150 ) );
  AOI22X1 \main_game_fsm/U145  ( .A(invader_2_coord_y[4]), .B(n3), .C(
        invader_1_coord_y[4]), .D(n70), .Y(\main_game_fsm/n151 ) );
  NAND2X1 \main_game_fsm/U144  ( .A(\main_game_fsm/n150 ), .B(
        \main_game_fsm/n151 ), .Y(closest_invader_coord_y[4]) );
  AOI22X1 \main_game_fsm/U143  ( .A(invader_4_coord_y[5]), .B(n4), .C(
        invader_3_coord_y[5]), .D(n71), .Y(\main_game_fsm/n144 ) );
  AOI22X1 \main_game_fsm/U142  ( .A(invader_2_coord_y[5]), .B(n3), .C(
        invader_1_coord_y[5]), .D(n70), .Y(\main_game_fsm/n145 ) );
  NAND2X1 \main_game_fsm/U141  ( .A(\main_game_fsm/n144 ), .B(
        \main_game_fsm/n145 ), .Y(closest_invader_coord_y[5]) );
  AOI22X1 \main_game_fsm/U140  ( .A(\main_game_fsm/N35 ), .B(n192), .C(
        \main_game_fsm/N29 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n143 ) );
  NAND2X1 \main_game_fsm/U139  ( .A(\main_game_fsm/n143 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [0]) );
  AOI22X1 \main_game_fsm/U138  ( .A(\main_game_fsm/N36 ), .B(n192), .C(
        \main_game_fsm/N30 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n142 ) );
  NAND2X1 \main_game_fsm/U137  ( .A(\main_game_fsm/n142 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [1]) );
  AOI22X1 \main_game_fsm/U136  ( .A(\main_game_fsm/N37 ), .B(n192), .C(
        \main_game_fsm/N31 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n141 ) );
  NAND2X1 \main_game_fsm/U135  ( .A(\main_game_fsm/n141 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [2]) );
  AOI22X1 \main_game_fsm/U134  ( .A(\main_game_fsm/N38 ), .B(n192), .C(
        \main_game_fsm/N32 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n140 ) );
  NAND2X1 \main_game_fsm/U133  ( .A(\main_game_fsm/n140 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [3]) );
  AOI22X1 \main_game_fsm/U132  ( .A(\main_game_fsm/N39 ), .B(n192), .C(
        \main_game_fsm/N33 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n139 ) );
  NAND2X1 \main_game_fsm/U131  ( .A(\main_game_fsm/n139 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [4]) );
  AOI22X1 \main_game_fsm/U130  ( .A(\main_game_fsm/N40 ), .B(n192), .C(
        \main_game_fsm/N34 ), .D(\main_game_fsm/N27 ), .Y(\main_game_fsm/n138 ) );
  NAND2X1 \main_game_fsm/U129  ( .A(\main_game_fsm/n138 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [5]) );
  AOI22X1 \main_game_fsm/U128  ( .A(\main_game_fsm/N49 ), .B(n187), .C(
        \main_game_fsm/N43 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n137 ) );
  NAND2X1 \main_game_fsm/U127  ( .A(\main_game_fsm/n137 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [0]) );
  AOI22X1 \main_game_fsm/U126  ( .A(\main_game_fsm/N50 ), .B(n187), .C(
        \main_game_fsm/N44 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n136 ) );
  NAND2X1 \main_game_fsm/U125  ( .A(\main_game_fsm/n136 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [1]) );
  AOI22X1 \main_game_fsm/U124  ( .A(\main_game_fsm/N51 ), .B(n187), .C(
        \main_game_fsm/N45 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n135 ) );
  NAND2X1 \main_game_fsm/U123  ( .A(\main_game_fsm/n135 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [2]) );
  AOI22X1 \main_game_fsm/U122  ( .A(\main_game_fsm/N52 ), .B(n187), .C(
        \main_game_fsm/N46 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n134 ) );
  NAND2X1 \main_game_fsm/U121  ( .A(\main_game_fsm/n134 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [3]) );
  AOI22X1 \main_game_fsm/U120  ( .A(\main_game_fsm/N53 ), .B(n187), .C(
        \main_game_fsm/N47 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n133 ) );
  NAND2X1 \main_game_fsm/U119  ( .A(\main_game_fsm/n133 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [4]) );
  AOI22X1 \main_game_fsm/U118  ( .A(\main_game_fsm/N54 ), .B(n187), .C(
        \main_game_fsm/N48 ), .D(\main_game_fsm/N41 ), .Y(\main_game_fsm/n132 ) );
  NAND2X1 \main_game_fsm/U117  ( .A(\main_game_fsm/n132 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [5]) );
  AOI22X1 \main_game_fsm/U116  ( .A(\main_game_fsm/N63 ), .B(n176), .C(
        \main_game_fsm/N57 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n131 ) );
  NAND2X1 \main_game_fsm/U115  ( .A(\main_game_fsm/n131 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [0]) );
  AOI22X1 \main_game_fsm/U114  ( .A(\main_game_fsm/N64 ), .B(n176), .C(
        \main_game_fsm/N58 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n130 ) );
  NAND2X1 \main_game_fsm/U113  ( .A(\main_game_fsm/n130 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [1]) );
  AOI22X1 \main_game_fsm/U112  ( .A(\main_game_fsm/N65 ), .B(n176), .C(
        \main_game_fsm/N59 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n129 ) );
  NAND2X1 \main_game_fsm/U111  ( .A(\main_game_fsm/n129 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [2]) );
  AOI22X1 \main_game_fsm/U110  ( .A(\main_game_fsm/N66 ), .B(n176), .C(
        \main_game_fsm/N60 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n128 ) );
  NAND2X1 \main_game_fsm/U109  ( .A(\main_game_fsm/n128 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [3]) );
  AOI22X1 \main_game_fsm/U108  ( .A(\main_game_fsm/N67 ), .B(n176), .C(
        \main_game_fsm/N61 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n127 ) );
  NAND2X1 \main_game_fsm/U107  ( .A(\main_game_fsm/n127 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [4]) );
  AOI22X1 \main_game_fsm/U106  ( .A(\main_game_fsm/N68 ), .B(n176), .C(
        \main_game_fsm/N62 ), .D(\main_game_fsm/N55 ), .Y(\main_game_fsm/n126 ) );
  NAND2X1 \main_game_fsm/U105  ( .A(\main_game_fsm/n126 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [5]) );
  AOI22X1 \main_game_fsm/U104  ( .A(\main_game_fsm/N77 ), .B(n171), .C(
        \main_game_fsm/N71 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n125 ) );
  NAND2X1 \main_game_fsm/U103  ( .A(\main_game_fsm/n125 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [0]) );
  AOI22X1 \main_game_fsm/U102  ( .A(\main_game_fsm/N78 ), .B(n171), .C(
        \main_game_fsm/N72 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n124 ) );
  NAND2X1 \main_game_fsm/U101  ( .A(\main_game_fsm/n124 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [1]) );
  AOI22X1 \main_game_fsm/U100  ( .A(\main_game_fsm/N79 ), .B(n171), .C(
        \main_game_fsm/N73 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n123 ) );
  NAND2X1 \main_game_fsm/U99  ( .A(\main_game_fsm/n123 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [2]) );
  AOI22X1 \main_game_fsm/U98  ( .A(\main_game_fsm/N80 ), .B(n171), .C(
        \main_game_fsm/N74 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n122 ) );
  NAND2X1 \main_game_fsm/U97  ( .A(\main_game_fsm/n122 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [3]) );
  AOI22X1 \main_game_fsm/U96  ( .A(\main_game_fsm/N81 ), .B(n171), .C(
        \main_game_fsm/N75 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n121 ) );
  NAND2X1 \main_game_fsm/U95  ( .A(\main_game_fsm/n121 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [4]) );
  AOI22X1 \main_game_fsm/U94  ( .A(\main_game_fsm/N82 ), .B(n171), .C(
        \main_game_fsm/N76 ), .D(\main_game_fsm/N69 ), .Y(\main_game_fsm/n120 ) );
  NAND2X1 \main_game_fsm/U93  ( .A(\main_game_fsm/n120 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [5]) );
  AOI22X1 \main_game_fsm/U92  ( .A(n181), .B(\main_game_fsm/diff_alive2 [0]), 
        .C(\main_game_fsm/diff_alive1 [0]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n119 ) );
  AOI22X1 \main_game_fsm/U91  ( .A(n181), .B(\main_game_fsm/diff_alive2 [1]), 
        .C(\main_game_fsm/diff_alive1 [1]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n118 ) );
  AOI22X1 \main_game_fsm/U90  ( .A(n181), .B(\main_game_fsm/diff_alive2 [2]), 
        .C(\main_game_fsm/diff_alive1 [2]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n117 ) );
  AOI22X1 \main_game_fsm/U89  ( .A(n181), .B(\main_game_fsm/diff_alive2 [3]), 
        .C(\main_game_fsm/diff_alive1 [3]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n116 ) );
  AOI22X1 \main_game_fsm/U88  ( .A(n181), .B(\main_game_fsm/diff_alive2 [4]), 
        .C(\main_game_fsm/diff_alive1 [4]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n115 ) );
  AOI22X1 \main_game_fsm/U87  ( .A(n181), .B(\main_game_fsm/diff_alive2 [5]), 
        .C(\main_game_fsm/diff_alive1 [5]), .D(\main_game_fsm/N87 ), .Y(
        \main_game_fsm/n114 ) );
  AOI22X1 \main_game_fsm/U86  ( .A(n165), .B(\main_game_fsm/diff_alive4 [0]), 
        .C(\main_game_fsm/diff_alive3 [0]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n113 ) );
  AOI22X1 \main_game_fsm/U85  ( .A(n165), .B(\main_game_fsm/diff_alive4 [1]), 
        .C(\main_game_fsm/diff_alive3 [1]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n112 ) );
  AOI22X1 \main_game_fsm/U84  ( .A(n165), .B(\main_game_fsm/diff_alive4 [2]), 
        .C(\main_game_fsm/diff_alive3 [2]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n111 ) );
  AOI22X1 \main_game_fsm/U83  ( .A(n165), .B(\main_game_fsm/diff_alive4 [3]), 
        .C(\main_game_fsm/diff_alive3 [3]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n110 ) );
  AOI22X1 \main_game_fsm/U82  ( .A(n165), .B(\main_game_fsm/diff_alive4 [4]), 
        .C(\main_game_fsm/diff_alive3 [4]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n109 ) );
  AOI22X1 \main_game_fsm/U81  ( .A(n165), .B(\main_game_fsm/diff_alive4 [5]), 
        .C(\main_game_fsm/diff_alive3 [5]), .D(\main_game_fsm/N93 ), .Y(
        \main_game_fsm/n108 ) );
  XOR2X1 \main_game_fsm/U80  ( .A(\main_game_fsm/n104 ), .B(invader_direction), 
        .Y(\main_game_fsm/n107 ) );
  NAND2X1 \main_game_fsm/U79  ( .A(n156), .B(n152), .Y(\main_game_fsm/n106 )
         );
  NAND2X1 \main_game_fsm/U78  ( .A(\main_game_fsm/n107 ), .B(
        \main_game_fsm/n91 ), .Y(\main_game_fsm/n190 ) );
  NOR2X1 \main_game_fsm/U77  ( .A(reset), .B(\main_game_fsm/n99 ), .Y(
        \main_game_fsm/n95 ) );
  NAND2X1 \main_game_fsm/U76  ( .A(\main_game_fsm/n95 ), .B(
        \main_game_fsm/n106 ), .Y(\main_game_fsm/n90 ) );
  NAND2X1 \main_game_fsm/U75  ( .A(n95), .B(\main_game_fsm/n104 ), .Y(
        \main_game_fsm/n100 ) );
  NAND2X1 \main_game_fsm/U74  ( .A(move_down), .B(n94), .Y(
        \main_game_fsm/n105 ) );
  OAI21X1 \main_game_fsm/U73  ( .A(reset), .B(\main_game_fsm/n104 ), .C(
        \main_game_fsm/n105 ), .Y(\main_game_fsm/n189 ) );
  NAND3X1 \main_game_fsm/U72  ( .A(\main_game_fsm/n102 ), .B(n93), .C(
        \main_game_fsm/n103 ), .Y(\main_game_fsm/n101 ) );
  OAI21X1 \main_game_fsm/U71  ( .A(\main_game_fsm/n100 ), .B(n155), .C(
        \main_game_fsm/n101 ), .Y(\main_game_fsm/n188 ) );
  NAND2X1 \main_game_fsm/U70  ( .A(\main_game_fsm/n99 ), .B(n93), .Y(
        \main_game_fsm/n92 ) );
  NAND2X1 \main_game_fsm/U69  ( .A(playerbullet_fire), .B(n95), .Y(
        \main_game_fsm/n98 ) );
  OAI21X1 \main_game_fsm/U68  ( .A(\main_game_fsm/n92 ), .B(n99), .C(
        \main_game_fsm/n98 ), .Y(\main_game_fsm/n187 ) );
  NOR2X1 \main_game_fsm/U67  ( .A(\main_game_fsm/n95 ), .B(reset), .Y(
        \main_game_fsm/n94 ) );
  AOI21X1 \main_game_fsm/U66  ( .A(\main_game_fsm/n95 ), .B(invader_fire), .C(
        \main_game_fsm/n94 ), .Y(\main_game_fsm/n97 ) );
  AOI22X1 \main_game_fsm/U65  ( .A(player_left_input), .B(\main_game_fsm/n94 ), 
        .C(player_left_motion), .D(\main_game_fsm/n95 ), .Y(
        \main_game_fsm/n96 ) );
  AOI22X1 \main_game_fsm/U64  ( .A(player_right_input), .B(\main_game_fsm/n94 ), .C(player_right_motion), .D(\main_game_fsm/n95 ), .Y(\main_game_fsm/n93 ) );
  OAI21X1 \main_game_fsm/U63  ( .A(\main_game_fsm/n90 ), .B(n143), .C(
        \main_game_fsm/n92 ), .Y(\main_game_fsm/n186 ) );
  OAI21X1 \main_game_fsm/U62  ( .A(\main_game_fsm/n90 ), .B(n72), .C(
        \main_game_fsm/n91 ), .Y(\main_game_fsm/n185 ) );
  AND2X2 \main_game_fsm/U3  ( .A(n93), .B(\main_game_fsm/n106 ), .Y(
        \main_game_fsm/n91 ) );
  DFFNEGX1 \main_game_fsm/reset_reg  ( .D(\main_game_fsm/n185 ), .CLK(n92), 
        .Q(internal_reset) );
  DFFNEGX1 \main_game_fsm/play_reg  ( .D(\main_game_fsm/n186 ), .CLK(n92), .Q(
        play) );
  DFFNEGX1 \main_game_fsm/player_right_motion_reg  ( .D(n98), .CLK(n92), .Q(
        player_right_motion) );
  DFFNEGX1 \main_game_fsm/player_left_motion_reg  ( .D(n97), .CLK(n92), .Q(
        player_left_motion) );
  DFFNEGX1 \main_game_fsm/invader_direction_reg  ( .D(\main_game_fsm/n190 ), 
        .CLK(n92), .Q(invader_direction) );
  DFFNEGX1 \main_game_fsm/playerbullet_fire_reg  ( .D(\main_game_fsm/n187 ), 
        .CLK(n92), .Q(playerbullet_fire) );
  DFFNEGX1 \main_game_fsm/move_down_reg  ( .D(\main_game_fsm/n189 ), .CLK(n92), 
        .Q(move_down) );
  DFFNEGX1 \main_game_fsm/state_reg[1]  ( .D(\main_game_fsm/N145 ), .CLK(n92), 
        .Q(\main_game_fsm/state[1] ) );
  DFFNEGX1 \main_game_fsm/invaderbullet_fire_reg  ( .D(n96), .CLK(n92), .Q(
        invader_fire) );
  DFFNEGX1 \main_game_fsm/next_state_reg[1]  ( .D(\main_game_fsm/N123 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [1]) );
  DFFNEGX1 \main_game_fsm/prev_invader_outofbounds_reg  ( .D(
        \main_game_fsm/n188 ), .CLK(n92), .Q(
        \main_game_fsm/prev_invader_outofbounds ) );
  DFFNEGX1 \main_game_fsm/next_state_reg[0]  ( .D(\main_game_fsm/N122 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [0]) );
  DFFNEGX1 \main_game_fsm/state_reg[0]  ( .D(\main_game_fsm/N144 ), .CLK(n92), 
        .Q(\main_game_fsm/state[0] ) );
  NAND3X1 \player_fsm/U82  ( .A(n217), .B(n73), .C(\player_fsm/next_state [1]), 
        .Y(\player_fsm/n56 ) );
  NAND2X1 \player_fsm/U81  ( .A(\player_fsm/next_state [0]), .B(n215), .Y(
        \player_fsm/n79 ) );
  NOR2X1 \player_fsm/U80  ( .A(\player_fsm/n79 ), .B(n77), .Y(\player_fsm/n71 ) );
  NOR2X1 \player_fsm/U79  ( .A(n140), .B(\player_fsm/n71 ), .Y(
        \player_fsm/n81 ) );
  NOR2X1 \player_fsm/U78  ( .A(\player_fsm/n81 ), .B(n217), .Y(
        \player_fsm/N108 ) );
  NOR2X1 \player_fsm/U77  ( .A(\player_fsm/n81 ), .B(n215), .Y(
        \player_fsm/N109 ) );
  XOR2X1 \player_fsm/U76  ( .A(\player_fsm/next_state [1]), .B(
        \player_fsm/next_state [0]), .Y(\player_fsm/n80 ) );
  NAND2X1 \player_fsm/U74  ( .A(\player_fsm/n79 ), .B(n24), .Y(
        \player_fsm/N119 ) );
  AOI22X1 \player_fsm/U73  ( .A(\player_fsm/N38 ), .B(\player_fsm/N37 ), .C(
        \player_fsm/N47 ), .D(\player_fsm/N46 ), .Y(\player_fsm/n77 ) );
  AOI22X1 \player_fsm/U72  ( .A(\player_fsm/N20 ), .B(\player_fsm/N19 ), .C(
        \player_fsm/N29 ), .D(\player_fsm/N28 ), .Y(\player_fsm/n78 ) );
  OR2X1 \player_fsm/U71  ( .A(\player_fsm/n77 ), .B(\player_fsm/n78 ), .Y(
        \player_fsm/n74 ) );
  AOI22X1 \player_fsm/U70  ( .A(\player_fsm/state[0] ), .B(\player_fsm/n74 ), 
        .C(play), .D(n216), .Y(\player_fsm/n75 ) );
  OR2X1 \player_fsm/U69  ( .A(n74), .B(\player_fsm/state[1] ), .Y(
        \player_fsm/n76 ) );
  NOR2X1 \player_fsm/U68  ( .A(\player_fsm/n75 ), .B(\player_fsm/n76 ), .Y(
        \player_fsm/N59 ) );
  NOR2X1 \player_fsm/U67  ( .A(\player_fsm/state[1] ), .B(\player_fsm/n74 ), 
        .Y(\player_fsm/n73 ) );
  AOI22X1 \player_fsm/U66  ( .A(\player_fsm/n73 ), .B(\player_fsm/state[0] ), 
        .C(\player_fsm/state[1] ), .D(n216), .Y(\player_fsm/n72 ) );
  NOR2X1 \player_fsm/U65  ( .A(n77), .B(\player_fsm/n72 ), .Y(\player_fsm/N60 ) );
  NAND3X1 \player_fsm/U64  ( .A(\player_fsm/N74 ), .B(n147), .C(
        player_right_motion), .Y(\player_fsm/n65 ) );
  NAND3X1 \player_fsm/U63  ( .A(\player_fsm/N72 ), .B(n145), .C(
        player_left_motion), .Y(\player_fsm/n64 ) );
  NAND2X1 \player_fsm/U62  ( .A(\player_fsm/n65 ), .B(\player_fsm/n64 ), .Y(
        \player_fsm/n62 ) );
  OAI21X1 \player_fsm/U61  ( .A(n142), .B(\player_fsm/n62 ), .C(
        \player_fsm/n56 ), .Y(\player_fsm/n70 ) );
  NOR2X1 \player_fsm/U60  ( .A(\player_fsm/n65 ), .B(n142), .Y(
        \player_fsm/n58 ) );
  NOR2X1 \player_fsm/U59  ( .A(\player_fsm/n64 ), .B(n142), .Y(
        \player_fsm/n59 ) );
  AOI22X1 \player_fsm/U58  ( .A(n61), .B(\player_fsm/n58 ), .C(n61), .D(
        \player_fsm/n59 ), .Y(\player_fsm/n69 ) );
  OAI21X1 \player_fsm/U57  ( .A(n141), .B(n61), .C(\player_fsm/n69 ), .Y(
        \player_fsm/n88 ) );
  AOI22X1 \player_fsm/U56  ( .A(\player_fsm/N13 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N79 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n68 ) );
  OAI21X1 \player_fsm/U55  ( .A(n141), .B(n67), .C(\player_fsm/n68 ), .Y(
        \player_fsm/n87 ) );
  AOI22X1 \player_fsm/U54  ( .A(\player_fsm/N14 ), .B(\player_fsm/n58 ), .C(
        n194), .D(\player_fsm/n59 ), .Y(\player_fsm/n67 ) );
  OAI21X1 \player_fsm/U53  ( .A(n141), .B(n68), .C(\player_fsm/n67 ), .Y(
        \player_fsm/n86 ) );
  AOI22X1 \player_fsm/U52  ( .A(\player_fsm/N15 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N81 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n66 ) );
  OAI21X1 \player_fsm/U51  ( .A(n141), .B(n66), .C(\player_fsm/n66 ), .Y(
        \player_fsm/n85 ) );
  AOI22X1 \player_fsm/U50  ( .A(\player_fsm/N16 ), .B(n146), .C(
        \player_fsm/N82 ), .D(n144), .Y(\player_fsm/n63 ) );
  OAI21X1 \player_fsm/U49  ( .A(n140), .B(\player_fsm/n63 ), .C(n24), .Y(
        \player_fsm/n60 ) );
  OAI22X1 \player_fsm/U48  ( .A(n64), .B(\player_fsm/n56 ), .C(
        \player_fsm/n62 ), .D(n64), .Y(\player_fsm/n61 ) );
  OR2X1 \player_fsm/U47  ( .A(\player_fsm/n60 ), .B(\player_fsm/n61 ), .Y(
        \player_fsm/n84 ) );
  AOI22X1 \player_fsm/U46  ( .A(\player_fsm/N17 ), .B(\player_fsm/n58 ), .C(
        \player_fsm/N83 ), .D(\player_fsm/n59 ), .Y(\player_fsm/n57 ) );
  OAI21X1 \player_fsm/U45  ( .A(n141), .B(n62), .C(\player_fsm/n57 ), .Y(
        \player_fsm/n83 ) );
  NAND3X1 \player_fsm/U44  ( .A(n217), .B(n72), .C(
        invaderbullet_player_collision_signal), .Y(\player_fsm/n55 ) );
  NAND2X1 \player_fsm/U43  ( .A(\player_fsm/n55 ), .B(\player_fsm/n56 ), .Y(
        \player_fsm/n82 ) );
  DFFNEGX1 \player_fsm/invaderbullet_player_collision_signal_reg  ( .D(
        \player_fsm/n82 ), .CLK(n91), .Q(invaderbullet_player_collision_signal) );
  DFFNEGX1 \player_fsm/state_reg[1]  ( .D(\player_fsm/N109 ), .CLK(n91), .Q(
        \player_fsm/state[1] ) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[2]  ( .D(\player_fsm/n86 ), .CLK(n91), .Q(n897) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[1]  ( .D(\player_fsm/n87 ), .CLK(n91), .Q(player_coord_x[1]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[3]  ( .D(\player_fsm/n85 ), .CLK(n91), .Q(player_coord_x[3]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[4]  ( .D(\player_fsm/n84 ), .CLK(n91), .Q(n896) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[5]  ( .D(\player_fsm/n83 ), .CLK(n91), .Q(n895) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[0]  ( .D(\player_fsm/n88 ), .CLK(n91), .Q(player_coord_x[0]) );
  DFFNEGX1 \player_fsm/display_reg  ( .D(\player_fsm/N119 ), .CLK(n91), .Q(
        player_display) );
  DFFNEGX1 \player_fsm/next_state_reg[1]  ( .D(\player_fsm/N60 ), .CLK(clka), 
        .Q(\player_fsm/next_state [1]) );
  DFFNEGX1 \player_fsm/state_reg[0]  ( .D(\player_fsm/N108 ), .CLK(n91), .Q(
        \player_fsm/state[0] ) );
  DFFNEGX1 \player_fsm/next_state_reg[0]  ( .D(\player_fsm/N59 ), .CLK(clka), 
        .Q(\player_fsm/next_state [0]) );
  OAI21X1 \shield_fsm/U85  ( .A(\shield_fsm/next_state [1]), .B(
        \shield_fsm/next_state [0]), .C(n72), .Y(\shield_fsm/N102 ) );
  NOR2X1 \shield_fsm/U82  ( .A(invader_bullet_coord_y[5]), .B(
        invader_bullet_coord_y[3]), .Y(\shield_fsm/n83 ) );
  NAND3X1 \shield_fsm/U81  ( .A(\shield_fsm/N26 ), .B(\shield_fsm/N18 ), .C(
        \shield_fsm/n83 ), .Y(\shield_fsm/n76 ) );
  NOR2X1 \shield_fsm/U76  ( .A(invader_bullet_coord_y[4]), .B(n420), .Y(
        \shield_fsm/n80 ) );
  NAND3X1 \shield_fsm/U75  ( .A(n419), .B(invader_bullet_coord_y[0]), .C(
        \shield_fsm/n80 ), .Y(\shield_fsm/n77 ) );
  NOR2X1 \shield_fsm/U74  ( .A(\shield_fsm/n76 ), .B(\shield_fsm/n77 ), .Y(
        \shield_fsm/n63 ) );
  NAND3X1 \shield_fsm/U73  ( .A(n222), .B(n223), .C(\shield_fsm/n63 ), .Y(
        \shield_fsm/n73 ) );
  AOI22X1 \shield_fsm/U72  ( .A(\shield_fsm/state[0] ), .B(\shield_fsm/n73 ), 
        .C(play), .D(n218), .Y(\shield_fsm/n74 ) );
  OR2X1 \shield_fsm/U71  ( .A(n74), .B(\shield_fsm/state[1] ), .Y(
        \shield_fsm/n75 ) );
  NOR2X1 \shield_fsm/U70  ( .A(\shield_fsm/n74 ), .B(\shield_fsm/n75 ), .Y(
        \shield_fsm/N55 ) );
  NOR2X1 \shield_fsm/U69  ( .A(\shield_fsm/state[1] ), .B(\shield_fsm/n73 ), 
        .Y(\shield_fsm/n72 ) );
  AOI22X1 \shield_fsm/U68  ( .A(\shield_fsm/n72 ), .B(\shield_fsm/state[0] ), 
        .C(\shield_fsm/state[1] ), .D(n218), .Y(\shield_fsm/n71 ) );
  NOR2X1 \shield_fsm/U67  ( .A(n77), .B(\shield_fsm/n71 ), .Y(\shield_fsm/N56 ) );
  NAND2X1 \shield_fsm/U66  ( .A(\shield_fsm/next_state [0]), .B(n221), .Y(
        \shield_fsm/n69 ) );
  NOR2X1 \shield_fsm/U65  ( .A(n77), .B(\shield_fsm/n69 ), .Y(\shield_fsm/N97 ) );
  OR2X1 \shield_fsm/U64  ( .A(\shield_fsm/next_state [0]), .B(n78), .Y(
        \shield_fsm/n70 ) );
  NOR2X1 \shield_fsm/U63  ( .A(n221), .B(\shield_fsm/n70 ), .Y(
        \shield_fsm/N98 ) );
  NAND2X1 \shield_fsm/U62  ( .A(n220), .B(\shield_fsm/n63 ), .Y(
        \shield_fsm/n67 ) );
  NAND2X1 \shield_fsm/U61  ( .A(n219), .B(n223), .Y(\shield_fsm/n64 ) );
  OAI21X1 \shield_fsm/U60  ( .A(n219), .B(n223), .C(\shield_fsm/n68 ), .Y(
        \shield_fsm/n90 ) );
  OAI21X1 \shield_fsm/U59  ( .A(shield_hp[0]), .B(\shield_fsm/n67 ), .C(
        shield_hp[1]), .Y(\shield_fsm/n66 ) );
  OAI21X1 \shield_fsm/U58  ( .A(shield_hp[1]), .B(\shield_fsm/n64 ), .C(
        \shield_fsm/n65 ), .Y(\shield_fsm/n89 ) );
  NAND2X1 \shield_fsm/U57  ( .A(n220), .B(n72), .Y(\shield_fsm/n61 ) );
  NOR2X1 \shield_fsm/U56  ( .A(n220), .B(\shield_fsm/N102 ), .Y(
        \shield_fsm/n46 ) );
  NAND2X1 \shield_fsm/U55  ( .A(invaderbullet_shield_collision_signal), .B(
        \shield_fsm/n50 ), .Y(\shield_fsm/n62 ) );
  OAI21X1 \shield_fsm/U54  ( .A(n411), .B(\shield_fsm/n61 ), .C(
        \shield_fsm/n62 ), .Y(\shield_fsm/n88 ) );
  NAND3X1 \shield_fsm/U53  ( .A(\shield_fsm/N34 ), .B(n139), .C(
        \shield_fsm/N42 ), .Y(\shield_fsm/n58 ) );
  NAND2X1 \shield_fsm/U51  ( .A(n400), .B(shield_hp[1]), .Y(\shield_fsm/n59 )
         );
  OR2X1 \shield_fsm/U50  ( .A(\shield_fsm/n58 ), .B(\shield_fsm/n59 ), .Y(
        \shield_fsm/n47 ) );
  NOR2X1 \shield_fsm/U47  ( .A(player_bullet_coord_y[5]), .B(
        player_bullet_coord_y[4]), .Y(\shield_fsm/n51 ) );
  NOR2X1 \shield_fsm/U43  ( .A(n404), .B(player_bullet_coord_y[1]), .Y(
        \shield_fsm/n53 ) );
  NAND3X1 \shield_fsm/U42  ( .A(\shield_fsm/n51 ), .B(player_bullet_coord_y[2]), .C(\shield_fsm/n53 ), .Y(\shield_fsm/n48 ) );
  NAND2X1 \shield_fsm/U41  ( .A(playerbullet_shield_collision_signal), .B(
        \shield_fsm/n50 ), .Y(\shield_fsm/n49 ) );
  OAI21X1 \shield_fsm/U40  ( .A(\shield_fsm/n47 ), .B(\shield_fsm/n48 ), .C(
        \shield_fsm/n49 ), .Y(\shield_fsm/n87 ) );
  OAI21X1 \shield_fsm/U39  ( .A(shield_hp[1]), .B(n411), .C(n220), .Y(
        \shield_fsm/n44 ) );
  NAND2X1 \shield_fsm/U38  ( .A(shield_display), .B(\shield_fsm/n46 ), .Y(
        \shield_fsm/n45 ) );
  NAND3X1 \shield_fsm/U37  ( .A(\shield_fsm/n44 ), .B(n138), .C(
        \shield_fsm/n45 ), .Y(\shield_fsm/n86 ) );
  AND2X2 \shield_fsm/U26  ( .A(n138), .B(\shield_fsm/n64 ), .Y(
        \shield_fsm/n68 ) );
  AND2X2 \shield_fsm/U25  ( .A(\shield_fsm/n66 ), .B(n138), .Y(
        \shield_fsm/n65 ) );
  AND2X2 \shield_fsm/U24  ( .A(\shield_fsm/n46 ), .B(
        \shield_fsm/next_state [0]), .Y(\shield_fsm/n50 ) );
  DFFNEGX1 \shield_fsm/invaderbullet_shield_collision_reg  ( .D(
        \shield_fsm/n88 ), .CLK(n91), .Q(invaderbullet_shield_collision_signal) );
  DFFNEGX1 \shield_fsm/playerbullet_shield_collision_reg  ( .D(
        \shield_fsm/n87 ), .CLK(n91), .Q(playerbullet_shield_collision_signal)
         );
  DFFNEGX1 \shield_fsm/shield_display_reg  ( .D(\shield_fsm/n86 ), .CLK(n91), 
        .Q(shield_display) );
  DFFNEGX1 \shield_fsm/state_reg[0]  ( .D(\shield_fsm/N97 ), .CLK(n90), .Q(
        \shield_fsm/state[0] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[1]  ( .D(\shield_fsm/N56 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [1]) );
  DFFNEGX1 \shield_fsm/state_reg[1]  ( .D(\shield_fsm/N98 ), .CLK(n90), .Q(
        \shield_fsm/state[1] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[0]  ( .D(\shield_fsm/N55 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [0]) );
  DFFNEGX1 \shield_fsm/hp_reg[1]  ( .D(\shield_fsm/n89 ), .CLK(n90), .Q(
        shield_hp[1]) );
  DFFNEGX1 \shield_fsm/hp_reg[0]  ( .D(\shield_fsm/n90 ), .CLK(n90), .Q(
        shield_hp[0]) );
  NAND3X1 \invader_fsm_1/U105  ( .A(\invader_fsm_1/N43 ), .B(
        \invader_fsm_1/N35 ), .C(\invader_fsm_1/n100 ), .Y(\invader_fsm_1/n96 ) );
  NAND3X1 \invader_fsm_1/U104  ( .A(n72), .B(n261), .C(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n70 ) );
  NOR2X1 \invader_fsm_1/U103  ( .A(\invader_fsm_1/state[1] ), .B(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n99 ) );
  NAND3X1 \invader_fsm_1/U102  ( .A(play), .B(n73), .C(\invader_fsm_1/n99 ), 
        .Y(\invader_fsm_1/n98 ) );
  OAI21X1 \invader_fsm_1/U101  ( .A(n224), .B(\invader_fsm_1/n70 ), .C(
        \invader_fsm_1/n98 ), .Y(\invader_fsm_1/N55 ) );
  NAND3X1 \invader_fsm_1/U100  ( .A(n72), .B(n264), .C(
        \invader_fsm_1/state[1] ), .Y(\invader_fsm_1/n97 ) );
  OAI21X1 \invader_fsm_1/U99  ( .A(\invader_fsm_1/n70 ), .B(
        \invader_fsm_1/n96 ), .C(\invader_fsm_1/n97 ), .Y(\invader_fsm_1/N56 )
         );
  NOR2X1 \invader_fsm_1/U98  ( .A(n265), .B(\invader_fsm_1/next_state [1]), 
        .Y(\invader_fsm_1/n68 ) );
  OR2X1 \invader_fsm_1/U97  ( .A(\invader_fsm_1/move_interval_toggle ), .B(n78), .Y(\invader_fsm_1/n94 ) );
  OAI21X1 \invader_fsm_1/U96  ( .A(\invader_fsm_1/next_state [1]), .B(
        \invader_fsm_1/next_state [0]), .C(n73), .Y(\invader_fsm_1/n73 ) );
  NAND3X1 \invader_fsm_1/U95  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        n263), .C(n133), .Y(\invader_fsm_1/n95 ) );
  OAI21X1 \invader_fsm_1/U94  ( .A(n263), .B(\invader_fsm_1/n94 ), .C(
        \invader_fsm_1/n95 ), .Y(\invader_fsm_1/n116 ) );
  AOI22X1 \invader_fsm_1/U93  ( .A(\invader_fsm_1/N13 ), .B(invader_direction), 
        .C(n260), .D(n148), .Y(\invader_fsm_1/n93 ) );
  OAI21X1 \invader_fsm_1/U92  ( .A(\invader_fsm_1/n93 ), .B(n263), .C(n133), 
        .Y(\invader_fsm_1/n91 ) );
  NAND2X1 \invader_fsm_1/U91  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        n149), .Y(\invader_fsm_1/n92 ) );
  NAND2X1 \invader_fsm_1/U90  ( .A(\invader_fsm_1/next_state [1]), .B(n265), 
        .Y(\invader_fsm_1/n69 ) );
  NOR2X1 \invader_fsm_1/U89  ( .A(\invader_fsm_1/n73 ), .B(n262), .Y(
        \invader_fsm_1/n63 ) );
  OAI21X1 \invader_fsm_1/U88  ( .A(n263), .B(\invader_fsm_1/n92 ), .C(
        \invader_fsm_1/n63 ), .Y(\invader_fsm_1/n86 ) );
  AOI22X1 \invader_fsm_1/U87  ( .A(\invader_fsm_1/n91 ), .B(
        \invader_fsm_1/n86 ), .C(invader_1_coord_x[1]), .D(n134), .Y(
        \invader_fsm_1/n90 ) );
  AOI22X1 \invader_fsm_1/U86  ( .A(n59), .B(invader_direction), .C(n59), .D(
        n148), .Y(\invader_fsm_1/n89 ) );
  OAI21X1 \invader_fsm_1/U85  ( .A(\invader_fsm_1/n89 ), .B(n263), .C(
        \invader_fsm_1/n69 ), .Y(\invader_fsm_1/n88 ) );
  NAND3X1 \invader_fsm_1/U84  ( .A(\invader_fsm_1/n86 ), .B(n73), .C(
        \invader_fsm_1/n88 ), .Y(\invader_fsm_1/n87 ) );
  OAI21X1 \invader_fsm_1/U83  ( .A(\invader_fsm_1/n86 ), .B(n59), .C(
        \invader_fsm_1/n87 ), .Y(\invader_fsm_1/n115 ) );
  NAND2X1 \invader_fsm_1/U82  ( .A(\invader_fsm_1/next_state [0]), .B(n72), 
        .Y(\invader_fsm_1/n76 ) );
  AOI22X1 \invader_fsm_1/U81  ( .A(\invader_fsm_1/N14 ), .B(invader_direction), 
        .C(\invader_fsm_1/N22 ), .D(n148), .Y(\invader_fsm_1/n83 ) );
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
  NOR2X1 \invader_fsm_1/U73  ( .A(\invader_fsm_1/n76 ), .B(n151), .Y(
        \invader_fsm_1/n55 ) );
  AOI22X1 \invader_fsm_1/U72  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/n55 ), .C(n253), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n79 ) );
  OAI21X1 \invader_fsm_1/U71  ( .A(\invader_fsm_1/n53 ), .B(n257), .C(
        \invader_fsm_1/n79 ), .Y(\invader_fsm_1/n113 ) );
  AOI22X1 \invader_fsm_1/U70  ( .A(invader_1_coord_x[4]), .B(
        \invader_fsm_1/n55 ), .C(\invader_fsm_1/N24 ), .D(\invader_fsm_1/n56 ), 
        .Y(\invader_fsm_1/n78 ) );
  OAI21X1 \invader_fsm_1/U69  ( .A(\invader_fsm_1/n53 ), .B(n249), .C(
        \invader_fsm_1/n78 ), .Y(\invader_fsm_1/n112 ) );
  AOI22X1 \invader_fsm_1/U68  ( .A(invader_1_coord_x[5]), .B(
        \invader_fsm_1/n55 ), .C(n244), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n77 ) );
  OAI21X1 \invader_fsm_1/U67  ( .A(\invader_fsm_1/n53 ), .B(n246), .C(
        \invader_fsm_1/n77 ), .Y(\invader_fsm_1/n111 ) );
  NAND2X1 \invader_fsm_1/U66  ( .A(\invader_fsm_1/n63 ), .B(n263), .Y(
        \invader_fsm_1/n74 ) );
  OAI22X1 \invader_fsm_1/U65  ( .A(n264), .B(\invader_fsm_1/n74 ), .C(n135), 
        .D(\invader_fsm_1/n76 ), .Y(\invader_fsm_1/n110 ) );
  NAND3X1 \invader_fsm_1/U64  ( .A(\invader_fsm_1/n74 ), .B(n73), .C(
        \invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n75 ) );
  OAI21X1 \invader_fsm_1/U63  ( .A(\invader_fsm_1/n74 ), .B(n261), .C(
        \invader_fsm_1/n75 ), .Y(\invader_fsm_1/n109 ) );
  AOI21X1 \invader_fsm_1/U62  ( .A(\invader_fsm_1/n63 ), .B(invader_1_display), 
        .C(\invader_fsm_1/n73 ), .Y(\invader_fsm_1/n72 ) );
  NAND2X1 \invader_fsm_1/U61  ( .A(playerbullet_invader_collision_signal_1), 
        .B(\invader_fsm_1/n63 ), .Y(\invader_fsm_1/n71 ) );
  OAI21X1 \invader_fsm_1/U60  ( .A(\invader_fsm_1/n69 ), .B(
        \invader_fsm_1/n70 ), .C(\invader_fsm_1/n71 ), .Y(\invader_fsm_1/n108 ) );
  AOI21X1 \invader_fsm_1/U59  ( .A(\invader_fsm_1/N70 ), .B(
        \invader_fsm_1/n68 ), .C(n262), .Y(\invader_fsm_1/n65 ) );
  OAI21X1 \invader_fsm_1/U58  ( .A(n263), .B(n149), .C(\invader_fsm_1/n63 ), 
        .Y(\invader_fsm_1/n57 ) );
  NAND2X1 \invader_fsm_1/U57  ( .A(\invader_fsm_1/n57 ), .B(n73), .Y(
        \invader_fsm_1/n66 ) );
  NAND2X1 \invader_fsm_1/U56  ( .A(\invader_fsm_1/N70 ), .B(n137), .Y(
        \invader_fsm_1/n67 ) );
  OAI21X1 \invader_fsm_1/U55  ( .A(\invader_fsm_1/n65 ), .B(
        \invader_fsm_1/n66 ), .C(\invader_fsm_1/n67 ), .Y(\invader_fsm_1/n107 ) );
  NOR2X1 \invader_fsm_1/U54  ( .A(n263), .B(n137), .Y(\invader_fsm_1/n59 ) );
  AOI22X1 \invader_fsm_1/U53  ( .A(n238), .B(\invader_fsm_1/n59 ), .C(
        invader_1_coord_y[1]), .D(n137), .Y(\invader_fsm_1/n64 ) );
  NAND2X1 \invader_fsm_1/U52  ( .A(\invader_fsm_1/n64 ), .B(n133), .Y(
        \invader_fsm_1/n106 ) );
  AOI22X1 \invader_fsm_1/U51  ( .A(\invader_fsm_1/N72 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[2]), .D(n137), .Y(
        \invader_fsm_1/n62 ) );
  NAND2X1 \invader_fsm_1/U50  ( .A(\invader_fsm_1/n62 ), .B(
        \invader_fsm_1/n63 ), .Y(\invader_fsm_1/n105 ) );
  AOI22X1 \invader_fsm_1/U49  ( .A(\invader_fsm_1/N73 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[3]), .D(n137), .Y(
        \invader_fsm_1/n61 ) );
  NAND2X1 \invader_fsm_1/U48  ( .A(\invader_fsm_1/n61 ), .B(n133), .Y(
        \invader_fsm_1/n104 ) );
  AOI22X1 \invader_fsm_1/U47  ( .A(\invader_fsm_1/N74 ), .B(
        \invader_fsm_1/n59 ), .C(invader_1_coord_y[4]), .D(n137), .Y(
        \invader_fsm_1/n60 ) );
  NAND2X1 \invader_fsm_1/U46  ( .A(\invader_fsm_1/n60 ), .B(n133), .Y(
        \invader_fsm_1/n103 ) );
  NAND3X1 \invader_fsm_1/U45  ( .A(\invader_fsm_1/n59 ), .B(n73), .C(
        \invader_fsm_1/N75 ), .Y(\invader_fsm_1/n58 ) );
  OAI21X1 \invader_fsm_1/U44  ( .A(\invader_fsm_1/n57 ), .B(n227), .C(
        \invader_fsm_1/n58 ), .Y(\invader_fsm_1/n102 ) );
  AOI22X1 \invader_fsm_1/U43  ( .A(invader_outofbounds_signal_1), .B(
        \invader_fsm_1/n55 ), .C(n243), .D(\invader_fsm_1/n56 ), .Y(
        \invader_fsm_1/n54 ) );
  OAI21X1 \invader_fsm_1/U42  ( .A(\invader_fsm_1/n53 ), .B(n593), .C(
        \invader_fsm_1/n54 ), .Y(\invader_fsm_1/n101 ) );
  AND2X2 \invader_fsm_1/U4  ( .A(\invader_fsm_1/N27 ), .B(\invader_fsm_1/N19 ), 
        .Y(\invader_fsm_1/n100 ) );
  AND2X2 \invader_fsm_1/U3  ( .A(\invader_fsm_1/n80 ), .B(n148), .Y(
        \invader_fsm_1/n56 ) );
  DFFNEGX1 \invader_fsm_1/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_1/n101 ), .CLK(n90), .Q(invader_outofbounds_signal_1) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[5]  ( .D(\invader_fsm_1/n102 ), 
        .CLK(n90), .Q(invader_1_coord_y[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[4]  ( .D(\invader_fsm_1/n103 ), 
        .CLK(n90), .Q(invader_1_coord_y[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[3]  ( .D(\invader_fsm_1/n104 ), 
        .CLK(n90), .Q(invader_1_coord_y[3]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[2]  ( .D(\invader_fsm_1/n105 ), 
        .CLK(n90), .Q(invader_1_coord_y[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[1]  ( .D(\invader_fsm_1/n106 ), 
        .CLK(n90), .Q(invader_1_coord_y[1]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[0]  ( .D(\invader_fsm_1/n107 ), 
        .CLK(n90), .Q(\invader_fsm_1/N70 ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[5]  ( .D(\invader_fsm_1/n111 ), 
        .CLK(n90), .Q(invader_1_coord_x[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[4]  ( .D(\invader_fsm_1/n112 ), 
        .CLK(n90), .Q(invader_1_coord_x[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[2]  ( .D(\invader_fsm_1/n114 ), 
        .CLK(n89), .Q(invader_1_coord_x[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[0]  ( .D(\invader_fsm_1/n115 ), 
        .CLK(n89), .Q(\invader_fsm_1/N84 ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[1]  ( .D(n132), .CLK(n89), .Q(
        invader_1_coord_x[1]) );
  DFFNEGX1 \invader_fsm_1/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_1/n108 ), .CLK(n89), .Q(
        playerbullet_invader_collision_signal_1) );
  DFFNEGX1 \invader_fsm_1/state_reg[1]  ( .D(\invader_fsm_1/n109 ), .CLK(n89), 
        .Q(\invader_fsm_1/state[1] ) );
  DFFNEGX1 \invader_fsm_1/display_reg  ( .D(n136), .CLK(n89), .Q(
        invader_1_display) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[1]  ( .D(\invader_fsm_1/N56 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [1]) );
  DFFNEGX1 \invader_fsm_1/state_reg[0]  ( .D(\invader_fsm_1/n110 ), .CLK(n89), 
        .Q(\invader_fsm_1/state[0] ) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[0]  ( .D(\invader_fsm_1/N55 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [0]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[3]  ( .D(\invader_fsm_1/n113 ), 
        .CLK(n89), .Q(invader_1_coord_x[3]) );
  DFFNEGX1 \invader_fsm_1/move_interval_toggle_reg  ( .D(\invader_fsm_1/n116 ), 
        .CLK(n89), .Q(\invader_fsm_1/move_interval_toggle ) );
  NAND3X1 \invader_fsm_2/U105  ( .A(\invader_fsm_2/N43 ), .B(
        \invader_fsm_2/N35 ), .C(\invader_fsm_2/n100 ), .Y(\invader_fsm_2/n96 ) );
  NAND3X1 \invader_fsm_2/U104  ( .A(n72), .B(n285), .C(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n70 ) );
  NOR2X1 \invader_fsm_2/U103  ( .A(\invader_fsm_2/state[1] ), .B(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n99 ) );
  NAND3X1 \invader_fsm_2/U102  ( .A(play), .B(n73), .C(\invader_fsm_2/n99 ), 
        .Y(\invader_fsm_2/n98 ) );
  OAI21X1 \invader_fsm_2/U101  ( .A(n266), .B(\invader_fsm_2/n70 ), .C(
        \invader_fsm_2/n98 ), .Y(\invader_fsm_2/N55 ) );
  NAND3X1 \invader_fsm_2/U100  ( .A(n72), .B(n307), .C(
        \invader_fsm_2/state[1] ), .Y(\invader_fsm_2/n97 ) );
  OAI21X1 \invader_fsm_2/U99  ( .A(\invader_fsm_2/n70 ), .B(
        \invader_fsm_2/n96 ), .C(\invader_fsm_2/n97 ), .Y(\invader_fsm_2/N56 )
         );
  NOR2X1 \invader_fsm_2/U98  ( .A(n308), .B(\invader_fsm_2/next_state [1]), 
        .Y(\invader_fsm_2/n68 ) );
  OR2X1 \invader_fsm_2/U97  ( .A(\invader_fsm_2/move_interval_toggle ), .B(n78), .Y(\invader_fsm_2/n94 ) );
  OAI21X1 \invader_fsm_2/U96  ( .A(\invader_fsm_2/next_state [1]), .B(
        \invader_fsm_2/next_state [0]), .C(n73), .Y(\invader_fsm_2/n73 ) );
  NAND3X1 \invader_fsm_2/U95  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        n306), .C(n127), .Y(\invader_fsm_2/n95 ) );
  OAI21X1 \invader_fsm_2/U94  ( .A(n306), .B(\invader_fsm_2/n94 ), .C(
        \invader_fsm_2/n95 ), .Y(\invader_fsm_2/n116 ) );
  NOR2X1 \invader_fsm_2/U93  ( .A(move_down), .B(\invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n93 ) );
  NAND2X1 \invader_fsm_2/U92  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        \invader_fsm_2/n93 ), .Y(\invader_fsm_2/n85 ) );
  NAND2X1 \invader_fsm_2/U91  ( .A(\invader_fsm_2/next_state [0]), .B(n73), 
        .Y(\invader_fsm_2/n76 ) );
  NOR2X1 \invader_fsm_2/U90  ( .A(\invader_fsm_2/n85 ), .B(\invader_fsm_2/n76 ), .Y(\invader_fsm_2/n92 ) );
  NAND2X1 \invader_fsm_2/U89  ( .A(invader_direction), .B(\invader_fsm_2/n92 ), 
        .Y(\invader_fsm_2/n53 ) );
  NOR2X1 \invader_fsm_2/U88  ( .A(\invader_fsm_2/n76 ), .B(n150), .Y(
        \invader_fsm_2/n55 ) );
  AOI22X1 \invader_fsm_2/U87  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/n55 ), .C(n303), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n91 ) );
  OAI21X1 \invader_fsm_2/U86  ( .A(\invader_fsm_2/n53 ), .B(n301), .C(
        \invader_fsm_2/n91 ), .Y(\invader_fsm_2/n115 ) );
  NAND2X1 \invader_fsm_2/U85  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        n149), .Y(\invader_fsm_2/n90 ) );
  NAND2X1 \invader_fsm_2/U84  ( .A(\invader_fsm_2/next_state [1]), .B(n308), 
        .Y(\invader_fsm_2/n69 ) );
  NOR2X1 \invader_fsm_2/U83  ( .A(\invader_fsm_2/n73 ), .B(n305), .Y(
        \invader_fsm_2/n63 ) );
  OAI21X1 \invader_fsm_2/U82  ( .A(n306), .B(\invader_fsm_2/n90 ), .C(
        \invader_fsm_2/n63 ), .Y(\invader_fsm_2/n81 ) );
  AOI22X1 \invader_fsm_2/U81  ( .A(n304), .B(invader_direction), .C(n304), .D(
        n148), .Y(\invader_fsm_2/n89 ) );
  OAI21X1 \invader_fsm_2/U80  ( .A(\invader_fsm_2/n89 ), .B(n306), .C(
        \invader_fsm_2/n69 ), .Y(\invader_fsm_2/n88 ) );
  NAND3X1 \invader_fsm_2/U79  ( .A(\invader_fsm_2/n81 ), .B(n73), .C(
        \invader_fsm_2/n88 ), .Y(\invader_fsm_2/n87 ) );
  OAI21X1 \invader_fsm_2/U78  ( .A(\invader_fsm_2/n81 ), .B(n304), .C(
        \invader_fsm_2/n87 ), .Y(\invader_fsm_2/n114 ) );
  AOI22X1 \invader_fsm_2/U77  ( .A(\invader_fsm_2/N14 ), .B(invader_direction), 
        .C(\invader_fsm_2/N22 ), .D(n148), .Y(\invader_fsm_2/n84 ) );
  NAND2X1 \invader_fsm_2/U76  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/n85 ), .Y(\invader_fsm_2/n86 ) );
  OAI21X1 \invader_fsm_2/U75  ( .A(\invader_fsm_2/n84 ), .B(
        \invader_fsm_2/n85 ), .C(\invader_fsm_2/n86 ), .Y(\invader_fsm_2/n83 )
         );
  OR2X1 \invader_fsm_2/U74  ( .A(\invader_fsm_2/n76 ), .B(\invader_fsm_2/n83 ), 
        .Y(\invader_fsm_2/n113 ) );
  AOI22X1 \invader_fsm_2/U73  ( .A(\invader_fsm_2/N15 ), .B(invader_direction), 
        .C(n296), .D(n148), .Y(\invader_fsm_2/n82 ) );
  OAI21X1 \invader_fsm_2/U72  ( .A(\invader_fsm_2/n82 ), .B(n306), .C(n127), 
        .Y(\invader_fsm_2/n80 ) );
  AOI22X1 \invader_fsm_2/U71  ( .A(\invader_fsm_2/n80 ), .B(
        \invader_fsm_2/n81 ), .C(invader_2_coord_x[3]), .D(n128), .Y(
        \invader_fsm_2/n79 ) );
  AOI22X1 \invader_fsm_2/U70  ( .A(invader_2_coord_x[4]), .B(
        \invader_fsm_2/n55 ), .C(\invader_fsm_2/N24 ), .D(\invader_fsm_2/n56 ), 
        .Y(\invader_fsm_2/n78 ) );
  OAI21X1 \invader_fsm_2/U69  ( .A(\invader_fsm_2/n53 ), .B(n292), .C(
        \invader_fsm_2/n78 ), .Y(\invader_fsm_2/n112 ) );
  AOI22X1 \invader_fsm_2/U68  ( .A(invader_2_coord_x[5]), .B(
        \invader_fsm_2/n55 ), .C(n287), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n77 ) );
  OAI21X1 \invader_fsm_2/U67  ( .A(\invader_fsm_2/n53 ), .B(n289), .C(
        \invader_fsm_2/n77 ), .Y(\invader_fsm_2/n111 ) );
  NAND2X1 \invader_fsm_2/U66  ( .A(\invader_fsm_2/n63 ), .B(n306), .Y(
        \invader_fsm_2/n74 ) );
  OAI22X1 \invader_fsm_2/U65  ( .A(n307), .B(\invader_fsm_2/n74 ), .C(n129), 
        .D(\invader_fsm_2/n76 ), .Y(\invader_fsm_2/n110 ) );
  NAND3X1 \invader_fsm_2/U64  ( .A(\invader_fsm_2/n74 ), .B(n73), .C(
        \invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n75 ) );
  OAI21X1 \invader_fsm_2/U63  ( .A(\invader_fsm_2/n74 ), .B(n285), .C(
        \invader_fsm_2/n75 ), .Y(\invader_fsm_2/n109 ) );
  AOI21X1 \invader_fsm_2/U62  ( .A(\invader_fsm_2/n63 ), .B(invader_2_display), 
        .C(\invader_fsm_2/n73 ), .Y(\invader_fsm_2/n72 ) );
  NAND2X1 \invader_fsm_2/U61  ( .A(playerbullet_invader_collision_signal_2), 
        .B(\invader_fsm_2/n63 ), .Y(\invader_fsm_2/n71 ) );
  OAI21X1 \invader_fsm_2/U60  ( .A(\invader_fsm_2/n69 ), .B(
        \invader_fsm_2/n70 ), .C(\invader_fsm_2/n71 ), .Y(\invader_fsm_2/n108 ) );
  AOI21X1 \invader_fsm_2/U59  ( .A(\invader_fsm_2/N70 ), .B(
        \invader_fsm_2/n68 ), .C(n305), .Y(\invader_fsm_2/n65 ) );
  OAI21X1 \invader_fsm_2/U58  ( .A(n306), .B(n149), .C(\invader_fsm_2/n63 ), 
        .Y(\invader_fsm_2/n57 ) );
  NAND2X1 \invader_fsm_2/U57  ( .A(\invader_fsm_2/n57 ), .B(n73), .Y(
        \invader_fsm_2/n66 ) );
  NAND2X1 \invader_fsm_2/U56  ( .A(\invader_fsm_2/N70 ), .B(n131), .Y(
        \invader_fsm_2/n67 ) );
  OAI21X1 \invader_fsm_2/U55  ( .A(\invader_fsm_2/n65 ), .B(
        \invader_fsm_2/n66 ), .C(\invader_fsm_2/n67 ), .Y(\invader_fsm_2/n107 ) );
  NOR2X1 \invader_fsm_2/U54  ( .A(n306), .B(n131), .Y(\invader_fsm_2/n59 ) );
  AOI22X1 \invader_fsm_2/U53  ( .A(n280), .B(\invader_fsm_2/n59 ), .C(
        invader_2_coord_y[1]), .D(n131), .Y(\invader_fsm_2/n64 ) );
  NAND2X1 \invader_fsm_2/U52  ( .A(\invader_fsm_2/n64 ), .B(n127), .Y(
        \invader_fsm_2/n106 ) );
  AOI22X1 \invader_fsm_2/U51  ( .A(\invader_fsm_2/N72 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[2]), .D(n131), .Y(
        \invader_fsm_2/n62 ) );
  NAND2X1 \invader_fsm_2/U50  ( .A(\invader_fsm_2/n62 ), .B(
        \invader_fsm_2/n63 ), .Y(\invader_fsm_2/n105 ) );
  AOI22X1 \invader_fsm_2/U49  ( .A(\invader_fsm_2/N73 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[3]), .D(n131), .Y(
        \invader_fsm_2/n61 ) );
  NAND2X1 \invader_fsm_2/U48  ( .A(\invader_fsm_2/n61 ), .B(n127), .Y(
        \invader_fsm_2/n104 ) );
  AOI22X1 \invader_fsm_2/U47  ( .A(\invader_fsm_2/N74 ), .B(
        \invader_fsm_2/n59 ), .C(invader_2_coord_y[4]), .D(n131), .Y(
        \invader_fsm_2/n60 ) );
  NAND2X1 \invader_fsm_2/U46  ( .A(\invader_fsm_2/n60 ), .B(n127), .Y(
        \invader_fsm_2/n103 ) );
  NAND3X1 \invader_fsm_2/U45  ( .A(\invader_fsm_2/n59 ), .B(n73), .C(
        \invader_fsm_2/N75 ), .Y(\invader_fsm_2/n58 ) );
  OAI21X1 \invader_fsm_2/U44  ( .A(\invader_fsm_2/n57 ), .B(n269), .C(
        \invader_fsm_2/n58 ), .Y(\invader_fsm_2/n102 ) );
  AOI22X1 \invader_fsm_2/U43  ( .A(invader_outofbounds_signal_2), .B(
        \invader_fsm_2/n55 ), .C(n286), .D(\invader_fsm_2/n56 ), .Y(
        \invader_fsm_2/n54 ) );
  OAI21X1 \invader_fsm_2/U42  ( .A(\invader_fsm_2/n53 ), .B(n667), .C(
        \invader_fsm_2/n54 ), .Y(\invader_fsm_2/n101 ) );
  AND2X2 \invader_fsm_2/U4  ( .A(\invader_fsm_2/N27 ), .B(\invader_fsm_2/N19 ), 
        .Y(\invader_fsm_2/n100 ) );
  AND2X2 \invader_fsm_2/U3  ( .A(\invader_fsm_2/n92 ), .B(n148), .Y(
        \invader_fsm_2/n56 ) );
  DFFNEGX1 \invader_fsm_2/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_2/n101 ), .CLK(n89), .Q(invader_outofbounds_signal_2) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[5]  ( .D(\invader_fsm_2/n102 ), 
        .CLK(n89), .Q(invader_2_coord_y[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[4]  ( .D(\invader_fsm_2/n103 ), 
        .CLK(n89), .Q(invader_2_coord_y[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[3]  ( .D(\invader_fsm_2/n104 ), 
        .CLK(n89), .Q(invader_2_coord_y[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[2]  ( .D(\invader_fsm_2/n105 ), 
        .CLK(n88), .Q(invader_2_coord_y[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[1]  ( .D(\invader_fsm_2/n106 ), 
        .CLK(n88), .Q(invader_2_coord_y[1]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[0]  ( .D(\invader_fsm_2/n107 ), 
        .CLK(n88), .Q(\invader_fsm_2/N70 ) );
  DFFNEGX1 \invader_fsm_2/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_2/n108 ), .CLK(n88), .Q(
        playerbullet_invader_collision_signal_2) );
  DFFNEGX1 \invader_fsm_2/state_reg[1]  ( .D(\invader_fsm_2/n109 ), .CLK(n88), 
        .Q(\invader_fsm_2/state[1] ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[5]  ( .D(\invader_fsm_2/n111 ), 
        .CLK(n88), .Q(invader_2_coord_x[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[4]  ( .D(\invader_fsm_2/n112 ), 
        .CLK(n88), .Q(invader_2_coord_x[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[2]  ( .D(\invader_fsm_2/n113 ), 
        .CLK(n88), .Q(invader_2_coord_x[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[0]  ( .D(\invader_fsm_2/n114 ), 
        .CLK(n88), .Q(\invader_fsm_2/N84 ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[1]  ( .D(\invader_fsm_2/n115 ), 
        .CLK(n88), .Q(invader_2_coord_x[1]) );
  DFFNEGX1 \invader_fsm_2/display_reg  ( .D(n130), .CLK(n88), .Q(
        invader_2_display) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[1]  ( .D(\invader_fsm_2/N56 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [1]) );
  DFFNEGX1 \invader_fsm_2/state_reg[0]  ( .D(\invader_fsm_2/n110 ), .CLK(n88), 
        .Q(\invader_fsm_2/state[0] ) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[0]  ( .D(\invader_fsm_2/N55 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [0]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[3]  ( .D(n126), .CLK(n88), .Q(
        invader_2_coord_x[3]) );
  DFFNEGX1 \invader_fsm_2/move_interval_toggle_reg  ( .D(\invader_fsm_2/n116 ), 
        .CLK(n87), .Q(\invader_fsm_2/move_interval_toggle ) );
  NAND3X1 \invader_fsm_3/U106  ( .A(\invader_fsm_3/N43 ), .B(
        \invader_fsm_3/N35 ), .C(\invader_fsm_3/n102 ), .Y(\invader_fsm_3/n98 ) );
  NAND3X1 \invader_fsm_3/U105  ( .A(n72), .B(n345), .C(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n71 ) );
  NOR2X1 \invader_fsm_3/U104  ( .A(\invader_fsm_3/state[1] ), .B(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n101 ) );
  NAND3X1 \invader_fsm_3/U103  ( .A(play), .B(n72), .C(\invader_fsm_3/n101 ), 
        .Y(\invader_fsm_3/n100 ) );
  OAI21X1 \invader_fsm_3/U102  ( .A(n309), .B(\invader_fsm_3/n71 ), .C(
        \invader_fsm_3/n100 ), .Y(\invader_fsm_3/N55 ) );
  NAND3X1 \invader_fsm_3/U101  ( .A(n72), .B(n348), .C(
        \invader_fsm_3/state[1] ), .Y(\invader_fsm_3/n99 ) );
  OAI21X1 \invader_fsm_3/U100  ( .A(\invader_fsm_3/n71 ), .B(
        \invader_fsm_3/n98 ), .C(\invader_fsm_3/n99 ), .Y(\invader_fsm_3/N56 )
         );
  NOR2X1 \invader_fsm_3/U99  ( .A(n349), .B(\invader_fsm_3/next_state [1]), 
        .Y(\invader_fsm_3/n69 ) );
  OR2X1 \invader_fsm_3/U98  ( .A(\invader_fsm_3/move_interval_toggle ), .B(n78), .Y(\invader_fsm_3/n96 ) );
  OAI21X1 \invader_fsm_3/U97  ( .A(\invader_fsm_3/next_state [1]), .B(
        \invader_fsm_3/next_state [0]), .C(n72), .Y(\invader_fsm_3/n74 ) );
  NAND3X1 \invader_fsm_3/U96  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        n347), .C(n120), .Y(\invader_fsm_3/n97 ) );
  OAI21X1 \invader_fsm_3/U95  ( .A(n347), .B(\invader_fsm_3/n96 ), .C(
        \invader_fsm_3/n97 ), .Y(\invader_fsm_3/n117 ) );
  AOI22X1 \invader_fsm_3/U94  ( .A(\invader_fsm_3/N13 ), .B(invader_direction), 
        .C(n342), .D(n148), .Y(\invader_fsm_3/n95 ) );
  OAI21X1 \invader_fsm_3/U93  ( .A(\invader_fsm_3/n95 ), .B(n347), .C(n120), 
        .Y(\invader_fsm_3/n93 ) );
  NAND2X1 \invader_fsm_3/U92  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        n149), .Y(\invader_fsm_3/n94 ) );
  NAND2X1 \invader_fsm_3/U91  ( .A(\invader_fsm_3/next_state [1]), .B(n349), 
        .Y(\invader_fsm_3/n70 ) );
  NOR2X1 \invader_fsm_3/U90  ( .A(\invader_fsm_3/n74 ), .B(n346), .Y(
        \invader_fsm_3/n64 ) );
  OAI21X1 \invader_fsm_3/U89  ( .A(n347), .B(\invader_fsm_3/n94 ), .C(
        \invader_fsm_3/n64 ), .Y(\invader_fsm_3/n81 ) );
  AOI22X1 \invader_fsm_3/U88  ( .A(\invader_fsm_3/n93 ), .B(
        \invader_fsm_3/n81 ), .C(invader_3_coord_x[1]), .D(n121), .Y(
        \invader_fsm_3/n92 ) );
  AOI22X1 \invader_fsm_3/U87  ( .A(n51), .B(invader_direction), .C(n51), .D(
        n148), .Y(\invader_fsm_3/n91 ) );
  OAI21X1 \invader_fsm_3/U86  ( .A(\invader_fsm_3/n91 ), .B(n347), .C(
        \invader_fsm_3/n70 ), .Y(\invader_fsm_3/n90 ) );
  NAND3X1 \invader_fsm_3/U85  ( .A(\invader_fsm_3/n81 ), .B(n73), .C(
        \invader_fsm_3/n90 ), .Y(\invader_fsm_3/n89 ) );
  OAI21X1 \invader_fsm_3/U84  ( .A(\invader_fsm_3/n81 ), .B(n51), .C(
        \invader_fsm_3/n89 ), .Y(\invader_fsm_3/n116 ) );
  AOI22X1 \invader_fsm_3/U83  ( .A(\invader_fsm_3/N14 ), .B(invader_direction), 
        .C(\invader_fsm_3/N22 ), .D(n148), .Y(\invader_fsm_3/n88 ) );
  OAI21X1 \invader_fsm_3/U82  ( .A(\invader_fsm_3/n88 ), .B(n347), .C(
        \invader_fsm_3/n70 ), .Y(\invader_fsm_3/n87 ) );
  NAND3X1 \invader_fsm_3/U81  ( .A(\invader_fsm_3/n81 ), .B(n73), .C(
        \invader_fsm_3/n87 ), .Y(\invader_fsm_3/n86 ) );
  OAI21X1 \invader_fsm_3/U80  ( .A(\invader_fsm_3/n81 ), .B(n340), .C(
        \invader_fsm_3/n86 ), .Y(\invader_fsm_3/n115 ) );
  NOR2X1 \invader_fsm_3/U79  ( .A(move_down), .B(\invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n85 ) );
  NAND2X1 \invader_fsm_3/U78  ( .A(\invader_fsm_3/next_state [0]), .B(n72), 
        .Y(\invader_fsm_3/n77 ) );
  NAND3X1 \invader_fsm_3/U77  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        \invader_fsm_3/n85 ), .C(n125), .Y(\invader_fsm_3/n84 ) );
  OR2X1 \invader_fsm_3/U76  ( .A(n148), .B(\invader_fsm_3/n84 ), .Y(
        \invader_fsm_3/n54 ) );
  AOI21X1 \invader_fsm_3/U75  ( .A(\invader_fsm_3/n85 ), .B(
        \invader_fsm_3/move_interval_toggle ), .C(\invader_fsm_3/n77 ), .Y(
        \invader_fsm_3/n56 ) );
  NOR2X1 \invader_fsm_3/U74  ( .A(\invader_fsm_3/n84 ), .B(invader_direction), 
        .Y(\invader_fsm_3/n57 ) );
  AOI22X1 \invader_fsm_3/U73  ( .A(invader_3_coord_x[3]), .B(
        \invader_fsm_3/n56 ), .C(n335), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n83 ) );
  OAI21X1 \invader_fsm_3/U72  ( .A(\invader_fsm_3/n54 ), .B(n339), .C(
        \invader_fsm_3/n83 ), .Y(\invader_fsm_3/n114 ) );
  AOI22X1 \invader_fsm_3/U71  ( .A(\invader_fsm_3/N16 ), .B(invader_direction), 
        .C(\invader_fsm_3/N24 ), .D(n148), .Y(\invader_fsm_3/n82 ) );
  OAI21X1 \invader_fsm_3/U70  ( .A(\invader_fsm_3/n82 ), .B(n347), .C(n120), 
        .Y(\invader_fsm_3/n80 ) );
  AOI22X1 \invader_fsm_3/U69  ( .A(\invader_fsm_3/n80 ), .B(
        \invader_fsm_3/n81 ), .C(invader_3_coord_x[4]), .D(n121), .Y(
        \invader_fsm_3/n79 ) );
  AOI22X1 \invader_fsm_3/U68  ( .A(invader_3_coord_x[5]), .B(
        \invader_fsm_3/n56 ), .C(n329), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n78 ) );
  OAI21X1 \invader_fsm_3/U67  ( .A(\invader_fsm_3/n54 ), .B(n331), .C(
        \invader_fsm_3/n78 ), .Y(\invader_fsm_3/n113 ) );
  NAND2X1 \invader_fsm_3/U66  ( .A(\invader_fsm_3/n64 ), .B(n347), .Y(
        \invader_fsm_3/n75 ) );
  OAI22X1 \invader_fsm_3/U65  ( .A(n348), .B(\invader_fsm_3/n75 ), .C(n122), 
        .D(\invader_fsm_3/n77 ), .Y(\invader_fsm_3/n112 ) );
  NAND3X1 \invader_fsm_3/U64  ( .A(\invader_fsm_3/n75 ), .B(n73), .C(
        \invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n76 ) );
  OAI21X1 \invader_fsm_3/U63  ( .A(\invader_fsm_3/n75 ), .B(n345), .C(
        \invader_fsm_3/n76 ), .Y(\invader_fsm_3/n111 ) );
  AOI21X1 \invader_fsm_3/U62  ( .A(\invader_fsm_3/n64 ), .B(invader_3_display), 
        .C(\invader_fsm_3/n74 ), .Y(\invader_fsm_3/n73 ) );
  NAND2X1 \invader_fsm_3/U61  ( .A(playerbullet_invader_collision_signal_3), 
        .B(\invader_fsm_3/n64 ), .Y(\invader_fsm_3/n72 ) );
  OAI21X1 \invader_fsm_3/U60  ( .A(\invader_fsm_3/n70 ), .B(
        \invader_fsm_3/n71 ), .C(\invader_fsm_3/n72 ), .Y(\invader_fsm_3/n110 ) );
  AOI21X1 \invader_fsm_3/U59  ( .A(\invader_fsm_3/N70 ), .B(
        \invader_fsm_3/n69 ), .C(n346), .Y(\invader_fsm_3/n66 ) );
  OAI21X1 \invader_fsm_3/U58  ( .A(n347), .B(n149), .C(\invader_fsm_3/n64 ), 
        .Y(\invader_fsm_3/n58 ) );
  NAND2X1 \invader_fsm_3/U57  ( .A(\invader_fsm_3/n58 ), .B(n73), .Y(
        \invader_fsm_3/n67 ) );
  NAND2X1 \invader_fsm_3/U56  ( .A(\invader_fsm_3/N70 ), .B(n124), .Y(
        \invader_fsm_3/n68 ) );
  OAI21X1 \invader_fsm_3/U55  ( .A(\invader_fsm_3/n66 ), .B(
        \invader_fsm_3/n67 ), .C(\invader_fsm_3/n68 ), .Y(\invader_fsm_3/n109 ) );
  NOR2X1 \invader_fsm_3/U54  ( .A(n347), .B(n124), .Y(\invader_fsm_3/n60 ) );
  AOI22X1 \invader_fsm_3/U53  ( .A(n323), .B(\invader_fsm_3/n60 ), .C(
        invader_3_coord_y[1]), .D(n124), .Y(\invader_fsm_3/n65 ) );
  NAND2X1 \invader_fsm_3/U52  ( .A(\invader_fsm_3/n65 ), .B(n120), .Y(
        \invader_fsm_3/n108 ) );
  AOI22X1 \invader_fsm_3/U51  ( .A(\invader_fsm_3/N72 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[2]), .D(n124), .Y(
        \invader_fsm_3/n63 ) );
  NAND2X1 \invader_fsm_3/U50  ( .A(\invader_fsm_3/n63 ), .B(
        \invader_fsm_3/n64 ), .Y(\invader_fsm_3/n107 ) );
  AOI22X1 \invader_fsm_3/U49  ( .A(\invader_fsm_3/N73 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[3]), .D(n124), .Y(
        \invader_fsm_3/n62 ) );
  NAND2X1 \invader_fsm_3/U48  ( .A(\invader_fsm_3/n62 ), .B(n120), .Y(
        \invader_fsm_3/n106 ) );
  AOI22X1 \invader_fsm_3/U47  ( .A(\invader_fsm_3/N74 ), .B(
        \invader_fsm_3/n60 ), .C(invader_3_coord_y[4]), .D(n124), .Y(
        \invader_fsm_3/n61 ) );
  NAND2X1 \invader_fsm_3/U46  ( .A(\invader_fsm_3/n61 ), .B(n120), .Y(
        \invader_fsm_3/n105 ) );
  NAND3X1 \invader_fsm_3/U45  ( .A(\invader_fsm_3/n60 ), .B(n73), .C(
        \invader_fsm_3/N75 ), .Y(\invader_fsm_3/n59 ) );
  OAI21X1 \invader_fsm_3/U44  ( .A(\invader_fsm_3/n58 ), .B(n312), .C(
        \invader_fsm_3/n59 ), .Y(\invader_fsm_3/n104 ) );
  AOI22X1 \invader_fsm_3/U43  ( .A(invader_outofbounds_signal_3), .B(
        \invader_fsm_3/n56 ), .C(n328), .D(\invader_fsm_3/n57 ), .Y(
        \invader_fsm_3/n55 ) );
  OAI21X1 \invader_fsm_3/U42  ( .A(\invader_fsm_3/n54 ), .B(n741), .C(
        \invader_fsm_3/n55 ), .Y(\invader_fsm_3/n103 ) );
  AND2X2 \invader_fsm_3/U3  ( .A(\invader_fsm_3/N27 ), .B(\invader_fsm_3/N19 ), 
        .Y(\invader_fsm_3/n102 ) );
  DFFNEGX1 \invader_fsm_3/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_3/n103 ), .CLK(n87), .Q(invader_outofbounds_signal_3) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[5]  ( .D(\invader_fsm_3/n104 ), 
        .CLK(n87), .Q(invader_3_coord_y[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[4]  ( .D(\invader_fsm_3/n105 ), 
        .CLK(n87), .Q(invader_3_coord_y[4]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[3]  ( .D(\invader_fsm_3/n106 ), 
        .CLK(n87), .Q(invader_3_coord_y[3]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[2]  ( .D(\invader_fsm_3/n107 ), 
        .CLK(n87), .Q(invader_3_coord_y[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[1]  ( .D(\invader_fsm_3/n108 ), 
        .CLK(n87), .Q(invader_3_coord_y[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[0]  ( .D(\invader_fsm_3/n109 ), 
        .CLK(n87), .Q(\invader_fsm_3/N70 ) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[5]  ( .D(\invader_fsm_3/n113 ), 
        .CLK(n87), .Q(invader_3_coord_x[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[2]  ( .D(\invader_fsm_3/n115 ), 
        .CLK(n87), .Q(invader_3_coord_x[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[1]  ( .D(n118), .CLK(n87), .Q(
        invader_3_coord_x[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[0]  ( .D(\invader_fsm_3/n116 ), 
        .CLK(n87), .Q(\invader_fsm_3/N84 ) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[4]  ( .D(n119), .CLK(n87), .Q(
        invader_3_coord_x[4]) );
  DFFNEGX1 \invader_fsm_3/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_3/n110 ), .CLK(n86), .Q(
        playerbullet_invader_collision_signal_3) );
  DFFNEGX1 \invader_fsm_3/state_reg[1]  ( .D(\invader_fsm_3/n111 ), .CLK(n86), 
        .Q(\invader_fsm_3/state[1] ) );
  DFFNEGX1 \invader_fsm_3/display_reg  ( .D(n123), .CLK(n86), .Q(
        invader_3_display) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[1]  ( .D(\invader_fsm_3/N56 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [1]) );
  DFFNEGX1 \invader_fsm_3/state_reg[0]  ( .D(\invader_fsm_3/n112 ), .CLK(n86), 
        .Q(\invader_fsm_3/state[0] ) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[0]  ( .D(\invader_fsm_3/N55 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [0]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[3]  ( .D(\invader_fsm_3/n114 ), 
        .CLK(n86), .Q(invader_3_coord_x[3]) );
  DFFNEGX1 \invader_fsm_3/move_interval_toggle_reg  ( .D(\invader_fsm_3/n117 ), 
        .CLK(n86), .Q(\invader_fsm_3/move_interval_toggle ) );
  NAND3X1 \invader_fsm_4/U106  ( .A(\invader_fsm_4/N43 ), .B(
        \invader_fsm_4/N35 ), .C(\invader_fsm_4/n102 ), .Y(\invader_fsm_4/n98 ) );
  NAND3X1 \invader_fsm_4/U105  ( .A(n72), .B(n369), .C(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n71 ) );
  NOR2X1 \invader_fsm_4/U104  ( .A(\invader_fsm_4/state[1] ), .B(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n101 ) );
  NAND3X1 \invader_fsm_4/U103  ( .A(play), .B(n72), .C(\invader_fsm_4/n101 ), 
        .Y(\invader_fsm_4/n100 ) );
  OAI21X1 \invader_fsm_4/U102  ( .A(n350), .B(\invader_fsm_4/n71 ), .C(
        \invader_fsm_4/n100 ), .Y(\invader_fsm_4/N55 ) );
  NAND3X1 \invader_fsm_4/U101  ( .A(n72), .B(n389), .C(
        \invader_fsm_4/state[1] ), .Y(\invader_fsm_4/n99 ) );
  OAI21X1 \invader_fsm_4/U100  ( .A(\invader_fsm_4/n71 ), .B(
        \invader_fsm_4/n98 ), .C(\invader_fsm_4/n99 ), .Y(\invader_fsm_4/N56 )
         );
  NOR2X1 \invader_fsm_4/U99  ( .A(n390), .B(\invader_fsm_4/next_state [1]), 
        .Y(\invader_fsm_4/n69 ) );
  OR2X1 \invader_fsm_4/U98  ( .A(\invader_fsm_4/move_interval_toggle ), .B(n78), .Y(\invader_fsm_4/n96 ) );
  OAI21X1 \invader_fsm_4/U97  ( .A(\invader_fsm_4/next_state [1]), .B(
        \invader_fsm_4/next_state [0]), .C(n73), .Y(\invader_fsm_4/n74 ) );
  NAND3X1 \invader_fsm_4/U96  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        n388), .C(n112), .Y(\invader_fsm_4/n97 ) );
  OAI21X1 \invader_fsm_4/U95  ( .A(n388), .B(\invader_fsm_4/n96 ), .C(
        \invader_fsm_4/n97 ), .Y(\invader_fsm_4/n117 ) );
  NOR2X1 \invader_fsm_4/U94  ( .A(move_down), .B(\invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n95 ) );
  NAND2X1 \invader_fsm_4/U93  ( .A(\invader_fsm_4/next_state [0]), .B(n72), 
        .Y(\invader_fsm_4/n77 ) );
  NAND3X1 \invader_fsm_4/U92  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        \invader_fsm_4/n95 ), .C(n117), .Y(\invader_fsm_4/n94 ) );
  OR2X1 \invader_fsm_4/U91  ( .A(n148), .B(\invader_fsm_4/n94 ), .Y(
        \invader_fsm_4/n54 ) );
  AOI21X1 \invader_fsm_4/U90  ( .A(\invader_fsm_4/n95 ), .B(
        \invader_fsm_4/move_interval_toggle ), .C(\invader_fsm_4/n77 ), .Y(
        \invader_fsm_4/n56 ) );
  NOR2X1 \invader_fsm_4/U89  ( .A(\invader_fsm_4/n94 ), .B(invader_direction), 
        .Y(\invader_fsm_4/n57 ) );
  AOI22X1 \invader_fsm_4/U88  ( .A(invader_4_coord_x[1]), .B(
        \invader_fsm_4/n56 ), .C(n385), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n93 ) );
  OAI21X1 \invader_fsm_4/U87  ( .A(\invader_fsm_4/n54 ), .B(n383), .C(
        \invader_fsm_4/n93 ), .Y(\invader_fsm_4/n116 ) );
  NAND2X1 \invader_fsm_4/U86  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        n149), .Y(\invader_fsm_4/n92 ) );
  NAND2X1 \invader_fsm_4/U85  ( .A(\invader_fsm_4/next_state [1]), .B(n390), 
        .Y(\invader_fsm_4/n70 ) );
  NOR2X1 \invader_fsm_4/U84  ( .A(\invader_fsm_4/n74 ), .B(n387), .Y(
        \invader_fsm_4/n64 ) );
  OAI21X1 \invader_fsm_4/U83  ( .A(n388), .B(\invader_fsm_4/n92 ), .C(
        \invader_fsm_4/n64 ), .Y(\invader_fsm_4/n81 ) );
  AOI22X1 \invader_fsm_4/U82  ( .A(n386), .B(invader_direction), .C(n386), .D(
        n148), .Y(\invader_fsm_4/n91 ) );
  OAI21X1 \invader_fsm_4/U81  ( .A(\invader_fsm_4/n91 ), .B(n388), .C(
        \invader_fsm_4/n70 ), .Y(\invader_fsm_4/n90 ) );
  NAND3X1 \invader_fsm_4/U80  ( .A(\invader_fsm_4/n81 ), .B(n72), .C(
        \invader_fsm_4/n90 ), .Y(\invader_fsm_4/n89 ) );
  OAI21X1 \invader_fsm_4/U79  ( .A(\invader_fsm_4/n81 ), .B(n386), .C(
        \invader_fsm_4/n89 ), .Y(\invader_fsm_4/n115 ) );
  AOI22X1 \invader_fsm_4/U78  ( .A(\invader_fsm_4/N14 ), .B(invader_direction), 
        .C(\invader_fsm_4/N22 ), .D(n148), .Y(\invader_fsm_4/n88 ) );
  OAI21X1 \invader_fsm_4/U77  ( .A(\invader_fsm_4/n88 ), .B(n388), .C(
        \invader_fsm_4/n70 ), .Y(\invader_fsm_4/n87 ) );
  NAND3X1 \invader_fsm_4/U76  ( .A(\invader_fsm_4/n81 ), .B(n72), .C(
        \invader_fsm_4/n87 ), .Y(\invader_fsm_4/n86 ) );
  OAI21X1 \invader_fsm_4/U75  ( .A(\invader_fsm_4/n81 ), .B(n382), .C(
        \invader_fsm_4/n86 ), .Y(\invader_fsm_4/n114 ) );
  AOI22X1 \invader_fsm_4/U74  ( .A(\invader_fsm_4/N15 ), .B(invader_direction), 
        .C(n376), .D(n148), .Y(\invader_fsm_4/n85 ) );
  OAI21X1 \invader_fsm_4/U73  ( .A(\invader_fsm_4/n85 ), .B(n388), .C(n112), 
        .Y(\invader_fsm_4/n84 ) );
  AOI22X1 \invader_fsm_4/U72  ( .A(\invader_fsm_4/n84 ), .B(
        \invader_fsm_4/n81 ), .C(invader_4_coord_x[3]), .D(n113), .Y(
        \invader_fsm_4/n83 ) );
  AOI22X1 \invader_fsm_4/U71  ( .A(\invader_fsm_4/N16 ), .B(invader_direction), 
        .C(\invader_fsm_4/N24 ), .D(n148), .Y(\invader_fsm_4/n82 ) );
  OAI21X1 \invader_fsm_4/U70  ( .A(\invader_fsm_4/n82 ), .B(n388), .C(n112), 
        .Y(\invader_fsm_4/n80 ) );
  AOI22X1 \invader_fsm_4/U69  ( .A(\invader_fsm_4/n80 ), .B(
        \invader_fsm_4/n81 ), .C(invader_4_coord_x[4]), .D(n113), .Y(
        \invader_fsm_4/n79 ) );
  AOI22X1 \invader_fsm_4/U68  ( .A(invader_4_coord_x[5]), .B(
        \invader_fsm_4/n56 ), .C(n371), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n78 ) );
  OAI21X1 \invader_fsm_4/U67  ( .A(\invader_fsm_4/n54 ), .B(n373), .C(
        \invader_fsm_4/n78 ), .Y(\invader_fsm_4/n113 ) );
  NAND2X1 \invader_fsm_4/U66  ( .A(\invader_fsm_4/n64 ), .B(n388), .Y(
        \invader_fsm_4/n75 ) );
  OAI22X1 \invader_fsm_4/U65  ( .A(n389), .B(\invader_fsm_4/n75 ), .C(n114), 
        .D(\invader_fsm_4/n77 ), .Y(\invader_fsm_4/n112 ) );
  NAND3X1 \invader_fsm_4/U64  ( .A(\invader_fsm_4/n75 ), .B(n73), .C(
        \invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n76 ) );
  OAI21X1 \invader_fsm_4/U63  ( .A(\invader_fsm_4/n75 ), .B(n369), .C(
        \invader_fsm_4/n76 ), .Y(\invader_fsm_4/n111 ) );
  AOI21X1 \invader_fsm_4/U62  ( .A(\invader_fsm_4/n64 ), .B(invader_4_display), 
        .C(\invader_fsm_4/n74 ), .Y(\invader_fsm_4/n73 ) );
  NAND2X1 \invader_fsm_4/U61  ( .A(playerbullet_invader_collision_signal_4), 
        .B(\invader_fsm_4/n64 ), .Y(\invader_fsm_4/n72 ) );
  OAI21X1 \invader_fsm_4/U60  ( .A(\invader_fsm_4/n70 ), .B(
        \invader_fsm_4/n71 ), .C(\invader_fsm_4/n72 ), .Y(\invader_fsm_4/n110 ) );
  AOI21X1 \invader_fsm_4/U59  ( .A(\invader_fsm_4/N70 ), .B(
        \invader_fsm_4/n69 ), .C(n387), .Y(\invader_fsm_4/n66 ) );
  OAI21X1 \invader_fsm_4/U58  ( .A(n388), .B(n149), .C(\invader_fsm_4/n64 ), 
        .Y(\invader_fsm_4/n58 ) );
  NAND2X1 \invader_fsm_4/U57  ( .A(\invader_fsm_4/n58 ), .B(n73), .Y(
        \invader_fsm_4/n67 ) );
  NAND2X1 \invader_fsm_4/U56  ( .A(\invader_fsm_4/N70 ), .B(n116), .Y(
        \invader_fsm_4/n68 ) );
  OAI21X1 \invader_fsm_4/U55  ( .A(\invader_fsm_4/n66 ), .B(
        \invader_fsm_4/n67 ), .C(\invader_fsm_4/n68 ), .Y(\invader_fsm_4/n109 ) );
  NOR2X1 \invader_fsm_4/U54  ( .A(n388), .B(n116), .Y(\invader_fsm_4/n60 ) );
  AOI22X1 \invader_fsm_4/U53  ( .A(n364), .B(\invader_fsm_4/n60 ), .C(
        invader_4_coord_y[1]), .D(n116), .Y(\invader_fsm_4/n65 ) );
  NAND2X1 \invader_fsm_4/U52  ( .A(\invader_fsm_4/n65 ), .B(n112), .Y(
        \invader_fsm_4/n108 ) );
  AOI22X1 \invader_fsm_4/U51  ( .A(\invader_fsm_4/N72 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[2]), .D(n116), .Y(
        \invader_fsm_4/n63 ) );
  NAND2X1 \invader_fsm_4/U50  ( .A(\invader_fsm_4/n63 ), .B(
        \invader_fsm_4/n64 ), .Y(\invader_fsm_4/n107 ) );
  AOI22X1 \invader_fsm_4/U49  ( .A(\invader_fsm_4/N73 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[3]), .D(n116), .Y(
        \invader_fsm_4/n62 ) );
  NAND2X1 \invader_fsm_4/U48  ( .A(\invader_fsm_4/n62 ), .B(n112), .Y(
        \invader_fsm_4/n106 ) );
  AOI22X1 \invader_fsm_4/U47  ( .A(\invader_fsm_4/N74 ), .B(
        \invader_fsm_4/n60 ), .C(invader_4_coord_y[4]), .D(n116), .Y(
        \invader_fsm_4/n61 ) );
  NAND2X1 \invader_fsm_4/U46  ( .A(\invader_fsm_4/n61 ), .B(n112), .Y(
        \invader_fsm_4/n105 ) );
  NAND3X1 \invader_fsm_4/U45  ( .A(\invader_fsm_4/n60 ), .B(n72), .C(
        \invader_fsm_4/N75 ), .Y(\invader_fsm_4/n59 ) );
  OAI21X1 \invader_fsm_4/U44  ( .A(\invader_fsm_4/n58 ), .B(n353), .C(
        \invader_fsm_4/n59 ), .Y(\invader_fsm_4/n104 ) );
  AOI22X1 \invader_fsm_4/U43  ( .A(invader_outofbounds_signal_4), .B(
        \invader_fsm_4/n56 ), .C(n370), .D(\invader_fsm_4/n57 ), .Y(
        \invader_fsm_4/n55 ) );
  OAI21X1 \invader_fsm_4/U42  ( .A(\invader_fsm_4/n54 ), .B(n815), .C(
        \invader_fsm_4/n55 ), .Y(\invader_fsm_4/n103 ) );
  AND2X2 \invader_fsm_4/U3  ( .A(\invader_fsm_4/N27 ), .B(\invader_fsm_4/N19 ), 
        .Y(\invader_fsm_4/n102 ) );
  DFFNEGX1 \invader_fsm_4/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_4/n103 ), .CLK(n86), .Q(invader_outofbounds_signal_4) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[5]  ( .D(\invader_fsm_4/n104 ), 
        .CLK(n86), .Q(invader_4_coord_y[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[4]  ( .D(\invader_fsm_4/n105 ), 
        .CLK(n86), .Q(invader_4_coord_y[4]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[3]  ( .D(\invader_fsm_4/n106 ), 
        .CLK(n86), .Q(invader_4_coord_y[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[2]  ( .D(\invader_fsm_4/n107 ), 
        .CLK(n86), .Q(invader_4_coord_y[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[1]  ( .D(\invader_fsm_4/n108 ), 
        .CLK(n86), .Q(invader_4_coord_y[1]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[0]  ( .D(\invader_fsm_4/n109 ), 
        .CLK(n86), .Q(\invader_fsm_4/N70 ) );
  DFFNEGX1 \invader_fsm_4/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_4/n110 ), .CLK(n85), .Q(
        playerbullet_invader_collision_signal_4) );
  DFFNEGX1 \invader_fsm_4/state_reg[1]  ( .D(\invader_fsm_4/n111 ), .CLK(n85), 
        .Q(\invader_fsm_4/state[1] ) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[5]  ( .D(\invader_fsm_4/n113 ), 
        .CLK(n85), .Q(invader_4_coord_x[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[3]  ( .D(n110), .CLK(n85), .Q(
        invader_4_coord_x[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[2]  ( .D(\invader_fsm_4/n114 ), 
        .CLK(n85), .Q(invader_4_coord_x[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[0]  ( .D(\invader_fsm_4/n115 ), 
        .CLK(n85), .Q(\invader_fsm_4/N84 ) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[1]  ( .D(\invader_fsm_4/n116 ), 
        .CLK(n85), .Q(invader_4_coord_x[1]) );
  DFFNEGX1 \invader_fsm_4/display_reg  ( .D(n115), .CLK(n85), .Q(
        invader_4_display) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[1]  ( .D(\invader_fsm_4/N56 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [1]) );
  DFFNEGX1 \invader_fsm_4/state_reg[0]  ( .D(\invader_fsm_4/n112 ), .CLK(n85), 
        .Q(\invader_fsm_4/state[0] ) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[0]  ( .D(\invader_fsm_4/N55 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [0]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[4]  ( .D(n111), .CLK(n85), .Q(
        invader_4_coord_x[4]) );
  DFFNEGX1 \invader_fsm_4/move_interval_toggle_reg  ( .D(\invader_fsm_4/n117 ), 
        .CLK(n85), .Q(\invader_fsm_4/move_interval_toggle ) );
  NOR2X1 \player_bullet_fsm/U59  ( .A(n398), .B(n402), .Y(
        \player_bullet_fsm/n47 ) );
  NOR2X1 \player_bullet_fsm/U58  ( .A(playerbullet_shield_collision_signal), 
        .B(playerbullet_invader_collision_signal), .Y(\player_bullet_fsm/n48 )
         );
  AOI22X1 \player_bullet_fsm/U57  ( .A(\player_bullet_fsm/n47 ), .B(
        \player_bullet_fsm/n48 ), .C(playerbullet_fire), .D(n402), .Y(
        \player_bullet_fsm/n45 ) );
  NOR2X1 \player_bullet_fsm/U55  ( .A(\player_bullet_fsm/n45 ), .B(n75), .Y(
        \player_bullet_fsm/N15 ) );
  OAI21X1 \player_bullet_fsm/U50  ( .A(n403), .B(n397), .C(n72), .Y(
        \player_bullet_fsm/n42 ) );
  NOR2X1 \player_bullet_fsm/U37  ( .A(\player_bullet_fsm/n30 ), .B(n77), .Y(
        \player_bullet_fsm/n29 ) );
  AOI22X1 \player_bullet_fsm/U36  ( .A(player_coord_x[5]), .B(
        \player_bullet_fsm/n29 ), .C(player_bullet_coord_x[5]), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n35 ) );
  OAI21X1 \player_bullet_fsm/U35  ( .A(n896), .B(n74), .C(n100), .Y(
        \player_bullet_fsm/n34 ) );
  OAI21X1 \player_bullet_fsm/U34  ( .A(n100), .B(n46), .C(
        \player_bullet_fsm/n34 ), .Y(\player_bullet_fsm/n50 ) );
  AOI22X1 \player_bullet_fsm/U33  ( .A(player_coord_x[3]), .B(
        \player_bullet_fsm/n29 ), .C(player_bullet_coord_x[3]), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n33 ) );
  AOI22X1 \player_bullet_fsm/U32  ( .A(player_coord_x[2]), .B(
        \player_bullet_fsm/n29 ), .C(player_bullet_coord_x[2]), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n32 ) );
  AOI22X1 \player_bullet_fsm/U31  ( .A(player_coord_x[1]), .B(
        \player_bullet_fsm/n29 ), .C(player_bullet_coord_x[1]), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n31 ) );
  AOI22X1 \player_bullet_fsm/U30  ( .A(player_coord_x[0]), .B(
        \player_bullet_fsm/n29 ), .C(\shield_fsm/N35 ), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n28 ) );
  DFFNEGX1 \player_bullet_fsm/display_reg  ( .D(n9), .CLK(n85), .Q(
        player_bullet_display) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[0]  ( .D(n105), .CLK(
        n85), .Q(\shield_fsm/N35 ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[1]  ( .D(n104), .CLK(
        n84), .Q(player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[2]  ( .D(n103), .CLK(
        n84), .Q(player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[3]  ( .D(n102), .CLK(
        n84), .Q(player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[4]  ( .D(
        \player_bullet_fsm/n50 ), .CLK(n84), .Q(player_bullet_coord_x[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[5]  ( .D(n101), .CLK(
        n84), .Q(player_bullet_coord_x[5]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[1]  ( .D(n38), .CLK(
        n84), .Q(player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[4]  ( .D(n42), .CLK(
        n84), .Q(player_bullet_coord_y[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[3]  ( .D(n41), .CLK(
        n84), .Q(player_bullet_coord_y[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[2]  ( .D(n40), .CLK(
        n84), .Q(player_bullet_coord_y[2]) );
  DFFNEGX1 \player_bullet_fsm/state_reg[0]  ( .D(n9), .CLK(n84), .Q(
        \player_bullet_fsm/state[0] ) );
  DFFNEGX1 \player_bullet_fsm/next_state_reg[0]  ( .D(\player_bullet_fsm/N15 ), 
        .CLK(clka), .Q(\player_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[5]  ( .D(n39), .CLK(
        n84), .Q(player_bullet_coord_y[5]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[0]  ( .D(n37), .CLK(
        n84), .Q(player_bullet_coord_y[0]) );
  NOR2X1 \invader_bullet_fsm/U58  ( .A(\invader_bullet_fsm/N13 ), .B(n405), 
        .Y(\invader_bullet_fsm/n43 ) );
  NOR2X1 \invader_bullet_fsm/U57  ( .A(invaderbullet_shield_collision_signal), 
        .B(invaderbullet_player_collision_signal), .Y(\invader_bullet_fsm/n44 ) );
  AOI22X1 \invader_bullet_fsm/U56  ( .A(\invader_bullet_fsm/n43 ), .B(
        \invader_bullet_fsm/n44 ), .C(invader_fire), .D(n405), .Y(
        \invader_bullet_fsm/n41 ) );
  NOR2X1 \invader_bullet_fsm/U54  ( .A(\invader_bullet_fsm/n41 ), .B(n75), .Y(
        \invader_bullet_fsm/N19 ) );
  NOR2X1 \invader_bullet_fsm/U52  ( .A(n422), .B(n75), .Y(
        \invader_bullet_fsm/N40 ) );
  AOI22X1 \invader_bullet_fsm/U51  ( .A(n423), .B(
        \invader_bullet_fsm/next_state[0] ), .C(closest_invader_coord_y[0]), 
        .D(n422), .Y(\invader_bullet_fsm/n38 ) );
  AOI21X1 \invader_bullet_fsm/U45  ( .A(closest_invader_coord_y[1]), .B(n422), 
        .C(n76), .Y(\invader_bullet_fsm/n36 ) );
  NAND2X1 \invader_bullet_fsm/U44  ( .A(\invader_bullet_fsm/n35 ), .B(
        \invader_bullet_fsm/n36 ), .Y(\invader_bullet_fsm/n52 ) );
  AOI21X1 \invader_bullet_fsm/U42  ( .A(closest_invader_coord_y[2]), .B(n422), 
        .C(n76), .Y(\invader_bullet_fsm/n34 ) );
  NAND2X1 \invader_bullet_fsm/U41  ( .A(\invader_bullet_fsm/n33 ), .B(
        \invader_bullet_fsm/n34 ), .Y(\invader_bullet_fsm/n51 ) );
  AOI21X1 \invader_bullet_fsm/U39  ( .A(closest_invader_coord_y[3]), .B(n422), 
        .C(n77), .Y(\invader_bullet_fsm/n32 ) );
  NAND2X1 \invader_bullet_fsm/U38  ( .A(\invader_bullet_fsm/n31 ), .B(
        \invader_bullet_fsm/n32 ), .Y(\invader_bullet_fsm/n50 ) );
  AOI21X1 \invader_bullet_fsm/U36  ( .A(closest_invader_coord_y[4]), .B(n422), 
        .C(n76), .Y(\invader_bullet_fsm/n29 ) );
  NAND2X1 \invader_bullet_fsm/U35  ( .A(\invader_bullet_fsm/n28 ), .B(
        \invader_bullet_fsm/n29 ), .Y(\invader_bullet_fsm/n49 ) );
  AOI22X1 \invader_bullet_fsm/U34  ( .A(\invader_bullet_fsm/N30 ), .B(
        \invader_bullet_fsm/next_state[0] ), .C(closest_invader_coord_y[5]), 
        .D(n422), .Y(\invader_bullet_fsm/n25 ) );
  NOR2X1 \invader_bullet_fsm/U30  ( .A(n422), .B(n77), .Y(
        \invader_bullet_fsm/n15 ) );
  AOI22X1 \invader_bullet_fsm/U29  ( .A(\shield_fsm/N19 ), .B(
        \invader_bullet_fsm/n15 ), .C(closest_invader_coord_x[0]), .D(
        \invader_bullet_fsm/n16 ), .Y(\invader_bullet_fsm/n22 ) );
  AOI22X1 \invader_bullet_fsm/U28  ( .A(invader_bullet_coord_x[5]), .B(
        \invader_bullet_fsm/n15 ), .C(closest_invader_coord_x[5]), .D(
        \invader_bullet_fsm/n16 ), .Y(\invader_bullet_fsm/n21 ) );
  AOI22X1 \invader_bullet_fsm/U27  ( .A(invader_bullet_coord_x[4]), .B(
        \invader_bullet_fsm/n15 ), .C(closest_invader_coord_x[4]), .D(
        \invader_bullet_fsm/n16 ), .Y(\invader_bullet_fsm/n20 ) );
  AOI21X1 \invader_bullet_fsm/U26  ( .A(closest_invader_coord_x[3]), .B(n422), 
        .C(n76), .Y(\invader_bullet_fsm/n19 ) );
  OAI21X1 \invader_bullet_fsm/U25  ( .A(n422), .B(n415), .C(
        \invader_bullet_fsm/n19 ), .Y(\invader_bullet_fsm/n46 ) );
  AOI21X1 \invader_bullet_fsm/U24  ( .A(closest_invader_coord_x[2]), .B(n422), 
        .C(n77), .Y(\invader_bullet_fsm/n18 ) );
  OAI21X1 \invader_bullet_fsm/U23  ( .A(n422), .B(n416), .C(
        \invader_bullet_fsm/n18 ), .Y(\invader_bullet_fsm/n45 ) );
  AOI22X1 \invader_bullet_fsm/U22  ( .A(invader_bullet_coord_x[1]), .B(
        \invader_bullet_fsm/n15 ), .C(closest_invader_coord_x[1]), .D(
        \invader_bullet_fsm/n16 ), .Y(\invader_bullet_fsm/n14 ) );
  AND2X2 \invader_bullet_fsm/U11  ( .A(n422), .B(n73), .Y(
        \invader_bullet_fsm/n16 ) );
  DFFNEGX1 \invader_bullet_fsm/state_reg[0]  ( .D(\invader_bullet_fsm/N40 ), 
        .CLK(n84), .Q(\invader_bullet_fsm/state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[0]  ( .D(n106), 
        .CLK(n83), .Q(\shield_fsm/N19 ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[5]  ( .D(n107), 
        .CLK(n83), .Q(invader_bullet_coord_x[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[4]  ( .D(n108), 
        .CLK(n83), .Q(invader_bullet_coord_x[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[1]  ( .D(n109), 
        .CLK(n83), .Q(invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[3]  ( .D(
        \invader_bullet_fsm/n46 ), .CLK(n83), .Q(invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[2]  ( .D(
        \invader_bullet_fsm/n45 ), .CLK(n83), .Q(invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[1]  ( .D(
        \invader_bullet_fsm/n52 ), .CLK(n83), .Q(invader_bullet_coord_y[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[2]  ( .D(
        \invader_bullet_fsm/n51 ), .CLK(n83), .Q(invader_bullet_coord_y[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[3]  ( .D(
        \invader_bullet_fsm/n50 ), .CLK(n83), .Q(invader_bullet_coord_y[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[4]  ( .D(
        \invader_bullet_fsm/n49 ), .CLK(n83), .Q(invader_bullet_coord_y[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_display_reg  ( .D(
        \invader_bullet_fsm/n47 ), .CLK(n83), .Q(invader_bullet_display) );
  DFFNEGX1 \invader_bullet_fsm/next_state_reg[0]  ( .D(
        \invader_bullet_fsm/N19 ), .CLK(clka), .Q(
        \invader_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[5]  ( .D(
        \invader_bullet_fsm/n48 ), .CLK(n83), .Q(invader_bullet_coord_y[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[0]  ( .D(
        \invader_bullet_fsm/n53 ), .CLK(n83), .Q(invader_bullet_coord_y[0]) );
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
  HAX1 \player_fsm/r403/U1_1_2  ( .A(n897), .B(\player_fsm/r403/carry [2]), 
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
  FAX1 \main_game_fsm/sub_60/U2_1  ( .A(player_coord_x[1]), .B(n58), .C(
        \main_game_fsm/sub_60/carry [1]), .YC(\main_game_fsm/sub_60/carry [2]), 
        .YS(\main_game_fsm/N30 ) );
  FAX1 \main_game_fsm/sub_60/U2_2  ( .A(player_coord_x[2]), .B(n254), .C(
        \main_game_fsm/sub_60/carry [2]), .YC(\main_game_fsm/sub_60/carry [3]), 
        .YS(\main_game_fsm/N31 ) );
  FAX1 \main_game_fsm/sub_60/U2_3  ( .A(player_coord_x[3]), .B(n57), .C(
        \main_game_fsm/sub_60/carry [3]), .YC(\main_game_fsm/sub_60/carry [4]), 
        .YS(\main_game_fsm/N32 ) );
  FAX1 \main_game_fsm/sub_60/U2_4  ( .A(player_coord_x[4]), .B(n248), .C(
        \main_game_fsm/sub_60/carry [4]), .YC(\main_game_fsm/sub_60/carry [5]), 
        .YS(\main_game_fsm/N33 ) );
  FAX1 \main_game_fsm/sub_60/U2_5  ( .A(player_coord_x[5]), .B(n60), .C(
        \main_game_fsm/sub_60/carry [5]), .YC(), .YS(\main_game_fsm/N34 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_1  ( .A(invader_1_coord_x[1]), .B(n67), .C(
        \main_game_fsm/sub_60_2/carry [1]), .YC(
        \main_game_fsm/sub_60_2/carry [2]), .YS(\main_game_fsm/N36 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_2  ( .A(invader_1_coord_x[2]), .B(n68), .C(
        \main_game_fsm/sub_60_2/carry [2]), .YC(
        \main_game_fsm/sub_60_2/carry [3]), .YS(\main_game_fsm/N37 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_3  ( .A(invader_1_coord_x[3]), .B(n66), .C(
        \main_game_fsm/sub_60_2/carry [3]), .YC(
        \main_game_fsm/sub_60_2/carry [4]), .YS(\main_game_fsm/N38 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_4  ( .A(invader_1_coord_x[4]), .B(n64), .C(
        \main_game_fsm/sub_60_2/carry [4]), .YC(
        \main_game_fsm/sub_60_2/carry [5]), .YS(\main_game_fsm/N39 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_5  ( .A(invader_1_coord_x[5]), .B(n62), .C(
        \main_game_fsm/sub_60_2/carry [5]), .YC(), .YS(\main_game_fsm/N40 ) );
  FAX1 \main_game_fsm/sub_64/U2_1  ( .A(player_coord_x[1]), .B(n55), .C(
        \main_game_fsm/sub_64/carry [1]), .YC(\main_game_fsm/sub_64/carry [2]), 
        .YS(\main_game_fsm/N44 ) );
  FAX1 \main_game_fsm/sub_64/U2_2  ( .A(n897), .B(n297), .C(
        \main_game_fsm/sub_64/carry [2]), .YC(\main_game_fsm/sub_64/carry [3]), 
        .YS(\main_game_fsm/N45 ) );
  FAX1 \main_game_fsm/sub_64/U2_3  ( .A(player_coord_x[3]), .B(n54), .C(
        \main_game_fsm/sub_64/carry [3]), .YC(\main_game_fsm/sub_64/carry [4]), 
        .YS(\main_game_fsm/N46 ) );
  FAX1 \main_game_fsm/sub_64/U2_4  ( .A(n896), .B(n291), .C(
        \main_game_fsm/sub_64/carry [4]), .YC(\main_game_fsm/sub_64/carry [5]), 
        .YS(\main_game_fsm/N47 ) );
  FAX1 \main_game_fsm/sub_64/U2_5  ( .A(n895), .B(n56), .C(
        \main_game_fsm/sub_64/carry [5]), .YC(), .YS(\main_game_fsm/N48 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_1  ( .A(invader_2_coord_x[1]), .B(n67), .C(
        \main_game_fsm/sub_64_2/carry [1]), .YC(
        \main_game_fsm/sub_64_2/carry [2]), .YS(\main_game_fsm/N50 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_2  ( .A(invader_2_coord_x[2]), .B(n68), .C(
        \main_game_fsm/sub_64_2/carry [2]), .YC(
        \main_game_fsm/sub_64_2/carry [3]), .YS(\main_game_fsm/N51 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_3  ( .A(invader_2_coord_x[3]), .B(n66), .C(
        \main_game_fsm/sub_64_2/carry [3]), .YC(
        \main_game_fsm/sub_64_2/carry [4]), .YS(\main_game_fsm/N52 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_4  ( .A(invader_2_coord_x[4]), .B(n64), .C(
        \main_game_fsm/sub_64_2/carry [4]), .YC(
        \main_game_fsm/sub_64_2/carry [5]), .YS(\main_game_fsm/N53 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_5  ( .A(invader_2_coord_x[5]), .B(n62), .C(
        \main_game_fsm/sub_64_2/carry [5]), .YC(), .YS(\main_game_fsm/N54 ) );
  FAX1 \main_game_fsm/sub_68/U2_1  ( .A(player_coord_x[1]), .B(n52), .C(
        \main_game_fsm/sub_68/carry [1]), .YC(\main_game_fsm/sub_68/carry [2]), 
        .YS(\main_game_fsm/N58 ) );
  FAX1 \main_game_fsm/sub_68/U2_2  ( .A(player_coord_x[2]), .B(n340), .C(
        \main_game_fsm/sub_68/carry [2]), .YC(\main_game_fsm/sub_68/carry [3]), 
        .YS(\main_game_fsm/N59 ) );
  FAX1 \main_game_fsm/sub_68/U2_3  ( .A(player_coord_x[3]), .B(n50), .C(
        \main_game_fsm/sub_68/carry [3]), .YC(\main_game_fsm/sub_68/carry [4]), 
        .YS(\main_game_fsm/N60 ) );
  FAX1 \main_game_fsm/sub_68/U2_4  ( .A(player_coord_x[4]), .B(n344), .C(
        \main_game_fsm/sub_68/carry [4]), .YC(\main_game_fsm/sub_68/carry [5]), 
        .YS(\main_game_fsm/N61 ) );
  FAX1 \main_game_fsm/sub_68/U2_5  ( .A(player_coord_x[5]), .B(n53), .C(
        \main_game_fsm/sub_68/carry [5]), .YC(), .YS(\main_game_fsm/N62 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_1  ( .A(invader_3_coord_x[1]), .B(n67), .C(
        \main_game_fsm/sub_68_2/carry [1]), .YC(
        \main_game_fsm/sub_68_2/carry [2]), .YS(\main_game_fsm/N64 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_2  ( .A(invader_3_coord_x[2]), .B(n68), .C(
        \main_game_fsm/sub_68_2/carry [2]), .YC(
        \main_game_fsm/sub_68_2/carry [3]), .YS(\main_game_fsm/N65 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_3  ( .A(invader_3_coord_x[3]), .B(n66), .C(
        \main_game_fsm/sub_68_2/carry [3]), .YC(
        \main_game_fsm/sub_68_2/carry [4]), .YS(\main_game_fsm/N66 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_4  ( .A(invader_3_coord_x[4]), .B(n64), .C(
        \main_game_fsm/sub_68_2/carry [4]), .YC(
        \main_game_fsm/sub_68_2/carry [5]), .YS(\main_game_fsm/N67 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_5  ( .A(invader_3_coord_x[5]), .B(n62), .C(
        \main_game_fsm/sub_68_2/carry [5]), .YC(), .YS(\main_game_fsm/N68 ) );
  FAX1 \main_game_fsm/sub_72/U2_1  ( .A(player_coord_x[1]), .B(n47), .C(
        \main_game_fsm/sub_72/carry [1]), .YC(\main_game_fsm/sub_72/carry [2]), 
        .YS(\main_game_fsm/N72 ) );
  FAX1 \main_game_fsm/sub_72/U2_2  ( .A(n897), .B(n382), .C(
        \main_game_fsm/sub_72/carry [2]), .YC(\main_game_fsm/sub_72/carry [3]), 
        .YS(\main_game_fsm/N73 ) );
  FAX1 \main_game_fsm/sub_72/U2_3  ( .A(player_coord_x[3]), .B(n48), .C(
        \main_game_fsm/sub_72/carry [3]), .YC(\main_game_fsm/sub_72/carry [4]), 
        .YS(\main_game_fsm/N74 ) );
  FAX1 \main_game_fsm/sub_72/U2_4  ( .A(n896), .B(n391), .C(
        \main_game_fsm/sub_72/carry [4]), .YC(\main_game_fsm/sub_72/carry [5]), 
        .YS(\main_game_fsm/N75 ) );
  FAX1 \main_game_fsm/sub_72/U2_5  ( .A(n895), .B(n49), .C(
        \main_game_fsm/sub_72/carry [5]), .YC(), .YS(\main_game_fsm/N76 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_1  ( .A(invader_4_coord_x[1]), .B(n67), .C(
        \main_game_fsm/sub_72_2/carry [1]), .YC(
        \main_game_fsm/sub_72_2/carry [2]), .YS(\main_game_fsm/N78 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_2  ( .A(invader_4_coord_x[2]), .B(n68), .C(
        \main_game_fsm/sub_72_2/carry [2]), .YC(
        \main_game_fsm/sub_72_2/carry [3]), .YS(\main_game_fsm/N79 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_3  ( .A(invader_4_coord_x[3]), .B(n66), .C(
        \main_game_fsm/sub_72_2/carry [3]), .YC(
        \main_game_fsm/sub_72_2/carry [4]), .YS(\main_game_fsm/N80 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_4  ( .A(invader_4_coord_x[4]), .B(n64), .C(
        \main_game_fsm/sub_72_2/carry [4]), .YC(
        \main_game_fsm/sub_72_2/carry [5]), .YS(\main_game_fsm/N81 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_5  ( .A(invader_4_coord_x[5]), .B(n62), .C(
        \main_game_fsm/sub_72_2/carry [5]), .YC(), .YS(\main_game_fsm/N82 ) );
  AND2X2 U4 ( .A(\main_game_fsm/N99 ), .B(n181), .Y(n3) );
  NOR2X1 U5 ( .A(\main_game_fsm/N93 ), .B(\main_game_fsm/N99 ), .Y(n4) );
  AND2X2 U6 ( .A(n19), .B(invader_3_coord_x[4]), .Y(n5) );
  AND2X2 U7 ( .A(n18), .B(invader_4_coord_x[4]), .Y(n6) );
  AND2X2 U8 ( .A(n21), .B(invader_1_coord_x[4]), .Y(n7) );
  AND2X2 U9 ( .A(n20), .B(invader_2_coord_x[4]), .Y(n8) );
  AND2X2 U10 ( .A(n73), .B(\player_bullet_fsm/next_state[0] ), .Y(n9) );
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
  AND2X2 U24 ( .A(n22), .B(player_bullet_coord_x[4]), .Y(n23) );
  AND2X2 U25 ( .A(\player_fsm/n80 ), .B(n72), .Y(n24) );
  AND2X2 U26 ( .A(n7), .B(invader_1_coord_x[5]), .Y(n25) );
  AND2X2 U27 ( .A(n8), .B(invader_2_coord_x[5]), .Y(n26) );
  AND2X2 U28 ( .A(n5), .B(invader_3_coord_x[5]), .Y(n27) );
  AND2X2 U29 ( .A(n6), .B(invader_4_coord_x[5]), .Y(n28) );
  AND2X2 U30 ( .A(n17), .B(invader_bullet_coord_x[5]), .Y(n29) );
  AND2X2 U31 ( .A(n23), .B(player_bullet_coord_x[5]), .Y(n30) );
  XNOR2X1 U32 ( .A(n12), .B(invader_1_coord_x[3]), .Y(n31) );
  XNOR2X1 U33 ( .A(n13), .B(invader_2_coord_x[3]), .Y(n32) );
  XNOR2X1 U34 ( .A(n14), .B(invader_3_coord_x[3]), .Y(n33) );
  XNOR2X1 U35 ( .A(n15), .B(invader_4_coord_x[3]), .Y(n34) );
  XNOR2X1 U36 ( .A(n16), .B(invader_bullet_coord_x[4]), .Y(n35) );
  XNOR2X1 U37 ( .A(n22), .B(player_bullet_coord_x[4]), .Y(n36) );
  AND2X2 U38 ( .A(n404), .B(n9), .Y(n37) );
  OR2X2 U39 ( .A(n403), .B(\player_bullet_fsm/n42 ), .Y(n38) );
  AND2X2 U40 ( .A(\player_bullet_fsm/N26 ), .B(n9), .Y(n39) );
  AND2X2 U41 ( .A(\player_bullet_fsm/N23 ), .B(n9), .Y(n40) );
  AND2X2 U42 ( .A(\player_bullet_fsm/N24 ), .B(n9), .Y(n41) );
  AND2X2 U43 ( .A(\player_bullet_fsm/N25 ), .B(n9), .Y(n42) );
  INVX2 U44 ( .A(n43), .Y(n71) );
  OR2X1 U45 ( .A(n165), .B(\main_game_fsm/N99 ), .Y(n43) );
  INVX2 U46 ( .A(n44), .Y(n70) );
  INVX2 U47 ( .A(invader_direction), .Y(n148) );
  NAND2X1 U48 ( .A(\main_game_fsm/N99 ), .B(\main_game_fsm/N87 ), .Y(n44) );
  BUFX2 U49 ( .A(n79), .Y(n83) );
  BUFX2 U50 ( .A(n79), .Y(n84) );
  BUFX2 U51 ( .A(n79), .Y(n85) );
  BUFX2 U52 ( .A(n80), .Y(n86) );
  BUFX2 U53 ( .A(n80), .Y(n87) );
  BUFX2 U54 ( .A(n80), .Y(n88) );
  BUFX2 U55 ( .A(n81), .Y(n89) );
  BUFX2 U56 ( .A(n81), .Y(n90) );
  BUFX2 U57 ( .A(n81), .Y(n91) );
  INVX2 U58 ( .A(\invader_fsm_4/n69 ), .Y(n388) );
  INVX2 U59 ( .A(\invader_fsm_3/n69 ), .Y(n347) );
  INVX2 U60 ( .A(n68), .Y(player_coord_x[2]) );
  INVX2 U61 ( .A(n62), .Y(player_coord_x[5]) );
  INVX2 U62 ( .A(n64), .Y(player_coord_x[4]) );
  INVX2 U63 ( .A(n76), .Y(n72) );
  INVX2 U64 ( .A(n75), .Y(n73) );
  BUFX2 U65 ( .A(n82), .Y(n92) );
  BUFX2 U66 ( .A(clkb), .Y(n82) );
  INVX2 U67 ( .A(player_bullet_coord_y[3]), .Y(n400) );
  INVX2 U68 ( .A(player_bullet_coord_x[1]), .Y(n393) );
  INVX2 U69 ( .A(player_bullet_coord_y[1]), .Y(n396) );
  INVX2 U70 ( .A(player_bullet_coord_y[0]), .Y(n404) );
  INVX2 U71 ( .A(\invader_bullet_fsm/next_state[0] ), .Y(n422) );
  BUFX2 U72 ( .A(internal_reset), .Y(n74) );
  BUFX2 U73 ( .A(internal_reset), .Y(n77) );
  BUFX2 U74 ( .A(internal_reset), .Y(n76) );
  BUFX2 U75 ( .A(internal_reset), .Y(n75) );
  BUFX2 U76 ( .A(internal_reset), .Y(n78) );
  INVX2 U77 ( .A(\invader_fsm_3/N84 ), .Y(n51) );
  INVX2 U78 ( .A(player_coord_x[3]), .Y(n66) );
  INVX2 U79 ( .A(\invader_fsm_1/N84 ), .Y(n59) );
  INVX2 U80 ( .A(player_coord_x[0]), .Y(n61) );
  INVX2 U81 ( .A(invader_4_coord_x[1]), .Y(n47) );
  INVX2 U82 ( .A(invader_2_coord_x[1]), .Y(n55) );
  INVX2 U83 ( .A(player_coord_x[1]), .Y(n67) );
  INVX2 U84 ( .A(invader_4_coord_x[3]), .Y(n48) );
  INVX2 U85 ( .A(invader_3_coord_x[3]), .Y(n50) );
  INVX2 U86 ( .A(invader_2_coord_x[3]), .Y(n54) );
  INVX2 U87 ( .A(invader_1_coord_x[3]), .Y(n57) );
  INVX2 U88 ( .A(player_bullet_coord_x[4]), .Y(n46) );
  INVX2 U89 ( .A(n895), .Y(n62) );
  INVX2 U90 ( .A(invader_3_coord_x[1]), .Y(n52) );
  INVX2 U91 ( .A(player_bullet_coord_y[5]), .Y(n45) );
  INVX2 U92 ( .A(invader_1_coord_x[1]), .Y(n58) );
  INVX2 U93 ( .A(invader_4_coord_x[5]), .Y(n49) );
  INVX2 U94 ( .A(invader_3_coord_x[5]), .Y(n53) );
  INVX2 U95 ( .A(invader_2_coord_x[5]), .Y(n56) );
  INVX2 U96 ( .A(invader_1_coord_x[5]), .Y(n60) );
  INVX2 U97 ( .A(n897), .Y(n68) );
  INVX2 U98 ( .A(n896), .Y(n64) );
  BUFX2 U99 ( .A(clkb), .Y(n79) );
  BUFX2 U100 ( .A(clkb), .Y(n80) );
  BUFX2 U101 ( .A(clkb), .Y(n81) );
  OR2X1 U102 ( .A(invader_4_coord_y[2]), .B(invader_4_coord_y[1]), .Y(
        \invader_fsm_4/sub_124/carry [3]) );
  XNOR2X1 U103 ( .A(invader_4_coord_y[1]), .B(invader_4_coord_y[2]), .Y(
        \invader_fsm_4/N72 ) );
  OR2X1 U104 ( .A(invader_4_coord_y[3]), .B(\invader_fsm_4/sub_124/carry [3]), 
        .Y(\invader_fsm_4/sub_124/carry [4]) );
  XNOR2X1 U105 ( .A(\invader_fsm_4/sub_124/carry [3]), .B(invader_4_coord_y[3]), .Y(\invader_fsm_4/N73 ) );
  OR2X1 U106 ( .A(invader_4_coord_y[4]), .B(\invader_fsm_4/sub_124/carry [4]), 
        .Y(\invader_fsm_4/sub_124/carry [5]) );
  XNOR2X1 U107 ( .A(\invader_fsm_4/sub_124/carry [4]), .B(invader_4_coord_y[4]), .Y(\invader_fsm_4/N74 ) );
  XNOR2X1 U108 ( .A(invader_4_coord_y[5]), .B(\invader_fsm_4/sub_124/carry [5]), .Y(\invader_fsm_4/N75 ) );
  OR2X1 U109 ( .A(invader_3_coord_y[2]), .B(invader_3_coord_y[1]), .Y(
        \invader_fsm_3/sub_124/carry [3]) );
  XNOR2X1 U110 ( .A(invader_3_coord_y[1]), .B(invader_3_coord_y[2]), .Y(
        \invader_fsm_3/N72 ) );
  OR2X1 U111 ( .A(invader_3_coord_y[3]), .B(\invader_fsm_3/sub_124/carry [3]), 
        .Y(\invader_fsm_3/sub_124/carry [4]) );
  XNOR2X1 U112 ( .A(\invader_fsm_3/sub_124/carry [3]), .B(invader_3_coord_y[3]), .Y(\invader_fsm_3/N73 ) );
  OR2X1 U113 ( .A(invader_3_coord_y[4]), .B(\invader_fsm_3/sub_124/carry [4]), 
        .Y(\invader_fsm_3/sub_124/carry [5]) );
  XNOR2X1 U114 ( .A(\invader_fsm_3/sub_124/carry [4]), .B(invader_3_coord_y[4]), .Y(\invader_fsm_3/N74 ) );
  XNOR2X1 U115 ( .A(invader_3_coord_y[5]), .B(\invader_fsm_3/sub_124/carry [5]), .Y(\invader_fsm_3/N75 ) );
  OR2X1 U116 ( .A(invader_2_coord_y[2]), .B(invader_2_coord_y[1]), .Y(
        \invader_fsm_2/sub_124/carry [3]) );
  XNOR2X1 U117 ( .A(invader_2_coord_y[1]), .B(invader_2_coord_y[2]), .Y(
        \invader_fsm_2/N72 ) );
  OR2X1 U118 ( .A(invader_2_coord_y[3]), .B(\invader_fsm_2/sub_124/carry [3]), 
        .Y(\invader_fsm_2/sub_124/carry [4]) );
  XNOR2X1 U119 ( .A(\invader_fsm_2/sub_124/carry [3]), .B(invader_2_coord_y[3]), .Y(\invader_fsm_2/N73 ) );
  OR2X1 U120 ( .A(invader_2_coord_y[4]), .B(\invader_fsm_2/sub_124/carry [4]), 
        .Y(\invader_fsm_2/sub_124/carry [5]) );
  XNOR2X1 U121 ( .A(\invader_fsm_2/sub_124/carry [4]), .B(invader_2_coord_y[4]), .Y(\invader_fsm_2/N74 ) );
  XNOR2X1 U122 ( .A(invader_2_coord_y[5]), .B(\invader_fsm_2/sub_124/carry [5]), .Y(\invader_fsm_2/N75 ) );
  OR2X1 U123 ( .A(invader_1_coord_y[2]), .B(invader_1_coord_y[1]), .Y(
        \invader_fsm_1/sub_124/carry [3]) );
  XNOR2X1 U124 ( .A(invader_1_coord_y[1]), .B(invader_1_coord_y[2]), .Y(
        \invader_fsm_1/N72 ) );
  OR2X1 U125 ( .A(invader_1_coord_y[3]), .B(\invader_fsm_1/sub_124/carry [3]), 
        .Y(\invader_fsm_1/sub_124/carry [4]) );
  XNOR2X1 U126 ( .A(\invader_fsm_1/sub_124/carry [3]), .B(invader_1_coord_y[3]), .Y(\invader_fsm_1/N73 ) );
  OR2X1 U127 ( .A(invader_1_coord_y[4]), .B(\invader_fsm_1/sub_124/carry [4]), 
        .Y(\invader_fsm_1/sub_124/carry [5]) );
  XNOR2X1 U128 ( .A(\invader_fsm_1/sub_124/carry [4]), .B(invader_1_coord_y[4]), .Y(\invader_fsm_1/N74 ) );
  XNOR2X1 U129 ( .A(invader_1_coord_y[5]), .B(\invader_fsm_1/sub_124/carry [5]), .Y(\invader_fsm_1/N75 ) );
  OR2X1 U130 ( .A(player_coord_x[0]), .B(n59), .Y(
        \main_game_fsm/sub_60/carry [1]) );
  XNOR2X1 U131 ( .A(n59), .B(player_coord_x[0]), .Y(\main_game_fsm/N29 ) );
  OR2X1 U132 ( .A(\invader_fsm_1/N84 ), .B(n61), .Y(
        \main_game_fsm/sub_60_2/carry [1]) );
  XNOR2X1 U133 ( .A(n61), .B(\invader_fsm_1/N84 ), .Y(\main_game_fsm/N35 ) );
  OR2X1 U134 ( .A(player_coord_x[0]), .B(n304), .Y(
        \main_game_fsm/sub_64/carry [1]) );
  XNOR2X1 U135 ( .A(n304), .B(player_coord_x[0]), .Y(\main_game_fsm/N43 ) );
  OR2X1 U136 ( .A(\invader_fsm_2/N84 ), .B(n61), .Y(
        \main_game_fsm/sub_64_2/carry [1]) );
  XNOR2X1 U137 ( .A(n61), .B(\invader_fsm_2/N84 ), .Y(\main_game_fsm/N49 ) );
  OR2X1 U138 ( .A(player_coord_x[0]), .B(n51), .Y(
        \main_game_fsm/sub_68/carry [1]) );
  XNOR2X1 U139 ( .A(n51), .B(player_coord_x[0]), .Y(\main_game_fsm/N57 ) );
  OR2X1 U140 ( .A(\invader_fsm_3/N84 ), .B(n61), .Y(
        \main_game_fsm/sub_68_2/carry [1]) );
  XNOR2X1 U141 ( .A(n61), .B(\invader_fsm_3/N84 ), .Y(\main_game_fsm/N63 ) );
  OR2X1 U142 ( .A(player_coord_x[0]), .B(n386), .Y(
        \main_game_fsm/sub_72/carry [1]) );
  XNOR2X1 U143 ( .A(n386), .B(player_coord_x[0]), .Y(\main_game_fsm/N71 ) );
  OR2X1 U144 ( .A(\invader_fsm_4/N84 ), .B(n61), .Y(
        \main_game_fsm/sub_72_2/carry [1]) );
  XNOR2X1 U145 ( .A(n61), .B(\invader_fsm_4/N84 ), .Y(\main_game_fsm/N77 ) );
  XOR2X1 U146 ( .A(invader_4_coord_x[1]), .B(invader_4_coord_x[2]), .Y(
        \invader_fsm_4/N86 ) );
  XOR2X1 U147 ( .A(n18), .B(invader_4_coord_x[4]), .Y(\invader_fsm_4/N88 ) );
  XOR2X1 U148 ( .A(n6), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N89 ) );
  XOR2X1 U149 ( .A(invader_3_coord_x[1]), .B(invader_3_coord_x[2]), .Y(
        \invader_fsm_3/N86 ) );
  XOR2X1 U150 ( .A(n19), .B(invader_3_coord_x[4]), .Y(\invader_fsm_3/N88 ) );
  XOR2X1 U151 ( .A(n5), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N89 ) );
  XOR2X1 U152 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(
        \invader_fsm_2/N86 ) );
  XOR2X1 U153 ( .A(n20), .B(invader_2_coord_x[4]), .Y(\invader_fsm_2/N88 ) );
  XOR2X1 U154 ( .A(n8), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N89 ) );
  XOR2X1 U155 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(
        \invader_fsm_1/N86 ) );
  XOR2X1 U156 ( .A(n21), .B(invader_1_coord_x[4]), .Y(\invader_fsm_1/N88 ) );
  XOR2X1 U157 ( .A(n7), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N89 ) );
  XOR2X1 U158 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(\shield_fsm/N21 ) );
  XOR2X1 U159 ( .A(n10), .B(invader_bullet_coord_x[3]), .Y(\shield_fsm/N22 )
         );
  XOR2X1 U160 ( .A(n17), .B(invader_bullet_coord_x[5]), .Y(\shield_fsm/N24 )
         );
  XOR2X1 U161 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), 
        .Y(\shield_fsm/N37 ) );
  XOR2X1 U162 ( .A(n11), .B(player_bullet_coord_x[3]), .Y(\shield_fsm/N38 ) );
  XOR2X1 U163 ( .A(n23), .B(player_bullet_coord_x[5]), .Y(\shield_fsm/N40 ) );
  AND2X2 U164 ( .A(n425), .B(n424), .Y(\main_game_fsm/N111 ) );
  AND2X2 U165 ( .A(n521), .B(n520), .Y(\player_fsm/N37 ) );
  AND2X2 U166 ( .A(n553), .B(n566), .Y(n554) );
  AND2X2 U167 ( .A(n557), .B(n572), .Y(n558) );
  AND2X2 U168 ( .A(player_coord_x[3]), .B(n897), .Y(n575) );
  AND2X2 U169 ( .A(n393), .B(\shield_fsm/N35 ), .Y(n576) );
  AND2X2 U170 ( .A(n580), .B(n579), .Y(\shield_fsm/N34 ) );
  AND2X2 U171 ( .A(n414), .B(\shield_fsm/N19 ), .Y(n581) );
  AND2X2 U172 ( .A(n585), .B(n584), .Y(\shield_fsm/N18 ) );
  AND2X2 U173 ( .A(n894), .B(n893), .Y(\invader_bullet_fsm/N13 ) );
  INVX2 U174 ( .A(reset), .Y(n93) );
  INVX2 U175 ( .A(\main_game_fsm/n100 ), .Y(n94) );
  INVX2 U176 ( .A(\main_game_fsm/n90 ), .Y(n95) );
  INVX2 U177 ( .A(\main_game_fsm/n97 ), .Y(n96) );
  INVX2 U178 ( .A(\main_game_fsm/n96 ), .Y(n97) );
  INVX2 U179 ( .A(\main_game_fsm/n93 ), .Y(n98) );
  INVX2 U180 ( .A(player_shoot_input), .Y(n99) );
  INVX2 U181 ( .A(\player_bullet_fsm/n30 ), .Y(n100) );
  INVX2 U182 ( .A(\player_bullet_fsm/n35 ), .Y(n101) );
  INVX2 U183 ( .A(\player_bullet_fsm/n33 ), .Y(n102) );
  INVX2 U184 ( .A(\player_bullet_fsm/n32 ), .Y(n103) );
  INVX2 U185 ( .A(\player_bullet_fsm/n31 ), .Y(n104) );
  INVX2 U186 ( .A(\player_bullet_fsm/n28 ), .Y(n105) );
  INVX2 U187 ( .A(\invader_bullet_fsm/n22 ), .Y(n106) );
  INVX2 U188 ( .A(\invader_bullet_fsm/n21 ), .Y(n107) );
  INVX2 U189 ( .A(\invader_bullet_fsm/n20 ), .Y(n108) );
  INVX2 U190 ( .A(\invader_bullet_fsm/n14 ), .Y(n109) );
  INVX2 U191 ( .A(\invader_fsm_4/n83 ), .Y(n110) );
  INVX2 U192 ( .A(\invader_fsm_4/n79 ), .Y(n111) );
  INVX2 U193 ( .A(\invader_fsm_4/n74 ), .Y(n112) );
  INVX2 U194 ( .A(\invader_fsm_4/n81 ), .Y(n113) );
  INVX2 U195 ( .A(\invader_fsm_4/n75 ), .Y(n114) );
  INVX2 U196 ( .A(\invader_fsm_4/n73 ), .Y(n115) );
  INVX2 U197 ( .A(\invader_fsm_4/n58 ), .Y(n116) );
  INVX2 U198 ( .A(\invader_fsm_4/n77 ), .Y(n117) );
  INVX2 U199 ( .A(\invader_fsm_3/n92 ), .Y(n118) );
  INVX2 U200 ( .A(\invader_fsm_3/n79 ), .Y(n119) );
  INVX2 U201 ( .A(\invader_fsm_3/n74 ), .Y(n120) );
  INVX2 U202 ( .A(\invader_fsm_3/n81 ), .Y(n121) );
  INVX2 U203 ( .A(\invader_fsm_3/n75 ), .Y(n122) );
  INVX2 U204 ( .A(\invader_fsm_3/n73 ), .Y(n123) );
  INVX2 U205 ( .A(\invader_fsm_3/n58 ), .Y(n124) );
  INVX2 U206 ( .A(\invader_fsm_3/n77 ), .Y(n125) );
  INVX2 U207 ( .A(\invader_fsm_2/n79 ), .Y(n126) );
  INVX2 U208 ( .A(\invader_fsm_2/n73 ), .Y(n127) );
  INVX2 U209 ( .A(\invader_fsm_2/n81 ), .Y(n128) );
  INVX2 U210 ( .A(\invader_fsm_2/n74 ), .Y(n129) );
  INVX2 U211 ( .A(\invader_fsm_2/n72 ), .Y(n130) );
  INVX2 U212 ( .A(\invader_fsm_2/n57 ), .Y(n131) );
  INVX2 U213 ( .A(\invader_fsm_1/n90 ), .Y(n132) );
  INVX2 U214 ( .A(\invader_fsm_1/n73 ), .Y(n133) );
  INVX2 U215 ( .A(\invader_fsm_1/n86 ), .Y(n134) );
  INVX2 U216 ( .A(\invader_fsm_1/n74 ), .Y(n135) );
  INVX2 U217 ( .A(\invader_fsm_1/n72 ), .Y(n136) );
  INVX2 U218 ( .A(\invader_fsm_1/n57 ), .Y(n137) );
  INVX2 U219 ( .A(\shield_fsm/N102 ), .Y(n138) );
  INVX2 U220 ( .A(\shield_fsm/n61 ), .Y(n139) );
  INVX2 U221 ( .A(\player_fsm/n56 ), .Y(n140) );
  INVX2 U222 ( .A(\player_fsm/n70 ), .Y(n141) );
  INVX2 U223 ( .A(\player_fsm/n71 ), .Y(n142) );
  INVX2 U224 ( .A(play), .Y(n143) );
  INVX2 U225 ( .A(\player_fsm/n64 ), .Y(n144) );
  INVX2 U226 ( .A(player_right_motion), .Y(n145) );
  INVX2 U227 ( .A(\player_fsm/n65 ), .Y(n146) );
  INVX2 U228 ( .A(player_left_motion), .Y(n147) );
  INVX2 U229 ( .A(move_down), .Y(n149) );
  INVX2 U230 ( .A(\invader_fsm_2/n85 ), .Y(n150) );
  INVX2 U231 ( .A(\invader_fsm_1/n81 ), .Y(n151) );
  INVX2 U232 ( .A(\main_game_fsm/next_state [1]), .Y(n152) );
  INVX2 U233 ( .A(\main_game_fsm/n99 ), .Y(n153) );
  INVX2 U234 ( .A(\main_game_fsm/n173 ), .Y(n154) );
  INVX2 U235 ( .A(\main_game_fsm/prev_invader_outofbounds ), .Y(n155) );
  INVX2 U236 ( .A(\main_game_fsm/next_state [0]), .Y(n156) );
  INVX2 U237 ( .A(\main_game_fsm/state[0] ), .Y(n157) );
  INVX2 U238 ( .A(\main_game_fsm/n113 ), .Y(n158) );
  INVX2 U239 ( .A(n433), .Y(n159) );
  INVX2 U240 ( .A(\main_game_fsm/n111 ), .Y(n160) );
  INVX2 U241 ( .A(n429), .Y(n161) );
  INVX2 U242 ( .A(\main_game_fsm/n109 ), .Y(n162) );
  INVX2 U243 ( .A(n437), .Y(n163) );
  INVX2 U244 ( .A(\main_game_fsm/n108 ), .Y(n164) );
  INVX2 U245 ( .A(\main_game_fsm/N93 ), .Y(n165) );
  INVX2 U246 ( .A(n449), .Y(n166) );
  INVX2 U247 ( .A(n445), .Y(n167) );
  INVX2 U248 ( .A(n441), .Y(n168) );
  INVX2 U249 ( .A(\main_game_fsm/diff_alive4 [3]), .Y(n169) );
  INVX2 U250 ( .A(\main_game_fsm/diff_alive4 [1]), .Y(n170) );
  INVX2 U251 ( .A(\main_game_fsm/N69 ), .Y(n171) );
  INVX2 U252 ( .A(n457), .Y(n172) );
  INVX2 U253 ( .A(\main_game_fsm/diff_alive3 [5]), .Y(n173) );
  INVX2 U254 ( .A(\main_game_fsm/diff_alive3 [4]), .Y(n174) );
  INVX2 U255 ( .A(\main_game_fsm/diff_alive3 [2]), .Y(n175) );
  INVX2 U256 ( .A(\main_game_fsm/N55 ), .Y(n176) );
  INVX2 U257 ( .A(n469), .Y(n177) );
  INVX2 U258 ( .A(\main_game_fsm/n119 ), .Y(n178) );
  INVX2 U259 ( .A(\main_game_fsm/n118 ), .Y(n179) );
  INVX2 U260 ( .A(\main_game_fsm/n116 ), .Y(n180) );
  INVX2 U261 ( .A(\main_game_fsm/N87 ), .Y(n181) );
  INVX2 U262 ( .A(n485), .Y(n182) );
  INVX2 U263 ( .A(n481), .Y(n183) );
  INVX2 U264 ( .A(n477), .Y(n184) );
  INVX2 U265 ( .A(\main_game_fsm/diff_alive2 [3]), .Y(n185) );
  INVX2 U266 ( .A(\main_game_fsm/diff_alive2 [1]), .Y(n186) );
  INVX2 U267 ( .A(\main_game_fsm/N41 ), .Y(n187) );
  INVX2 U268 ( .A(n493), .Y(n188) );
  INVX2 U269 ( .A(\main_game_fsm/diff_alive1 [5]), .Y(n189) );
  INVX2 U270 ( .A(\main_game_fsm/diff_alive1 [4]), .Y(n190) );
  INVX2 U271 ( .A(\main_game_fsm/diff_alive1 [2]), .Y(n191) );
  INVX2 U272 ( .A(\main_game_fsm/N27 ), .Y(n192) );
  INVX2 U273 ( .A(n505), .Y(n193) );
  INVX2 U274 ( .A(n511), .Y(n194) );
  INVX2 U275 ( .A(n528), .Y(n195) );
  INVX2 U276 ( .A(\player_fsm/N18 ), .Y(n196) );
  INVX2 U277 ( .A(\player_fsm/N17 ), .Y(n197) );
  INVX2 U278 ( .A(n541), .Y(n198) );
  INVX2 U279 ( .A(n537), .Y(n199) );
  INVX2 U280 ( .A(\player_fsm/N15 ), .Y(n200) );
  INVX2 U281 ( .A(\player_fsm/N13 ), .Y(n201) );
  INVX2 U282 ( .A(n453), .Y(n202) );
  INVX2 U283 ( .A(n465), .Y(n203) );
  INVX2 U284 ( .A(n489), .Y(n204) );
  INVX2 U285 ( .A(n501), .Y(n205) );
  INVX2 U286 ( .A(n524), .Y(n206) );
  INVX2 U287 ( .A(n568), .Y(n207) );
  INVX2 U288 ( .A(n461), .Y(n208) );
  INVX2 U289 ( .A(n473), .Y(n209) );
  INVX2 U290 ( .A(n497), .Y(n210) );
  INVX2 U291 ( .A(n509), .Y(n211) );
  INVX2 U292 ( .A(n574), .Y(n212) );
  INVX2 U293 ( .A(n551), .Y(n213) );
  INVX2 U294 ( .A(n562), .Y(n214) );
  INVX2 U295 ( .A(\player_fsm/next_state [1]), .Y(n215) );
  INVX2 U296 ( .A(\player_fsm/state[0] ), .Y(n216) );
  INVX2 U297 ( .A(\player_fsm/next_state [0]), .Y(n217) );
  INVX2 U298 ( .A(\shield_fsm/state[0] ), .Y(n218) );
  INVX2 U299 ( .A(\shield_fsm/n67 ), .Y(n219) );
  INVX2 U300 ( .A(\shield_fsm/n69 ), .Y(n220) );
  INVX2 U301 ( .A(\shield_fsm/next_state [1]), .Y(n221) );
  INVX2 U302 ( .A(shield_hp[1]), .Y(n222) );
  INVX2 U303 ( .A(shield_hp[0]), .Y(n223) );
  INVX2 U304 ( .A(\invader_fsm_1/n96 ), .Y(n224) );
  INVX2 U305 ( .A(\invader_fsm_1/N34 ), .Y(n225) );
  INVX2 U306 ( .A(\invader_fsm_1/N33 ), .Y(n226) );
  INVX2 U307 ( .A(invader_1_coord_y[5]), .Y(n227) );
  INVX2 U308 ( .A(\invader_fsm_1/N40 ), .Y(n228) );
  INVX2 U309 ( .A(invader_1_coord_y[4]), .Y(n229) );
  INVX2 U310 ( .A(n603), .Y(n230) );
  INVX2 U311 ( .A(n599), .Y(n231) );
  INVX2 U312 ( .A(n610), .Y(n232) );
  INVX2 U313 ( .A(n620), .Y(n233) );
  INVX2 U314 ( .A(n616), .Y(n234) );
  INVX2 U315 ( .A(\invader_fsm_1/N31 ), .Y(n235) );
  INVX2 U316 ( .A(\invader_fsm_1/N38 ), .Y(n236) );
  INVX2 U317 ( .A(invader_1_coord_y[2]), .Y(n237) );
  INVX2 U318 ( .A(invader_1_coord_y[1]), .Y(n238) );
  INVX2 U319 ( .A(n598), .Y(n239) );
  INVX2 U320 ( .A(n607), .Y(n240) );
  INVX2 U321 ( .A(\invader_fsm_1/N29 ), .Y(n241) );
  INVX2 U322 ( .A(\invader_fsm_1/N70 ), .Y(n242) );
  INVX2 U323 ( .A(n588), .Y(n243) );
  INVX2 U324 ( .A(n659), .Y(n244) );
  INVX2 U325 ( .A(\invader_fsm_1/N18 ), .Y(n245) );
  INVX2 U326 ( .A(\invader_fsm_1/N17 ), .Y(n246) );
  INVX2 U327 ( .A(\invader_fsm_1/N24 ), .Y(n247) );
  INVX2 U328 ( .A(invader_1_coord_x[4]), .Y(n248) );
  INVX2 U329 ( .A(\invader_fsm_1/N16 ), .Y(n249) );
  INVX2 U330 ( .A(n636), .Y(n250) );
  INVX2 U331 ( .A(\invader_fsm_1/N22 ), .Y(n251) );
  INVX2 U332 ( .A(n632), .Y(n252) );
  INVX2 U333 ( .A(n656), .Y(n253) );
  INVX2 U334 ( .A(invader_1_coord_x[2]), .Y(n254) );
  INVX2 U335 ( .A(n646), .Y(n255) );
  INVX2 U336 ( .A(n642), .Y(n256) );
  INVX2 U337 ( .A(\invader_fsm_1/N15 ), .Y(n257) );
  INVX2 U338 ( .A(\invader_fsm_1/N13 ), .Y(n258) );
  INVX2 U339 ( .A(n631), .Y(n259) );
  INVX2 U340 ( .A(n653), .Y(n260) );
  INVX2 U341 ( .A(\invader_fsm_1/state[1] ), .Y(n261) );
  INVX2 U342 ( .A(\invader_fsm_1/n69 ), .Y(n262) );
  INVX2 U343 ( .A(\invader_fsm_1/n68 ), .Y(n263) );
  INVX2 U344 ( .A(\invader_fsm_1/state[0] ), .Y(n264) );
  INVX2 U345 ( .A(\invader_fsm_1/next_state [0]), .Y(n265) );
  INVX2 U346 ( .A(\invader_fsm_2/n96 ), .Y(n266) );
  INVX2 U347 ( .A(\invader_fsm_2/N34 ), .Y(n267) );
  INVX2 U348 ( .A(\invader_fsm_2/N33 ), .Y(n268) );
  INVX2 U349 ( .A(invader_2_coord_y[5]), .Y(n269) );
  INVX2 U350 ( .A(\invader_fsm_2/N40 ), .Y(n270) );
  INVX2 U351 ( .A(invader_2_coord_y[4]), .Y(n271) );
  INVX2 U352 ( .A(n677), .Y(n272) );
  INVX2 U353 ( .A(n673), .Y(n273) );
  INVX2 U354 ( .A(n684), .Y(n274) );
  INVX2 U355 ( .A(n694), .Y(n275) );
  INVX2 U356 ( .A(n690), .Y(n276) );
  INVX2 U357 ( .A(\invader_fsm_2/N31 ), .Y(n277) );
  INVX2 U358 ( .A(\invader_fsm_2/N38 ), .Y(n278) );
  INVX2 U359 ( .A(invader_2_coord_y[2]), .Y(n279) );
  INVX2 U360 ( .A(invader_2_coord_y[1]), .Y(n280) );
  INVX2 U361 ( .A(n672), .Y(n281) );
  INVX2 U362 ( .A(n681), .Y(n282) );
  INVX2 U363 ( .A(\invader_fsm_2/N29 ), .Y(n283) );
  INVX2 U364 ( .A(\invader_fsm_2/N70 ), .Y(n284) );
  INVX2 U365 ( .A(\invader_fsm_2/state[1] ), .Y(n285) );
  INVX2 U366 ( .A(n662), .Y(n286) );
  INVX2 U367 ( .A(n733), .Y(n287) );
  INVX2 U368 ( .A(\invader_fsm_2/N18 ), .Y(n288) );
  INVX2 U369 ( .A(\invader_fsm_2/N17 ), .Y(n289) );
  INVX2 U370 ( .A(\invader_fsm_2/N24 ), .Y(n290) );
  INVX2 U371 ( .A(invader_2_coord_x[4]), .Y(n291) );
  INVX2 U372 ( .A(\invader_fsm_2/N16 ), .Y(n292) );
  INVX2 U373 ( .A(n710), .Y(n293) );
  INVX2 U374 ( .A(\invader_fsm_2/N22 ), .Y(n294) );
  INVX2 U375 ( .A(n706), .Y(n295) );
  INVX2 U376 ( .A(n730), .Y(n296) );
  INVX2 U377 ( .A(invader_2_coord_x[2]), .Y(n297) );
  INVX2 U378 ( .A(n720), .Y(n298) );
  INVX2 U379 ( .A(n716), .Y(n299) );
  INVX2 U380 ( .A(\invader_fsm_2/N15 ), .Y(n300) );
  INVX2 U381 ( .A(\invader_fsm_2/N13 ), .Y(n301) );
  INVX2 U382 ( .A(n705), .Y(n302) );
  INVX2 U383 ( .A(n727), .Y(n303) );
  INVX2 U384 ( .A(\invader_fsm_2/N84 ), .Y(n304) );
  INVX2 U385 ( .A(\invader_fsm_2/n69 ), .Y(n305) );
  INVX2 U386 ( .A(\invader_fsm_2/n68 ), .Y(n306) );
  INVX2 U387 ( .A(\invader_fsm_2/state[0] ), .Y(n307) );
  INVX2 U388 ( .A(\invader_fsm_2/next_state [0]), .Y(n308) );
  INVX2 U389 ( .A(\invader_fsm_3/n98 ), .Y(n309) );
  INVX2 U390 ( .A(\invader_fsm_3/N34 ), .Y(n310) );
  INVX2 U391 ( .A(\invader_fsm_3/N33 ), .Y(n311) );
  INVX2 U392 ( .A(invader_3_coord_y[5]), .Y(n312) );
  INVX2 U393 ( .A(\invader_fsm_3/N40 ), .Y(n313) );
  INVX2 U394 ( .A(invader_3_coord_y[4]), .Y(n314) );
  INVX2 U395 ( .A(n751), .Y(n315) );
  INVX2 U396 ( .A(n747), .Y(n316) );
  INVX2 U397 ( .A(n758), .Y(n317) );
  INVX2 U398 ( .A(n768), .Y(n318) );
  INVX2 U399 ( .A(n764), .Y(n319) );
  INVX2 U400 ( .A(\invader_fsm_3/N31 ), .Y(n320) );
  INVX2 U401 ( .A(\invader_fsm_3/N38 ), .Y(n321) );
  INVX2 U402 ( .A(invader_3_coord_y[2]), .Y(n322) );
  INVX2 U403 ( .A(invader_3_coord_y[1]), .Y(n323) );
  INVX2 U404 ( .A(n746), .Y(n324) );
  INVX2 U405 ( .A(n755), .Y(n325) );
  INVX2 U406 ( .A(\invader_fsm_3/N29 ), .Y(n326) );
  INVX2 U407 ( .A(\invader_fsm_3/N70 ), .Y(n327) );
  INVX2 U408 ( .A(n736), .Y(n328) );
  INVX2 U409 ( .A(n807), .Y(n329) );
  INVX2 U410 ( .A(\invader_fsm_3/N18 ), .Y(n330) );
  INVX2 U411 ( .A(\invader_fsm_3/N17 ), .Y(n331) );
  INVX2 U412 ( .A(n784), .Y(n332) );
  INVX2 U413 ( .A(\invader_fsm_3/N22 ), .Y(n333) );
  INVX2 U414 ( .A(n780), .Y(n334) );
  INVX2 U415 ( .A(n804), .Y(n335) );
  INVX2 U416 ( .A(\invader_fsm_3/N24 ), .Y(n336) );
  INVX2 U417 ( .A(n794), .Y(n337) );
  INVX2 U418 ( .A(n790), .Y(n338) );
  INVX2 U419 ( .A(\invader_fsm_3/N15 ), .Y(n339) );
  INVX2 U420 ( .A(invader_3_coord_x[2]), .Y(n340) );
  INVX2 U421 ( .A(n779), .Y(n341) );
  INVX2 U422 ( .A(n801), .Y(n342) );
  INVX2 U423 ( .A(\invader_fsm_3/N13 ), .Y(n343) );
  INVX2 U424 ( .A(invader_3_coord_x[4]), .Y(n344) );
  INVX2 U425 ( .A(\invader_fsm_3/state[1] ), .Y(n345) );
  INVX2 U426 ( .A(\invader_fsm_3/n70 ), .Y(n346) );
  INVX2 U427 ( .A(\invader_fsm_3/state[0] ), .Y(n348) );
  INVX2 U428 ( .A(\invader_fsm_3/next_state [0]), .Y(n349) );
  INVX2 U429 ( .A(\invader_fsm_4/n98 ), .Y(n350) );
  INVX2 U430 ( .A(\invader_fsm_4/N34 ), .Y(n351) );
  INVX2 U431 ( .A(\invader_fsm_4/N33 ), .Y(n352) );
  INVX2 U432 ( .A(invader_4_coord_y[5]), .Y(n353) );
  INVX2 U433 ( .A(\invader_fsm_4/N40 ), .Y(n354) );
  INVX2 U434 ( .A(invader_4_coord_y[4]), .Y(n355) );
  INVX2 U435 ( .A(n825), .Y(n356) );
  INVX2 U436 ( .A(n821), .Y(n357) );
  INVX2 U437 ( .A(n832), .Y(n358) );
  INVX2 U438 ( .A(n842), .Y(n359) );
  INVX2 U439 ( .A(n838), .Y(n360) );
  INVX2 U440 ( .A(\invader_fsm_4/N31 ), .Y(n361) );
  INVX2 U441 ( .A(\invader_fsm_4/N38 ), .Y(n362) );
  INVX2 U442 ( .A(invader_4_coord_y[2]), .Y(n363) );
  INVX2 U443 ( .A(invader_4_coord_y[1]), .Y(n364) );
  INVX2 U444 ( .A(n820), .Y(n365) );
  INVX2 U445 ( .A(n829), .Y(n366) );
  INVX2 U446 ( .A(\invader_fsm_4/N29 ), .Y(n367) );
  INVX2 U447 ( .A(\invader_fsm_4/N70 ), .Y(n368) );
  INVX2 U448 ( .A(\invader_fsm_4/state[1] ), .Y(n369) );
  INVX2 U449 ( .A(n810), .Y(n370) );
  INVX2 U450 ( .A(n881), .Y(n371) );
  INVX2 U451 ( .A(\invader_fsm_4/N18 ), .Y(n372) );
  INVX2 U452 ( .A(\invader_fsm_4/N17 ), .Y(n373) );
  INVX2 U453 ( .A(n858), .Y(n374) );
  INVX2 U454 ( .A(n854), .Y(n375) );
  INVX2 U455 ( .A(n878), .Y(n376) );
  INVX2 U456 ( .A(\invader_fsm_4/N24 ), .Y(n377) );
  INVX2 U457 ( .A(n868), .Y(n378) );
  INVX2 U458 ( .A(n864), .Y(n379) );
  INVX2 U459 ( .A(\invader_fsm_4/N15 ), .Y(n380) );
  INVX2 U460 ( .A(\invader_fsm_4/N22 ), .Y(n381) );
  INVX2 U461 ( .A(invader_4_coord_x[2]), .Y(n382) );
  INVX2 U462 ( .A(\invader_fsm_4/N13 ), .Y(n383) );
  INVX2 U463 ( .A(n853), .Y(n384) );
  INVX2 U464 ( .A(n875), .Y(n385) );
  INVX2 U465 ( .A(\invader_fsm_4/N84 ), .Y(n386) );
  INVX2 U466 ( .A(\invader_fsm_4/n70 ), .Y(n387) );
  INVX2 U467 ( .A(\invader_fsm_4/state[0] ), .Y(n389) );
  INVX2 U468 ( .A(\invader_fsm_4/next_state [0]), .Y(n390) );
  INVX2 U469 ( .A(invader_4_coord_x[4]), .Y(n391) );
  INVX2 U470 ( .A(\shield_fsm/N35 ), .Y(n392) );
  INVX2 U471 ( .A(player_bullet_coord_x[2]), .Y(n394) );
  INVX2 U472 ( .A(player_bullet_coord_x[3]), .Y(n395) );
  INVX2 U473 ( .A(\player_bullet_fsm/N22 ), .Y(n397) );
  INVX2 U474 ( .A(n885), .Y(n398) );
  INVX2 U475 ( .A(player_bullet_coord_y[4]), .Y(n399) );
  INVX2 U476 ( .A(player_bullet_coord_y[2]), .Y(n401) );
  INVX2 U477 ( .A(\player_bullet_fsm/state[0] ), .Y(n402) );
  INVX2 U478 ( .A(\player_bullet_fsm/next_state[0] ), .Y(n403) );
  INVX2 U479 ( .A(\invader_bullet_fsm/state[0] ), .Y(n405) );
  INVX2 U480 ( .A(\player_fsm/N27 ), .Y(n406) );
  INVX2 U481 ( .A(\player_fsm/N26 ), .Y(n407) );
  INVX2 U482 ( .A(\player_fsm/N24 ), .Y(n408) );
  INVX2 U483 ( .A(\player_fsm/N22 ), .Y(n409) );
  INVX2 U484 ( .A(\shield_fsm/N19 ), .Y(n410) );
  INVX2 U485 ( .A(\shield_fsm/n63 ), .Y(n411) );
  INVX2 U486 ( .A(invader_bullet_coord_x[5]), .Y(n412) );
  INVX2 U487 ( .A(invader_bullet_coord_x[4]), .Y(n413) );
  INVX2 U488 ( .A(invader_bullet_coord_x[1]), .Y(n414) );
  INVX2 U489 ( .A(invader_bullet_coord_x[3]), .Y(n415) );
  INVX2 U490 ( .A(invader_bullet_coord_x[2]), .Y(n416) );
  INVX2 U491 ( .A(\player_fsm/N40 ), .Y(n417) );
  INVX2 U492 ( .A(n887), .Y(n418) );
  INVX2 U493 ( .A(invader_bullet_coord_y[1]), .Y(n419) );
  INVX2 U494 ( .A(invader_bullet_coord_y[2]), .Y(n420) );
  INVX2 U495 ( .A(invader_bullet_coord_y[3]), .Y(n421) );
  INVX2 U496 ( .A(invader_bullet_coord_y[0]), .Y(n423) );
  AOI21X1 U497 ( .A(closest_invader_coord_y[2]), .B(closest_invader_coord_y[1]), .C(closest_invader_coord_y[3]), .Y(n425) );
  NOR2X1 U498 ( .A(closest_invader_coord_y[5]), .B(closest_invader_coord_y[4]), 
        .Y(n424) );
  NOR2X1 U499 ( .A(\main_game_fsm/n114 ), .B(n164), .Y(n437) );
  AOI22X1 U500 ( .A(n162), .B(\main_game_fsm/n115 ), .C(n164), .D(
        \main_game_fsm/n114 ), .Y(n436) );
  OAI21X1 U501 ( .A(n162), .B(\main_game_fsm/n115 ), .C(n163), .Y(n435) );
  NAND2X1 U502 ( .A(n180), .B(\main_game_fsm/n110 ), .Y(n429) );
  NAND3X1 U503 ( .A(n429), .B(\main_game_fsm/n117 ), .C(n160), .Y(n426) );
  OAI21X1 U504 ( .A(n180), .B(\main_game_fsm/n110 ), .C(n426), .Y(n433) );
  AOI21X1 U505 ( .A(n179), .B(\main_game_fsm/n112 ), .C(n178), .Y(n427) );
  NAND2X1 U506 ( .A(n427), .B(n158), .Y(n428) );
  OAI21X1 U507 ( .A(n179), .B(\main_game_fsm/n112 ), .C(n428), .Y(n432) );
  NOR2X1 U508 ( .A(n160), .B(\main_game_fsm/n117 ), .Y(n430) );
  OAI21X1 U509 ( .A(n161), .B(n430), .C(n159), .Y(n431) );
  OAI21X1 U510 ( .A(n433), .B(n432), .C(n431), .Y(n434) );
  OAI22X1 U511 ( .A(n437), .B(n436), .C(n435), .D(n434), .Y(
        \main_game_fsm/N99 ) );
  NOR2X1 U512 ( .A(n173), .B(\main_game_fsm/diff_alive4 [5]), .Y(n449) );
  AOI22X1 U513 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n174), .C(
        \main_game_fsm/diff_alive4 [5]), .D(n173), .Y(n448) );
  OAI21X1 U514 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n174), .C(n166), .Y(
        n447) );
  NAND2X1 U515 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n169), .Y(n441) );
  NAND3X1 U516 ( .A(n441), .B(n175), .C(\main_game_fsm/diff_alive4 [2]), .Y(
        n438) );
  OAI21X1 U517 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n169), .C(n438), .Y(
        n445) );
  AOI21X1 U518 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n170), .C(
        \main_game_fsm/diff_alive3 [0]), .Y(n439) );
  NAND2X1 U519 ( .A(n439), .B(\main_game_fsm/diff_alive4 [0]), .Y(n440) );
  OAI21X1 U520 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n170), .C(n440), .Y(
        n444) );
  NOR2X1 U521 ( .A(\main_game_fsm/diff_alive4 [2]), .B(n175), .Y(n442) );
  OAI21X1 U522 ( .A(n168), .B(n442), .C(n167), .Y(n443) );
  OAI21X1 U523 ( .A(n445), .B(n444), .C(n443), .Y(n446) );
  OAI22X1 U524 ( .A(n449), .B(n448), .C(n447), .D(n446), .Y(
        \main_game_fsm/N93 ) );
  NOR2X1 U525 ( .A(n49), .B(n895), .Y(n461) );
  AOI22X1 U526 ( .A(n896), .B(n391), .C(player_coord_x[5]), .D(n49), .Y(n460)
         );
  OAI21X1 U527 ( .A(n896), .B(n391), .C(n208), .Y(n459) );
  NAND2X1 U528 ( .A(invader_4_coord_x[3]), .B(n66), .Y(n453) );
  NAND3X1 U529 ( .A(n453), .B(n382), .C(n897), .Y(n450) );
  OAI21X1 U530 ( .A(invader_4_coord_x[3]), .B(n66), .C(n450), .Y(n457) );
  AOI21X1 U531 ( .A(invader_4_coord_x[1]), .B(n67), .C(\invader_fsm_4/N84 ), 
        .Y(n451) );
  NAND2X1 U532 ( .A(n451), .B(player_coord_x[0]), .Y(n452) );
  OAI21X1 U533 ( .A(invader_4_coord_x[1]), .B(n67), .C(n452), .Y(n456) );
  NOR2X1 U534 ( .A(player_coord_x[2]), .B(n382), .Y(n454) );
  OAI21X1 U535 ( .A(n202), .B(n454), .C(n172), .Y(n455) );
  OAI21X1 U536 ( .A(n457), .B(n456), .C(n455), .Y(n458) );
  OAI22X1 U537 ( .A(n461), .B(n460), .C(n459), .D(n458), .Y(
        \main_game_fsm/N69 ) );
  NOR2X1 U538 ( .A(n53), .B(player_coord_x[5]), .Y(n473) );
  AOI22X1 U539 ( .A(player_coord_x[4]), .B(n344), .C(n895), .D(n53), .Y(n472)
         );
  OAI21X1 U540 ( .A(player_coord_x[4]), .B(n344), .C(n209), .Y(n471) );
  NAND2X1 U541 ( .A(invader_3_coord_x[3]), .B(n66), .Y(n465) );
  NAND3X1 U542 ( .A(n465), .B(n340), .C(player_coord_x[2]), .Y(n462) );
  OAI21X1 U543 ( .A(invader_3_coord_x[3]), .B(n66), .C(n462), .Y(n469) );
  AOI21X1 U544 ( .A(invader_3_coord_x[1]), .B(n67), .C(\invader_fsm_3/N84 ), 
        .Y(n463) );
  NAND2X1 U545 ( .A(n463), .B(player_coord_x[0]), .Y(n464) );
  OAI21X1 U546 ( .A(invader_3_coord_x[1]), .B(n67), .C(n464), .Y(n468) );
  NOR2X1 U547 ( .A(player_coord_x[2]), .B(n340), .Y(n466) );
  OAI21X1 U548 ( .A(n203), .B(n466), .C(n177), .Y(n467) );
  OAI21X1 U549 ( .A(n469), .B(n468), .C(n467), .Y(n470) );
  OAI22X1 U550 ( .A(n473), .B(n472), .C(n471), .D(n470), .Y(
        \main_game_fsm/N55 ) );
  NOR2X1 U551 ( .A(n189), .B(\main_game_fsm/diff_alive2 [5]), .Y(n485) );
  AOI22X1 U552 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n190), .C(
        \main_game_fsm/diff_alive2 [5]), .D(n189), .Y(n484) );
  OAI21X1 U553 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n190), .C(n182), .Y(
        n483) );
  NAND2X1 U554 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n185), .Y(n477) );
  NAND3X1 U555 ( .A(n477), .B(n191), .C(\main_game_fsm/diff_alive2 [2]), .Y(
        n474) );
  OAI21X1 U556 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n185), .C(n474), .Y(
        n481) );
  AOI21X1 U557 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n186), .C(
        \main_game_fsm/diff_alive1 [0]), .Y(n475) );
  NAND2X1 U558 ( .A(n475), .B(\main_game_fsm/diff_alive2 [0]), .Y(n476) );
  OAI21X1 U559 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n186), .C(n476), .Y(
        n480) );
  NOR2X1 U560 ( .A(\main_game_fsm/diff_alive2 [2]), .B(n191), .Y(n478) );
  OAI21X1 U561 ( .A(n184), .B(n478), .C(n183), .Y(n479) );
  OAI21X1 U562 ( .A(n481), .B(n480), .C(n479), .Y(n482) );
  OAI22X1 U563 ( .A(n485), .B(n484), .C(n483), .D(n482), .Y(
        \main_game_fsm/N87 ) );
  NOR2X1 U564 ( .A(n56), .B(n895), .Y(n497) );
  AOI22X1 U565 ( .A(n896), .B(n291), .C(player_coord_x[5]), .D(n56), .Y(n496)
         );
  OAI21X1 U566 ( .A(n896), .B(n291), .C(n210), .Y(n495) );
  NAND2X1 U567 ( .A(invader_2_coord_x[3]), .B(n66), .Y(n489) );
  NAND3X1 U568 ( .A(n489), .B(n297), .C(n897), .Y(n486) );
  OAI21X1 U569 ( .A(invader_2_coord_x[3]), .B(n66), .C(n486), .Y(n493) );
  AOI21X1 U570 ( .A(invader_2_coord_x[1]), .B(n67), .C(\invader_fsm_2/N84 ), 
        .Y(n487) );
  NAND2X1 U571 ( .A(n487), .B(player_coord_x[0]), .Y(n488) );
  OAI21X1 U572 ( .A(invader_2_coord_x[1]), .B(n67), .C(n488), .Y(n492) );
  NOR2X1 U573 ( .A(n897), .B(n297), .Y(n490) );
  OAI21X1 U574 ( .A(n204), .B(n490), .C(n188), .Y(n491) );
  OAI21X1 U575 ( .A(n493), .B(n492), .C(n491), .Y(n494) );
  OAI22X1 U576 ( .A(n497), .B(n496), .C(n495), .D(n494), .Y(
        \main_game_fsm/N41 ) );
  NOR2X1 U577 ( .A(n60), .B(player_coord_x[5]), .Y(n509) );
  AOI22X1 U578 ( .A(player_coord_x[4]), .B(n248), .C(n895), .D(n60), .Y(n508)
         );
  OAI21X1 U579 ( .A(player_coord_x[4]), .B(n248), .C(n211), .Y(n507) );
  NAND2X1 U580 ( .A(invader_1_coord_x[3]), .B(n66), .Y(n501) );
  NAND3X1 U581 ( .A(n501), .B(n254), .C(player_coord_x[2]), .Y(n498) );
  OAI21X1 U582 ( .A(invader_1_coord_x[3]), .B(n66), .C(n498), .Y(n505) );
  AOI21X1 U583 ( .A(invader_1_coord_x[1]), .B(n67), .C(\invader_fsm_1/N84 ), 
        .Y(n499) );
  NAND2X1 U584 ( .A(n499), .B(player_coord_x[0]), .Y(n500) );
  OAI21X1 U585 ( .A(invader_1_coord_x[1]), .B(n67), .C(n500), .Y(n504) );
  NOR2X1 U586 ( .A(player_coord_x[2]), .B(n254), .Y(n502) );
  OAI21X1 U587 ( .A(n205), .B(n502), .C(n193), .Y(n503) );
  OAI21X1 U588 ( .A(n505), .B(n504), .C(n503), .Y(n506) );
  OAI22X1 U589 ( .A(n509), .B(n508), .C(n507), .D(n506), .Y(
        \main_game_fsm/N27 ) );
  NAND2X1 U590 ( .A(n67), .B(n61), .Y(n510) );
  OAI21X1 U591 ( .A(n61), .B(n67), .C(n510), .Y(\player_fsm/N79 ) );
  NOR2X1 U592 ( .A(n510), .B(n897), .Y(n512) );
  AOI21X1 U593 ( .A(n510), .B(n897), .C(n512), .Y(n511) );
  NAND2X1 U594 ( .A(n512), .B(n66), .Y(n513) );
  OAI21X1 U595 ( .A(n512), .B(n66), .C(n513), .Y(\player_fsm/N81 ) );
  XNOR2X1 U596 ( .A(n896), .B(n513), .Y(\player_fsm/N82 ) );
  NOR2X1 U597 ( .A(n896), .B(n513), .Y(n514) );
  XOR2X1 U598 ( .A(n895), .B(n514), .Y(\player_fsm/N83 ) );
  NOR2X1 U599 ( .A(player_coord_x[3]), .B(player_coord_x[2]), .Y(n516) );
  NOR2X1 U600 ( .A(player_coord_x[5]), .B(player_coord_x[4]), .Y(n515) );
  NAND2X1 U601 ( .A(n516), .B(n515), .Y(\player_fsm/N72 ) );
  NOR2X1 U602 ( .A(\player_fsm/N42 ), .B(\player_fsm/N41 ), .Y(n519) );
  OR2X1 U603 ( .A(\player_fsm/N45 ), .B(\player_fsm/N44 ), .Y(n517) );
  NOR2X1 U604 ( .A(\player_fsm/N43 ), .B(n517), .Y(n518) );
  NAND3X1 U605 ( .A(n519), .B(n417), .C(n518), .Y(\player_fsm/N46 ) );
  NOR2X1 U606 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n521) );
  NOR2X1 U607 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n520) );
  OAI21X1 U608 ( .A(n895), .B(n407), .C(n406), .Y(n534) );
  NAND2X1 U609 ( .A(n895), .B(n407), .Y(n529) );
  OAI21X1 U610 ( .A(\player_fsm/N25 ), .B(n64), .C(n529), .Y(n532) );
  NAND2X1 U611 ( .A(player_coord_x[3]), .B(n408), .Y(n524) );
  NAND3X1 U612 ( .A(n524), .B(n68), .C(\player_fsm/N23 ), .Y(n522) );
  OAI21X1 U613 ( .A(player_coord_x[3]), .B(n408), .C(n522), .Y(n528) );
  OAI22X1 U614 ( .A(\player_fsm/N22 ), .B(n67), .C(n410), .D(n61), .Y(n523) );
  OAI21X1 U615 ( .A(player_coord_x[1]), .B(n409), .C(n523), .Y(n527) );
  NOR2X1 U616 ( .A(\player_fsm/N23 ), .B(n68), .Y(n525) );
  OAI21X1 U617 ( .A(n206), .B(n525), .C(n195), .Y(n526) );
  OAI21X1 U618 ( .A(n528), .B(n527), .C(n526), .Y(n531) );
  NAND3X1 U619 ( .A(n529), .B(n64), .C(\player_fsm/N25 ), .Y(n530) );
  OAI21X1 U620 ( .A(n532), .B(n531), .C(n530), .Y(n533) );
  OR2X1 U621 ( .A(n534), .B(n533), .Y(\player_fsm/N28 ) );
  OAI21X1 U622 ( .A(invader_bullet_coord_x[5]), .B(n197), .C(n196), .Y(n547)
         );
  NAND2X1 U623 ( .A(invader_bullet_coord_x[5]), .B(n197), .Y(n542) );
  OAI21X1 U624 ( .A(\player_fsm/N16 ), .B(n413), .C(n542), .Y(n545) );
  NAND2X1 U625 ( .A(invader_bullet_coord_x[3]), .B(n200), .Y(n537) );
  NAND3X1 U626 ( .A(n537), .B(n416), .C(\player_fsm/N14 ), .Y(n535) );
  OAI21X1 U627 ( .A(invader_bullet_coord_x[3]), .B(n200), .C(n535), .Y(n541)
         );
  OAI22X1 U628 ( .A(\player_fsm/N13 ), .B(n414), .C(n61), .D(n410), .Y(n536)
         );
  OAI21X1 U629 ( .A(invader_bullet_coord_x[1]), .B(n201), .C(n536), .Y(n540)
         );
  NOR2X1 U630 ( .A(\player_fsm/N14 ), .B(n416), .Y(n538) );
  OAI21X1 U631 ( .A(n199), .B(n538), .C(n198), .Y(n539) );
  OAI21X1 U632 ( .A(n541), .B(n540), .C(n539), .Y(n544) );
  NAND3X1 U633 ( .A(n542), .B(n413), .C(\player_fsm/N16 ), .Y(n543) );
  OAI21X1 U634 ( .A(n545), .B(n544), .C(n543), .Y(n546) );
  OR2X1 U635 ( .A(n547), .B(n546), .Y(\player_fsm/N19 ) );
  NOR2X1 U636 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n549) );
  NOR2X1 U637 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n548) );
  NAND2X1 U638 ( .A(n549), .B(n548), .Y(n550) );
  OR2X1 U639 ( .A(n550), .B(invader_bullet_coord_y[1]), .Y(\player_fsm/N38 )
         );
  AOI21X1 U640 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[0]), 
        .C(n550), .Y(\player_fsm/N47 ) );
  NOR2X1 U641 ( .A(n412), .B(n895), .Y(n574) );
  OR2X1 U642 ( .A(n413), .B(player_coord_x[4]), .Y(n569) );
  NAND2X1 U643 ( .A(player_coord_x[4]), .B(n413), .Y(n557) );
  NAND2X1 U644 ( .A(n569), .B(n557), .Y(n571) );
  OR2X1 U645 ( .A(n68), .B(invader_bullet_coord_x[2]), .Y(n553) );
  NAND2X1 U646 ( .A(invader_bullet_coord_x[2]), .B(n68), .Y(n563) );
  NAND2X1 U647 ( .A(n553), .B(n563), .Y(n565) );
  NAND2X1 U648 ( .A(player_coord_x[0]), .B(n410), .Y(n551) );
  OAI21X1 U649 ( .A(invader_bullet_coord_x[1]), .B(n551), .C(n67), .Y(n552) );
  OAI21X1 U650 ( .A(n213), .B(n414), .C(n552), .Y(n555) );
  NAND2X1 U651 ( .A(player_coord_x[3]), .B(n415), .Y(n566) );
  OAI21X1 U652 ( .A(n565), .B(n555), .C(n554), .Y(n556) );
  NOR2X1 U653 ( .A(n415), .B(player_coord_x[3]), .Y(n568) );
  NAND2X1 U654 ( .A(n556), .B(n207), .Y(n559) );
  NAND2X1 U655 ( .A(player_coord_x[5]), .B(n412), .Y(n572) );
  OAI21X1 U656 ( .A(n571), .B(n559), .C(n558), .Y(n560) );
  NAND2X1 U657 ( .A(n212), .B(n560), .Y(\player_fsm/N20 ) );
  NOR2X1 U658 ( .A(n410), .B(player_coord_x[0]), .Y(n562) );
  OAI21X1 U659 ( .A(n214), .B(n414), .C(player_coord_x[1]), .Y(n561) );
  OAI21X1 U660 ( .A(invader_bullet_coord_x[1]), .B(n562), .C(n561), .Y(n564)
         );
  OAI21X1 U661 ( .A(n565), .B(n564), .C(n563), .Y(n567) );
  OAI21X1 U662 ( .A(n568), .B(n567), .C(n566), .Y(n570) );
  OAI21X1 U663 ( .A(n571), .B(n570), .C(n569), .Y(n573) );
  OAI21X1 U664 ( .A(n574), .B(n573), .C(n572), .Y(\player_fsm/N29 ) );
  AOI21X1 U665 ( .A(n575), .B(player_coord_x[4]), .C(player_coord_x[5]), .Y(
        \player_fsm/N74 ) );
  NAND3X1 U666 ( .A(\shield_fsm/N38 ), .B(\shield_fsm/N37 ), .C(n576), .Y(n578) );
  NOR2X1 U667 ( .A(n30), .B(\shield_fsm/N40 ), .Y(n577) );
  NAND3X1 U668 ( .A(n578), .B(n36), .C(n577), .Y(\shield_fsm/N42 ) );
  AOI21X1 U669 ( .A(player_bullet_coord_x[4]), .B(player_bullet_coord_x[3]), 
        .C(player_bullet_coord_x[5]), .Y(n580) );
  OAI21X1 U670 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), 
        .C(player_bullet_coord_x[4]), .Y(n579) );
  NAND3X1 U671 ( .A(\shield_fsm/N22 ), .B(\shield_fsm/N21 ), .C(n581), .Y(n583) );
  NOR2X1 U672 ( .A(n29), .B(\shield_fsm/N24 ), .Y(n582) );
  NAND3X1 U673 ( .A(n583), .B(n35), .C(n582), .Y(\shield_fsm/N26 ) );
  AOI21X1 U674 ( .A(invader_bullet_coord_x[4]), .B(invader_bullet_coord_x[3]), 
        .C(invader_bullet_coord_x[5]), .Y(n585) );
  OAI21X1 U675 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .C(invader_bullet_coord_x[4]), .Y(n584) );
  OAI21X1 U676 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(
        invader_1_coord_x[2]), .Y(n587) );
  NOR2X1 U677 ( .A(invader_1_coord_x[5]), .B(invader_1_coord_x[4]), .Y(n586)
         );
  NAND3X1 U678 ( .A(n587), .B(n57), .C(n586), .Y(n588) );
  OR2X1 U679 ( .A(\invader_fsm_1/N89 ), .B(n25), .Y(n592) );
  OAI21X1 U680 ( .A(\invader_fsm_1/N84 ), .B(n58), .C(\invader_fsm_1/N86 ), 
        .Y(n590) );
  NOR2X1 U681 ( .A(n25), .B(\invader_fsm_1/N89 ), .Y(n589) );
  OAI21X1 U682 ( .A(n31), .B(n590), .C(n589), .Y(n591) );
  OAI21X1 U683 ( .A(\invader_fsm_1/N88 ), .B(n592), .C(n591), .Y(n593) );
  NOR2X1 U684 ( .A(n613), .B(player_bullet_coord_y[5]), .Y(n595) );
  NOR2X1 U685 ( .A(\invader_fsm_1/N40 ), .B(n595), .Y(n594) );
  AOI22X1 U686 ( .A(n594), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n613), .Y(n606) );
  NOR2X1 U687 ( .A(\invader_fsm_1/N42 ), .B(n595), .Y(n596) );
  OAI21X1 U688 ( .A(player_bullet_coord_y[4]), .B(n228), .C(n596), .Y(n605) );
  NAND2X1 U689 ( .A(n232), .B(n400), .Y(n599) );
  NAND3X1 U690 ( .A(n599), .B(n236), .C(player_bullet_coord_y[2]), .Y(n597) );
  OAI21X1 U691 ( .A(n232), .B(n400), .C(n597), .Y(n603) );
  AOI22X1 U692 ( .A(n396), .B(n240), .C(n404), .D(n242), .Y(n598) );
  OAI21X1 U693 ( .A(n240), .B(n396), .C(n239), .Y(n602) );
  NOR2X1 U694 ( .A(player_bullet_coord_y[2]), .B(n236), .Y(n600) );
  OAI21X1 U695 ( .A(n231), .B(n600), .C(n230), .Y(n601) );
  OAI21X1 U696 ( .A(n603), .B(n602), .C(n601), .Y(n604) );
  OAI22X1 U697 ( .A(\invader_fsm_1/N42 ), .B(n606), .C(n605), .D(n604), .Y(
        \invader_fsm_1/N43 ) );
  NOR2X1 U698 ( .A(invader_1_coord_y[1]), .B(\invader_fsm_1/N70 ), .Y(n608) );
  AOI21X1 U699 ( .A(\invader_fsm_1/N70 ), .B(invader_1_coord_y[1]), .C(n608), 
        .Y(n607) );
  NAND2X1 U700 ( .A(n608), .B(n237), .Y(n609) );
  OAI21X1 U701 ( .A(n608), .B(n237), .C(n609), .Y(\invader_fsm_1/N38 ) );
  NOR2X1 U702 ( .A(n609), .B(invader_1_coord_y[3]), .Y(n611) );
  AOI21X1 U703 ( .A(n609), .B(invader_1_coord_y[3]), .C(n611), .Y(n610) );
  NAND2X1 U704 ( .A(n611), .B(n229), .Y(n612) );
  OAI21X1 U705 ( .A(n611), .B(n229), .C(n612), .Y(\invader_fsm_1/N40 ) );
  NOR2X1 U706 ( .A(n612), .B(invader_1_coord_y[5]), .Y(\invader_fsm_1/N42 ) );
  AOI21X1 U707 ( .A(n612), .B(invader_1_coord_y[5]), .C(\invader_fsm_1/N42 ), 
        .Y(n613) );
  OAI21X1 U708 ( .A(player_bullet_coord_y[5]), .B(n226), .C(n225), .Y(n626) );
  NAND2X1 U709 ( .A(player_bullet_coord_y[5]), .B(n226), .Y(n621) );
  OAI21X1 U710 ( .A(\invader_fsm_1/N32 ), .B(n399), .C(n621), .Y(n624) );
  NAND2X1 U711 ( .A(player_bullet_coord_y[3]), .B(n235), .Y(n616) );
  NAND3X1 U712 ( .A(n616), .B(n401), .C(\invader_fsm_1/N30 ), .Y(n614) );
  OAI21X1 U713 ( .A(player_bullet_coord_y[3]), .B(n235), .C(n614), .Y(n620) );
  OAI22X1 U714 ( .A(\invader_fsm_1/N29 ), .B(n396), .C(n242), .D(n404), .Y(
        n615) );
  OAI21X1 U715 ( .A(player_bullet_coord_y[1]), .B(n241), .C(n615), .Y(n619) );
  NOR2X1 U716 ( .A(\invader_fsm_1/N30 ), .B(n401), .Y(n617) );
  OAI21X1 U717 ( .A(n234), .B(n617), .C(n233), .Y(n618) );
  OAI21X1 U718 ( .A(n620), .B(n619), .C(n618), .Y(n623) );
  NAND3X1 U719 ( .A(n621), .B(n399), .C(\invader_fsm_1/N32 ), .Y(n622) );
  OAI21X1 U720 ( .A(n624), .B(n623), .C(n622), .Y(n625) );
  OR2X1 U721 ( .A(n626), .B(n625), .Y(\invader_fsm_1/N35 ) );
  NOR2X1 U722 ( .A(n659), .B(player_bullet_coord_x[5]), .Y(n628) );
  NOR2X1 U723 ( .A(\invader_fsm_1/N24 ), .B(n628), .Y(n627) );
  AOI22X1 U724 ( .A(n627), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n659), .Y(n639) );
  NOR2X1 U725 ( .A(\invader_fsm_1/N26 ), .B(n628), .Y(n629) );
  OAI21X1 U726 ( .A(player_bullet_coord_x[4]), .B(n247), .C(n629), .Y(n638) );
  NAND2X1 U727 ( .A(n253), .B(n395), .Y(n632) );
  NAND3X1 U728 ( .A(n632), .B(n251), .C(player_bullet_coord_x[2]), .Y(n630) );
  OAI21X1 U729 ( .A(n253), .B(n395), .C(n630), .Y(n636) );
  AOI22X1 U730 ( .A(n393), .B(n260), .C(n392), .D(n59), .Y(n631) );
  OAI21X1 U731 ( .A(n260), .B(n393), .C(n259), .Y(n635) );
  NOR2X1 U732 ( .A(player_bullet_coord_x[2]), .B(n251), .Y(n633) );
  OAI21X1 U733 ( .A(n252), .B(n633), .C(n250), .Y(n634) );
  OAI21X1 U734 ( .A(n636), .B(n635), .C(n634), .Y(n637) );
  OAI22X1 U735 ( .A(\invader_fsm_1/N26 ), .B(n639), .C(n638), .D(n637), .Y(
        \invader_fsm_1/N27 ) );
  OAI21X1 U736 ( .A(player_bullet_coord_x[5]), .B(n246), .C(n245), .Y(n652) );
  NAND2X1 U737 ( .A(player_bullet_coord_x[5]), .B(n246), .Y(n647) );
  OAI21X1 U738 ( .A(\invader_fsm_1/N16 ), .B(n46), .C(n647), .Y(n650) );
  NAND2X1 U739 ( .A(player_bullet_coord_x[3]), .B(n257), .Y(n642) );
  NAND3X1 U740 ( .A(n642), .B(n394), .C(\invader_fsm_1/N14 ), .Y(n640) );
  OAI21X1 U741 ( .A(player_bullet_coord_x[3]), .B(n257), .C(n640), .Y(n646) );
  OAI22X1 U742 ( .A(\invader_fsm_1/N13 ), .B(n393), .C(n59), .D(n392), .Y(n641) );
  OAI21X1 U743 ( .A(player_bullet_coord_x[1]), .B(n258), .C(n641), .Y(n645) );
  NOR2X1 U744 ( .A(\invader_fsm_1/N14 ), .B(n394), .Y(n643) );
  OAI21X1 U745 ( .A(n256), .B(n643), .C(n255), .Y(n644) );
  OAI21X1 U746 ( .A(n646), .B(n645), .C(n644), .Y(n649) );
  NAND3X1 U747 ( .A(n647), .B(n46), .C(\invader_fsm_1/N16 ), .Y(n648) );
  OAI21X1 U748 ( .A(n650), .B(n649), .C(n648), .Y(n651) );
  OR2X1 U749 ( .A(n652), .B(n651), .Y(\invader_fsm_1/N19 ) );
  NOR2X1 U750 ( .A(invader_1_coord_x[1]), .B(\invader_fsm_1/N84 ), .Y(n654) );
  AOI21X1 U751 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(n654), 
        .Y(n653) );
  NAND2X1 U752 ( .A(n654), .B(n254), .Y(n655) );
  OAI21X1 U753 ( .A(n654), .B(n254), .C(n655), .Y(\invader_fsm_1/N22 ) );
  NOR2X1 U754 ( .A(n655), .B(invader_1_coord_x[3]), .Y(n657) );
  AOI21X1 U755 ( .A(n655), .B(invader_1_coord_x[3]), .C(n657), .Y(n656) );
  NAND2X1 U756 ( .A(n657), .B(n248), .Y(n658) );
  OAI21X1 U757 ( .A(n657), .B(n248), .C(n658), .Y(\invader_fsm_1/N24 ) );
  NOR2X1 U758 ( .A(n658), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N26 ) );
  AOI21X1 U759 ( .A(n658), .B(invader_1_coord_x[5]), .C(\invader_fsm_1/N26 ), 
        .Y(n659) );
  OAI21X1 U760 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(
        invader_2_coord_x[2]), .Y(n661) );
  NOR2X1 U761 ( .A(invader_2_coord_x[5]), .B(invader_2_coord_x[4]), .Y(n660)
         );
  NAND3X1 U762 ( .A(n661), .B(n54), .C(n660), .Y(n662) );
  OR2X1 U763 ( .A(\invader_fsm_2/N89 ), .B(n26), .Y(n666) );
  OAI21X1 U764 ( .A(\invader_fsm_2/N84 ), .B(n55), .C(\invader_fsm_2/N86 ), 
        .Y(n664) );
  NOR2X1 U765 ( .A(n26), .B(\invader_fsm_2/N89 ), .Y(n663) );
  OAI21X1 U766 ( .A(n32), .B(n664), .C(n663), .Y(n665) );
  OAI21X1 U767 ( .A(\invader_fsm_2/N88 ), .B(n666), .C(n665), .Y(n667) );
  NOR2X1 U768 ( .A(n687), .B(player_bullet_coord_y[5]), .Y(n669) );
  NOR2X1 U769 ( .A(\invader_fsm_2/N40 ), .B(n669), .Y(n668) );
  AOI22X1 U770 ( .A(n668), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n687), .Y(n680) );
  NOR2X1 U771 ( .A(\invader_fsm_2/N42 ), .B(n669), .Y(n670) );
  OAI21X1 U772 ( .A(player_bullet_coord_y[4]), .B(n270), .C(n670), .Y(n679) );
  NAND2X1 U773 ( .A(n274), .B(n400), .Y(n673) );
  NAND3X1 U774 ( .A(n673), .B(n278), .C(player_bullet_coord_y[2]), .Y(n671) );
  OAI21X1 U775 ( .A(n274), .B(n400), .C(n671), .Y(n677) );
  AOI22X1 U776 ( .A(n396), .B(n282), .C(n404), .D(n284), .Y(n672) );
  OAI21X1 U777 ( .A(n282), .B(n396), .C(n281), .Y(n676) );
  NOR2X1 U778 ( .A(player_bullet_coord_y[2]), .B(n278), .Y(n674) );
  OAI21X1 U779 ( .A(n273), .B(n674), .C(n272), .Y(n675) );
  OAI21X1 U780 ( .A(n677), .B(n676), .C(n675), .Y(n678) );
  OAI22X1 U781 ( .A(\invader_fsm_2/N42 ), .B(n680), .C(n679), .D(n678), .Y(
        \invader_fsm_2/N43 ) );
  NOR2X1 U782 ( .A(invader_2_coord_y[1]), .B(\invader_fsm_2/N70 ), .Y(n682) );
  AOI21X1 U783 ( .A(\invader_fsm_2/N70 ), .B(invader_2_coord_y[1]), .C(n682), 
        .Y(n681) );
  NAND2X1 U784 ( .A(n682), .B(n279), .Y(n683) );
  OAI21X1 U785 ( .A(n682), .B(n279), .C(n683), .Y(\invader_fsm_2/N38 ) );
  NOR2X1 U786 ( .A(n683), .B(invader_2_coord_y[3]), .Y(n685) );
  AOI21X1 U787 ( .A(n683), .B(invader_2_coord_y[3]), .C(n685), .Y(n684) );
  NAND2X1 U788 ( .A(n685), .B(n271), .Y(n686) );
  OAI21X1 U789 ( .A(n685), .B(n271), .C(n686), .Y(\invader_fsm_2/N40 ) );
  NOR2X1 U790 ( .A(n686), .B(invader_2_coord_y[5]), .Y(\invader_fsm_2/N42 ) );
  AOI21X1 U791 ( .A(n686), .B(invader_2_coord_y[5]), .C(\invader_fsm_2/N42 ), 
        .Y(n687) );
  OAI21X1 U792 ( .A(player_bullet_coord_y[5]), .B(n268), .C(n267), .Y(n700) );
  NAND2X1 U793 ( .A(player_bullet_coord_y[5]), .B(n268), .Y(n695) );
  OAI21X1 U794 ( .A(\invader_fsm_2/N32 ), .B(n399), .C(n695), .Y(n698) );
  NAND2X1 U795 ( .A(player_bullet_coord_y[3]), .B(n277), .Y(n690) );
  NAND3X1 U796 ( .A(n690), .B(n401), .C(\invader_fsm_2/N30 ), .Y(n688) );
  OAI21X1 U797 ( .A(player_bullet_coord_y[3]), .B(n277), .C(n688), .Y(n694) );
  OAI22X1 U798 ( .A(\invader_fsm_2/N29 ), .B(n396), .C(n284), .D(n404), .Y(
        n689) );
  OAI21X1 U799 ( .A(player_bullet_coord_y[1]), .B(n283), .C(n689), .Y(n693) );
  NOR2X1 U800 ( .A(\invader_fsm_2/N30 ), .B(n401), .Y(n691) );
  OAI21X1 U801 ( .A(n276), .B(n691), .C(n275), .Y(n692) );
  OAI21X1 U802 ( .A(n694), .B(n693), .C(n692), .Y(n697) );
  NAND3X1 U803 ( .A(n695), .B(n399), .C(\invader_fsm_2/N32 ), .Y(n696) );
  OAI21X1 U804 ( .A(n698), .B(n697), .C(n696), .Y(n699) );
  OR2X1 U805 ( .A(n700), .B(n699), .Y(\invader_fsm_2/N35 ) );
  NOR2X1 U806 ( .A(n733), .B(player_bullet_coord_x[5]), .Y(n702) );
  NOR2X1 U807 ( .A(\invader_fsm_2/N24 ), .B(n702), .Y(n701) );
  AOI22X1 U808 ( .A(n701), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n733), .Y(n713) );
  NOR2X1 U809 ( .A(\invader_fsm_2/N26 ), .B(n702), .Y(n703) );
  OAI21X1 U810 ( .A(player_bullet_coord_x[4]), .B(n290), .C(n703), .Y(n712) );
  NAND2X1 U811 ( .A(n296), .B(n395), .Y(n706) );
  NAND3X1 U812 ( .A(n706), .B(n294), .C(player_bullet_coord_x[2]), .Y(n704) );
  OAI21X1 U813 ( .A(n296), .B(n395), .C(n704), .Y(n710) );
  AOI22X1 U814 ( .A(n393), .B(n303), .C(n392), .D(n304), .Y(n705) );
  OAI21X1 U815 ( .A(n303), .B(n393), .C(n302), .Y(n709) );
  NOR2X1 U816 ( .A(player_bullet_coord_x[2]), .B(n294), .Y(n707) );
  OAI21X1 U817 ( .A(n295), .B(n707), .C(n293), .Y(n708) );
  OAI21X1 U818 ( .A(n710), .B(n709), .C(n708), .Y(n711) );
  OAI22X1 U819 ( .A(\invader_fsm_2/N26 ), .B(n713), .C(n712), .D(n711), .Y(
        \invader_fsm_2/N27 ) );
  OAI21X1 U820 ( .A(player_bullet_coord_x[5]), .B(n289), .C(n288), .Y(n726) );
  NAND2X1 U821 ( .A(player_bullet_coord_x[5]), .B(n289), .Y(n721) );
  OAI21X1 U822 ( .A(\invader_fsm_2/N16 ), .B(n46), .C(n721), .Y(n724) );
  NAND2X1 U823 ( .A(player_bullet_coord_x[3]), .B(n300), .Y(n716) );
  NAND3X1 U824 ( .A(n716), .B(n394), .C(\invader_fsm_2/N14 ), .Y(n714) );
  OAI21X1 U825 ( .A(player_bullet_coord_x[3]), .B(n300), .C(n714), .Y(n720) );
  OAI22X1 U826 ( .A(\invader_fsm_2/N13 ), .B(n393), .C(n304), .D(n392), .Y(
        n715) );
  OAI21X1 U827 ( .A(player_bullet_coord_x[1]), .B(n301), .C(n715), .Y(n719) );
  NOR2X1 U828 ( .A(\invader_fsm_2/N14 ), .B(n394), .Y(n717) );
  OAI21X1 U829 ( .A(n299), .B(n717), .C(n298), .Y(n718) );
  OAI21X1 U830 ( .A(n720), .B(n719), .C(n718), .Y(n723) );
  NAND3X1 U831 ( .A(n721), .B(n46), .C(\invader_fsm_2/N16 ), .Y(n722) );
  OAI21X1 U832 ( .A(n724), .B(n723), .C(n722), .Y(n725) );
  OR2X1 U833 ( .A(n726), .B(n725), .Y(\invader_fsm_2/N19 ) );
  NOR2X1 U834 ( .A(invader_2_coord_x[1]), .B(\invader_fsm_2/N84 ), .Y(n728) );
  AOI21X1 U835 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(n728), 
        .Y(n727) );
  NAND2X1 U836 ( .A(n728), .B(n297), .Y(n729) );
  OAI21X1 U837 ( .A(n728), .B(n297), .C(n729), .Y(\invader_fsm_2/N22 ) );
  NOR2X1 U838 ( .A(n729), .B(invader_2_coord_x[3]), .Y(n731) );
  AOI21X1 U839 ( .A(n729), .B(invader_2_coord_x[3]), .C(n731), .Y(n730) );
  NAND2X1 U840 ( .A(n731), .B(n291), .Y(n732) );
  OAI21X1 U841 ( .A(n731), .B(n291), .C(n732), .Y(\invader_fsm_2/N24 ) );
  NOR2X1 U842 ( .A(n732), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N26 ) );
  AOI21X1 U843 ( .A(n732), .B(invader_2_coord_x[5]), .C(\invader_fsm_2/N26 ), 
        .Y(n733) );
  OAI21X1 U844 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(
        invader_3_coord_x[2]), .Y(n735) );
  NOR2X1 U845 ( .A(invader_3_coord_x[5]), .B(invader_3_coord_x[4]), .Y(n734)
         );
  NAND3X1 U846 ( .A(n735), .B(n50), .C(n734), .Y(n736) );
  OR2X1 U847 ( .A(\invader_fsm_3/N89 ), .B(n27), .Y(n740) );
  OAI21X1 U848 ( .A(\invader_fsm_3/N84 ), .B(n52), .C(\invader_fsm_3/N86 ), 
        .Y(n738) );
  NOR2X1 U849 ( .A(n27), .B(\invader_fsm_3/N89 ), .Y(n737) );
  OAI21X1 U850 ( .A(n33), .B(n738), .C(n737), .Y(n739) );
  OAI21X1 U851 ( .A(\invader_fsm_3/N88 ), .B(n740), .C(n739), .Y(n741) );
  NOR2X1 U852 ( .A(n761), .B(player_bullet_coord_y[5]), .Y(n743) );
  NOR2X1 U853 ( .A(\invader_fsm_3/N40 ), .B(n743), .Y(n742) );
  AOI22X1 U854 ( .A(n742), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n761), .Y(n754) );
  NOR2X1 U855 ( .A(\invader_fsm_3/N42 ), .B(n743), .Y(n744) );
  OAI21X1 U856 ( .A(player_bullet_coord_y[4]), .B(n313), .C(n744), .Y(n753) );
  NAND2X1 U857 ( .A(n317), .B(n400), .Y(n747) );
  NAND3X1 U858 ( .A(n747), .B(n321), .C(player_bullet_coord_y[2]), .Y(n745) );
  OAI21X1 U859 ( .A(n317), .B(n400), .C(n745), .Y(n751) );
  AOI22X1 U860 ( .A(n396), .B(n325), .C(n404), .D(n327), .Y(n746) );
  OAI21X1 U861 ( .A(n325), .B(n396), .C(n324), .Y(n750) );
  NOR2X1 U862 ( .A(player_bullet_coord_y[2]), .B(n321), .Y(n748) );
  OAI21X1 U863 ( .A(n316), .B(n748), .C(n315), .Y(n749) );
  OAI21X1 U864 ( .A(n751), .B(n750), .C(n749), .Y(n752) );
  OAI22X1 U865 ( .A(\invader_fsm_3/N42 ), .B(n754), .C(n753), .D(n752), .Y(
        \invader_fsm_3/N43 ) );
  NOR2X1 U866 ( .A(invader_3_coord_y[1]), .B(\invader_fsm_3/N70 ), .Y(n756) );
  AOI21X1 U867 ( .A(\invader_fsm_3/N70 ), .B(invader_3_coord_y[1]), .C(n756), 
        .Y(n755) );
  NAND2X1 U868 ( .A(n756), .B(n322), .Y(n757) );
  OAI21X1 U869 ( .A(n756), .B(n322), .C(n757), .Y(\invader_fsm_3/N38 ) );
  NOR2X1 U870 ( .A(n757), .B(invader_3_coord_y[3]), .Y(n759) );
  AOI21X1 U871 ( .A(n757), .B(invader_3_coord_y[3]), .C(n759), .Y(n758) );
  NAND2X1 U872 ( .A(n759), .B(n314), .Y(n760) );
  OAI21X1 U873 ( .A(n759), .B(n314), .C(n760), .Y(\invader_fsm_3/N40 ) );
  NOR2X1 U874 ( .A(n760), .B(invader_3_coord_y[5]), .Y(\invader_fsm_3/N42 ) );
  AOI21X1 U875 ( .A(n760), .B(invader_3_coord_y[5]), .C(\invader_fsm_3/N42 ), 
        .Y(n761) );
  OAI21X1 U876 ( .A(player_bullet_coord_y[5]), .B(n311), .C(n310), .Y(n774) );
  NAND2X1 U877 ( .A(player_bullet_coord_y[5]), .B(n311), .Y(n769) );
  OAI21X1 U878 ( .A(\invader_fsm_3/N32 ), .B(n399), .C(n769), .Y(n772) );
  NAND2X1 U879 ( .A(player_bullet_coord_y[3]), .B(n320), .Y(n764) );
  NAND3X1 U880 ( .A(n764), .B(n401), .C(\invader_fsm_3/N30 ), .Y(n762) );
  OAI21X1 U881 ( .A(player_bullet_coord_y[3]), .B(n320), .C(n762), .Y(n768) );
  OAI22X1 U882 ( .A(\invader_fsm_3/N29 ), .B(n396), .C(n327), .D(n404), .Y(
        n763) );
  OAI21X1 U883 ( .A(player_bullet_coord_y[1]), .B(n326), .C(n763), .Y(n767) );
  NOR2X1 U884 ( .A(\invader_fsm_3/N30 ), .B(n401), .Y(n765) );
  OAI21X1 U885 ( .A(n319), .B(n765), .C(n318), .Y(n766) );
  OAI21X1 U886 ( .A(n768), .B(n767), .C(n766), .Y(n771) );
  NAND3X1 U887 ( .A(n769), .B(n399), .C(\invader_fsm_3/N32 ), .Y(n770) );
  OAI21X1 U888 ( .A(n772), .B(n771), .C(n770), .Y(n773) );
  OR2X1 U889 ( .A(n774), .B(n773), .Y(\invader_fsm_3/N35 ) );
  NOR2X1 U890 ( .A(n807), .B(player_bullet_coord_x[5]), .Y(n776) );
  NOR2X1 U891 ( .A(\invader_fsm_3/N24 ), .B(n776), .Y(n775) );
  AOI22X1 U892 ( .A(n775), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n807), .Y(n787) );
  NOR2X1 U893 ( .A(\invader_fsm_3/N26 ), .B(n776), .Y(n777) );
  OAI21X1 U894 ( .A(player_bullet_coord_x[4]), .B(n336), .C(n777), .Y(n786) );
  NAND2X1 U895 ( .A(n335), .B(n395), .Y(n780) );
  NAND3X1 U896 ( .A(n780), .B(n333), .C(player_bullet_coord_x[2]), .Y(n778) );
  OAI21X1 U897 ( .A(n335), .B(n395), .C(n778), .Y(n784) );
  AOI22X1 U898 ( .A(n393), .B(n342), .C(n392), .D(n51), .Y(n779) );
  OAI21X1 U899 ( .A(n342), .B(n393), .C(n341), .Y(n783) );
  NOR2X1 U900 ( .A(player_bullet_coord_x[2]), .B(n333), .Y(n781) );
  OAI21X1 U901 ( .A(n334), .B(n781), .C(n332), .Y(n782) );
  OAI21X1 U902 ( .A(n784), .B(n783), .C(n782), .Y(n785) );
  OAI22X1 U903 ( .A(\invader_fsm_3/N26 ), .B(n787), .C(n786), .D(n785), .Y(
        \invader_fsm_3/N27 ) );
  OAI21X1 U904 ( .A(player_bullet_coord_x[5]), .B(n331), .C(n330), .Y(n800) );
  NAND2X1 U905 ( .A(player_bullet_coord_x[5]), .B(n331), .Y(n795) );
  OAI21X1 U906 ( .A(\invader_fsm_3/N16 ), .B(n46), .C(n795), .Y(n798) );
  NAND2X1 U907 ( .A(player_bullet_coord_x[3]), .B(n339), .Y(n790) );
  NAND3X1 U908 ( .A(n790), .B(n394), .C(\invader_fsm_3/N14 ), .Y(n788) );
  OAI21X1 U909 ( .A(player_bullet_coord_x[3]), .B(n339), .C(n788), .Y(n794) );
  OAI22X1 U910 ( .A(\invader_fsm_3/N13 ), .B(n393), .C(n51), .D(n392), .Y(n789) );
  OAI21X1 U911 ( .A(player_bullet_coord_x[1]), .B(n343), .C(n789), .Y(n793) );
  NOR2X1 U912 ( .A(\invader_fsm_3/N14 ), .B(n394), .Y(n791) );
  OAI21X1 U913 ( .A(n338), .B(n791), .C(n337), .Y(n792) );
  OAI21X1 U914 ( .A(n794), .B(n793), .C(n792), .Y(n797) );
  NAND3X1 U915 ( .A(n795), .B(n46), .C(\invader_fsm_3/N16 ), .Y(n796) );
  OAI21X1 U916 ( .A(n798), .B(n797), .C(n796), .Y(n799) );
  OR2X1 U917 ( .A(n800), .B(n799), .Y(\invader_fsm_3/N19 ) );
  NOR2X1 U918 ( .A(invader_3_coord_x[1]), .B(\invader_fsm_3/N84 ), .Y(n802) );
  AOI21X1 U919 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(n802), 
        .Y(n801) );
  NAND2X1 U920 ( .A(n802), .B(n340), .Y(n803) );
  OAI21X1 U921 ( .A(n802), .B(n340), .C(n803), .Y(\invader_fsm_3/N22 ) );
  NOR2X1 U922 ( .A(n803), .B(invader_3_coord_x[3]), .Y(n805) );
  AOI21X1 U923 ( .A(n803), .B(invader_3_coord_x[3]), .C(n805), .Y(n804) );
  NAND2X1 U924 ( .A(n805), .B(n344), .Y(n806) );
  OAI21X1 U925 ( .A(n805), .B(n344), .C(n806), .Y(\invader_fsm_3/N24 ) );
  NOR2X1 U926 ( .A(n806), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N26 ) );
  AOI21X1 U927 ( .A(n806), .B(invader_3_coord_x[5]), .C(\invader_fsm_3/N26 ), 
        .Y(n807) );
  OAI21X1 U928 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(
        invader_4_coord_x[2]), .Y(n809) );
  NOR2X1 U929 ( .A(invader_4_coord_x[5]), .B(invader_4_coord_x[4]), .Y(n808)
         );
  NAND3X1 U930 ( .A(n809), .B(n48), .C(n808), .Y(n810) );
  OR2X1 U931 ( .A(\invader_fsm_4/N89 ), .B(n28), .Y(n814) );
  OAI21X1 U932 ( .A(\invader_fsm_4/N84 ), .B(n47), .C(\invader_fsm_4/N86 ), 
        .Y(n812) );
  NOR2X1 U933 ( .A(n28), .B(\invader_fsm_4/N89 ), .Y(n811) );
  OAI21X1 U934 ( .A(n34), .B(n812), .C(n811), .Y(n813) );
  OAI21X1 U935 ( .A(\invader_fsm_4/N88 ), .B(n814), .C(n813), .Y(n815) );
  NOR2X1 U936 ( .A(n835), .B(player_bullet_coord_y[5]), .Y(n817) );
  NOR2X1 U937 ( .A(\invader_fsm_4/N40 ), .B(n817), .Y(n816) );
  AOI22X1 U938 ( .A(n816), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n835), .Y(n828) );
  NOR2X1 U939 ( .A(\invader_fsm_4/N42 ), .B(n817), .Y(n818) );
  OAI21X1 U940 ( .A(player_bullet_coord_y[4]), .B(n354), .C(n818), .Y(n827) );
  NAND2X1 U941 ( .A(n358), .B(n400), .Y(n821) );
  NAND3X1 U942 ( .A(n821), .B(n362), .C(player_bullet_coord_y[2]), .Y(n819) );
  OAI21X1 U943 ( .A(n358), .B(n400), .C(n819), .Y(n825) );
  AOI22X1 U944 ( .A(n396), .B(n366), .C(n404), .D(n368), .Y(n820) );
  OAI21X1 U945 ( .A(n366), .B(n396), .C(n365), .Y(n824) );
  NOR2X1 U946 ( .A(player_bullet_coord_y[2]), .B(n362), .Y(n822) );
  OAI21X1 U947 ( .A(n357), .B(n822), .C(n356), .Y(n823) );
  OAI21X1 U948 ( .A(n825), .B(n824), .C(n823), .Y(n826) );
  OAI22X1 U949 ( .A(\invader_fsm_4/N42 ), .B(n828), .C(n827), .D(n826), .Y(
        \invader_fsm_4/N43 ) );
  NOR2X1 U950 ( .A(invader_4_coord_y[1]), .B(\invader_fsm_4/N70 ), .Y(n830) );
  AOI21X1 U951 ( .A(\invader_fsm_4/N70 ), .B(invader_4_coord_y[1]), .C(n830), 
        .Y(n829) );
  NAND2X1 U952 ( .A(n830), .B(n363), .Y(n831) );
  OAI21X1 U953 ( .A(n830), .B(n363), .C(n831), .Y(\invader_fsm_4/N38 ) );
  NOR2X1 U954 ( .A(n831), .B(invader_4_coord_y[3]), .Y(n833) );
  AOI21X1 U955 ( .A(n831), .B(invader_4_coord_y[3]), .C(n833), .Y(n832) );
  NAND2X1 U956 ( .A(n833), .B(n355), .Y(n834) );
  OAI21X1 U957 ( .A(n833), .B(n355), .C(n834), .Y(\invader_fsm_4/N40 ) );
  NOR2X1 U958 ( .A(n834), .B(invader_4_coord_y[5]), .Y(\invader_fsm_4/N42 ) );
  AOI21X1 U959 ( .A(n834), .B(invader_4_coord_y[5]), .C(\invader_fsm_4/N42 ), 
        .Y(n835) );
  OAI21X1 U960 ( .A(player_bullet_coord_y[5]), .B(n352), .C(n351), .Y(n848) );
  NAND2X1 U961 ( .A(player_bullet_coord_y[5]), .B(n352), .Y(n843) );
  OAI21X1 U962 ( .A(\invader_fsm_4/N32 ), .B(n399), .C(n843), .Y(n846) );
  NAND2X1 U963 ( .A(player_bullet_coord_y[3]), .B(n361), .Y(n838) );
  NAND3X1 U964 ( .A(n838), .B(n401), .C(\invader_fsm_4/N30 ), .Y(n836) );
  OAI21X1 U965 ( .A(player_bullet_coord_y[3]), .B(n361), .C(n836), .Y(n842) );
  OAI22X1 U966 ( .A(\invader_fsm_4/N29 ), .B(n396), .C(n368), .D(n404), .Y(
        n837) );
  OAI21X1 U967 ( .A(player_bullet_coord_y[1]), .B(n367), .C(n837), .Y(n841) );
  NOR2X1 U968 ( .A(\invader_fsm_4/N30 ), .B(n401), .Y(n839) );
  OAI21X1 U969 ( .A(n360), .B(n839), .C(n359), .Y(n840) );
  OAI21X1 U970 ( .A(n842), .B(n841), .C(n840), .Y(n845) );
  NAND3X1 U971 ( .A(n843), .B(n399), .C(\invader_fsm_4/N32 ), .Y(n844) );
  OAI21X1 U972 ( .A(n846), .B(n845), .C(n844), .Y(n847) );
  OR2X1 U973 ( .A(n848), .B(n847), .Y(\invader_fsm_4/N35 ) );
  NOR2X1 U974 ( .A(n881), .B(player_bullet_coord_x[5]), .Y(n850) );
  NOR2X1 U975 ( .A(\invader_fsm_4/N24 ), .B(n850), .Y(n849) );
  AOI22X1 U976 ( .A(n849), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n881), .Y(n861) );
  NOR2X1 U977 ( .A(\invader_fsm_4/N26 ), .B(n850), .Y(n851) );
  OAI21X1 U978 ( .A(player_bullet_coord_x[4]), .B(n377), .C(n851), .Y(n860) );
  NAND2X1 U979 ( .A(n376), .B(n395), .Y(n854) );
  NAND3X1 U980 ( .A(n854), .B(n381), .C(player_bullet_coord_x[2]), .Y(n852) );
  OAI21X1 U981 ( .A(n376), .B(n395), .C(n852), .Y(n858) );
  AOI22X1 U982 ( .A(n393), .B(n385), .C(n392), .D(n386), .Y(n853) );
  OAI21X1 U983 ( .A(n385), .B(n393), .C(n384), .Y(n857) );
  NOR2X1 U984 ( .A(player_bullet_coord_x[2]), .B(n381), .Y(n855) );
  OAI21X1 U985 ( .A(n375), .B(n855), .C(n374), .Y(n856) );
  OAI21X1 U986 ( .A(n858), .B(n857), .C(n856), .Y(n859) );
  OAI22X1 U987 ( .A(\invader_fsm_4/N26 ), .B(n861), .C(n860), .D(n859), .Y(
        \invader_fsm_4/N27 ) );
  OAI21X1 U988 ( .A(player_bullet_coord_x[5]), .B(n373), .C(n372), .Y(n874) );
  NAND2X1 U989 ( .A(player_bullet_coord_x[5]), .B(n373), .Y(n869) );
  OAI21X1 U990 ( .A(\invader_fsm_4/N16 ), .B(n46), .C(n869), .Y(n872) );
  NAND2X1 U991 ( .A(player_bullet_coord_x[3]), .B(n380), .Y(n864) );
  NAND3X1 U992 ( .A(n864), .B(n394), .C(\invader_fsm_4/N14 ), .Y(n862) );
  OAI21X1 U993 ( .A(player_bullet_coord_x[3]), .B(n380), .C(n862), .Y(n868) );
  OAI22X1 U994 ( .A(\invader_fsm_4/N13 ), .B(n393), .C(n386), .D(n392), .Y(
        n863) );
  OAI21X1 U995 ( .A(player_bullet_coord_x[1]), .B(n383), .C(n863), .Y(n867) );
  NOR2X1 U996 ( .A(\invader_fsm_4/N14 ), .B(n394), .Y(n865) );
  OAI21X1 U997 ( .A(n379), .B(n865), .C(n378), .Y(n866) );
  OAI21X1 U998 ( .A(n868), .B(n867), .C(n866), .Y(n871) );
  NAND3X1 U999 ( .A(n869), .B(n46), .C(\invader_fsm_4/N16 ), .Y(n870) );
  OAI21X1 U1000 ( .A(n872), .B(n871), .C(n870), .Y(n873) );
  OR2X1 U1001 ( .A(n874), .B(n873), .Y(\invader_fsm_4/N19 ) );
  NOR2X1 U1002 ( .A(invader_4_coord_x[1]), .B(\invader_fsm_4/N84 ), .Y(n876)
         );
  AOI21X1 U1003 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(n876), 
        .Y(n875) );
  NAND2X1 U1004 ( .A(n876), .B(n382), .Y(n877) );
  OAI21X1 U1005 ( .A(n876), .B(n382), .C(n877), .Y(\invader_fsm_4/N22 ) );
  NOR2X1 U1006 ( .A(n877), .B(invader_4_coord_x[3]), .Y(n879) );
  AOI21X1 U1007 ( .A(n877), .B(invader_4_coord_x[3]), .C(n879), .Y(n878) );
  NAND2X1 U1008 ( .A(n879), .B(n391), .Y(n880) );
  OAI21X1 U1009 ( .A(n879), .B(n391), .C(n880), .Y(\invader_fsm_4/N24 ) );
  NOR2X1 U1010 ( .A(n880), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N26 )
         );
  AOI21X1 U1011 ( .A(n880), .B(invader_4_coord_x[5]), .C(\invader_fsm_4/N26 ), 
        .Y(n881) );
  XOR2X1 U1012 ( .A(\player_bullet_fsm/add_89/carry [5]), .B(
        player_bullet_coord_y[5]), .Y(\player_bullet_fsm/N26 ) );
  NAND2X1 U1013 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), 
        .Y(n883) );
  NAND2X1 U1014 ( .A(player_bullet_coord_y[3]), .B(player_bullet_coord_y[2]), 
        .Y(n882) );
  OAI21X1 U1015 ( .A(n883), .B(n882), .C(n45), .Y(n884) );
  OAI21X1 U1016 ( .A(player_bullet_coord_y[5]), .B(player_bullet_coord_y[4]), 
        .C(n884), .Y(n885) );
  NAND2X1 U1017 ( .A(n419), .B(n423), .Y(n886) );
  OAI21X1 U1018 ( .A(n423), .B(n419), .C(n886), .Y(\invader_bullet_fsm/N26 )
         );
  NOR2X1 U1019 ( .A(n886), .B(invader_bullet_coord_y[2]), .Y(n888) );
  AOI21X1 U1020 ( .A(n886), .B(invader_bullet_coord_y[2]), .C(n888), .Y(n887)
         );
  NAND2X1 U1021 ( .A(n888), .B(n421), .Y(n889) );
  OAI21X1 U1022 ( .A(n888), .B(n421), .C(n889), .Y(\invader_bullet_fsm/N28 )
         );
  XNOR2X1 U1023 ( .A(invader_bullet_coord_y[4]), .B(n889), .Y(
        \invader_bullet_fsm/N29 ) );
  NOR2X1 U1024 ( .A(invader_bullet_coord_y[4]), .B(n889), .Y(n890) );
  XOR2X1 U1025 ( .A(invader_bullet_coord_y[5]), .B(n890), .Y(
        \invader_bullet_fsm/N30 ) );
  OR2X1 U1026 ( .A(invader_bullet_coord_y[2]), .B(invader_bullet_coord_y[1]), 
        .Y(n891) );
  NOR2X1 U1027 ( .A(invader_bullet_coord_y[0]), .B(n891), .Y(n894) );
  OR2X1 U1028 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n892) );
  NOR2X1 U1029 ( .A(invader_bullet_coord_y[3]), .B(n892), .Y(n893) );
  NOR2X1 U1030 ( .A(n77), .B(n403), .Y(\player_bullet_fsm/n30 ) );
  NOR2X1 U1031 ( .A(\invader_bullet_fsm/n38 ), .B(n74), .Y(
        \invader_bullet_fsm/n53 ) );
  NOR2X1 U1032 ( .A(\invader_bullet_fsm/n25 ), .B(n75), .Y(
        \invader_bullet_fsm/n48 ) );
  NOR2X1 U1033 ( .A(n78), .B(n422), .Y(\invader_bullet_fsm/n47 ) );
  NAND2X1 U1034 ( .A(\invader_bullet_fsm/N26 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n35 ) );
  NAND2X1 U1035 ( .A(n418), .B(\invader_bullet_fsm/next_state[0] ), .Y(
        \invader_bullet_fsm/n33 ) );
  NAND2X1 U1036 ( .A(\invader_bullet_fsm/N28 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n31 ) );
  NAND2X1 U1037 ( .A(\invader_bullet_fsm/N29 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n28 ) );
endmodule

