/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Sun Apr 19 00:40:08 2026
/////////////////////////////////////////////////////////////


module top ( clka, clkb, reset, player_left_input, player_right_input, 
        player_shoot_input, player_coord_x, player_coord_y, player_display, 
        invader_1_coord_x, invader_1_coord_y, invader_1_display, 
        invader_2_coord_x, invader_2_coord_y, invader_2_display, 
        invader_3_coord_x, invader_3_coord_y, invader_3_display, 
        invader_4_coord_x, invader_4_coord_y, invader_4_display, 
        shield_coord_x, shield_coord_y, shield_hp, shield_display, 
        player_bullet_coord_x, player_bullet_coord_y, player_bullet_display, 
        invader_bullet_coord_x, invader_bullet_coord_y, invader_bullet_display, 
        playerbullet_state, main_game_state );
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
  output [1:0] playerbullet_state;
  output [1:0] main_game_state;
  input clka, clkb, reset, player_left_input, player_right_input,
         player_shoot_input;
  output player_display, invader_1_display, invader_2_display,
         invader_3_display, invader_4_display, shield_display,
         player_bullet_display, invader_bullet_display;
  wire   n942, n943, n944, playerbullet_invader_collision_signal_1,
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
         \main_game_fsm/n191 , \main_game_fsm/n190 , \main_game_fsm/n189 ,
         \main_game_fsm/n188 , \main_game_fsm/n187 , \main_game_fsm/n186 ,
         \main_game_fsm/n185 , \main_game_fsm/n184 , \main_game_fsm/n183 ,
         \main_game_fsm/n182 , \main_game_fsm/n181 , \main_game_fsm/n180 ,
         \main_game_fsm/n179 , \main_game_fsm/n178 , \main_game_fsm/n177 ,
         \main_game_fsm/n176 , \main_game_fsm/n175 , \main_game_fsm/n174 ,
         \main_game_fsm/n173 , \main_game_fsm/n172 , \main_game_fsm/n171 ,
         \main_game_fsm/n170 , \main_game_fsm/n169 , \main_game_fsm/n168 ,
         \main_game_fsm/n167 , \main_game_fsm/n166 , \main_game_fsm/n165 ,
         \main_game_fsm/n164 , \main_game_fsm/n163 , \main_game_fsm/n162 ,
         \main_game_fsm/n161 , \main_game_fsm/n160 , \main_game_fsm/n159 ,
         \main_game_fsm/n158 , \main_game_fsm/n157 , \main_game_fsm/n156 ,
         \main_game_fsm/n155 , \main_game_fsm/n154 , \main_game_fsm/n153 ,
         \main_game_fsm/n152 , \main_game_fsm/n147 , \main_game_fsm/n146 ,
         \main_game_fsm/n145 , \main_game_fsm/n144 , \main_game_fsm/n143 ,
         \main_game_fsm/n142 , \main_game_fsm/n141 , \main_game_fsm/n140 ,
         \main_game_fsm/n139 , \main_game_fsm/n138 , \main_game_fsm/n137 ,
         \main_game_fsm/n136 , \main_game_fsm/n135 , \main_game_fsm/n134 ,
         \main_game_fsm/n133 , \main_game_fsm/n132 , \main_game_fsm/n131 ,
         \main_game_fsm/n130 , \main_game_fsm/n129 , \main_game_fsm/n128 ,
         \main_game_fsm/n127 , \main_game_fsm/n126 , \main_game_fsm/n125 ,
         \main_game_fsm/n124 , \main_game_fsm/n123 , \main_game_fsm/n122 ,
         \main_game_fsm/n121 , \main_game_fsm/n120 , \main_game_fsm/n119 ,
         \main_game_fsm/n118 , \main_game_fsm/n117 , \main_game_fsm/n116 ,
         \main_game_fsm/n115 , \main_game_fsm/n114 , \main_game_fsm/n113 ,
         \main_game_fsm/n112 , \main_game_fsm/n111 , \main_game_fsm/n110 ,
         \main_game_fsm/n109 , \main_game_fsm/n108 , \main_game_fsm/n107 ,
         \main_game_fsm/n106 , \main_game_fsm/n105 , \main_game_fsm/n104 ,
         \main_game_fsm/n103 , \main_game_fsm/n102 , \main_game_fsm/n101 ,
         \main_game_fsm/n100 , \main_game_fsm/n99 , \main_game_fsm/n98 ,
         \main_game_fsm/n97 , \main_game_fsm/n96 , \main_game_fsm/n95 ,
         \main_game_fsm/n94 , \main_game_fsm/N166 , \main_game_fsm/N165 ,
         \main_game_fsm/N142 , \main_game_fsm/N141 , \main_game_fsm/N140 ,
         \main_game_fsm/N139 , \main_game_fsm/N138 ,
         \main_game_fsm/next_playerbullet_fire ,
         \main_game_fsm/next_player_right_motion ,
         \main_game_fsm/next_player_left_motion , \main_game_fsm/N133 ,
         \main_game_fsm/N132 , \main_game_fsm/N131 , \main_game_fsm/N130 ,
         \main_game_fsm/prev_invader_outofbounds , \main_game_fsm/N113 ,
         \main_game_fsm/temp_playerbullet_fire ,
         \main_game_fsm/temp_player_right_motion ,
         \main_game_fsm/temp_player_left_motion , \main_game_fsm/N100 ,
         \main_game_fsm/N94 , \main_game_fsm/N88 , \main_game_fsm/N83 ,
         \main_game_fsm/N82 , \main_game_fsm/N81 , \main_game_fsm/N80 ,
         \main_game_fsm/N79 , \main_game_fsm/N78 , \main_game_fsm/N77 ,
         \main_game_fsm/N76 , \main_game_fsm/N75 , \main_game_fsm/N74 ,
         \main_game_fsm/N73 , \main_game_fsm/N72 , \main_game_fsm/N70 ,
         \main_game_fsm/N69 , \main_game_fsm/N68 , \main_game_fsm/N67 ,
         \main_game_fsm/N66 , \main_game_fsm/N65 , \main_game_fsm/N64 ,
         \main_game_fsm/N63 , \main_game_fsm/N62 , \main_game_fsm/N61 ,
         \main_game_fsm/N60 , \main_game_fsm/N59 , \main_game_fsm/N58 ,
         \main_game_fsm/N56 , \main_game_fsm/N55 , \main_game_fsm/N54 ,
         \main_game_fsm/N53 , \main_game_fsm/N52 , \main_game_fsm/N51 ,
         \main_game_fsm/N50 , \main_game_fsm/N49 , \main_game_fsm/N48 ,
         \main_game_fsm/N47 , \main_game_fsm/N46 , \main_game_fsm/N45 ,
         \main_game_fsm/N44 , \main_game_fsm/N42 , \main_game_fsm/N41 ,
         \main_game_fsm/N40 , \main_game_fsm/N39 , \main_game_fsm/N38 ,
         \main_game_fsm/N37 , \main_game_fsm/N36 , \main_game_fsm/N35 ,
         \main_game_fsm/N34 , \main_game_fsm/N33 , \main_game_fsm/N32 ,
         \main_game_fsm/N31 , \main_game_fsm/N30 , \main_game_fsm/N28 ,
         \player_fsm/n82 , \player_fsm/n81 , \player_fsm/n80 ,
         \player_fsm/n79 , \player_fsm/n78 , \player_fsm/n77 ,
         \player_fsm/n76 , \player_fsm/n75 , \player_fsm/n74 ,
         \player_fsm/n73 , \player_fsm/n72 , \player_fsm/n71 ,
         \player_fsm/n70 , \player_fsm/n69 , \player_fsm/n68 ,
         \player_fsm/n67 , \player_fsm/n66 , \player_fsm/n65 ,
         \player_fsm/n64 , \player_fsm/n63 , \player_fsm/n62 ,
         \player_fsm/n61 , \player_fsm/n60 , \player_fsm/n59 ,
         \player_fsm/n58 , \player_fsm/n57 , \player_fsm/n56 ,
         \player_fsm/n55 , \player_fsm/n54 , \player_fsm/n53 ,
         \player_fsm/n52 , \player_fsm/n51 , \player_fsm/N120 ,
         \player_fsm/N115 , \player_fsm/N114 , \player_fsm/N107 ,
         \player_fsm/N106 , \player_fsm/N83 , \player_fsm/N82 ,
         \player_fsm/N81 , \player_fsm/N79 , \player_fsm/N74 ,
         \player_fsm/N72 , \player_fsm/N60 , \player_fsm/N59 ,
         \player_fsm/N47 , \player_fsm/N46 , \player_fsm/N45 ,
         \player_fsm/N44 , \player_fsm/N43 , \player_fsm/N42 ,
         \player_fsm/N41 , \player_fsm/N40 , \player_fsm/N38 ,
         \player_fsm/N37 , \player_fsm/N29 , \player_fsm/N28 ,
         \player_fsm/N27 , \player_fsm/N26 , \player_fsm/N25 ,
         \player_fsm/N24 , \player_fsm/N23 , \player_fsm/N22 ,
         \player_fsm/N20 , \player_fsm/N19 , \player_fsm/N18 ,
         \player_fsm/N17 , \player_fsm/N16 , \player_fsm/N15 ,
         \player_fsm/N14 , \player_fsm/N13 , \player_fsm/state[0] ,
         \player_fsm/state[1] , \shield_fsm/n98 , \shield_fsm/n97 ,
         \shield_fsm/n96 , \shield_fsm/n95 , \shield_fsm/n94 ,
         \shield_fsm/n93 , \shield_fsm/n92 , \shield_fsm/n91 ,
         \shield_fsm/n90 , \shield_fsm/n87 , \shield_fsm/n86 ,
         \shield_fsm/n84 , \shield_fsm/n81 , \shield_fsm/n80 ,
         \shield_fsm/n79 , \shield_fsm/n78 , \shield_fsm/n77 ,
         \shield_fsm/n76 , \shield_fsm/n75 , \shield_fsm/n74 ,
         \shield_fsm/n73 , \shield_fsm/n72 , \shield_fsm/n71 ,
         \shield_fsm/n70 , \shield_fsm/n69 , \shield_fsm/n68 ,
         \shield_fsm/n67 , \shield_fsm/n66 , \shield_fsm/n65 ,
         \shield_fsm/n64 , \shield_fsm/n62 , \shield_fsm/n61 ,
         \shield_fsm/n56 , \shield_fsm/n55 , \shield_fsm/n54 ,
         \shield_fsm/n53 , \shield_fsm/n52 , \shield_fsm/n51 ,
         \shield_fsm/n50 , \shield_fsm/n49 , \shield_fsm/n48 ,
         \shield_fsm/N110 , \shield_fsm/N97 , \shield_fsm/N96 ,
         \shield_fsm/N56 , \shield_fsm/N55 , \shield_fsm/N42 ,
         \shield_fsm/N40 , \shield_fsm/N37 , \shield_fsm/N35 ,
         \shield_fsm/N34 , \shield_fsm/N26 , \shield_fsm/N24 ,
         \shield_fsm/N21 , \shield_fsm/N19 , \shield_fsm/N18 ,
         \shield_fsm/N14 , \shield_fsm/N13 , \shield_fsm/state[0] ,
         \shield_fsm/state[1] , \invader_fsm_1/n117 , \invader_fsm_1/n116 ,
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
         \invader_fsm_1/n55 , \invader_fsm_1/N89 , \invader_fsm_1/N88 ,
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
         \invader_fsm_2/n117 , \invader_fsm_2/n116 , \invader_fsm_2/n115 ,
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
         \invader_fsm_2/N89 , \invader_fsm_2/N88 , \invader_fsm_2/N86 ,
         \invader_fsm_2/N84 , \invader_fsm_2/N75 , \invader_fsm_2/N74 ,
         \invader_fsm_2/N73 , \invader_fsm_2/N72 , \invader_fsm_2/N70 ,
         \invader_fsm_2/move_interval_toggle , \invader_fsm_2/N56 ,
         \invader_fsm_2/N55 , \invader_fsm_2/N43 , \invader_fsm_2/N42 ,
         \invader_fsm_2/N40 , \invader_fsm_2/N38 , \invader_fsm_2/N35 ,
         \invader_fsm_2/N34 , \invader_fsm_2/N33 , \invader_fsm_2/N32 ,
         \invader_fsm_2/N31 , \invader_fsm_2/N30 , \invader_fsm_2/N29 ,
         \invader_fsm_2/N27 , \invader_fsm_2/N26 , \invader_fsm_2/N24 ,
         \invader_fsm_2/N22 , \invader_fsm_2/N19 , \invader_fsm_2/N18 ,
         \invader_fsm_2/N17 , \invader_fsm_2/N16 , \invader_fsm_2/N15 ,
         \invader_fsm_2/N14 , \invader_fsm_2/N13 , \invader_fsm_2/state[0] ,
         \invader_fsm_2/state[1] , \invader_fsm_3/n118 , \invader_fsm_3/n117 ,
         \invader_fsm_3/n116 , \invader_fsm_3/n115 , \invader_fsm_3/n114 ,
         \invader_fsm_3/n113 , \invader_fsm_3/n112 , \invader_fsm_3/n111 ,
         \invader_fsm_3/n110 , \invader_fsm_3/n109 , \invader_fsm_3/n108 ,
         \invader_fsm_3/n107 , \invader_fsm_3/n106 , \invader_fsm_3/n105 ,
         \invader_fsm_3/n104 , \invader_fsm_3/n103 , \invader_fsm_3/n102 ,
         \invader_fsm_3/n101 , \invader_fsm_3/n100 , \invader_fsm_3/n99 ,
         \invader_fsm_3/n98 , \invader_fsm_3/n97 , \invader_fsm_3/n96 ,
         \invader_fsm_3/n95 , \invader_fsm_3/n94 , \invader_fsm_3/n93 ,
         \invader_fsm_3/n92 , \invader_fsm_3/n91 , \invader_fsm_3/n90 ,
         \invader_fsm_3/n89 , \invader_fsm_3/n88 , \invader_fsm_3/n87 ,
         \invader_fsm_3/n86 , \invader_fsm_3/n85 , \invader_fsm_3/n84 ,
         \invader_fsm_3/n83 , \invader_fsm_3/n82 , \invader_fsm_3/n81 ,
         \invader_fsm_3/n80 , \invader_fsm_3/n79 , \invader_fsm_3/n78 ,
         \invader_fsm_3/n77 , \invader_fsm_3/n76 , \invader_fsm_3/n75 ,
         \invader_fsm_3/n74 , \invader_fsm_3/n73 , \invader_fsm_3/n72 ,
         \invader_fsm_3/n71 , \invader_fsm_3/n70 , \invader_fsm_3/n69 ,
         \invader_fsm_3/n68 , \invader_fsm_3/n67 , \invader_fsm_3/n66 ,
         \invader_fsm_3/n65 , \invader_fsm_3/n64 , \invader_fsm_3/n63 ,
         \invader_fsm_3/n62 , \invader_fsm_3/n61 , \invader_fsm_3/n60 ,
         \invader_fsm_3/n59 , \invader_fsm_3/n58 , \invader_fsm_3/n57 ,
         \invader_fsm_3/n56 , \invader_fsm_3/N89 , \invader_fsm_3/N88 ,
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
         \invader_fsm_4/n118 , \invader_fsm_4/n117 , \invader_fsm_4/n116 ,
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
         \invader_fsm_4/N89 , \invader_fsm_4/N88 , \invader_fsm_4/N86 ,
         \invader_fsm_4/N84 , \invader_fsm_4/N75 , \invader_fsm_4/N74 ,
         \invader_fsm_4/N73 , \invader_fsm_4/N72 , \invader_fsm_4/N70 ,
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
         \player_bullet_fsm/next_state[0] , \invader_bullet_fsm/n53 ,
         \invader_bullet_fsm/n52 , \invader_bullet_fsm/n51 ,
         \invader_bullet_fsm/n50 , \invader_bullet_fsm/n49 ,
         \invader_bullet_fsm/n48 , \invader_bullet_fsm/n47 ,
         \invader_bullet_fsm/n46 , \invader_bullet_fsm/n45 ,
         \invader_bullet_fsm/n44 , \invader_bullet_fsm/n43 ,
         \invader_bullet_fsm/n41 , \invader_bullet_fsm/n38 ,
         \invader_bullet_fsm/n36 , \invader_bullet_fsm/n35 ,
         \invader_bullet_fsm/n34 , \invader_bullet_fsm/n33 ,
         \invader_bullet_fsm/n32 , \invader_bullet_fsm/n31 ,
         \invader_bullet_fsm/n29 , \invader_bullet_fsm/n28 ,
         \invader_bullet_fsm/n25 , \invader_bullet_fsm/n22 ,
         \invader_bullet_fsm/n21 , \invader_bullet_fsm/n20 ,
         \invader_bullet_fsm/n19 , \invader_bullet_fsm/n18 ,
         \invader_bullet_fsm/n16 , \invader_bullet_fsm/n15 ,
         \invader_bullet_fsm/n14 , \invader_bullet_fsm/N40 ,
         \invader_bullet_fsm/N30 , \invader_bullet_fsm/N29 ,
         \invader_bullet_fsm/N28 , \invader_bullet_fsm/N26 ,
         \invader_bullet_fsm/N19 , \invader_bullet_fsm/next_state[0] ,
         \invader_bullet_fsm/N13 , \invader_bullet_fsm/state[0] , n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n67, n69, n70, n71, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941;
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
  wire   [6:2] \invader_fsm_4/r410/carry ;
  wire   [6:2] \invader_fsm_4/add_50/carry ;
  wire   [6:0] \invader_fsm_4/sub_124/carry ;
  wire   [6:2] \invader_fsm_3/r410/carry ;
  wire   [6:2] \invader_fsm_3/add_50/carry ;
  wire   [6:0] \invader_fsm_3/sub_124/carry ;
  wire   [6:2] \invader_fsm_2/r410/carry ;
  wire   [6:2] \invader_fsm_2/add_50/carry ;
  wire   [6:0] \invader_fsm_2/sub_124/carry ;
  wire   [6:2] \invader_fsm_1/r410/carry ;
  wire   [6:2] \invader_fsm_1/add_50/carry ;
  wire   [6:0] \invader_fsm_1/sub_124/carry ;
  wire   [6:2] \player_fsm/r399/carry ;
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
  assign shield_coord_y[3] = 1'b0;
  assign shield_coord_y[4] = 1'b0;
  assign shield_coord_y[5] = 1'b0;
  assign shield_coord_x[0] = 1'b1;
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
  assign playerbullet_state[1] = 1'b0;
  assign playerbullet_state[1] = 1'b0;

  NAND2X1 U1 ( .A(n1), .B(n2), .Y(playerbullet_invader_collision_signal) );
  NOR2X1 U2 ( .A(playerbullet_invader_collision_signal_4), .B(
        playerbullet_invader_collision_signal_3), .Y(n2) );
  NOR2X1 U3 ( .A(playerbullet_invader_collision_signal_2), .B(
        playerbullet_invader_collision_signal_1), .Y(n1) );
  NAND2X1 \main_game_fsm/U206  ( .A(main_game_state[0]), .B(n120), .Y(
        \main_game_fsm/n179 ) );
  NAND2X1 \main_game_fsm/U205  ( .A(main_game_state[0]), .B(
        \main_game_fsm/n179 ), .Y(\main_game_fsm/N130 ) );
  NOR2X1 \main_game_fsm/U204  ( .A(invader_outofbounds_signal_2), .B(
        invader_outofbounds_signal_1), .Y(\main_game_fsm/n186 ) );
  NOR2X1 \main_game_fsm/U203  ( .A(invader_outofbounds_signal_4), .B(
        invader_outofbounds_signal_3), .Y(\main_game_fsm/n187 ) );
  NAND2X1 \main_game_fsm/U202  ( .A(\main_game_fsm/n186 ), .B(
        \main_game_fsm/n187 ), .Y(\main_game_fsm/n100 ) );
  NOR2X1 \main_game_fsm/U201  ( .A(invader_2_display), .B(invader_1_display), 
        .Y(\main_game_fsm/n184 ) );
  NOR2X1 \main_game_fsm/U200  ( .A(invader_4_display), .B(invader_3_display), 
        .Y(\main_game_fsm/n185 ) );
  AOI21X1 \main_game_fsm/U199  ( .A(\main_game_fsm/n184 ), .B(
        \main_game_fsm/n185 ), .C(\main_game_fsm/N113 ), .Y(
        \main_game_fsm/n183 ) );
  NAND3X1 \main_game_fsm/U198  ( .A(\main_game_fsm/n100 ), .B(n161), .C(
        \main_game_fsm/n180 ), .Y(\main_game_fsm/n174 ) );
  OAI21X1 \main_game_fsm/U197  ( .A(n242), .B(
        \main_game_fsm/prev_invader_outofbounds ), .C(n119), .Y(
        \main_game_fsm/n182 ) );
  OAI21X1 \main_game_fsm/U196  ( .A(main_game_state[0]), .B(n120), .C(
        \main_game_fsm/n182 ), .Y(\main_game_fsm/n181 ) );
  NAND2X1 \main_game_fsm/U195  ( .A(\main_game_fsm/n180 ), .B(
        \main_game_fsm/n181 ), .Y(\main_game_fsm/n176 ) );
  OAI21X1 \main_game_fsm/U194  ( .A(\main_game_fsm/n179 ), .B(
        \main_game_fsm/n174 ), .C(\main_game_fsm/n176 ), .Y(
        \main_game_fsm/n178 ) );
  NAND3X1 \main_game_fsm/U193  ( .A(n163), .B(n120), .C(player_shoot_input), 
        .Y(\main_game_fsm/n177 ) );
  AOI21X1 \main_game_fsm/U192  ( .A(\main_game_fsm/n176 ), .B(
        \main_game_fsm/n177 ), .C(reset), .Y(\main_game_fsm/N138 ) );
  NAND2X1 \main_game_fsm/U191  ( .A(n119), .B(n105), .Y(\main_game_fsm/n175 )
         );
  NOR2X1 \main_game_fsm/U190  ( .A(\main_game_fsm/n174 ), .B(
        \main_game_fsm/n175 ), .Y(\main_game_fsm/N139 ) );
  NAND2X1 \main_game_fsm/U189  ( .A(\main_game_fsm/next_state [1]), .B(n162), 
        .Y(\main_game_fsm/n104 ) );
  OAI21X1 \main_game_fsm/U188  ( .A(\main_game_fsm/next_state [1]), .B(n162), 
        .C(\main_game_fsm/n104 ), .Y(\main_game_fsm/n109 ) );
  NAND2X1 \main_game_fsm/U187  ( .A(\main_game_fsm/n109 ), .B(n105), .Y(
        \main_game_fsm/n101 ) );
  NOR2X1 \main_game_fsm/U186  ( .A(n162), .B(\main_game_fsm/n101 ), .Y(
        \main_game_fsm/N165 ) );
  NOR2X1 \main_game_fsm/U185  ( .A(n159), .B(\main_game_fsm/n101 ), .Y(
        \main_game_fsm/N166 ) );
  AOI22X1 \main_game_fsm/U182  ( .A(\invader_fsm_4/N84 ), .B(n4), .C(
        \invader_fsm_3/N84 ), .D(n75), .Y(\main_game_fsm/n172 ) );
  AOI22X1 \main_game_fsm/U181  ( .A(\invader_fsm_2/N84 ), .B(n3), .C(
        \invader_fsm_1/N84 ), .D(n74), .Y(\main_game_fsm/n173 ) );
  NAND2X1 \main_game_fsm/U180  ( .A(\main_game_fsm/n172 ), .B(
        \main_game_fsm/n173 ), .Y(closest_invader_coord_x[0]) );
  AOI22X1 \main_game_fsm/U179  ( .A(invader_4_coord_x[1]), .B(n4), .C(
        invader_3_coord_x[1]), .D(n75), .Y(\main_game_fsm/n170 ) );
  AOI22X1 \main_game_fsm/U178  ( .A(invader_2_coord_x[1]), .B(n3), .C(
        invader_1_coord_x[1]), .D(n74), .Y(\main_game_fsm/n171 ) );
  NAND2X1 \main_game_fsm/U177  ( .A(\main_game_fsm/n170 ), .B(
        \main_game_fsm/n171 ), .Y(closest_invader_coord_x[1]) );
  AOI22X1 \main_game_fsm/U176  ( .A(invader_4_coord_x[2]), .B(n4), .C(
        invader_3_coord_x[2]), .D(n75), .Y(\main_game_fsm/n168 ) );
  AOI22X1 \main_game_fsm/U175  ( .A(invader_2_coord_x[2]), .B(n3), .C(
        invader_1_coord_x[2]), .D(n74), .Y(\main_game_fsm/n169 ) );
  NAND2X1 \main_game_fsm/U174  ( .A(\main_game_fsm/n168 ), .B(
        \main_game_fsm/n169 ), .Y(closest_invader_coord_x[2]) );
  AOI22X1 \main_game_fsm/U173  ( .A(invader_4_coord_x[3]), .B(n4), .C(
        invader_3_coord_x[3]), .D(n75), .Y(\main_game_fsm/n166 ) );
  AOI22X1 \main_game_fsm/U172  ( .A(invader_2_coord_x[3]), .B(n3), .C(
        invader_1_coord_x[3]), .D(n74), .Y(\main_game_fsm/n167 ) );
  NAND2X1 \main_game_fsm/U171  ( .A(\main_game_fsm/n166 ), .B(
        \main_game_fsm/n167 ), .Y(closest_invader_coord_x[3]) );
  AOI22X1 \main_game_fsm/U170  ( .A(invader_4_coord_x[4]), .B(n4), .C(
        invader_3_coord_x[4]), .D(n75), .Y(\main_game_fsm/n164 ) );
  AOI22X1 \main_game_fsm/U169  ( .A(invader_2_coord_x[4]), .B(n3), .C(
        invader_1_coord_x[4]), .D(n74), .Y(\main_game_fsm/n165 ) );
  NAND2X1 \main_game_fsm/U168  ( .A(\main_game_fsm/n164 ), .B(
        \main_game_fsm/n165 ), .Y(closest_invader_coord_x[4]) );
  AOI22X1 \main_game_fsm/U167  ( .A(invader_4_coord_x[5]), .B(n4), .C(
        invader_3_coord_x[5]), .D(n75), .Y(\main_game_fsm/n162 ) );
  AOI22X1 \main_game_fsm/U166  ( .A(invader_2_coord_x[5]), .B(n3), .C(
        invader_1_coord_x[5]), .D(n74), .Y(\main_game_fsm/n163 ) );
  NAND2X1 \main_game_fsm/U165  ( .A(\main_game_fsm/n162 ), .B(
        \main_game_fsm/n163 ), .Y(closest_invader_coord_x[5]) );
  AOI22X1 \main_game_fsm/U164  ( .A(\invader_fsm_4/N70 ), .B(n4), .C(
        \invader_fsm_3/N70 ), .D(n75), .Y(\main_game_fsm/n160 ) );
  AOI22X1 \main_game_fsm/U163  ( .A(\invader_fsm_2/N70 ), .B(n3), .C(
        \invader_fsm_1/N70 ), .D(n74), .Y(\main_game_fsm/n161 ) );
  NAND2X1 \main_game_fsm/U162  ( .A(\main_game_fsm/n160 ), .B(
        \main_game_fsm/n161 ), .Y(closest_invader_coord_y[0]) );
  AOI22X1 \main_game_fsm/U161  ( .A(invader_4_coord_y[1]), .B(n4), .C(
        invader_3_coord_y[1]), .D(n75), .Y(\main_game_fsm/n158 ) );
  AOI22X1 \main_game_fsm/U160  ( .A(invader_2_coord_y[1]), .B(n3), .C(
        invader_1_coord_y[1]), .D(n74), .Y(\main_game_fsm/n159 ) );
  NAND2X1 \main_game_fsm/U159  ( .A(\main_game_fsm/n158 ), .B(
        \main_game_fsm/n159 ), .Y(closest_invader_coord_y[1]) );
  AOI22X1 \main_game_fsm/U158  ( .A(invader_4_coord_y[2]), .B(n4), .C(
        invader_3_coord_y[2]), .D(n75), .Y(\main_game_fsm/n156 ) );
  AOI22X1 \main_game_fsm/U157  ( .A(invader_2_coord_y[2]), .B(n3), .C(
        invader_1_coord_y[2]), .D(n74), .Y(\main_game_fsm/n157 ) );
  NAND2X1 \main_game_fsm/U156  ( .A(\main_game_fsm/n156 ), .B(
        \main_game_fsm/n157 ), .Y(closest_invader_coord_y[2]) );
  AOI22X1 \main_game_fsm/U155  ( .A(invader_4_coord_y[3]), .B(n4), .C(
        invader_3_coord_y[3]), .D(n75), .Y(\main_game_fsm/n154 ) );
  AOI22X1 \main_game_fsm/U154  ( .A(invader_2_coord_y[3]), .B(n3), .C(
        invader_1_coord_y[3]), .D(n74), .Y(\main_game_fsm/n155 ) );
  NAND2X1 \main_game_fsm/U153  ( .A(\main_game_fsm/n154 ), .B(
        \main_game_fsm/n155 ), .Y(closest_invader_coord_y[3]) );
  AOI22X1 \main_game_fsm/U152  ( .A(invader_4_coord_y[4]), .B(n4), .C(
        invader_3_coord_y[4]), .D(n75), .Y(\main_game_fsm/n152 ) );
  AOI22X1 \main_game_fsm/U151  ( .A(invader_2_coord_y[4]), .B(n3), .C(
        invader_1_coord_y[4]), .D(n74), .Y(\main_game_fsm/n153 ) );
  NAND2X1 \main_game_fsm/U150  ( .A(\main_game_fsm/n152 ), .B(
        \main_game_fsm/n153 ), .Y(closest_invader_coord_y[4]) );
  AOI22X1 \main_game_fsm/U149  ( .A(invader_4_coord_y[5]), .B(n4), .C(
        invader_3_coord_y[5]), .D(n75), .Y(\main_game_fsm/n146 ) );
  AOI22X1 \main_game_fsm/U148  ( .A(invader_2_coord_y[5]), .B(n3), .C(
        invader_1_coord_y[5]), .D(n74), .Y(\main_game_fsm/n147 ) );
  NAND2X1 \main_game_fsm/U147  ( .A(\main_game_fsm/n146 ), .B(
        \main_game_fsm/n147 ), .Y(closest_invader_coord_y[5]) );
  AOI22X1 \main_game_fsm/U146  ( .A(\main_game_fsm/N36 ), .B(n195), .C(
        \main_game_fsm/N30 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n145 ) );
  NAND2X1 \main_game_fsm/U145  ( .A(\main_game_fsm/n145 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [0]) );
  AOI22X1 \main_game_fsm/U144  ( .A(\main_game_fsm/N37 ), .B(n195), .C(
        \main_game_fsm/N31 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n144 ) );
  NAND2X1 \main_game_fsm/U143  ( .A(\main_game_fsm/n144 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [1]) );
  AOI22X1 \main_game_fsm/U142  ( .A(\main_game_fsm/N38 ), .B(n195), .C(
        \main_game_fsm/N32 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n143 ) );
  NAND2X1 \main_game_fsm/U141  ( .A(\main_game_fsm/n143 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [2]) );
  AOI22X1 \main_game_fsm/U140  ( .A(\main_game_fsm/N39 ), .B(n195), .C(
        \main_game_fsm/N33 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n142 ) );
  NAND2X1 \main_game_fsm/U139  ( .A(\main_game_fsm/n142 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [3]) );
  AOI22X1 \main_game_fsm/U138  ( .A(\main_game_fsm/N40 ), .B(n195), .C(
        \main_game_fsm/N34 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n141 ) );
  NAND2X1 \main_game_fsm/U137  ( .A(\main_game_fsm/n141 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [4]) );
  AOI22X1 \main_game_fsm/U136  ( .A(\main_game_fsm/N41 ), .B(n195), .C(
        \main_game_fsm/N35 ), .D(\main_game_fsm/N28 ), .Y(\main_game_fsm/n140 ) );
  NAND2X1 \main_game_fsm/U135  ( .A(\main_game_fsm/n140 ), .B(
        invader_1_display), .Y(\main_game_fsm/diff_alive1 [5]) );
  AOI22X1 \main_game_fsm/U134  ( .A(\main_game_fsm/N50 ), .B(n191), .C(
        \main_game_fsm/N44 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n139 ) );
  NAND2X1 \main_game_fsm/U133  ( .A(\main_game_fsm/n139 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [0]) );
  AOI22X1 \main_game_fsm/U132  ( .A(\main_game_fsm/N51 ), .B(n191), .C(
        \main_game_fsm/N45 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n138 ) );
  NAND2X1 \main_game_fsm/U131  ( .A(\main_game_fsm/n138 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [1]) );
  AOI22X1 \main_game_fsm/U130  ( .A(\main_game_fsm/N52 ), .B(n191), .C(
        \main_game_fsm/N46 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n137 ) );
  NAND2X1 \main_game_fsm/U129  ( .A(\main_game_fsm/n137 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [2]) );
  AOI22X1 \main_game_fsm/U128  ( .A(\main_game_fsm/N53 ), .B(n191), .C(
        \main_game_fsm/N47 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n136 ) );
  NAND2X1 \main_game_fsm/U127  ( .A(\main_game_fsm/n136 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [3]) );
  AOI22X1 \main_game_fsm/U126  ( .A(\main_game_fsm/N54 ), .B(n191), .C(
        \main_game_fsm/N48 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n135 ) );
  NAND2X1 \main_game_fsm/U125  ( .A(\main_game_fsm/n135 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [4]) );
  AOI22X1 \main_game_fsm/U124  ( .A(\main_game_fsm/N55 ), .B(n191), .C(
        \main_game_fsm/N49 ), .D(\main_game_fsm/N42 ), .Y(\main_game_fsm/n134 ) );
  NAND2X1 \main_game_fsm/U123  ( .A(\main_game_fsm/n134 ), .B(
        invader_2_display), .Y(\main_game_fsm/diff_alive2 [5]) );
  AOI22X1 \main_game_fsm/U122  ( .A(\main_game_fsm/N64 ), .B(n181), .C(
        \main_game_fsm/N58 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n133 ) );
  NAND2X1 \main_game_fsm/U121  ( .A(\main_game_fsm/n133 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [0]) );
  AOI22X1 \main_game_fsm/U120  ( .A(\main_game_fsm/N65 ), .B(n181), .C(
        \main_game_fsm/N59 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n132 ) );
  NAND2X1 \main_game_fsm/U119  ( .A(\main_game_fsm/n132 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [1]) );
  AOI22X1 \main_game_fsm/U118  ( .A(\main_game_fsm/N66 ), .B(n181), .C(
        \main_game_fsm/N60 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n131 ) );
  NAND2X1 \main_game_fsm/U117  ( .A(\main_game_fsm/n131 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [2]) );
  AOI22X1 \main_game_fsm/U116  ( .A(\main_game_fsm/N67 ), .B(n181), .C(
        \main_game_fsm/N61 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n130 ) );
  NAND2X1 \main_game_fsm/U115  ( .A(\main_game_fsm/n130 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [3]) );
  AOI22X1 \main_game_fsm/U114  ( .A(\main_game_fsm/N68 ), .B(n181), .C(
        \main_game_fsm/N62 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n129 ) );
  NAND2X1 \main_game_fsm/U113  ( .A(\main_game_fsm/n129 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [4]) );
  AOI22X1 \main_game_fsm/U112  ( .A(\main_game_fsm/N69 ), .B(n181), .C(
        \main_game_fsm/N63 ), .D(\main_game_fsm/N56 ), .Y(\main_game_fsm/n128 ) );
  NAND2X1 \main_game_fsm/U111  ( .A(\main_game_fsm/n128 ), .B(
        invader_3_display), .Y(\main_game_fsm/diff_alive3 [5]) );
  AOI22X1 \main_game_fsm/U110  ( .A(\main_game_fsm/N78 ), .B(n177), .C(
        \main_game_fsm/N72 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n127 ) );
  NAND2X1 \main_game_fsm/U109  ( .A(\main_game_fsm/n127 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [0]) );
  AOI22X1 \main_game_fsm/U108  ( .A(\main_game_fsm/N79 ), .B(n177), .C(
        \main_game_fsm/N73 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n126 ) );
  NAND2X1 \main_game_fsm/U107  ( .A(\main_game_fsm/n126 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [1]) );
  AOI22X1 \main_game_fsm/U106  ( .A(\main_game_fsm/N80 ), .B(n177), .C(
        \main_game_fsm/N74 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n125 ) );
  NAND2X1 \main_game_fsm/U105  ( .A(\main_game_fsm/n125 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [2]) );
  AOI22X1 \main_game_fsm/U104  ( .A(\main_game_fsm/N81 ), .B(n177), .C(
        \main_game_fsm/N75 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n124 ) );
  NAND2X1 \main_game_fsm/U103  ( .A(\main_game_fsm/n124 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [3]) );
  AOI22X1 \main_game_fsm/U102  ( .A(\main_game_fsm/N82 ), .B(n177), .C(
        \main_game_fsm/N76 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n123 ) );
  NAND2X1 \main_game_fsm/U101  ( .A(\main_game_fsm/n123 ), .B(
        invader_4_display), .Y(\main_game_fsm/diff_alive4 [4]) );
  AOI22X1 \main_game_fsm/U100  ( .A(\main_game_fsm/N83 ), .B(n177), .C(
        \main_game_fsm/N77 ), .D(\main_game_fsm/N70 ), .Y(\main_game_fsm/n122 ) );
  NAND2X1 \main_game_fsm/U99  ( .A(\main_game_fsm/n122 ), .B(invader_4_display), .Y(\main_game_fsm/diff_alive4 [5]) );
  AOI22X1 \main_game_fsm/U98  ( .A(n185), .B(\main_game_fsm/diff_alive2 [0]), 
        .C(\main_game_fsm/diff_alive1 [0]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n121 ) );
  AOI22X1 \main_game_fsm/U97  ( .A(n185), .B(\main_game_fsm/diff_alive2 [1]), 
        .C(\main_game_fsm/diff_alive1 [1]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n120 ) );
  AOI22X1 \main_game_fsm/U96  ( .A(n185), .B(\main_game_fsm/diff_alive2 [2]), 
        .C(\main_game_fsm/diff_alive1 [2]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n119 ) );
  AOI22X1 \main_game_fsm/U95  ( .A(n185), .B(\main_game_fsm/diff_alive2 [3]), 
        .C(\main_game_fsm/diff_alive1 [3]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n118 ) );
  AOI22X1 \main_game_fsm/U94  ( .A(n185), .B(\main_game_fsm/diff_alive2 [4]), 
        .C(\main_game_fsm/diff_alive1 [4]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n117 ) );
  AOI22X1 \main_game_fsm/U93  ( .A(n185), .B(\main_game_fsm/diff_alive2 [5]), 
        .C(\main_game_fsm/diff_alive1 [5]), .D(\main_game_fsm/N88 ), .Y(
        \main_game_fsm/n116 ) );
  AOI22X1 \main_game_fsm/U92  ( .A(n171), .B(\main_game_fsm/diff_alive4 [0]), 
        .C(\main_game_fsm/diff_alive3 [0]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n115 ) );
  AOI22X1 \main_game_fsm/U91  ( .A(n171), .B(\main_game_fsm/diff_alive4 [1]), 
        .C(\main_game_fsm/diff_alive3 [1]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n114 ) );
  AOI22X1 \main_game_fsm/U90  ( .A(n171), .B(\main_game_fsm/diff_alive4 [2]), 
        .C(\main_game_fsm/diff_alive3 [2]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n113 ) );
  AOI22X1 \main_game_fsm/U89  ( .A(n171), .B(\main_game_fsm/diff_alive4 [3]), 
        .C(\main_game_fsm/diff_alive3 [3]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n112 ) );
  AOI22X1 \main_game_fsm/U88  ( .A(n171), .B(\main_game_fsm/diff_alive4 [4]), 
        .C(\main_game_fsm/diff_alive3 [4]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n111 ) );
  AOI22X1 \main_game_fsm/U87  ( .A(n171), .B(\main_game_fsm/diff_alive4 [5]), 
        .C(\main_game_fsm/diff_alive3 [5]), .D(\main_game_fsm/N94 ), .Y(
        \main_game_fsm/n110 ) );
  OAI21X1 \main_game_fsm/U86  ( .A(\main_game_fsm/next_state [1]), .B(
        \main_game_fsm/next_state [0]), .C(n105), .Y(\main_game_fsm/n103 ) );
  NOR2X1 \main_game_fsm/U85  ( .A(\main_game_fsm/n109 ), .B(
        \main_game_fsm/n103 ), .Y(\main_game_fsm/n96 ) );
  AOI21X1 \main_game_fsm/U84  ( .A(n160), .B(n105), .C(\main_game_fsm/n96 ), 
        .Y(\main_game_fsm/n108 ) );
  NAND3X1 \main_game_fsm/U83  ( .A(n105), .B(n159), .C(
        \main_game_fsm/next_state [0]), .Y(\main_game_fsm/n94 ) );
  OAI21X1 \main_game_fsm/U82  ( .A(\main_game_fsm/n108 ), .B(n117), .C(
        \main_game_fsm/n94 ), .Y(\main_game_fsm/n191 ) );
  OAI21X1 \main_game_fsm/U81  ( .A(n104), .B(\main_game_fsm/n96 ), .C(
        invader_direction), .Y(\main_game_fsm/n107 ) );
  OAI21X1 \main_game_fsm/U80  ( .A(invader_direction), .B(\main_game_fsm/n104 ), .C(\main_game_fsm/n107 ), .Y(\main_game_fsm/n106 ) );
  OR2X1 \main_game_fsm/U79  ( .A(\main_game_fsm/n103 ), .B(
        \main_game_fsm/n106 ), .Y(\main_game_fsm/n190 ) );
  NAND2X1 \main_game_fsm/U78  ( .A(move_down), .B(\main_game_fsm/n96 ), .Y(
        \main_game_fsm/n105 ) );
  OAI21X1 \main_game_fsm/U77  ( .A(reset), .B(\main_game_fsm/n104 ), .C(
        \main_game_fsm/n105 ), .Y(\main_game_fsm/n189 ) );
  AOI21X1 \main_game_fsm/U76  ( .A(\main_game_fsm/n96 ), .B(n78), .C(
        \main_game_fsm/n103 ), .Y(\main_game_fsm/n102 ) );
  AOI22X1 \main_game_fsm/U75  ( .A(\main_game_fsm/n96 ), .B(
        \main_game_fsm/prev_invader_outofbounds ), .C(\main_game_fsm/n100 ), 
        .D(n102), .Y(\main_game_fsm/n99 ) );
  AOI22X1 \main_game_fsm/U74  ( .A(\main_game_fsm/next_player_left_motion ), 
        .B(n102), .C(player_left_motion), .D(\main_game_fsm/n96 ), .Y(
        \main_game_fsm/n98 ) );
  AOI22X1 \main_game_fsm/U73  ( .A(\main_game_fsm/next_playerbullet_fire ), 
        .B(n102), .C(playerbullet_fire), .D(\main_game_fsm/n96 ), .Y(
        \main_game_fsm/n97 ) );
  AOI22X1 \main_game_fsm/U72  ( .A(\main_game_fsm/next_player_right_motion ), 
        .B(n102), .C(player_right_motion), .D(\main_game_fsm/n96 ), .Y(
        \main_game_fsm/n95 ) );
  OAI21X1 \main_game_fsm/U71  ( .A(reset), .B(n118), .C(\main_game_fsm/n94 ), 
        .Y(\main_game_fsm/n188 ) );
  AND2X2 \main_game_fsm/U34  ( .A(\main_game_fsm/n183 ), .B(player_display), 
        .Y(\main_game_fsm/n180 ) );
  AND2X2 \main_game_fsm/U33  ( .A(player_left_input), .B(\main_game_fsm/n178 ), 
        .Y(\main_game_fsm/N131 ) );
  AND2X2 \main_game_fsm/U32  ( .A(player_right_input), .B(\main_game_fsm/n178 ), .Y(\main_game_fsm/N132 ) );
  AND2X2 \main_game_fsm/U31  ( .A(\main_game_fsm/n178 ), .B(player_shoot_input), .Y(\main_game_fsm/N133 ) );
  AND2X2 \main_game_fsm/U7  ( .A(\main_game_fsm/temp_player_left_motion ), .B(
        n105), .Y(\main_game_fsm/N140 ) );
  AND2X2 \main_game_fsm/U6  ( .A(\main_game_fsm/temp_player_right_motion ), 
        .B(n105), .Y(\main_game_fsm/N141 ) );
  AND2X2 \main_game_fsm/U5  ( .A(\main_game_fsm/temp_playerbullet_fire ), .B(
        n105), .Y(\main_game_fsm/N142 ) );
  DFFNEGX1 \main_game_fsm/player_right_motion_reg  ( .D(n101), .CLK(n97), .Q(
        player_right_motion) );
  DFFNEGX1 \main_game_fsm/playerbullet_fire_reg  ( .D(n100), .CLK(n97), .Q(
        playerbullet_fire) );
  DFFNEGX1 \main_game_fsm/player_left_motion_reg  ( .D(n99), .CLK(n96), .Q(
        player_left_motion) );
  DFFNEGX1 \main_game_fsm/next_player_left_motion_reg  ( .D(
        \main_game_fsm/N140 ), .CLK(clka), .Q(
        \main_game_fsm/next_player_left_motion ) );
  LATCH \main_game_fsm/temp_player_left_motion_reg  ( .CLK(
        \main_game_fsm/N130 ), .D(\main_game_fsm/N131 ), .Q(
        \main_game_fsm/temp_player_left_motion ) );
  DFFNEGX1 \main_game_fsm/next_player_right_motion_reg  ( .D(
        \main_game_fsm/N141 ), .CLK(clka), .Q(
        \main_game_fsm/next_player_right_motion ) );
  LATCH \main_game_fsm/temp_player_right_motion_reg  ( .CLK(
        \main_game_fsm/N130 ), .D(\main_game_fsm/N132 ), .Q(
        \main_game_fsm/temp_player_right_motion ) );
  DFFNEGX1 \main_game_fsm/next_playerbullet_fire_reg  ( .D(
        \main_game_fsm/N142 ), .CLK(clka), .Q(
        \main_game_fsm/next_playerbullet_fire ) );
  LATCH \main_game_fsm/temp_playerbullet_fire_reg  ( .CLK(\main_game_fsm/N130 ), .D(\main_game_fsm/N133 ), .Q(\main_game_fsm/temp_playerbullet_fire ) );
  DFFNEGX1 \main_game_fsm/invader_direction_reg  ( .D(\main_game_fsm/n190 ), 
        .CLK(n96), .Q(invader_direction) );
  DFFNEGX1 \main_game_fsm/play_reg  ( .D(\main_game_fsm/n191 ), .CLK(n96), .Q(
        play) );
  DFFNEGX1 \main_game_fsm/invaderbullet_fire_reg  ( .D(\main_game_fsm/n188 ), 
        .CLK(n96), .Q(invader_fire) );
  DFFNEGX1 \main_game_fsm/state_reg[1]  ( .D(\main_game_fsm/N166 ), .CLK(n96), 
        .Q(main_game_state[1]) );
  DFFNEGX1 \main_game_fsm/move_down_reg  ( .D(\main_game_fsm/n189 ), .CLK(n96), 
        .Q(move_down) );
  DFFNEGX1 \main_game_fsm/reset_reg  ( .D(n103), .CLK(n96), .Q(internal_reset)
         );
  DFFNEGX1 \main_game_fsm/next_state_reg[1]  ( .D(\main_game_fsm/N139 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [1]) );
  DFFNEGX1 \main_game_fsm/prev_invader_outofbounds_reg  ( .D(n98), .CLK(n96), 
        .Q(\main_game_fsm/prev_invader_outofbounds ) );
  DFFNEGX1 \main_game_fsm/next_state_reg[0]  ( .D(\main_game_fsm/N138 ), .CLK(
        clka), .Q(\main_game_fsm/next_state [0]) );
  DFFNEGX1 \main_game_fsm/state_reg[0]  ( .D(\main_game_fsm/N165 ), .CLK(n96), 
        .Q(main_game_state[0]) );
  NAND2X1 \player_fsm/U77  ( .A(\player_fsm/next_state [0]), .B(n222), .Y(
        \player_fsm/n61 ) );
  NOR2X1 \player_fsm/U76  ( .A(n222), .B(\player_fsm/next_state [0]), .Y(
        \player_fsm/n76 ) );
  OAI21X1 \player_fsm/U75  ( .A(n221), .B(\player_fsm/n76 ), .C(n77), .Y(
        \player_fsm/N120 ) );
  NOR2X1 \player_fsm/U74  ( .A(\player_fsm/N120 ), .B(n224), .Y(
        \player_fsm/N106 ) );
  NOR2X1 \player_fsm/U73  ( .A(\player_fsm/N120 ), .B(n222), .Y(
        \player_fsm/N107 ) );
  XOR2X1 \player_fsm/U72  ( .A(\player_fsm/next_state [0]), .B(
        \player_fsm/next_state [1]), .Y(\player_fsm/n57 ) );
  NAND3X1 \player_fsm/U71  ( .A(\player_fsm/n61 ), .B(n76), .C(
        \player_fsm/n57 ), .Y(\player_fsm/N115 ) );
  AOI22X1 \player_fsm/U70  ( .A(\player_fsm/N38 ), .B(\player_fsm/N37 ), .C(
        \player_fsm/N47 ), .D(\player_fsm/N46 ), .Y(\player_fsm/n74 ) );
  AOI22X1 \player_fsm/U69  ( .A(\player_fsm/N20 ), .B(\player_fsm/N19 ), .C(
        \player_fsm/N29 ), .D(\player_fsm/N28 ), .Y(\player_fsm/n75 ) );
  OR2X1 \player_fsm/U68  ( .A(\player_fsm/n74 ), .B(\player_fsm/n75 ), .Y(
        \player_fsm/n71 ) );
  AOI22X1 \player_fsm/U67  ( .A(\player_fsm/state[0] ), .B(\player_fsm/n71 ), 
        .C(play), .D(n223), .Y(\player_fsm/n72 ) );
  OR2X1 \player_fsm/U66  ( .A(n78), .B(\player_fsm/state[1] ), .Y(
        \player_fsm/n73 ) );
  NOR2X1 \player_fsm/U65  ( .A(\player_fsm/n72 ), .B(\player_fsm/n73 ), .Y(
        \player_fsm/N59 ) );
  NOR2X1 \player_fsm/U64  ( .A(\player_fsm/state[1] ), .B(\player_fsm/n71 ), 
        .Y(\player_fsm/n70 ) );
  AOI22X1 \player_fsm/U63  ( .A(\player_fsm/n70 ), .B(\player_fsm/state[0] ), 
        .C(\player_fsm/state[1] ), .D(n223), .Y(\player_fsm/n69 ) );
  NOR2X1 \player_fsm/U62  ( .A(n82), .B(\player_fsm/n69 ), .Y(\player_fsm/N60 ) );
  NAND3X1 \player_fsm/U61  ( .A(\player_fsm/N74 ), .B(n109), .C(
        player_right_motion), .Y(\player_fsm/n68 ) );
  NAND3X1 \player_fsm/U60  ( .A(\player_fsm/N72 ), .B(n107), .C(
        player_left_motion), .Y(\player_fsm/n67 ) );
  NOR2X1 \player_fsm/U59  ( .A(n108), .B(n106), .Y(\player_fsm/n59 ) );
  NOR2X1 \player_fsm/U58  ( .A(\player_fsm/n61 ), .B(n82), .Y(\player_fsm/n66 ) );
  AOI21X1 \player_fsm/U57  ( .A(\player_fsm/n59 ), .B(\player_fsm/n66 ), .C(
        \player_fsm/N114 ), .Y(\player_fsm/n51 ) );
  AOI22X1 \player_fsm/U56  ( .A(n69), .B(\player_fsm/n53 ), .C(n69), .D(
        \player_fsm/n54 ), .Y(\player_fsm/n65 ) );
  OAI21X1 \player_fsm/U55  ( .A(\player_fsm/n51 ), .B(n69), .C(
        \player_fsm/n65 ), .Y(\player_fsm/n82 ) );
  AOI22X1 \player_fsm/U54  ( .A(\player_fsm/N13 ), .B(\player_fsm/n53 ), .C(
        \player_fsm/N79 ), .D(\player_fsm/n54 ), .Y(\player_fsm/n64 ) );
  OAI21X1 \player_fsm/U53  ( .A(\player_fsm/n51 ), .B(n73), .C(
        \player_fsm/n64 ), .Y(\player_fsm/n81 ) );
  AOI22X1 \player_fsm/U52  ( .A(\player_fsm/N14 ), .B(\player_fsm/n53 ), .C(
        n196), .D(\player_fsm/n54 ), .Y(\player_fsm/n63 ) );
  OAI21X1 \player_fsm/U51  ( .A(\player_fsm/n51 ), .B(n71), .C(
        \player_fsm/n63 ), .Y(\player_fsm/n80 ) );
  AOI22X1 \player_fsm/U50  ( .A(\player_fsm/N15 ), .B(\player_fsm/n53 ), .C(
        \player_fsm/N81 ), .D(\player_fsm/n54 ), .Y(\player_fsm/n62 ) );
  OAI21X1 \player_fsm/U49  ( .A(\player_fsm/n51 ), .B(n70), .C(
        \player_fsm/n62 ), .Y(\player_fsm/n79 ) );
  AOI22X1 \player_fsm/U48  ( .A(\player_fsm/N16 ), .B(n108), .C(
        \player_fsm/N82 ), .D(n106), .Y(\player_fsm/n60 ) );
  OAI21X1 \player_fsm/U47  ( .A(\player_fsm/n60 ), .B(\player_fsm/n61 ), .C(
        n77), .Y(\player_fsm/n55 ) );
  OAI21X1 \player_fsm/U46  ( .A(\player_fsm/n59 ), .B(\player_fsm/N114 ), .C(
        n943), .Y(\player_fsm/n58 ) );
  NAND2X1 \player_fsm/U45  ( .A(\player_fsm/n57 ), .B(\player_fsm/n58 ), .Y(
        \player_fsm/n56 ) );
  OR2X1 \player_fsm/U44  ( .A(\player_fsm/n55 ), .B(\player_fsm/n56 ), .Y(
        \player_fsm/n78 ) );
  AOI22X1 \player_fsm/U43  ( .A(\player_fsm/N17 ), .B(\player_fsm/n53 ), .C(
        \player_fsm/N83 ), .D(\player_fsm/n54 ), .Y(\player_fsm/n52 ) );
  OAI21X1 \player_fsm/U42  ( .A(\player_fsm/n51 ), .B(n67), .C(
        \player_fsm/n52 ), .Y(\player_fsm/n77 ) );
  AND2X2 \player_fsm/U27  ( .A(\player_fsm/n76 ), .B(n76), .Y(
        \player_fsm/N114 ) );
  AND2X2 \player_fsm/U26  ( .A(n108), .B(\player_fsm/n66 ), .Y(
        \player_fsm/n53 ) );
  AND2X2 \player_fsm/U25  ( .A(n106), .B(\player_fsm/n66 ), .Y(
        \player_fsm/n54 ) );
  DFFNEGX1 \player_fsm/state_reg[1]  ( .D(\player_fsm/N107 ), .CLK(n96), .Q(
        \player_fsm/state[1] ) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[1]  ( .D(\player_fsm/n81 ), .CLK(n96), .Q(player_coord_x[1]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[2]  ( .D(\player_fsm/n80 ), .CLK(n96), .Q(n944) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[3]  ( .D(\player_fsm/n79 ), .CLK(n96), .Q(player_coord_x[3]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[0]  ( .D(\player_fsm/n82 ), .CLK(n95), .Q(player_coord_x[0]) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[5]  ( .D(\player_fsm/n77 ), .CLK(n95), .Q(n942) );
  DFFNEGX1 \player_fsm/player_coord_x_reg[4]  ( .D(\player_fsm/n78 ), .CLK(n95), .Q(n943) );
  DFFNEGX1 \player_fsm/invaderbullet_player_collision_signal_reg  ( .D(
        \player_fsm/N114 ), .CLK(n95), .Q(
        invaderbullet_player_collision_signal) );
  DFFNEGX1 \player_fsm/display_reg  ( .D(\player_fsm/N115 ), .CLK(n95), .Q(
        player_display) );
  DFFNEGX1 \player_fsm/next_state_reg[1]  ( .D(\player_fsm/N60 ), .CLK(clka), 
        .Q(\player_fsm/next_state [1]) );
  DFFNEGX1 \player_fsm/state_reg[0]  ( .D(\player_fsm/N106 ), .CLK(n95), .Q(
        \player_fsm/state[0] ) );
  DFFNEGX1 \player_fsm/next_state_reg[0]  ( .D(\player_fsm/N59 ), .CLK(clka), 
        .Q(\player_fsm/next_state [0]) );
  NAND2X1 \shield_fsm/U89  ( .A(\shield_fsm/next_state [0]), .B(n238), .Y(
        \shield_fsm/n69 ) );
  OAI21X1 \shield_fsm/U88  ( .A(\shield_fsm/next_state [1]), .B(
        \shield_fsm/next_state [0]), .C(n77), .Y(\shield_fsm/n71 ) );
  AOI21X1 \shield_fsm/U87  ( .A(n76), .B(n237), .C(\shield_fsm/n50 ), .Y(
        \shield_fsm/N110 ) );
  NOR2X1 \shield_fsm/U84  ( .A(invader_bullet_coord_y[5]), .B(
        invader_bullet_coord_y[3]), .Y(\shield_fsm/n87 ) );
  NAND3X1 \shield_fsm/U83  ( .A(\shield_fsm/N26 ), .B(\shield_fsm/N18 ), .C(
        \shield_fsm/n87 ), .Y(\shield_fsm/n80 ) );
  XOR2X1 \shield_fsm/U79  ( .A(shield_coord_y[2]), .B(
        invader_bullet_coord_y[2]), .Y(\shield_fsm/n86 ) );
  NOR2X1 \shield_fsm/U78  ( .A(invader_bullet_coord_y[4]), .B(\shield_fsm/n86 ), .Y(\shield_fsm/n84 ) );
  NAND3X1 \shield_fsm/U77  ( .A(n445), .B(invader_bullet_coord_y[0]), .C(
        \shield_fsm/n84 ), .Y(\shield_fsm/n81 ) );
  NOR2X1 \shield_fsm/U76  ( .A(\shield_fsm/n80 ), .B(\shield_fsm/n81 ), .Y(
        \shield_fsm/n74 ) );
  NAND3X1 \shield_fsm/U75  ( .A(n240), .B(n241), .C(\shield_fsm/n74 ), .Y(
        \shield_fsm/n77 ) );
  AOI22X1 \shield_fsm/U74  ( .A(\shield_fsm/state[0] ), .B(\shield_fsm/n77 ), 
        .C(play), .D(n239), .Y(\shield_fsm/n78 ) );
  OR2X1 \shield_fsm/U73  ( .A(n78), .B(\shield_fsm/state[1] ), .Y(
        \shield_fsm/n79 ) );
  NOR2X1 \shield_fsm/U72  ( .A(\shield_fsm/n78 ), .B(\shield_fsm/n79 ), .Y(
        \shield_fsm/N55 ) );
  NOR2X1 \shield_fsm/U71  ( .A(\shield_fsm/state[1] ), .B(\shield_fsm/n77 ), 
        .Y(\shield_fsm/n76 ) );
  AOI22X1 \shield_fsm/U70  ( .A(\shield_fsm/n76 ), .B(\shield_fsm/state[0] ), 
        .C(\shield_fsm/state[1] ), .D(n239), .Y(\shield_fsm/n75 ) );
  NOR2X1 \shield_fsm/U69  ( .A(n82), .B(\shield_fsm/n75 ), .Y(\shield_fsm/N56 ) );
  NOR2X1 \shield_fsm/U68  ( .A(n82), .B(\shield_fsm/n69 ), .Y(\shield_fsm/N96 ) );
  NOR2X1 \shield_fsm/U67  ( .A(\shield_fsm/n69 ), .B(n238), .Y(
        \shield_fsm/N97 ) );
  OAI21X1 \shield_fsm/U66  ( .A(n225), .B(\shield_fsm/n69 ), .C(
        \shield_fsm/n73 ), .Y(\shield_fsm/n70 ) );
  NAND3X1 \shield_fsm/U65  ( .A(\shield_fsm/n70 ), .B(n241), .C(n237), .Y(
        \shield_fsm/n68 ) );
  OAI21X1 \shield_fsm/U64  ( .A(n241), .B(\shield_fsm/n70 ), .C(
        \shield_fsm/n68 ), .Y(\shield_fsm/n72 ) );
  OR2X1 \shield_fsm/U63  ( .A(\shield_fsm/n71 ), .B(\shield_fsm/n72 ), .Y(
        \shield_fsm/n98 ) );
  OAI21X1 \shield_fsm/U62  ( .A(\shield_fsm/n69 ), .B(n241), .C(
        \shield_fsm/n70 ), .Y(\shield_fsm/n67 ) );
  AOI22X1 \shield_fsm/U61  ( .A(shield_hp[1]), .B(\shield_fsm/n67 ), .C(n156), 
        .D(n240), .Y(\shield_fsm/n66 ) );
  NAND2X1 \shield_fsm/U60  ( .A(\shield_fsm/n66 ), .B(n157), .Y(
        \shield_fsm/n97 ) );
  OAI21X1 \shield_fsm/U59  ( .A(\shield_fsm/N110 ), .B(n236), .C(n157), .Y(
        \shield_fsm/n96 ) );
  OAI21X1 \shield_fsm/U58  ( .A(\shield_fsm/N110 ), .B(n235), .C(n157), .Y(
        \shield_fsm/n95 ) );
  OAI21X1 \shield_fsm/U57  ( .A(\shield_fsm/N110 ), .B(n232), .C(n157), .Y(
        \shield_fsm/n94 ) );
  OAI21X1 \shield_fsm/U56  ( .A(\shield_fsm/N110 ), .B(n229), .C(n157), .Y(
        \shield_fsm/n93 ) );
  NAND2X1 \shield_fsm/U55  ( .A(n237), .B(n77), .Y(\shield_fsm/n64 ) );
  NAND2X1 \shield_fsm/U54  ( .A(invaderbullet_shield_collision_signal), .B(
        \shield_fsm/n50 ), .Y(\shield_fsm/n65 ) );
  OAI21X1 \shield_fsm/U53  ( .A(n225), .B(\shield_fsm/n64 ), .C(
        \shield_fsm/n65 ), .Y(\shield_fsm/n92 ) );
  NAND3X1 \shield_fsm/U52  ( .A(\shield_fsm/N34 ), .B(n158), .C(
        \shield_fsm/N42 ), .Y(\shield_fsm/n61 ) );
  NAND2X1 \shield_fsm/U50  ( .A(n427), .B(shield_hp[1]), .Y(\shield_fsm/n62 )
         );
  OR2X1 \shield_fsm/U49  ( .A(\shield_fsm/n61 ), .B(\shield_fsm/n62 ), .Y(
        \shield_fsm/n51 ) );
  NOR2X1 \shield_fsm/U46  ( .A(player_bullet_coord_y[5]), .B(
        player_bullet_coord_y[4]), .Y(\shield_fsm/n54 ) );
  XOR2X1 \shield_fsm/U45  ( .A(n236), .B(player_bullet_coord_y[2]), .Y(
        \shield_fsm/n55 ) );
  NOR2X1 \shield_fsm/U42  ( .A(n431), .B(player_bullet_coord_y[1]), .Y(
        \shield_fsm/n56 ) );
  NAND3X1 \shield_fsm/U41  ( .A(\shield_fsm/n54 ), .B(\shield_fsm/n55 ), .C(
        \shield_fsm/n56 ), .Y(\shield_fsm/n52 ) );
  NAND2X1 \shield_fsm/U40  ( .A(playerbullet_shield_collision_signal), .B(
        \shield_fsm/n50 ), .Y(\shield_fsm/n53 ) );
  OAI21X1 \shield_fsm/U39  ( .A(\shield_fsm/n51 ), .B(\shield_fsm/n52 ), .C(
        \shield_fsm/n53 ), .Y(\shield_fsm/n91 ) );
  NAND2X1 \shield_fsm/U38  ( .A(shield_display), .B(\shield_fsm/n50 ), .Y(
        \shield_fsm/n48 ) );
  OAI21X1 \shield_fsm/U37  ( .A(shield_hp[1]), .B(n225), .C(n237), .Y(
        \shield_fsm/n49 ) );
  NAND3X1 \shield_fsm/U36  ( .A(\shield_fsm/n48 ), .B(\shield_fsm/n49 ), .C(
        n157), .Y(\shield_fsm/n90 ) );
  AND2X2 \shield_fsm/U21  ( .A(n157), .B(\shield_fsm/next_state [0]), .Y(
        \shield_fsm/n73 ) );
  AND2X2 \shield_fsm/U20  ( .A(\shield_fsm/n73 ), .B(\shield_fsm/n69 ), .Y(
        \shield_fsm/n50 ) );
  DFFNEGX1 \shield_fsm/playerbullet_shield_collision_reg  ( .D(
        \shield_fsm/n91 ), .CLK(n95), .Q(playerbullet_shield_collision_signal)
         );
  DFFNEGX1 \shield_fsm/shield_display_reg  ( .D(\shield_fsm/n90 ), .CLK(n95), 
        .Q(shield_display) );
  DFFNEGX1 \shield_fsm/invaderbullet_shield_collision_reg  ( .D(
        \shield_fsm/n92 ), .CLK(n95), .Q(invaderbullet_shield_collision_signal) );
  DFFNEGX1 \shield_fsm/shield_coord_x_reg[1]  ( .D(\shield_fsm/n93 ), .CLK(n95), .Q(shield_coord_x[1]) );
  DFFNEGX1 \shield_fsm/shield_coord_x_reg[2]  ( .D(\shield_fsm/n94 ), .CLK(n95), .Q(shield_coord_x[2]) );
  DFFNEGX1 \shield_fsm/shield_coord_x_reg[3]  ( .D(\shield_fsm/n95 ), .CLK(n95), .Q(shield_coord_x[3]) );
  DFFNEGX1 \shield_fsm/shield_coord_y_reg[2]  ( .D(\shield_fsm/n96 ), .CLK(n95), .Q(shield_coord_y[2]) );
  DFFNEGX1 \shield_fsm/state_reg[1]  ( .D(\shield_fsm/N97 ), .CLK(n94), .Q(
        \shield_fsm/state[1] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[1]  ( .D(\shield_fsm/N56 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [1]) );
  DFFNEGX1 \shield_fsm/state_reg[0]  ( .D(\shield_fsm/N96 ), .CLK(n94), .Q(
        \shield_fsm/state[0] ) );
  DFFNEGX1 \shield_fsm/next_state_reg[0]  ( .D(\shield_fsm/N55 ), .CLK(clka), 
        .Q(\shield_fsm/next_state [0]) );
  DFFNEGX1 \shield_fsm/hp_reg[1]  ( .D(\shield_fsm/n97 ), .CLK(n94), .Q(
        shield_hp[1]) );
  DFFNEGX1 \shield_fsm/hp_reg[0]  ( .D(\shield_fsm/n98 ), .CLK(n94), .Q(
        shield_hp[0]) );
  NAND3X1 \invader_fsm_1/U106  ( .A(\invader_fsm_1/N43 ), .B(
        \invader_fsm_1/N35 ), .C(\invader_fsm_1/n100 ), .Y(\invader_fsm_1/n96 ) );
  NAND3X1 \invader_fsm_1/U105  ( .A(n76), .B(n262), .C(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n71 ) );
  NOR2X1 \invader_fsm_1/U104  ( .A(\invader_fsm_1/state[1] ), .B(
        \invader_fsm_1/state[0] ), .Y(\invader_fsm_1/n99 ) );
  NAND3X1 \invader_fsm_1/U103  ( .A(play), .B(n76), .C(\invader_fsm_1/n99 ), 
        .Y(\invader_fsm_1/n98 ) );
  OAI21X1 \invader_fsm_1/U102  ( .A(n243), .B(\invader_fsm_1/n71 ), .C(
        \invader_fsm_1/n98 ), .Y(\invader_fsm_1/N55 ) );
  NAND3X1 \invader_fsm_1/U101  ( .A(n76), .B(n285), .C(
        \invader_fsm_1/state[1] ), .Y(\invader_fsm_1/n97 ) );
  OAI21X1 \invader_fsm_1/U100  ( .A(\invader_fsm_1/n71 ), .B(
        \invader_fsm_1/n96 ), .C(\invader_fsm_1/n97 ), .Y(\invader_fsm_1/N56 )
         );
  NOR2X1 \invader_fsm_1/U99  ( .A(n286), .B(\invader_fsm_1/next_state [1]), 
        .Y(\invader_fsm_1/n69 ) );
  NAND2X1 \invader_fsm_1/U98  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        n129), .Y(\invader_fsm_1/n94 ) );
  OAI21X1 \invader_fsm_1/U97  ( .A(\invader_fsm_1/next_state [1]), .B(
        \invader_fsm_1/next_state [0]), .C(n77), .Y(\invader_fsm_1/n95 ) );
  NAND2X1 \invader_fsm_1/U96  ( .A(\invader_fsm_1/next_state [1]), .B(n286), 
        .Y(\invader_fsm_1/n70 ) );
  NAND2X1 \invader_fsm_1/U95  ( .A(n155), .B(\invader_fsm_1/n70 ), .Y(
        \invader_fsm_1/n90 ) );
  OAI21X1 \invader_fsm_1/U94  ( .A(n284), .B(\invader_fsm_1/n94 ), .C(n154), 
        .Y(\invader_fsm_1/n87 ) );
  AOI22X1 \invader_fsm_1/U93  ( .A(n61), .B(invader_direction), .C(n61), .D(
        n116), .Y(\invader_fsm_1/n93 ) );
  OAI21X1 \invader_fsm_1/U92  ( .A(\invader_fsm_1/n93 ), .B(n284), .C(
        \invader_fsm_1/n70 ), .Y(\invader_fsm_1/n92 ) );
  NAND3X1 \invader_fsm_1/U91  ( .A(\invader_fsm_1/n87 ), .B(n76), .C(
        \invader_fsm_1/n92 ), .Y(\invader_fsm_1/n91 ) );
  OAI21X1 \invader_fsm_1/U90  ( .A(\invader_fsm_1/n87 ), .B(n61), .C(
        \invader_fsm_1/n91 ), .Y(\invader_fsm_1/n117 ) );
  OAI21X1 \invader_fsm_1/U89  ( .A(\invader_fsm_1/n90 ), .B(n281), .C(n155), 
        .Y(\invader_fsm_1/n116 ) );
  NAND2X1 \invader_fsm_1/U88  ( .A(n154), .B(n284), .Y(\invader_fsm_1/n73 ) );
  NAND3X1 \invader_fsm_1/U87  ( .A(n282), .B(n77), .C(\invader_fsm_1/n69 ), 
        .Y(\invader_fsm_1/n89 ) );
  OAI21X1 \invader_fsm_1/U86  ( .A(n282), .B(\invader_fsm_1/n73 ), .C(
        \invader_fsm_1/n89 ), .Y(\invader_fsm_1/n115 ) );
  AOI22X1 \invader_fsm_1/U85  ( .A(\invader_fsm_1/N13 ), .B(invader_direction), 
        .C(n279), .D(n116), .Y(\invader_fsm_1/n88 ) );
  OAI21X1 \invader_fsm_1/U84  ( .A(\invader_fsm_1/n88 ), .B(n284), .C(n155), 
        .Y(\invader_fsm_1/n86 ) );
  AOI22X1 \invader_fsm_1/U83  ( .A(\invader_fsm_1/n86 ), .B(
        \invader_fsm_1/n87 ), .C(invader_1_coord_x[1]), .D(n127), .Y(
        \invader_fsm_1/n85 ) );
  NAND2X1 \invader_fsm_1/U82  ( .A(\invader_fsm_1/next_state [0]), .B(n77), 
        .Y(\invader_fsm_1/n74 ) );
  AOI22X1 \invader_fsm_1/U81  ( .A(\invader_fsm_1/N14 ), .B(invader_direction), 
        .C(\invader_fsm_1/N22 ), .D(n116), .Y(\invader_fsm_1/n82 ) );
  NOR2X1 \invader_fsm_1/U80  ( .A(move_down), .B(\invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n84 ) );
  NAND2X1 \invader_fsm_1/U79  ( .A(\invader_fsm_1/move_interval_toggle ), .B(
        \invader_fsm_1/n84 ), .Y(\invader_fsm_1/n80 ) );
  NAND2X1 \invader_fsm_1/U78  ( .A(invader_1_coord_x[2]), .B(
        \invader_fsm_1/n80 ), .Y(\invader_fsm_1/n83 ) );
  OAI21X1 \invader_fsm_1/U77  ( .A(\invader_fsm_1/n82 ), .B(
        \invader_fsm_1/n80 ), .C(\invader_fsm_1/n83 ), .Y(\invader_fsm_1/n81 )
         );
  OR2X1 \invader_fsm_1/U76  ( .A(\invader_fsm_1/n74 ), .B(\invader_fsm_1/n81 ), 
        .Y(\invader_fsm_1/n114 ) );
  NOR2X1 \invader_fsm_1/U75  ( .A(\invader_fsm_1/n80 ), .B(\invader_fsm_1/n74 ), .Y(\invader_fsm_1/n79 ) );
  NAND2X1 \invader_fsm_1/U74  ( .A(invader_direction), .B(\invader_fsm_1/n79 ), 
        .Y(\invader_fsm_1/n55 ) );
  NOR2X1 \invader_fsm_1/U73  ( .A(\invader_fsm_1/n74 ), .B(n131), .Y(
        \invader_fsm_1/n57 ) );
  AOI22X1 \invader_fsm_1/U72  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/n57 ), .C(n273), .D(\invader_fsm_1/n58 ), .Y(
        \invader_fsm_1/n78 ) );
  OAI21X1 \invader_fsm_1/U71  ( .A(\invader_fsm_1/n55 ), .B(n277), .C(
        \invader_fsm_1/n78 ), .Y(\invader_fsm_1/n113 ) );
  AOI22X1 \invader_fsm_1/U70  ( .A(invader_1_coord_x[4]), .B(
        \invader_fsm_1/n57 ), .C(\invader_fsm_1/N24 ), .D(\invader_fsm_1/n58 ), 
        .Y(\invader_fsm_1/n77 ) );
  OAI21X1 \invader_fsm_1/U69  ( .A(\invader_fsm_1/n55 ), .B(n269), .C(
        \invader_fsm_1/n77 ), .Y(\invader_fsm_1/n112 ) );
  AOI22X1 \invader_fsm_1/U68  ( .A(invader_1_coord_x[5]), .B(
        \invader_fsm_1/n57 ), .C(n264), .D(\invader_fsm_1/n58 ), .Y(
        \invader_fsm_1/n76 ) );
  OAI21X1 \invader_fsm_1/U67  ( .A(\invader_fsm_1/n55 ), .B(n266), .C(
        \invader_fsm_1/n76 ), .Y(\invader_fsm_1/n111 ) );
  NAND3X1 \invader_fsm_1/U66  ( .A(\invader_fsm_1/n73 ), .B(n76), .C(
        \invader_fsm_1/next_state [1]), .Y(\invader_fsm_1/n75 ) );
  OAI21X1 \invader_fsm_1/U65  ( .A(\invader_fsm_1/n73 ), .B(n262), .C(
        \invader_fsm_1/n75 ), .Y(\invader_fsm_1/n110 ) );
  OAI22X1 \invader_fsm_1/U64  ( .A(n285), .B(\invader_fsm_1/n73 ), .C(n153), 
        .D(\invader_fsm_1/n74 ), .Y(\invader_fsm_1/n109 ) );
  NAND2X1 \invader_fsm_1/U63  ( .A(playerbullet_invader_collision_signal_1), 
        .B(n154), .Y(\invader_fsm_1/n72 ) );
  OAI21X1 \invader_fsm_1/U62  ( .A(\invader_fsm_1/n70 ), .B(
        \invader_fsm_1/n71 ), .C(\invader_fsm_1/n72 ), .Y(\invader_fsm_1/n108 ) );
  AOI21X1 \invader_fsm_1/U61  ( .A(\invader_fsm_1/N70 ), .B(
        \invader_fsm_1/n69 ), .C(n283), .Y(\invader_fsm_1/n66 ) );
  OAI21X1 \invader_fsm_1/U60  ( .A(n284), .B(n129), .C(n154), .Y(
        \invader_fsm_1/n59 ) );
  NAND2X1 \invader_fsm_1/U59  ( .A(\invader_fsm_1/n59 ), .B(n77), .Y(
        \invader_fsm_1/n67 ) );
  NAND2X1 \invader_fsm_1/U58  ( .A(\invader_fsm_1/N70 ), .B(n128), .Y(
        \invader_fsm_1/n68 ) );
  OAI21X1 \invader_fsm_1/U57  ( .A(\invader_fsm_1/n66 ), .B(
        \invader_fsm_1/n67 ), .C(\invader_fsm_1/n68 ), .Y(\invader_fsm_1/n107 ) );
  NOR2X1 \invader_fsm_1/U56  ( .A(n284), .B(n128), .Y(\invader_fsm_1/n61 ) );
  AOI22X1 \invader_fsm_1/U55  ( .A(n257), .B(\invader_fsm_1/n61 ), .C(
        invader_1_coord_y[1]), .D(n128), .Y(\invader_fsm_1/n65 ) );
  NAND2X1 \invader_fsm_1/U54  ( .A(\invader_fsm_1/n65 ), .B(n155), .Y(
        \invader_fsm_1/n106 ) );
  AOI22X1 \invader_fsm_1/U53  ( .A(\invader_fsm_1/N72 ), .B(
        \invader_fsm_1/n61 ), .C(invader_1_coord_y[2]), .D(n128), .Y(
        \invader_fsm_1/n64 ) );
  NAND2X1 \invader_fsm_1/U52  ( .A(\invader_fsm_1/n64 ), .B(n154), .Y(
        \invader_fsm_1/n105 ) );
  AOI22X1 \invader_fsm_1/U51  ( .A(\invader_fsm_1/N73 ), .B(
        \invader_fsm_1/n61 ), .C(invader_1_coord_y[3]), .D(n128), .Y(
        \invader_fsm_1/n63 ) );
  NAND2X1 \invader_fsm_1/U50  ( .A(\invader_fsm_1/n63 ), .B(n155), .Y(
        \invader_fsm_1/n104 ) );
  AOI22X1 \invader_fsm_1/U49  ( .A(\invader_fsm_1/N74 ), .B(
        \invader_fsm_1/n61 ), .C(invader_1_coord_y[4]), .D(n128), .Y(
        \invader_fsm_1/n62 ) );
  NAND2X1 \invader_fsm_1/U48  ( .A(\invader_fsm_1/n62 ), .B(n155), .Y(
        \invader_fsm_1/n103 ) );
  NAND3X1 \invader_fsm_1/U47  ( .A(\invader_fsm_1/n61 ), .B(n76), .C(
        \invader_fsm_1/N75 ), .Y(\invader_fsm_1/n60 ) );
  OAI21X1 \invader_fsm_1/U46  ( .A(\invader_fsm_1/n59 ), .B(n246), .C(
        \invader_fsm_1/n60 ), .Y(\invader_fsm_1/n102 ) );
  AOI22X1 \invader_fsm_1/U45  ( .A(invader_outofbounds_signal_1), .B(
        \invader_fsm_1/n57 ), .C(n263), .D(\invader_fsm_1/n58 ), .Y(
        \invader_fsm_1/n56 ) );
  OAI21X1 \invader_fsm_1/U44  ( .A(\invader_fsm_1/n55 ), .B(n640), .C(
        \invader_fsm_1/n56 ), .Y(\invader_fsm_1/n101 ) );
  AND2X2 \invader_fsm_1/U4  ( .A(\invader_fsm_1/N27 ), .B(\invader_fsm_1/N19 ), 
        .Y(\invader_fsm_1/n100 ) );
  AND2X2 \invader_fsm_1/U3  ( .A(\invader_fsm_1/n79 ), .B(n116), .Y(
        \invader_fsm_1/n58 ) );
  DFFNEGX1 \invader_fsm_1/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_1/n101 ), .CLK(n94), .Q(invader_outofbounds_signal_1) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[5]  ( .D(\invader_fsm_1/n102 ), 
        .CLK(n94), .Q(invader_1_coord_y[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[4]  ( .D(\invader_fsm_1/n103 ), 
        .CLK(n94), .Q(invader_1_coord_y[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[3]  ( .D(\invader_fsm_1/n104 ), 
        .CLK(n94), .Q(invader_1_coord_y[3]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[2]  ( .D(\invader_fsm_1/n105 ), 
        .CLK(n94), .Q(invader_1_coord_y[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[1]  ( .D(\invader_fsm_1/n106 ), 
        .CLK(n94), .Q(invader_1_coord_y[1]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_y_reg[0]  ( .D(\invader_fsm_1/n107 ), 
        .CLK(n94), .Q(\invader_fsm_1/N70 ) );
  DFFNEGX1 \invader_fsm_1/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_1/n108 ), .CLK(n94), .Q(
        playerbullet_invader_collision_signal_1) );
  DFFNEGX1 \invader_fsm_1/state_reg[1]  ( .D(\invader_fsm_1/n110 ), .CLK(n94), 
        .Q(\invader_fsm_1/state[1] ) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[5]  ( .D(\invader_fsm_1/n111 ), 
        .CLK(n93), .Q(invader_1_coord_x[5]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[4]  ( .D(\invader_fsm_1/n112 ), 
        .CLK(n93), .Q(invader_1_coord_x[4]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[2]  ( .D(\invader_fsm_1/n114 ), 
        .CLK(n93), .Q(invader_1_coord_x[2]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[1]  ( .D(n115), .CLK(n93), .Q(
        invader_1_coord_x[1]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[3]  ( .D(\invader_fsm_1/n113 ), 
        .CLK(n93), .Q(invader_1_coord_x[3]) );
  DFFNEGX1 \invader_fsm_1/display_reg  ( .D(\invader_fsm_1/n116 ), .CLK(n93), 
        .Q(invader_1_display) );
  DFFNEGX1 \invader_fsm_1/move_interval_toggle_reg  ( .D(\invader_fsm_1/n115 ), 
        .CLK(n93), .Q(\invader_fsm_1/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[1]  ( .D(\invader_fsm_1/N56 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [1]) );
  DFFNEGX1 \invader_fsm_1/state_reg[0]  ( .D(\invader_fsm_1/n109 ), .CLK(n93), 
        .Q(\invader_fsm_1/state[0] ) );
  DFFNEGX1 \invader_fsm_1/next_state_reg[0]  ( .D(\invader_fsm_1/N55 ), .CLK(
        clka), .Q(\invader_fsm_1/next_state [0]) );
  DFFNEGX1 \invader_fsm_1/invader_coord_x_reg[0]  ( .D(\invader_fsm_1/n117 ), 
        .CLK(n93), .Q(\invader_fsm_1/N84 ) );
  NAND3X1 \invader_fsm_2/U106  ( .A(\invader_fsm_2/N43 ), .B(
        \invader_fsm_2/N35 ), .C(\invader_fsm_2/n100 ), .Y(\invader_fsm_2/n96 ) );
  NAND3X1 \invader_fsm_2/U105  ( .A(n76), .B(n306), .C(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n71 ) );
  NOR2X1 \invader_fsm_2/U104  ( .A(\invader_fsm_2/state[1] ), .B(
        \invader_fsm_2/state[0] ), .Y(\invader_fsm_2/n99 ) );
  NAND3X1 \invader_fsm_2/U103  ( .A(play), .B(n77), .C(\invader_fsm_2/n99 ), 
        .Y(\invader_fsm_2/n98 ) );
  OAI21X1 \invader_fsm_2/U102  ( .A(n287), .B(\invader_fsm_2/n71 ), .C(
        \invader_fsm_2/n98 ), .Y(\invader_fsm_2/N55 ) );
  NAND3X1 \invader_fsm_2/U101  ( .A(n76), .B(n329), .C(
        \invader_fsm_2/state[1] ), .Y(\invader_fsm_2/n97 ) );
  OAI21X1 \invader_fsm_2/U100  ( .A(\invader_fsm_2/n71 ), .B(
        \invader_fsm_2/n96 ), .C(\invader_fsm_2/n97 ), .Y(\invader_fsm_2/N56 )
         );
  NOR2X1 \invader_fsm_2/U99  ( .A(n330), .B(\invader_fsm_2/next_state [1]), 
        .Y(\invader_fsm_2/n69 ) );
  NAND2X1 \invader_fsm_2/U98  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        n129), .Y(\invader_fsm_2/n94 ) );
  OAI21X1 \invader_fsm_2/U97  ( .A(\invader_fsm_2/next_state [1]), .B(
        \invader_fsm_2/next_state [0]), .C(n77), .Y(\invader_fsm_2/n95 ) );
  NAND2X1 \invader_fsm_2/U96  ( .A(\invader_fsm_2/next_state [1]), .B(n330), 
        .Y(\invader_fsm_2/n70 ) );
  NAND2X1 \invader_fsm_2/U95  ( .A(n152), .B(\invader_fsm_2/n70 ), .Y(
        \invader_fsm_2/n90 ) );
  OAI21X1 \invader_fsm_2/U94  ( .A(n328), .B(\invader_fsm_2/n94 ), .C(n151), 
        .Y(\invader_fsm_2/n80 ) );
  AOI22X1 \invader_fsm_2/U93  ( .A(n331), .B(invader_direction), .C(n331), .D(
        n116), .Y(\invader_fsm_2/n93 ) );
  OAI21X1 \invader_fsm_2/U92  ( .A(\invader_fsm_2/n93 ), .B(n328), .C(
        \invader_fsm_2/n70 ), .Y(\invader_fsm_2/n92 ) );
  NAND3X1 \invader_fsm_2/U91  ( .A(\invader_fsm_2/n80 ), .B(n77), .C(
        \invader_fsm_2/n92 ), .Y(\invader_fsm_2/n91 ) );
  OAI21X1 \invader_fsm_2/U90  ( .A(\invader_fsm_2/n80 ), .B(n331), .C(
        \invader_fsm_2/n91 ), .Y(\invader_fsm_2/n117 ) );
  OAI21X1 \invader_fsm_2/U89  ( .A(\invader_fsm_2/n90 ), .B(n325), .C(n152), 
        .Y(\invader_fsm_2/n116 ) );
  NAND2X1 \invader_fsm_2/U88  ( .A(n151), .B(n328), .Y(\invader_fsm_2/n73 ) );
  NAND3X1 \invader_fsm_2/U87  ( .A(n326), .B(n76), .C(\invader_fsm_2/n69 ), 
        .Y(\invader_fsm_2/n89 ) );
  OAI21X1 \invader_fsm_2/U86  ( .A(n326), .B(\invader_fsm_2/n73 ), .C(
        \invader_fsm_2/n89 ), .Y(\invader_fsm_2/n115 ) );
  NOR2X1 \invader_fsm_2/U85  ( .A(move_down), .B(\invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n88 ) );
  NAND2X1 \invader_fsm_2/U84  ( .A(\invader_fsm_2/move_interval_toggle ), .B(
        \invader_fsm_2/n88 ), .Y(\invader_fsm_2/n84 ) );
  NAND2X1 \invader_fsm_2/U83  ( .A(\invader_fsm_2/next_state [0]), .B(n77), 
        .Y(\invader_fsm_2/n74 ) );
  NOR2X1 \invader_fsm_2/U82  ( .A(\invader_fsm_2/n84 ), .B(\invader_fsm_2/n74 ), .Y(\invader_fsm_2/n87 ) );
  NAND2X1 \invader_fsm_2/U81  ( .A(invader_direction), .B(\invader_fsm_2/n87 ), 
        .Y(\invader_fsm_2/n55 ) );
  NOR2X1 \invader_fsm_2/U80  ( .A(\invader_fsm_2/n74 ), .B(n130), .Y(
        \invader_fsm_2/n57 ) );
  AOI22X1 \invader_fsm_2/U79  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/n57 ), .C(n323), .D(\invader_fsm_2/n58 ), .Y(
        \invader_fsm_2/n86 ) );
  OAI21X1 \invader_fsm_2/U78  ( .A(\invader_fsm_2/n55 ), .B(n324), .C(
        \invader_fsm_2/n86 ), .Y(\invader_fsm_2/n114 ) );
  AOI22X1 \invader_fsm_2/U77  ( .A(\invader_fsm_2/N14 ), .B(invader_direction), 
        .C(\invader_fsm_2/N22 ), .D(n116), .Y(\invader_fsm_2/n83 ) );
  NAND2X1 \invader_fsm_2/U76  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/n84 ), .Y(\invader_fsm_2/n85 ) );
  OAI21X1 \invader_fsm_2/U75  ( .A(\invader_fsm_2/n83 ), .B(
        \invader_fsm_2/n84 ), .C(\invader_fsm_2/n85 ), .Y(\invader_fsm_2/n82 )
         );
  OR2X1 \invader_fsm_2/U74  ( .A(\invader_fsm_2/n74 ), .B(\invader_fsm_2/n82 ), 
        .Y(\invader_fsm_2/n113 ) );
  AOI22X1 \invader_fsm_2/U73  ( .A(\invader_fsm_2/N15 ), .B(invader_direction), 
        .C(n316), .D(n116), .Y(\invader_fsm_2/n81 ) );
  OAI21X1 \invader_fsm_2/U72  ( .A(\invader_fsm_2/n81 ), .B(n328), .C(n152), 
        .Y(\invader_fsm_2/n79 ) );
  AOI22X1 \invader_fsm_2/U71  ( .A(\invader_fsm_2/n79 ), .B(
        \invader_fsm_2/n80 ), .C(invader_2_coord_x[3]), .D(n125), .Y(
        \invader_fsm_2/n78 ) );
  AOI22X1 \invader_fsm_2/U70  ( .A(invader_2_coord_x[4]), .B(
        \invader_fsm_2/n57 ), .C(\invader_fsm_2/N24 ), .D(\invader_fsm_2/n58 ), 
        .Y(\invader_fsm_2/n77 ) );
  OAI21X1 \invader_fsm_2/U69  ( .A(\invader_fsm_2/n55 ), .B(n313), .C(
        \invader_fsm_2/n77 ), .Y(\invader_fsm_2/n112 ) );
  AOI22X1 \invader_fsm_2/U68  ( .A(invader_2_coord_x[5]), .B(
        \invader_fsm_2/n57 ), .C(n308), .D(\invader_fsm_2/n58 ), .Y(
        \invader_fsm_2/n76 ) );
  OAI21X1 \invader_fsm_2/U67  ( .A(\invader_fsm_2/n55 ), .B(n310), .C(
        \invader_fsm_2/n76 ), .Y(\invader_fsm_2/n111 ) );
  NAND3X1 \invader_fsm_2/U66  ( .A(\invader_fsm_2/n73 ), .B(n76), .C(
        \invader_fsm_2/next_state [1]), .Y(\invader_fsm_2/n75 ) );
  OAI21X1 \invader_fsm_2/U65  ( .A(\invader_fsm_2/n73 ), .B(n306), .C(
        \invader_fsm_2/n75 ), .Y(\invader_fsm_2/n110 ) );
  OAI22X1 \invader_fsm_2/U64  ( .A(n329), .B(\invader_fsm_2/n73 ), .C(n150), 
        .D(\invader_fsm_2/n74 ), .Y(\invader_fsm_2/n109 ) );
  NAND2X1 \invader_fsm_2/U63  ( .A(playerbullet_invader_collision_signal_2), 
        .B(n151), .Y(\invader_fsm_2/n72 ) );
  OAI21X1 \invader_fsm_2/U62  ( .A(\invader_fsm_2/n70 ), .B(
        \invader_fsm_2/n71 ), .C(\invader_fsm_2/n72 ), .Y(\invader_fsm_2/n108 ) );
  AOI21X1 \invader_fsm_2/U61  ( .A(\invader_fsm_2/N70 ), .B(
        \invader_fsm_2/n69 ), .C(n327), .Y(\invader_fsm_2/n66 ) );
  OAI21X1 \invader_fsm_2/U60  ( .A(n328), .B(n129), .C(n151), .Y(
        \invader_fsm_2/n59 ) );
  NAND2X1 \invader_fsm_2/U59  ( .A(\invader_fsm_2/n59 ), .B(n77), .Y(
        \invader_fsm_2/n67 ) );
  NAND2X1 \invader_fsm_2/U58  ( .A(\invader_fsm_2/N70 ), .B(n126), .Y(
        \invader_fsm_2/n68 ) );
  OAI21X1 \invader_fsm_2/U57  ( .A(\invader_fsm_2/n66 ), .B(
        \invader_fsm_2/n67 ), .C(\invader_fsm_2/n68 ), .Y(\invader_fsm_2/n107 ) );
  NOR2X1 \invader_fsm_2/U56  ( .A(n328), .B(n126), .Y(\invader_fsm_2/n61 ) );
  AOI22X1 \invader_fsm_2/U55  ( .A(n301), .B(\invader_fsm_2/n61 ), .C(
        invader_2_coord_y[1]), .D(n126), .Y(\invader_fsm_2/n65 ) );
  NAND2X1 \invader_fsm_2/U54  ( .A(\invader_fsm_2/n65 ), .B(n152), .Y(
        \invader_fsm_2/n106 ) );
  AOI22X1 \invader_fsm_2/U53  ( .A(\invader_fsm_2/N72 ), .B(
        \invader_fsm_2/n61 ), .C(invader_2_coord_y[2]), .D(n126), .Y(
        \invader_fsm_2/n64 ) );
  NAND2X1 \invader_fsm_2/U52  ( .A(\invader_fsm_2/n64 ), .B(n151), .Y(
        \invader_fsm_2/n105 ) );
  AOI22X1 \invader_fsm_2/U51  ( .A(\invader_fsm_2/N73 ), .B(
        \invader_fsm_2/n61 ), .C(invader_2_coord_y[3]), .D(n126), .Y(
        \invader_fsm_2/n63 ) );
  NAND2X1 \invader_fsm_2/U50  ( .A(\invader_fsm_2/n63 ), .B(n152), .Y(
        \invader_fsm_2/n104 ) );
  AOI22X1 \invader_fsm_2/U49  ( .A(\invader_fsm_2/N74 ), .B(
        \invader_fsm_2/n61 ), .C(invader_2_coord_y[4]), .D(n126), .Y(
        \invader_fsm_2/n62 ) );
  NAND2X1 \invader_fsm_2/U48  ( .A(\invader_fsm_2/n62 ), .B(n152), .Y(
        \invader_fsm_2/n103 ) );
  NAND3X1 \invader_fsm_2/U47  ( .A(\invader_fsm_2/n61 ), .B(n77), .C(
        \invader_fsm_2/N75 ), .Y(\invader_fsm_2/n60 ) );
  OAI21X1 \invader_fsm_2/U46  ( .A(\invader_fsm_2/n59 ), .B(n290), .C(
        \invader_fsm_2/n60 ), .Y(\invader_fsm_2/n102 ) );
  AOI22X1 \invader_fsm_2/U45  ( .A(invader_outofbounds_signal_2), .B(
        \invader_fsm_2/n57 ), .C(n307), .D(\invader_fsm_2/n58 ), .Y(
        \invader_fsm_2/n56 ) );
  OAI21X1 \invader_fsm_2/U44  ( .A(\invader_fsm_2/n55 ), .B(n714), .C(
        \invader_fsm_2/n56 ), .Y(\invader_fsm_2/n101 ) );
  AND2X2 \invader_fsm_2/U4  ( .A(\invader_fsm_2/N27 ), .B(\invader_fsm_2/N19 ), 
        .Y(\invader_fsm_2/n100 ) );
  AND2X2 \invader_fsm_2/U3  ( .A(\invader_fsm_2/n87 ), .B(n116), .Y(
        \invader_fsm_2/n58 ) );
  DFFNEGX1 \invader_fsm_2/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_2/n101 ), .CLK(n93), .Q(invader_outofbounds_signal_2) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[5]  ( .D(\invader_fsm_2/n102 ), 
        .CLK(n93), .Q(invader_2_coord_y[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[4]  ( .D(\invader_fsm_2/n103 ), 
        .CLK(n93), .Q(invader_2_coord_y[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[3]  ( .D(\invader_fsm_2/n104 ), 
        .CLK(n93), .Q(invader_2_coord_y[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[2]  ( .D(\invader_fsm_2/n105 ), 
        .CLK(n92), .Q(invader_2_coord_y[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[1]  ( .D(\invader_fsm_2/n106 ), 
        .CLK(n92), .Q(invader_2_coord_y[1]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_y_reg[0]  ( .D(\invader_fsm_2/n107 ), 
        .CLK(n92), .Q(\invader_fsm_2/N70 ) );
  DFFNEGX1 \invader_fsm_2/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_2/n108 ), .CLK(n92), .Q(
        playerbullet_invader_collision_signal_2) );
  DFFNEGX1 \invader_fsm_2/state_reg[1]  ( .D(\invader_fsm_2/n110 ), .CLK(n92), 
        .Q(\invader_fsm_2/state[1] ) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[5]  ( .D(\invader_fsm_2/n111 ), 
        .CLK(n92), .Q(invader_2_coord_x[5]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[4]  ( .D(\invader_fsm_2/n112 ), 
        .CLK(n92), .Q(invader_2_coord_x[4]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[3]  ( .D(n114), .CLK(n92), .Q(
        invader_2_coord_x[3]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[2]  ( .D(\invader_fsm_2/n113 ), 
        .CLK(n92), .Q(invader_2_coord_x[2]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[1]  ( .D(\invader_fsm_2/n114 ), 
        .CLK(n92), .Q(invader_2_coord_x[1]) );
  DFFNEGX1 \invader_fsm_2/display_reg  ( .D(\invader_fsm_2/n116 ), .CLK(n92), 
        .Q(invader_2_display) );
  DFFNEGX1 \invader_fsm_2/move_interval_toggle_reg  ( .D(\invader_fsm_2/n115 ), 
        .CLK(n92), .Q(\invader_fsm_2/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[1]  ( .D(\invader_fsm_2/N56 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [1]) );
  DFFNEGX1 \invader_fsm_2/state_reg[0]  ( .D(\invader_fsm_2/n109 ), .CLK(n92), 
        .Q(\invader_fsm_2/state[0] ) );
  DFFNEGX1 \invader_fsm_2/next_state_reg[0]  ( .D(\invader_fsm_2/N55 ), .CLK(
        clka), .Q(\invader_fsm_2/next_state [0]) );
  DFFNEGX1 \invader_fsm_2/invader_coord_x_reg[0]  ( .D(\invader_fsm_2/n117 ), 
        .CLK(n91), .Q(\invader_fsm_2/N84 ) );
  NAND3X1 \invader_fsm_3/U107  ( .A(\invader_fsm_3/N43 ), .B(
        \invader_fsm_3/N35 ), .C(\invader_fsm_3/n102 ), .Y(\invader_fsm_3/n98 ) );
  NAND3X1 \invader_fsm_3/U106  ( .A(n76), .B(n351), .C(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n72 ) );
  NOR2X1 \invader_fsm_3/U105  ( .A(\invader_fsm_3/state[1] ), .B(
        \invader_fsm_3/state[0] ), .Y(\invader_fsm_3/n101 ) );
  NAND3X1 \invader_fsm_3/U104  ( .A(play), .B(n77), .C(\invader_fsm_3/n101 ), 
        .Y(\invader_fsm_3/n100 ) );
  OAI21X1 \invader_fsm_3/U103  ( .A(n332), .B(\invader_fsm_3/n72 ), .C(
        \invader_fsm_3/n100 ), .Y(\invader_fsm_3/N55 ) );
  NAND3X1 \invader_fsm_3/U102  ( .A(n76), .B(n373), .C(
        \invader_fsm_3/state[1] ), .Y(\invader_fsm_3/n99 ) );
  OAI21X1 \invader_fsm_3/U101  ( .A(\invader_fsm_3/n72 ), .B(
        \invader_fsm_3/n98 ), .C(\invader_fsm_3/n99 ), .Y(\invader_fsm_3/N56 )
         );
  NOR2X1 \invader_fsm_3/U100  ( .A(n374), .B(\invader_fsm_3/next_state [1]), 
        .Y(\invader_fsm_3/n70 ) );
  NAND2X1 \invader_fsm_3/U99  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        n129), .Y(\invader_fsm_3/n96 ) );
  OAI21X1 \invader_fsm_3/U98  ( .A(\invader_fsm_3/next_state [1]), .B(
        \invader_fsm_3/next_state [0]), .C(n77), .Y(\invader_fsm_3/n97 ) );
  NAND2X1 \invader_fsm_3/U97  ( .A(\invader_fsm_3/next_state [1]), .B(n374), 
        .Y(\invader_fsm_3/n71 ) );
  NAND2X1 \invader_fsm_3/U96  ( .A(n148), .B(\invader_fsm_3/n71 ), .Y(
        \invader_fsm_3/n92 ) );
  OAI21X1 \invader_fsm_3/U95  ( .A(n372), .B(\invader_fsm_3/n96 ), .C(n147), 
        .Y(\invader_fsm_3/n80 ) );
  AOI22X1 \invader_fsm_3/U94  ( .A(n54), .B(invader_direction), .C(n54), .D(
        n116), .Y(\invader_fsm_3/n95 ) );
  OAI21X1 \invader_fsm_3/U93  ( .A(\invader_fsm_3/n95 ), .B(n372), .C(
        \invader_fsm_3/n71 ), .Y(\invader_fsm_3/n94 ) );
  NAND3X1 \invader_fsm_3/U92  ( .A(\invader_fsm_3/n80 ), .B(n77), .C(
        \invader_fsm_3/n94 ), .Y(\invader_fsm_3/n93 ) );
  OAI21X1 \invader_fsm_3/U91  ( .A(\invader_fsm_3/n80 ), .B(n54), .C(
        \invader_fsm_3/n93 ), .Y(\invader_fsm_3/n118 ) );
  OAI21X1 \invader_fsm_3/U90  ( .A(\invader_fsm_3/n92 ), .B(n369), .C(n148), 
        .Y(\invader_fsm_3/n117 ) );
  NAND2X1 \invader_fsm_3/U89  ( .A(n147), .B(n372), .Y(\invader_fsm_3/n74 ) );
  NAND3X1 \invader_fsm_3/U88  ( .A(n370), .B(n76), .C(\invader_fsm_3/n70 ), 
        .Y(\invader_fsm_3/n91 ) );
  OAI21X1 \invader_fsm_3/U87  ( .A(n370), .B(\invader_fsm_3/n74 ), .C(
        \invader_fsm_3/n91 ), .Y(\invader_fsm_3/n116 ) );
  AOI22X1 \invader_fsm_3/U86  ( .A(\invader_fsm_3/N13 ), .B(invader_direction), 
        .C(n367), .D(n116), .Y(\invader_fsm_3/n90 ) );
  OAI21X1 \invader_fsm_3/U85  ( .A(\invader_fsm_3/n90 ), .B(n372), .C(n148), 
        .Y(\invader_fsm_3/n89 ) );
  AOI22X1 \invader_fsm_3/U84  ( .A(\invader_fsm_3/n89 ), .B(
        \invader_fsm_3/n80 ), .C(invader_3_coord_x[1]), .D(n123), .Y(
        \invader_fsm_3/n88 ) );
  AOI22X1 \invader_fsm_3/U83  ( .A(\invader_fsm_3/N14 ), .B(invader_direction), 
        .C(\invader_fsm_3/N22 ), .D(n116), .Y(\invader_fsm_3/n87 ) );
  OAI21X1 \invader_fsm_3/U82  ( .A(\invader_fsm_3/n87 ), .B(n372), .C(
        \invader_fsm_3/n71 ), .Y(\invader_fsm_3/n86 ) );
  NAND3X1 \invader_fsm_3/U81  ( .A(\invader_fsm_3/n80 ), .B(n77), .C(
        \invader_fsm_3/n86 ), .Y(\invader_fsm_3/n85 ) );
  OAI21X1 \invader_fsm_3/U80  ( .A(\invader_fsm_3/n80 ), .B(n365), .C(
        \invader_fsm_3/n85 ), .Y(\invader_fsm_3/n115 ) );
  NOR2X1 \invader_fsm_3/U79  ( .A(move_down), .B(\invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n84 ) );
  NAND2X1 \invader_fsm_3/U78  ( .A(\invader_fsm_3/next_state [0]), .B(n77), 
        .Y(\invader_fsm_3/n75 ) );
  NAND3X1 \invader_fsm_3/U77  ( .A(\invader_fsm_3/move_interval_toggle ), .B(
        \invader_fsm_3/n84 ), .C(n149), .Y(\invader_fsm_3/n83 ) );
  OR2X1 \invader_fsm_3/U76  ( .A(n116), .B(\invader_fsm_3/n83 ), .Y(
        \invader_fsm_3/n56 ) );
  AOI21X1 \invader_fsm_3/U75  ( .A(\invader_fsm_3/n84 ), .B(
        \invader_fsm_3/move_interval_toggle ), .C(\invader_fsm_3/n75 ), .Y(
        \invader_fsm_3/n58 ) );
  NOR2X1 \invader_fsm_3/U74  ( .A(\invader_fsm_3/n83 ), .B(invader_direction), 
        .Y(\invader_fsm_3/n59 ) );
  AOI22X1 \invader_fsm_3/U73  ( .A(invader_3_coord_x[3]), .B(
        \invader_fsm_3/n58 ), .C(n361), .D(\invader_fsm_3/n59 ), .Y(
        \invader_fsm_3/n82 ) );
  OAI21X1 \invader_fsm_3/U72  ( .A(\invader_fsm_3/n56 ), .B(n364), .C(
        \invader_fsm_3/n82 ), .Y(\invader_fsm_3/n114 ) );
  AOI22X1 \invader_fsm_3/U71  ( .A(\invader_fsm_3/N16 ), .B(invader_direction), 
        .C(\invader_fsm_3/N24 ), .D(n116), .Y(\invader_fsm_3/n81 ) );
  OAI21X1 \invader_fsm_3/U70  ( .A(\invader_fsm_3/n81 ), .B(n372), .C(n148), 
        .Y(\invader_fsm_3/n79 ) );
  AOI22X1 \invader_fsm_3/U69  ( .A(\invader_fsm_3/n79 ), .B(
        \invader_fsm_3/n80 ), .C(invader_3_coord_x[4]), .D(n123), .Y(
        \invader_fsm_3/n78 ) );
  AOI22X1 \invader_fsm_3/U68  ( .A(invader_3_coord_x[5]), .B(
        \invader_fsm_3/n58 ), .C(n353), .D(\invader_fsm_3/n59 ), .Y(
        \invader_fsm_3/n77 ) );
  OAI21X1 \invader_fsm_3/U67  ( .A(\invader_fsm_3/n56 ), .B(n355), .C(
        \invader_fsm_3/n77 ), .Y(\invader_fsm_3/n113 ) );
  NAND3X1 \invader_fsm_3/U66  ( .A(\invader_fsm_3/n74 ), .B(n76), .C(
        \invader_fsm_3/next_state [1]), .Y(\invader_fsm_3/n76 ) );
  OAI21X1 \invader_fsm_3/U65  ( .A(\invader_fsm_3/n74 ), .B(n351), .C(
        \invader_fsm_3/n76 ), .Y(\invader_fsm_3/n112 ) );
  OAI22X1 \invader_fsm_3/U64  ( .A(n373), .B(\invader_fsm_3/n74 ), .C(n146), 
        .D(\invader_fsm_3/n75 ), .Y(\invader_fsm_3/n111 ) );
  NAND2X1 \invader_fsm_3/U63  ( .A(playerbullet_invader_collision_signal_3), 
        .B(n147), .Y(\invader_fsm_3/n73 ) );
  OAI21X1 \invader_fsm_3/U62  ( .A(\invader_fsm_3/n71 ), .B(
        \invader_fsm_3/n72 ), .C(\invader_fsm_3/n73 ), .Y(\invader_fsm_3/n110 ) );
  AOI21X1 \invader_fsm_3/U61  ( .A(\invader_fsm_3/N70 ), .B(
        \invader_fsm_3/n70 ), .C(n371), .Y(\invader_fsm_3/n67 ) );
  OAI21X1 \invader_fsm_3/U60  ( .A(n372), .B(n129), .C(n147), .Y(
        \invader_fsm_3/n60 ) );
  NAND2X1 \invader_fsm_3/U59  ( .A(\invader_fsm_3/n60 ), .B(n77), .Y(
        \invader_fsm_3/n68 ) );
  NAND2X1 \invader_fsm_3/U58  ( .A(\invader_fsm_3/N70 ), .B(n124), .Y(
        \invader_fsm_3/n69 ) );
  OAI21X1 \invader_fsm_3/U57  ( .A(\invader_fsm_3/n67 ), .B(
        \invader_fsm_3/n68 ), .C(\invader_fsm_3/n69 ), .Y(\invader_fsm_3/n109 ) );
  NOR2X1 \invader_fsm_3/U56  ( .A(n372), .B(n124), .Y(\invader_fsm_3/n62 ) );
  AOI22X1 \invader_fsm_3/U55  ( .A(n346), .B(\invader_fsm_3/n62 ), .C(
        invader_3_coord_y[1]), .D(n124), .Y(\invader_fsm_3/n66 ) );
  NAND2X1 \invader_fsm_3/U54  ( .A(\invader_fsm_3/n66 ), .B(n148), .Y(
        \invader_fsm_3/n108 ) );
  AOI22X1 \invader_fsm_3/U53  ( .A(\invader_fsm_3/N72 ), .B(
        \invader_fsm_3/n62 ), .C(invader_3_coord_y[2]), .D(n124), .Y(
        \invader_fsm_3/n65 ) );
  NAND2X1 \invader_fsm_3/U52  ( .A(\invader_fsm_3/n65 ), .B(n147), .Y(
        \invader_fsm_3/n107 ) );
  AOI22X1 \invader_fsm_3/U51  ( .A(\invader_fsm_3/N73 ), .B(
        \invader_fsm_3/n62 ), .C(invader_3_coord_y[3]), .D(n124), .Y(
        \invader_fsm_3/n64 ) );
  NAND2X1 \invader_fsm_3/U50  ( .A(\invader_fsm_3/n64 ), .B(n148), .Y(
        \invader_fsm_3/n106 ) );
  AOI22X1 \invader_fsm_3/U49  ( .A(\invader_fsm_3/N74 ), .B(
        \invader_fsm_3/n62 ), .C(invader_3_coord_y[4]), .D(n124), .Y(
        \invader_fsm_3/n63 ) );
  NAND2X1 \invader_fsm_3/U48  ( .A(\invader_fsm_3/n63 ), .B(n148), .Y(
        \invader_fsm_3/n105 ) );
  NAND3X1 \invader_fsm_3/U47  ( .A(\invader_fsm_3/n62 ), .B(n77), .C(
        \invader_fsm_3/N75 ), .Y(\invader_fsm_3/n61 ) );
  OAI21X1 \invader_fsm_3/U46  ( .A(\invader_fsm_3/n60 ), .B(n335), .C(
        \invader_fsm_3/n61 ), .Y(\invader_fsm_3/n104 ) );
  AOI22X1 \invader_fsm_3/U45  ( .A(invader_outofbounds_signal_3), .B(
        \invader_fsm_3/n58 ), .C(n352), .D(\invader_fsm_3/n59 ), .Y(
        \invader_fsm_3/n57 ) );
  OAI21X1 \invader_fsm_3/U44  ( .A(\invader_fsm_3/n56 ), .B(n788), .C(
        \invader_fsm_3/n57 ), .Y(\invader_fsm_3/n103 ) );
  AND2X2 \invader_fsm_3/U3  ( .A(\invader_fsm_3/N27 ), .B(\invader_fsm_3/N19 ), 
        .Y(\invader_fsm_3/n102 ) );
  DFFNEGX1 \invader_fsm_3/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_3/n103 ), .CLK(n91), .Q(invader_outofbounds_signal_3) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[5]  ( .D(\invader_fsm_3/n104 ), 
        .CLK(n91), .Q(invader_3_coord_y[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[4]  ( .D(\invader_fsm_3/n105 ), 
        .CLK(n91), .Q(invader_3_coord_y[4]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[3]  ( .D(\invader_fsm_3/n106 ), 
        .CLK(n91), .Q(invader_3_coord_y[3]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[2]  ( .D(\invader_fsm_3/n107 ), 
        .CLK(n91), .Q(invader_3_coord_y[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[1]  ( .D(\invader_fsm_3/n108 ), 
        .CLK(n91), .Q(invader_3_coord_y[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_y_reg[0]  ( .D(\invader_fsm_3/n109 ), 
        .CLK(n91), .Q(\invader_fsm_3/N70 ) );
  DFFNEGX1 \invader_fsm_3/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_3/n110 ), .CLK(n91), .Q(
        playerbullet_invader_collision_signal_3) );
  DFFNEGX1 \invader_fsm_3/state_reg[1]  ( .D(\invader_fsm_3/n112 ), .CLK(n91), 
        .Q(\invader_fsm_3/state[1] ) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[5]  ( .D(\invader_fsm_3/n113 ), 
        .CLK(n91), .Q(invader_3_coord_x[5]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[4]  ( .D(n113), .CLK(n91), .Q(
        invader_3_coord_x[4]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[2]  ( .D(\invader_fsm_3/n115 ), 
        .CLK(n91), .Q(invader_3_coord_x[2]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[1]  ( .D(n112), .CLK(n90), .Q(
        invader_3_coord_x[1]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[3]  ( .D(\invader_fsm_3/n114 ), 
        .CLK(n90), .Q(invader_3_coord_x[3]) );
  DFFNEGX1 \invader_fsm_3/display_reg  ( .D(\invader_fsm_3/n117 ), .CLK(n90), 
        .Q(invader_3_display) );
  DFFNEGX1 \invader_fsm_3/move_interval_toggle_reg  ( .D(\invader_fsm_3/n116 ), 
        .CLK(n90), .Q(\invader_fsm_3/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[1]  ( .D(\invader_fsm_3/N56 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [1]) );
  DFFNEGX1 \invader_fsm_3/state_reg[0]  ( .D(\invader_fsm_3/n111 ), .CLK(n90), 
        .Q(\invader_fsm_3/state[0] ) );
  DFFNEGX1 \invader_fsm_3/next_state_reg[0]  ( .D(\invader_fsm_3/N55 ), .CLK(
        clka), .Q(\invader_fsm_3/next_state [0]) );
  DFFNEGX1 \invader_fsm_3/invader_coord_x_reg[0]  ( .D(\invader_fsm_3/n118 ), 
        .CLK(n90), .Q(\invader_fsm_3/N84 ) );
  NAND3X1 \invader_fsm_4/U107  ( .A(\invader_fsm_4/N43 ), .B(
        \invader_fsm_4/N35 ), .C(\invader_fsm_4/n102 ), .Y(\invader_fsm_4/n98 ) );
  NAND3X1 \invader_fsm_4/U106  ( .A(n76), .B(n394), .C(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n72 ) );
  NOR2X1 \invader_fsm_4/U105  ( .A(\invader_fsm_4/state[1] ), .B(
        \invader_fsm_4/state[0] ), .Y(\invader_fsm_4/n101 ) );
  NAND3X1 \invader_fsm_4/U104  ( .A(play), .B(n76), .C(\invader_fsm_4/n101 ), 
        .Y(\invader_fsm_4/n100 ) );
  OAI21X1 \invader_fsm_4/U103  ( .A(n375), .B(\invader_fsm_4/n72 ), .C(
        \invader_fsm_4/n100 ), .Y(\invader_fsm_4/N55 ) );
  NAND3X1 \invader_fsm_4/U102  ( .A(n76), .B(n416), .C(
        \invader_fsm_4/state[1] ), .Y(\invader_fsm_4/n99 ) );
  OAI21X1 \invader_fsm_4/U101  ( .A(\invader_fsm_4/n72 ), .B(
        \invader_fsm_4/n98 ), .C(\invader_fsm_4/n99 ), .Y(\invader_fsm_4/N56 )
         );
  NOR2X1 \invader_fsm_4/U100  ( .A(n417), .B(\invader_fsm_4/next_state [1]), 
        .Y(\invader_fsm_4/n70 ) );
  NAND2X1 \invader_fsm_4/U99  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        n129), .Y(\invader_fsm_4/n96 ) );
  OAI21X1 \invader_fsm_4/U98  ( .A(\invader_fsm_4/next_state [1]), .B(
        \invader_fsm_4/next_state [0]), .C(n77), .Y(\invader_fsm_4/n97 ) );
  NAND2X1 \invader_fsm_4/U97  ( .A(\invader_fsm_4/next_state [1]), .B(n417), 
        .Y(\invader_fsm_4/n71 ) );
  NAND2X1 \invader_fsm_4/U96  ( .A(n144), .B(\invader_fsm_4/n71 ), .Y(
        \invader_fsm_4/n92 ) );
  OAI21X1 \invader_fsm_4/U95  ( .A(n415), .B(\invader_fsm_4/n96 ), .C(n143), 
        .Y(\invader_fsm_4/n80 ) );
  AOI22X1 \invader_fsm_4/U94  ( .A(n418), .B(invader_direction), .C(n418), .D(
        n116), .Y(\invader_fsm_4/n95 ) );
  OAI21X1 \invader_fsm_4/U93  ( .A(\invader_fsm_4/n95 ), .B(n415), .C(
        \invader_fsm_4/n71 ), .Y(\invader_fsm_4/n94 ) );
  NAND3X1 \invader_fsm_4/U92  ( .A(\invader_fsm_4/n80 ), .B(n76), .C(
        \invader_fsm_4/n94 ), .Y(\invader_fsm_4/n93 ) );
  OAI21X1 \invader_fsm_4/U91  ( .A(\invader_fsm_4/n80 ), .B(n418), .C(
        \invader_fsm_4/n93 ), .Y(\invader_fsm_4/n118 ) );
  OAI21X1 \invader_fsm_4/U90  ( .A(\invader_fsm_4/n92 ), .B(n412), .C(n144), 
        .Y(\invader_fsm_4/n117 ) );
  NAND2X1 \invader_fsm_4/U89  ( .A(n143), .B(n415), .Y(\invader_fsm_4/n74 ) );
  NAND3X1 \invader_fsm_4/U88  ( .A(n413), .B(n76), .C(\invader_fsm_4/n70 ), 
        .Y(\invader_fsm_4/n91 ) );
  OAI21X1 \invader_fsm_4/U87  ( .A(n413), .B(\invader_fsm_4/n74 ), .C(
        \invader_fsm_4/n91 ), .Y(\invader_fsm_4/n116 ) );
  NOR2X1 \invader_fsm_4/U86  ( .A(move_down), .B(\invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n90 ) );
  NAND2X1 \invader_fsm_4/U85  ( .A(\invader_fsm_4/next_state [0]), .B(n77), 
        .Y(\invader_fsm_4/n75 ) );
  NAND3X1 \invader_fsm_4/U84  ( .A(\invader_fsm_4/move_interval_toggle ), .B(
        \invader_fsm_4/n90 ), .C(n145), .Y(\invader_fsm_4/n89 ) );
  OR2X1 \invader_fsm_4/U83  ( .A(n116), .B(\invader_fsm_4/n89 ), .Y(
        \invader_fsm_4/n56 ) );
  AOI21X1 \invader_fsm_4/U82  ( .A(\invader_fsm_4/n90 ), .B(
        \invader_fsm_4/move_interval_toggle ), .C(\invader_fsm_4/n75 ), .Y(
        \invader_fsm_4/n58 ) );
  NOR2X1 \invader_fsm_4/U81  ( .A(\invader_fsm_4/n89 ), .B(invader_direction), 
        .Y(\invader_fsm_4/n59 ) );
  AOI22X1 \invader_fsm_4/U80  ( .A(invader_4_coord_x[1]), .B(
        \invader_fsm_4/n58 ), .C(n410), .D(\invader_fsm_4/n59 ), .Y(
        \invader_fsm_4/n88 ) );
  OAI21X1 \invader_fsm_4/U79  ( .A(\invader_fsm_4/n56 ), .B(n411), .C(
        \invader_fsm_4/n88 ), .Y(\invader_fsm_4/n115 ) );
  AOI22X1 \invader_fsm_4/U78  ( .A(\invader_fsm_4/N14 ), .B(invader_direction), 
        .C(\invader_fsm_4/N22 ), .D(n116), .Y(\invader_fsm_4/n87 ) );
  OAI21X1 \invader_fsm_4/U77  ( .A(\invader_fsm_4/n87 ), .B(n415), .C(
        \invader_fsm_4/n71 ), .Y(\invader_fsm_4/n86 ) );
  NAND3X1 \invader_fsm_4/U76  ( .A(\invader_fsm_4/n80 ), .B(n76), .C(
        \invader_fsm_4/n86 ), .Y(\invader_fsm_4/n85 ) );
  OAI21X1 \invader_fsm_4/U75  ( .A(\invader_fsm_4/n80 ), .B(n408), .C(
        \invader_fsm_4/n85 ), .Y(\invader_fsm_4/n114 ) );
  AOI22X1 \invader_fsm_4/U74  ( .A(\invader_fsm_4/N15 ), .B(invader_direction), 
        .C(n403), .D(n116), .Y(\invader_fsm_4/n84 ) );
  OAI21X1 \invader_fsm_4/U73  ( .A(\invader_fsm_4/n84 ), .B(n415), .C(n144), 
        .Y(\invader_fsm_4/n83 ) );
  AOI22X1 \invader_fsm_4/U72  ( .A(\invader_fsm_4/n83 ), .B(
        \invader_fsm_4/n80 ), .C(invader_4_coord_x[3]), .D(n121), .Y(
        \invader_fsm_4/n82 ) );
  AOI22X1 \invader_fsm_4/U71  ( .A(\invader_fsm_4/N16 ), .B(invader_direction), 
        .C(\invader_fsm_4/N24 ), .D(n116), .Y(\invader_fsm_4/n81 ) );
  OAI21X1 \invader_fsm_4/U70  ( .A(\invader_fsm_4/n81 ), .B(n415), .C(n144), 
        .Y(\invader_fsm_4/n79 ) );
  AOI22X1 \invader_fsm_4/U69  ( .A(\invader_fsm_4/n79 ), .B(
        \invader_fsm_4/n80 ), .C(invader_4_coord_x[4]), .D(n121), .Y(
        \invader_fsm_4/n78 ) );
  AOI22X1 \invader_fsm_4/U68  ( .A(invader_4_coord_x[5]), .B(
        \invader_fsm_4/n58 ), .C(n396), .D(\invader_fsm_4/n59 ), .Y(
        \invader_fsm_4/n77 ) );
  OAI21X1 \invader_fsm_4/U67  ( .A(\invader_fsm_4/n56 ), .B(n398), .C(
        \invader_fsm_4/n77 ), .Y(\invader_fsm_4/n113 ) );
  NAND3X1 \invader_fsm_4/U66  ( .A(\invader_fsm_4/n74 ), .B(n77), .C(
        \invader_fsm_4/next_state [1]), .Y(\invader_fsm_4/n76 ) );
  OAI21X1 \invader_fsm_4/U65  ( .A(\invader_fsm_4/n74 ), .B(n394), .C(
        \invader_fsm_4/n76 ), .Y(\invader_fsm_4/n112 ) );
  OAI22X1 \invader_fsm_4/U64  ( .A(n416), .B(\invader_fsm_4/n74 ), .C(n142), 
        .D(\invader_fsm_4/n75 ), .Y(\invader_fsm_4/n111 ) );
  NAND2X1 \invader_fsm_4/U63  ( .A(playerbullet_invader_collision_signal_4), 
        .B(n143), .Y(\invader_fsm_4/n73 ) );
  OAI21X1 \invader_fsm_4/U62  ( .A(\invader_fsm_4/n71 ), .B(
        \invader_fsm_4/n72 ), .C(\invader_fsm_4/n73 ), .Y(\invader_fsm_4/n110 ) );
  AOI21X1 \invader_fsm_4/U61  ( .A(\invader_fsm_4/N70 ), .B(
        \invader_fsm_4/n70 ), .C(n414), .Y(\invader_fsm_4/n67 ) );
  OAI21X1 \invader_fsm_4/U60  ( .A(n415), .B(n129), .C(n143), .Y(
        \invader_fsm_4/n60 ) );
  NAND2X1 \invader_fsm_4/U59  ( .A(\invader_fsm_4/n60 ), .B(n77), .Y(
        \invader_fsm_4/n68 ) );
  NAND2X1 \invader_fsm_4/U58  ( .A(\invader_fsm_4/N70 ), .B(n122), .Y(
        \invader_fsm_4/n69 ) );
  OAI21X1 \invader_fsm_4/U57  ( .A(\invader_fsm_4/n67 ), .B(
        \invader_fsm_4/n68 ), .C(\invader_fsm_4/n69 ), .Y(\invader_fsm_4/n109 ) );
  NOR2X1 \invader_fsm_4/U56  ( .A(n415), .B(n122), .Y(\invader_fsm_4/n62 ) );
  AOI22X1 \invader_fsm_4/U55  ( .A(n389), .B(\invader_fsm_4/n62 ), .C(
        invader_4_coord_y[1]), .D(n122), .Y(\invader_fsm_4/n66 ) );
  NAND2X1 \invader_fsm_4/U54  ( .A(\invader_fsm_4/n66 ), .B(n144), .Y(
        \invader_fsm_4/n108 ) );
  AOI22X1 \invader_fsm_4/U53  ( .A(\invader_fsm_4/N72 ), .B(
        \invader_fsm_4/n62 ), .C(invader_4_coord_y[2]), .D(n122), .Y(
        \invader_fsm_4/n65 ) );
  NAND2X1 \invader_fsm_4/U52  ( .A(\invader_fsm_4/n65 ), .B(n143), .Y(
        \invader_fsm_4/n107 ) );
  AOI22X1 \invader_fsm_4/U51  ( .A(\invader_fsm_4/N73 ), .B(
        \invader_fsm_4/n62 ), .C(invader_4_coord_y[3]), .D(n122), .Y(
        \invader_fsm_4/n64 ) );
  NAND2X1 \invader_fsm_4/U50  ( .A(\invader_fsm_4/n64 ), .B(n144), .Y(
        \invader_fsm_4/n106 ) );
  AOI22X1 \invader_fsm_4/U49  ( .A(\invader_fsm_4/N74 ), .B(
        \invader_fsm_4/n62 ), .C(invader_4_coord_y[4]), .D(n122), .Y(
        \invader_fsm_4/n63 ) );
  NAND2X1 \invader_fsm_4/U48  ( .A(\invader_fsm_4/n63 ), .B(n144), .Y(
        \invader_fsm_4/n105 ) );
  NAND3X1 \invader_fsm_4/U47  ( .A(\invader_fsm_4/n62 ), .B(n76), .C(
        \invader_fsm_4/N75 ), .Y(\invader_fsm_4/n61 ) );
  OAI21X1 \invader_fsm_4/U46  ( .A(\invader_fsm_4/n60 ), .B(n378), .C(
        \invader_fsm_4/n61 ), .Y(\invader_fsm_4/n104 ) );
  AOI22X1 \invader_fsm_4/U45  ( .A(invader_outofbounds_signal_4), .B(
        \invader_fsm_4/n58 ), .C(n395), .D(\invader_fsm_4/n59 ), .Y(
        \invader_fsm_4/n57 ) );
  OAI21X1 \invader_fsm_4/U44  ( .A(\invader_fsm_4/n56 ), .B(n862), .C(
        \invader_fsm_4/n57 ), .Y(\invader_fsm_4/n103 ) );
  AND2X2 \invader_fsm_4/U3  ( .A(\invader_fsm_4/N27 ), .B(\invader_fsm_4/N19 ), 
        .Y(\invader_fsm_4/n102 ) );
  DFFNEGX1 \invader_fsm_4/invader_outofbounds_signal_reg  ( .D(
        \invader_fsm_4/n103 ), .CLK(n90), .Q(invader_outofbounds_signal_4) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[5]  ( .D(\invader_fsm_4/n104 ), 
        .CLK(n90), .Q(invader_4_coord_y[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[4]  ( .D(\invader_fsm_4/n105 ), 
        .CLK(n90), .Q(invader_4_coord_y[4]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[3]  ( .D(\invader_fsm_4/n106 ), 
        .CLK(n90), .Q(invader_4_coord_y[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[2]  ( .D(\invader_fsm_4/n107 ), 
        .CLK(n90), .Q(invader_4_coord_y[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[1]  ( .D(\invader_fsm_4/n108 ), 
        .CLK(n90), .Q(invader_4_coord_y[1]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_y_reg[0]  ( .D(\invader_fsm_4/n109 ), 
        .CLK(n90), .Q(\invader_fsm_4/N70 ) );
  DFFNEGX1 \invader_fsm_4/playerbullet_invader_collision_signal_reg  ( .D(
        \invader_fsm_4/n110 ), .CLK(n89), .Q(
        playerbullet_invader_collision_signal_4) );
  DFFNEGX1 \invader_fsm_4/state_reg[1]  ( .D(\invader_fsm_4/n112 ), .CLK(n89), 
        .Q(\invader_fsm_4/state[1] ) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[5]  ( .D(\invader_fsm_4/n113 ), 
        .CLK(n89), .Q(invader_4_coord_x[5]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[4]  ( .D(n111), .CLK(n89), .Q(
        invader_4_coord_x[4]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[3]  ( .D(n110), .CLK(n89), .Q(
        invader_4_coord_x[3]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[2]  ( .D(\invader_fsm_4/n114 ), 
        .CLK(n89), .Q(invader_4_coord_x[2]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[1]  ( .D(\invader_fsm_4/n115 ), 
        .CLK(n89), .Q(invader_4_coord_x[1]) );
  DFFNEGX1 \invader_fsm_4/display_reg  ( .D(\invader_fsm_4/n117 ), .CLK(n89), 
        .Q(invader_4_display) );
  DFFNEGX1 \invader_fsm_4/move_interval_toggle_reg  ( .D(\invader_fsm_4/n116 ), 
        .CLK(n89), .Q(\invader_fsm_4/move_interval_toggle ) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[1]  ( .D(\invader_fsm_4/N56 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [1]) );
  DFFNEGX1 \invader_fsm_4/state_reg[0]  ( .D(\invader_fsm_4/n111 ), .CLK(n89), 
        .Q(\invader_fsm_4/state[0] ) );
  DFFNEGX1 \invader_fsm_4/next_state_reg[0]  ( .D(\invader_fsm_4/N55 ), .CLK(
        clka), .Q(\invader_fsm_4/next_state [0]) );
  DFFNEGX1 \invader_fsm_4/invader_coord_x_reg[0]  ( .D(\invader_fsm_4/n118 ), 
        .CLK(n89), .Q(\invader_fsm_4/N84 ) );
  NOR2X1 \player_bullet_fsm/U59  ( .A(n425), .B(n429), .Y(
        \player_bullet_fsm/n47 ) );
  NOR2X1 \player_bullet_fsm/U58  ( .A(playerbullet_shield_collision_signal), 
        .B(playerbullet_invader_collision_signal), .Y(\player_bullet_fsm/n48 )
         );
  AOI22X1 \player_bullet_fsm/U57  ( .A(\player_bullet_fsm/n47 ), .B(
        \player_bullet_fsm/n48 ), .C(playerbullet_fire), .D(n429), .Y(
        \player_bullet_fsm/n45 ) );
  NOR2X1 \player_bullet_fsm/U55  ( .A(\player_bullet_fsm/n45 ), .B(n79), .Y(
        \player_bullet_fsm/N15 ) );
  OAI21X1 \player_bullet_fsm/U50  ( .A(n430), .B(n424), .C(n77), .Y(
        \player_bullet_fsm/n42 ) );
  NOR2X1 \player_bullet_fsm/U37  ( .A(\player_bullet_fsm/n30 ), .B(n81), .Y(
        \player_bullet_fsm/n29 ) );
  AOI22X1 \player_bullet_fsm/U36  ( .A(player_coord_x[5]), .B(
        \player_bullet_fsm/n29 ), .C(player_bullet_coord_x[5]), .D(
        \player_bullet_fsm/n30 ), .Y(\player_bullet_fsm/n35 ) );
  OAI21X1 \player_bullet_fsm/U35  ( .A(n943), .B(n78), .C(n132), .Y(
        \player_bullet_fsm/n34 ) );
  OAI21X1 \player_bullet_fsm/U34  ( .A(n132), .B(n50), .C(
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
  DFFNEGX1 \player_bullet_fsm/display_reg  ( .D(n5), .CLK(n89), .Q(
        player_bullet_display) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[0]  ( .D(n137), .CLK(
        n89), .Q(\shield_fsm/N35 ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[1]  ( .D(n136), .CLK(
        n88), .Q(player_bullet_coord_x[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[2]  ( .D(n135), .CLK(
        n88), .Q(player_bullet_coord_x[2]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[3]  ( .D(n134), .CLK(
        n88), .Q(player_bullet_coord_x[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[4]  ( .D(
        \player_bullet_fsm/n50 ), .CLK(n88), .Q(player_bullet_coord_x[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_x_reg[5]  ( .D(n133), .CLK(
        n88), .Q(player_bullet_coord_x[5]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[1]  ( .D(n40), .CLK(
        n88), .Q(player_bullet_coord_y[1]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[4]  ( .D(n44), .CLK(
        n88), .Q(player_bullet_coord_y[4]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[3]  ( .D(n43), .CLK(
        n88), .Q(player_bullet_coord_y[3]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[2]  ( .D(n42), .CLK(
        n88), .Q(player_bullet_coord_y[2]) );
  DFFNEGX1 \player_bullet_fsm/state_reg[0]  ( .D(n5), .CLK(n88), .Q(
        playerbullet_state[0]) );
  DFFNEGX1 \player_bullet_fsm/next_state_reg[0]  ( .D(\player_bullet_fsm/N15 ), 
        .CLK(clka), .Q(\player_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[5]  ( .D(n41), .CLK(
        n88), .Q(player_bullet_coord_y[5]) );
  DFFNEGX1 \player_bullet_fsm/player_bullet_coord_y_reg[0]  ( .D(n39), .CLK(
        n88), .Q(player_bullet_coord_y[0]) );
  NOR2X1 \invader_bullet_fsm/U58  ( .A(\invader_bullet_fsm/N13 ), .B(n432), 
        .Y(\invader_bullet_fsm/n43 ) );
  NOR2X1 \invader_bullet_fsm/U57  ( .A(invaderbullet_shield_collision_signal), 
        .B(invaderbullet_player_collision_signal), .Y(\invader_bullet_fsm/n44 ) );
  AOI22X1 \invader_bullet_fsm/U56  ( .A(\invader_bullet_fsm/n43 ), .B(
        \invader_bullet_fsm/n44 ), .C(invader_fire), .D(n432), .Y(
        \invader_bullet_fsm/n41 ) );
  NOR2X1 \invader_bullet_fsm/U54  ( .A(\invader_bullet_fsm/n41 ), .B(n79), .Y(
        \invader_bullet_fsm/N19 ) );
  NOR2X1 \invader_bullet_fsm/U52  ( .A(n447), .B(n79), .Y(
        \invader_bullet_fsm/N40 ) );
  AOI22X1 \invader_bullet_fsm/U51  ( .A(n448), .B(
        \invader_bullet_fsm/next_state[0] ), .C(closest_invader_coord_y[0]), 
        .D(n447), .Y(\invader_bullet_fsm/n38 ) );
  AOI21X1 \invader_bullet_fsm/U45  ( .A(closest_invader_coord_y[1]), .B(n447), 
        .C(n79), .Y(\invader_bullet_fsm/n36 ) );
  NAND2X1 \invader_bullet_fsm/U44  ( .A(\invader_bullet_fsm/n35 ), .B(
        \invader_bullet_fsm/n36 ), .Y(\invader_bullet_fsm/n52 ) );
  AOI21X1 \invader_bullet_fsm/U42  ( .A(closest_invader_coord_y[2]), .B(n447), 
        .C(n80), .Y(\invader_bullet_fsm/n34 ) );
  NAND2X1 \invader_bullet_fsm/U41  ( .A(\invader_bullet_fsm/n33 ), .B(
        \invader_bullet_fsm/n34 ), .Y(\invader_bullet_fsm/n51 ) );
  AOI21X1 \invader_bullet_fsm/U39  ( .A(closest_invader_coord_y[3]), .B(n447), 
        .C(n80), .Y(\invader_bullet_fsm/n32 ) );
  NAND2X1 \invader_bullet_fsm/U38  ( .A(\invader_bullet_fsm/n31 ), .B(
        \invader_bullet_fsm/n32 ), .Y(\invader_bullet_fsm/n50 ) );
  AOI21X1 \invader_bullet_fsm/U36  ( .A(closest_invader_coord_y[4]), .B(n447), 
        .C(n80), .Y(\invader_bullet_fsm/n29 ) );
  NAND2X1 \invader_bullet_fsm/U35  ( .A(\invader_bullet_fsm/n28 ), .B(
        \invader_bullet_fsm/n29 ), .Y(\invader_bullet_fsm/n49 ) );
  AOI22X1 \invader_bullet_fsm/U34  ( .A(\invader_bullet_fsm/N30 ), .B(
        \invader_bullet_fsm/next_state[0] ), .C(closest_invader_coord_y[5]), 
        .D(n447), .Y(\invader_bullet_fsm/n25 ) );
  NOR2X1 \invader_bullet_fsm/U30  ( .A(n447), .B(n80), .Y(
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
  AOI21X1 \invader_bullet_fsm/U26  ( .A(closest_invader_coord_x[3]), .B(n447), 
        .C(n81), .Y(\invader_bullet_fsm/n19 ) );
  OAI21X1 \invader_bullet_fsm/U25  ( .A(n447), .B(n441), .C(
        \invader_bullet_fsm/n19 ), .Y(\invader_bullet_fsm/n46 ) );
  AOI21X1 \invader_bullet_fsm/U24  ( .A(closest_invader_coord_x[2]), .B(n447), 
        .C(n81), .Y(\invader_bullet_fsm/n18 ) );
  OAI21X1 \invader_bullet_fsm/U23  ( .A(n447), .B(n442), .C(
        \invader_bullet_fsm/n18 ), .Y(\invader_bullet_fsm/n45 ) );
  AOI22X1 \invader_bullet_fsm/U22  ( .A(invader_bullet_coord_x[1]), .B(
        \invader_bullet_fsm/n15 ), .C(closest_invader_coord_x[1]), .D(
        \invader_bullet_fsm/n16 ), .Y(\invader_bullet_fsm/n14 ) );
  AND2X2 \invader_bullet_fsm/U11  ( .A(n447), .B(n77), .Y(
        \invader_bullet_fsm/n16 ) );
  DFFNEGX1 \invader_bullet_fsm/state_reg[0]  ( .D(\invader_bullet_fsm/N40 ), 
        .CLK(n88), .Q(\invader_bullet_fsm/state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[0]  ( .D(n138), 
        .CLK(n87), .Q(\shield_fsm/N19 ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[5]  ( .D(n139), 
        .CLK(n87), .Q(invader_bullet_coord_x[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[4]  ( .D(n140), 
        .CLK(n87), .Q(invader_bullet_coord_x[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[1]  ( .D(n141), 
        .CLK(n87), .Q(invader_bullet_coord_x[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[3]  ( .D(
        \invader_bullet_fsm/n46 ), .CLK(n87), .Q(invader_bullet_coord_x[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_x_reg[2]  ( .D(
        \invader_bullet_fsm/n45 ), .CLK(n87), .Q(invader_bullet_coord_x[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[1]  ( .D(
        \invader_bullet_fsm/n52 ), .CLK(n87), .Q(invader_bullet_coord_y[1]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[2]  ( .D(
        \invader_bullet_fsm/n51 ), .CLK(n87), .Q(invader_bullet_coord_y[2]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[3]  ( .D(
        \invader_bullet_fsm/n50 ), .CLK(n87), .Q(invader_bullet_coord_y[3]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[4]  ( .D(
        \invader_bullet_fsm/n49 ), .CLK(n87), .Q(invader_bullet_coord_y[4]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_display_reg  ( .D(
        \invader_bullet_fsm/n47 ), .CLK(n87), .Q(invader_bullet_display) );
  DFFNEGX1 \invader_bullet_fsm/next_state_reg[0]  ( .D(
        \invader_bullet_fsm/N19 ), .CLK(clka), .Q(
        \invader_bullet_fsm/next_state[0] ) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[5]  ( .D(
        \invader_bullet_fsm/n48 ), .CLK(n87), .Q(invader_bullet_coord_y[5]) );
  DFFNEGX1 \invader_bullet_fsm/invader_bullet_coord_y_reg[0]  ( .D(
        \invader_bullet_fsm/n53 ), .CLK(n87), .Q(invader_bullet_coord_y[0]) );
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
  HAX1 \invader_fsm_4/r410/U1_1_1  ( .A(invader_4_coord_x[1]), .B(
        \invader_fsm_4/N84 ), .YC(\invader_fsm_4/r410/carry [2]), .YS(
        \invader_fsm_4/N13 ) );
  HAX1 \invader_fsm_4/r410/U1_1_2  ( .A(invader_4_coord_x[2]), .B(
        \invader_fsm_4/r410/carry [2]), .YC(\invader_fsm_4/r410/carry [3]), 
        .YS(\invader_fsm_4/N14 ) );
  HAX1 \invader_fsm_4/r410/U1_1_3  ( .A(invader_4_coord_x[3]), .B(
        \invader_fsm_4/r410/carry [3]), .YC(\invader_fsm_4/r410/carry [4]), 
        .YS(\invader_fsm_4/N15 ) );
  HAX1 \invader_fsm_4/r410/U1_1_4  ( .A(invader_4_coord_x[4]), .B(
        \invader_fsm_4/r410/carry [4]), .YC(\invader_fsm_4/r410/carry [5]), 
        .YS(\invader_fsm_4/N16 ) );
  HAX1 \invader_fsm_4/r410/U1_1_5  ( .A(invader_4_coord_x[5]), .B(
        \invader_fsm_4/r410/carry [5]), .YC(\invader_fsm_4/N18 ), .YS(
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
  HAX1 \invader_fsm_3/r410/U1_1_1  ( .A(invader_3_coord_x[1]), .B(
        \invader_fsm_3/N84 ), .YC(\invader_fsm_3/r410/carry [2]), .YS(
        \invader_fsm_3/N13 ) );
  HAX1 \invader_fsm_3/r410/U1_1_2  ( .A(invader_3_coord_x[2]), .B(
        \invader_fsm_3/r410/carry [2]), .YC(\invader_fsm_3/r410/carry [3]), 
        .YS(\invader_fsm_3/N14 ) );
  HAX1 \invader_fsm_3/r410/U1_1_3  ( .A(invader_3_coord_x[3]), .B(
        \invader_fsm_3/r410/carry [3]), .YC(\invader_fsm_3/r410/carry [4]), 
        .YS(\invader_fsm_3/N15 ) );
  HAX1 \invader_fsm_3/r410/U1_1_4  ( .A(invader_3_coord_x[4]), .B(
        \invader_fsm_3/r410/carry [4]), .YC(\invader_fsm_3/r410/carry [5]), 
        .YS(\invader_fsm_3/N16 ) );
  HAX1 \invader_fsm_3/r410/U1_1_5  ( .A(invader_3_coord_x[5]), .B(
        \invader_fsm_3/r410/carry [5]), .YC(\invader_fsm_3/N18 ), .YS(
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
  HAX1 \invader_fsm_2/r410/U1_1_1  ( .A(invader_2_coord_x[1]), .B(
        \invader_fsm_2/N84 ), .YC(\invader_fsm_2/r410/carry [2]), .YS(
        \invader_fsm_2/N13 ) );
  HAX1 \invader_fsm_2/r410/U1_1_2  ( .A(invader_2_coord_x[2]), .B(
        \invader_fsm_2/r410/carry [2]), .YC(\invader_fsm_2/r410/carry [3]), 
        .YS(\invader_fsm_2/N14 ) );
  HAX1 \invader_fsm_2/r410/U1_1_3  ( .A(invader_2_coord_x[3]), .B(
        \invader_fsm_2/r410/carry [3]), .YC(\invader_fsm_2/r410/carry [4]), 
        .YS(\invader_fsm_2/N15 ) );
  HAX1 \invader_fsm_2/r410/U1_1_4  ( .A(invader_2_coord_x[4]), .B(
        \invader_fsm_2/r410/carry [4]), .YC(\invader_fsm_2/r410/carry [5]), 
        .YS(\invader_fsm_2/N16 ) );
  HAX1 \invader_fsm_2/r410/U1_1_5  ( .A(invader_2_coord_x[5]), .B(
        \invader_fsm_2/r410/carry [5]), .YC(\invader_fsm_2/N18 ), .YS(
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
  HAX1 \invader_fsm_1/r410/U1_1_1  ( .A(invader_1_coord_x[1]), .B(
        \invader_fsm_1/N84 ), .YC(\invader_fsm_1/r410/carry [2]), .YS(
        \invader_fsm_1/N13 ) );
  HAX1 \invader_fsm_1/r410/U1_1_2  ( .A(invader_1_coord_x[2]), .B(
        \invader_fsm_1/r410/carry [2]), .YC(\invader_fsm_1/r410/carry [3]), 
        .YS(\invader_fsm_1/N14 ) );
  HAX1 \invader_fsm_1/r410/U1_1_3  ( .A(invader_1_coord_x[3]), .B(
        \invader_fsm_1/r410/carry [3]), .YC(\invader_fsm_1/r410/carry [4]), 
        .YS(\invader_fsm_1/N15 ) );
  HAX1 \invader_fsm_1/r410/U1_1_4  ( .A(invader_1_coord_x[4]), .B(
        \invader_fsm_1/r410/carry [4]), .YC(\invader_fsm_1/r410/carry [5]), 
        .YS(\invader_fsm_1/N16 ) );
  HAX1 \invader_fsm_1/r410/U1_1_5  ( .A(invader_1_coord_x[5]), .B(
        \invader_fsm_1/r410/carry [5]), .YC(\invader_fsm_1/N18 ), .YS(
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
  HAX1 \player_fsm/r399/U1_1_1  ( .A(player_coord_x[1]), .B(player_coord_x[0]), 
        .YC(\player_fsm/r399/carry [2]), .YS(\player_fsm/N13 ) );
  HAX1 \player_fsm/r399/U1_1_2  ( .A(n944), .B(\player_fsm/r399/carry [2]), 
        .YC(\player_fsm/r399/carry [3]), .YS(\player_fsm/N14 ) );
  HAX1 \player_fsm/r399/U1_1_3  ( .A(player_coord_x[3]), .B(
        \player_fsm/r399/carry [3]), .YC(\player_fsm/r399/carry [4]), .YS(
        \player_fsm/N15 ) );
  HAX1 \player_fsm/r399/U1_1_4  ( .A(player_coord_x[4]), .B(
        \player_fsm/r399/carry [4]), .YC(\player_fsm/r399/carry [5]), .YS(
        \player_fsm/N16 ) );
  HAX1 \player_fsm/r399/U1_1_5  ( .A(player_coord_x[5]), .B(
        \player_fsm/r399/carry [5]), .YC(\player_fsm/N18 ), .YS(
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
  FAX1 \main_game_fsm/sub_60/U2_1  ( .A(player_coord_x[1]), .B(n63), .C(
        \main_game_fsm/sub_60/carry [1]), .YC(\main_game_fsm/sub_60/carry [2]), 
        .YS(\main_game_fsm/N31 ) );
  FAX1 \main_game_fsm/sub_60/U2_2  ( .A(player_coord_x[2]), .B(n274), .C(
        \main_game_fsm/sub_60/carry [2]), .YC(\main_game_fsm/sub_60/carry [3]), 
        .YS(\main_game_fsm/N32 ) );
  FAX1 \main_game_fsm/sub_60/U2_3  ( .A(player_coord_x[3]), .B(n62), .C(
        \main_game_fsm/sub_60/carry [3]), .YC(\main_game_fsm/sub_60/carry [4]), 
        .YS(\main_game_fsm/N33 ) );
  FAX1 \main_game_fsm/sub_60/U2_4  ( .A(player_coord_x[4]), .B(n268), .C(
        \main_game_fsm/sub_60/carry [4]), .YC(\main_game_fsm/sub_60/carry [5]), 
        .YS(\main_game_fsm/N34 ) );
  FAX1 \main_game_fsm/sub_60/U2_5  ( .A(player_coord_x[5]), .B(n64), .C(
        \main_game_fsm/sub_60/carry [5]), .YC(), .YS(\main_game_fsm/N35 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_1  ( .A(invader_1_coord_x[1]), .B(n73), .C(
        \main_game_fsm/sub_60_2/carry [1]), .YC(
        \main_game_fsm/sub_60_2/carry [2]), .YS(\main_game_fsm/N37 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_2  ( .A(invader_1_coord_x[2]), .B(n71), .C(
        \main_game_fsm/sub_60_2/carry [2]), .YC(
        \main_game_fsm/sub_60_2/carry [3]), .YS(\main_game_fsm/N38 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_3  ( .A(invader_1_coord_x[3]), .B(n70), .C(
        \main_game_fsm/sub_60_2/carry [3]), .YC(
        \main_game_fsm/sub_60_2/carry [4]), .YS(\main_game_fsm/N39 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_4  ( .A(invader_1_coord_x[4]), .B(n65), .C(
        \main_game_fsm/sub_60_2/carry [4]), .YC(
        \main_game_fsm/sub_60_2/carry [5]), .YS(\main_game_fsm/N40 ) );
  FAX1 \main_game_fsm/sub_60_2/U2_5  ( .A(invader_1_coord_x[5]), .B(n67), .C(
        \main_game_fsm/sub_60_2/carry [5]), .YC(), .YS(\main_game_fsm/N41 ) );
  FAX1 \main_game_fsm/sub_64/U2_1  ( .A(player_coord_x[1]), .B(n58), .C(
        \main_game_fsm/sub_64/carry [1]), .YC(\main_game_fsm/sub_64/carry [2]), 
        .YS(\main_game_fsm/N45 ) );
  FAX1 \main_game_fsm/sub_64/U2_2  ( .A(n944), .B(n321), .C(
        \main_game_fsm/sub_64/carry [2]), .YC(\main_game_fsm/sub_64/carry [3]), 
        .YS(\main_game_fsm/N46 ) );
  FAX1 \main_game_fsm/sub_64/U2_3  ( .A(player_coord_x[3]), .B(n59), .C(
        \main_game_fsm/sub_64/carry [3]), .YC(\main_game_fsm/sub_64/carry [4]), 
        .YS(\main_game_fsm/N47 ) );
  FAX1 \main_game_fsm/sub_64/U2_4  ( .A(n943), .B(n312), .C(
        \main_game_fsm/sub_64/carry [4]), .YC(\main_game_fsm/sub_64/carry [5]), 
        .YS(\main_game_fsm/N48 ) );
  FAX1 \main_game_fsm/sub_64/U2_5  ( .A(n942), .B(n60), .C(
        \main_game_fsm/sub_64/carry [5]), .YC(), .YS(\main_game_fsm/N49 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_1  ( .A(invader_2_coord_x[1]), .B(n73), .C(
        \main_game_fsm/sub_64_2/carry [1]), .YC(
        \main_game_fsm/sub_64_2/carry [2]), .YS(\main_game_fsm/N51 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_2  ( .A(invader_2_coord_x[2]), .B(n71), .C(
        \main_game_fsm/sub_64_2/carry [2]), .YC(
        \main_game_fsm/sub_64_2/carry [3]), .YS(\main_game_fsm/N52 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_3  ( .A(invader_2_coord_x[3]), .B(n70), .C(
        \main_game_fsm/sub_64_2/carry [3]), .YC(
        \main_game_fsm/sub_64_2/carry [4]), .YS(\main_game_fsm/N53 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_4  ( .A(invader_2_coord_x[4]), .B(n65), .C(
        \main_game_fsm/sub_64_2/carry [4]), .YC(
        \main_game_fsm/sub_64_2/carry [5]), .YS(\main_game_fsm/N54 ) );
  FAX1 \main_game_fsm/sub_64_2/U2_5  ( .A(invader_2_coord_x[5]), .B(n67), .C(
        \main_game_fsm/sub_64_2/carry [5]), .YC(), .YS(\main_game_fsm/N55 ) );
  FAX1 \main_game_fsm/sub_68/U2_1  ( .A(player_coord_x[1]), .B(n56), .C(
        \main_game_fsm/sub_68/carry [1]), .YC(\main_game_fsm/sub_68/carry [2]), 
        .YS(\main_game_fsm/N59 ) );
  FAX1 \main_game_fsm/sub_68/U2_2  ( .A(player_coord_x[2]), .B(n365), .C(
        \main_game_fsm/sub_68/carry [2]), .YC(\main_game_fsm/sub_68/carry [3]), 
        .YS(\main_game_fsm/N60 ) );
  FAX1 \main_game_fsm/sub_68/U2_3  ( .A(player_coord_x[3]), .B(n55), .C(
        \main_game_fsm/sub_68/carry [3]), .YC(\main_game_fsm/sub_68/carry [4]), 
        .YS(\main_game_fsm/N61 ) );
  FAX1 \main_game_fsm/sub_68/U2_4  ( .A(player_coord_x[4]), .B(n357), .C(
        \main_game_fsm/sub_68/carry [4]), .YC(\main_game_fsm/sub_68/carry [5]), 
        .YS(\main_game_fsm/N62 ) );
  FAX1 \main_game_fsm/sub_68/U2_5  ( .A(player_coord_x[5]), .B(n57), .C(
        \main_game_fsm/sub_68/carry [5]), .YC(), .YS(\main_game_fsm/N63 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_1  ( .A(invader_3_coord_x[1]), .B(n73), .C(
        \main_game_fsm/sub_68_2/carry [1]), .YC(
        \main_game_fsm/sub_68_2/carry [2]), .YS(\main_game_fsm/N65 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_2  ( .A(invader_3_coord_x[2]), .B(n71), .C(
        \main_game_fsm/sub_68_2/carry [2]), .YC(
        \main_game_fsm/sub_68_2/carry [3]), .YS(\main_game_fsm/N66 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_3  ( .A(invader_3_coord_x[3]), .B(n70), .C(
        \main_game_fsm/sub_68_2/carry [3]), .YC(
        \main_game_fsm/sub_68_2/carry [4]), .YS(\main_game_fsm/N67 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_4  ( .A(invader_3_coord_x[4]), .B(n65), .C(
        \main_game_fsm/sub_68_2/carry [4]), .YC(
        \main_game_fsm/sub_68_2/carry [5]), .YS(\main_game_fsm/N68 ) );
  FAX1 \main_game_fsm/sub_68_2/U2_5  ( .A(invader_3_coord_x[5]), .B(n67), .C(
        \main_game_fsm/sub_68_2/carry [5]), .YC(), .YS(\main_game_fsm/N69 ) );
  FAX1 \main_game_fsm/sub_72/U2_1  ( .A(player_coord_x[1]), .B(n51), .C(
        \main_game_fsm/sub_72/carry [1]), .YC(\main_game_fsm/sub_72/carry [2]), 
        .YS(\main_game_fsm/N73 ) );
  FAX1 \main_game_fsm/sub_72/U2_2  ( .A(n944), .B(n408), .C(
        \main_game_fsm/sub_72/carry [2]), .YC(\main_game_fsm/sub_72/carry [3]), 
        .YS(\main_game_fsm/N74 ) );
  FAX1 \main_game_fsm/sub_72/U2_3  ( .A(player_coord_x[3]), .B(n52), .C(
        \main_game_fsm/sub_72/carry [3]), .YC(\main_game_fsm/sub_72/carry [4]), 
        .YS(\main_game_fsm/N75 ) );
  FAX1 \main_game_fsm/sub_72/U2_4  ( .A(n943), .B(n400), .C(
        \main_game_fsm/sub_72/carry [4]), .YC(\main_game_fsm/sub_72/carry [5]), 
        .YS(\main_game_fsm/N76 ) );
  FAX1 \main_game_fsm/sub_72/U2_5  ( .A(n942), .B(n53), .C(
        \main_game_fsm/sub_72/carry [5]), .YC(), .YS(\main_game_fsm/N77 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_1  ( .A(invader_4_coord_x[1]), .B(n73), .C(
        \main_game_fsm/sub_72_2/carry [1]), .YC(
        \main_game_fsm/sub_72_2/carry [2]), .YS(\main_game_fsm/N79 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_2  ( .A(invader_4_coord_x[2]), .B(n71), .C(
        \main_game_fsm/sub_72_2/carry [2]), .YC(
        \main_game_fsm/sub_72_2/carry [3]), .YS(\main_game_fsm/N80 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_3  ( .A(invader_4_coord_x[3]), .B(n70), .C(
        \main_game_fsm/sub_72_2/carry [3]), .YC(
        \main_game_fsm/sub_72_2/carry [4]), .YS(\main_game_fsm/N81 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_4  ( .A(invader_4_coord_x[4]), .B(n65), .C(
        \main_game_fsm/sub_72_2/carry [4]), .YC(
        \main_game_fsm/sub_72_2/carry [5]), .YS(\main_game_fsm/N82 ) );
  FAX1 \main_game_fsm/sub_72_2/U2_5  ( .A(invader_4_coord_x[5]), .B(n67), .C(
        \main_game_fsm/sub_72_2/carry [5]), .YC(), .YS(\main_game_fsm/N83 ) );
  AND2X2 U4 ( .A(\main_game_fsm/N100 ), .B(n185), .Y(n3) );
  NOR2X1 U5 ( .A(\main_game_fsm/N100 ), .B(\main_game_fsm/N94 ), .Y(n4) );
  AND2X2 U6 ( .A(n77), .B(\player_bullet_fsm/next_state[0] ), .Y(n5) );
  AND2X2 U7 ( .A(n20), .B(invader_3_coord_x[4]), .Y(n6) );
  AND2X2 U8 ( .A(n19), .B(invader_4_coord_x[4]), .Y(n7) );
  AND2X2 U9 ( .A(n22), .B(invader_1_coord_x[4]), .Y(n8) );
  AND2X2 U10 ( .A(n21), .B(invader_2_coord_x[4]), .Y(n9) );
  AND2X2 U11 ( .A(n18), .B(invader_bullet_coord_x[4]), .Y(n10) );
  AND2X2 U12 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(n11) );
  AND2X2 U13 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), .Y(
        n12) );
  AND2X2 U14 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(n13) );
  AND2X2 U15 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(n14) );
  AND2X2 U16 ( .A(invader_3_coord_x[1]), .B(invader_3_coord_x[2]), .Y(n15) );
  AND2X2 U17 ( .A(invader_4_coord_x[1]), .B(invader_4_coord_x[2]), .Y(n16) );
  AND2X2 U18 ( .A(shield_coord_x[1]), .B(shield_coord_x[2]), .Y(n17) );
  AND2X2 U19 ( .A(n11), .B(invader_bullet_coord_x[3]), .Y(n18) );
  AND2X2 U20 ( .A(n16), .B(invader_4_coord_x[3]), .Y(n19) );
  AND2X2 U21 ( .A(n15), .B(invader_3_coord_x[3]), .Y(n20) );
  AND2X2 U22 ( .A(n14), .B(invader_2_coord_x[3]), .Y(n21) );
  AND2X2 U23 ( .A(n13), .B(invader_1_coord_x[3]), .Y(n22) );
  AND2X2 U24 ( .A(n12), .B(player_bullet_coord_x[3]), .Y(n23) );
  AND2X2 U25 ( .A(n23), .B(player_bullet_coord_x[4]), .Y(n24) );
  XNOR2X1 U26 ( .A(n11), .B(invader_bullet_coord_x[3]), .Y(n25) );
  XNOR2X1 U27 ( .A(n12), .B(player_bullet_coord_x[3]), .Y(n26) );
  AND2X2 U28 ( .A(n8), .B(invader_1_coord_x[5]), .Y(n27) );
  AND2X2 U29 ( .A(n9), .B(invader_2_coord_x[5]), .Y(n28) );
  AND2X2 U30 ( .A(n6), .B(invader_3_coord_x[5]), .Y(n29) );
  AND2X2 U31 ( .A(n7), .B(invader_4_coord_x[5]), .Y(n30) );
  AND2X2 U32 ( .A(n24), .B(player_bullet_coord_x[5]), .Y(n31) );
  AND2X2 U33 ( .A(n10), .B(invader_bullet_coord_x[5]), .Y(n32) );
  XNOR2X1 U34 ( .A(n13), .B(invader_1_coord_x[3]), .Y(n33) );
  XNOR2X1 U35 ( .A(n14), .B(invader_2_coord_x[3]), .Y(n34) );
  XNOR2X1 U36 ( .A(n15), .B(invader_3_coord_x[3]), .Y(n35) );
  XNOR2X1 U37 ( .A(n16), .B(invader_4_coord_x[3]), .Y(n36) );
  XNOR2X1 U38 ( .A(n18), .B(invader_bullet_coord_x[4]), .Y(n37) );
  XNOR2X1 U39 ( .A(n23), .B(player_bullet_coord_x[4]), .Y(n38) );
  AND2X2 U40 ( .A(n431), .B(n5), .Y(n39) );
  OR2X2 U41 ( .A(n430), .B(\player_bullet_fsm/n42 ), .Y(n40) );
  AND2X2 U42 ( .A(\player_bullet_fsm/N26 ), .B(n5), .Y(n41) );
  AND2X2 U43 ( .A(\player_bullet_fsm/N23 ), .B(n5), .Y(n42) );
  AND2X2 U44 ( .A(\player_bullet_fsm/N24 ), .B(n5), .Y(n43) );
  AND2X2 U45 ( .A(\player_bullet_fsm/N25 ), .B(n5), .Y(n44) );
  INVX2 U46 ( .A(n45), .Y(n75) );
  OR2X1 U47 ( .A(n171), .B(\main_game_fsm/N100 ), .Y(n45) );
  INVX2 U48 ( .A(n46), .Y(n74) );
  INVX2 U49 ( .A(invader_direction), .Y(n116) );
  NAND2X1 U50 ( .A(\main_game_fsm/N100 ), .B(\main_game_fsm/N88 ), .Y(n46) );
  INVX2 U51 ( .A(player_bullet_coord_x[3]), .Y(n422) );
  INVX2 U52 ( .A(player_bullet_coord_x[2]), .Y(n421) );
  BUFX2 U53 ( .A(n86), .Y(n96) );
  BUFX2 U54 ( .A(n83), .Y(n87) );
  BUFX2 U55 ( .A(n83), .Y(n88) );
  BUFX2 U56 ( .A(n83), .Y(n89) );
  BUFX2 U57 ( .A(n84), .Y(n90) );
  BUFX2 U58 ( .A(n84), .Y(n91) );
  BUFX2 U59 ( .A(n84), .Y(n92) );
  BUFX2 U60 ( .A(n85), .Y(n93) );
  BUFX2 U61 ( .A(n85), .Y(n94) );
  BUFX2 U62 ( .A(n85), .Y(n95) );
  INVX2 U63 ( .A(n71), .Y(player_coord_x[2]) );
  INVX2 U64 ( .A(n65), .Y(player_coord_x[4]) );
  INVX2 U65 ( .A(n67), .Y(player_coord_x[5]) );
  INVX2 U66 ( .A(n81), .Y(n76) );
  INVX2 U67 ( .A(n79), .Y(n77) );
  BUFX2 U68 ( .A(n86), .Y(n97) );
  INVX2 U69 ( .A(player_bullet_coord_x[1]), .Y(n420) );
  INVX2 U70 ( .A(player_bullet_coord_y[3]), .Y(n427) );
  INVX2 U71 ( .A(player_bullet_coord_y[1]), .Y(n423) );
  INVX2 U72 ( .A(player_bullet_coord_y[0]), .Y(n431) );
  INVX2 U73 ( .A(\invader_bullet_fsm/next_state[0] ), .Y(n447) );
  BUFX2 U74 ( .A(internal_reset), .Y(n78) );
  BUFX2 U75 ( .A(internal_reset), .Y(n80) );
  BUFX2 U76 ( .A(internal_reset), .Y(n81) );
  BUFX2 U77 ( .A(internal_reset), .Y(n79) );
  BUFX2 U78 ( .A(internal_reset), .Y(n82) );
  INVX2 U79 ( .A(\invader_fsm_3/N84 ), .Y(n54) );
  INVX2 U80 ( .A(player_coord_x[3]), .Y(n70) );
  INVX2 U81 ( .A(\invader_fsm_1/N84 ), .Y(n61) );
  INVX2 U82 ( .A(player_coord_x[0]), .Y(n69) );
  INVX2 U83 ( .A(invader_4_coord_x[1]), .Y(n51) );
  INVX2 U84 ( .A(invader_2_coord_x[1]), .Y(n58) );
  INVX2 U85 ( .A(player_coord_x[1]), .Y(n73) );
  INVX2 U86 ( .A(invader_4_coord_x[3]), .Y(n52) );
  INVX2 U87 ( .A(invader_3_coord_x[3]), .Y(n55) );
  INVX2 U88 ( .A(invader_2_coord_x[3]), .Y(n59) );
  INVX2 U89 ( .A(invader_1_coord_x[3]), .Y(n62) );
  INVX2 U90 ( .A(player_bullet_coord_x[4]), .Y(n50) );
  INVX2 U91 ( .A(player_bullet_coord_x[5]), .Y(n49) );
  INVX2 U92 ( .A(n943), .Y(n65) );
  INVX2 U93 ( .A(n942), .Y(n67) );
  INVX2 U94 ( .A(invader_3_coord_x[1]), .Y(n56) );
  INVX2 U95 ( .A(player_bullet_coord_y[5]), .Y(n48) );
  INVX2 U96 ( .A(invader_1_coord_x[1]), .Y(n63) );
  INVX2 U97 ( .A(invader_4_coord_x[5]), .Y(n53) );
  INVX2 U98 ( .A(invader_3_coord_x[5]), .Y(n57) );
  INVX2 U99 ( .A(invader_2_coord_x[5]), .Y(n60) );
  INVX2 U100 ( .A(invader_1_coord_x[5]), .Y(n64) );
  INVX2 U101 ( .A(n944), .Y(n71) );
  BUFX2 U102 ( .A(clkb), .Y(n83) );
  BUFX2 U103 ( .A(clkb), .Y(n84) );
  BUFX2 U104 ( .A(clkb), .Y(n85) );
  BUFX2 U105 ( .A(clkb), .Y(n86) );
  OR2X1 U106 ( .A(invader_4_coord_y[2]), .B(invader_4_coord_y[1]), .Y(
        \invader_fsm_4/sub_124/carry [3]) );
  XNOR2X1 U107 ( .A(invader_4_coord_y[1]), .B(invader_4_coord_y[2]), .Y(
        \invader_fsm_4/N72 ) );
  OR2X1 U108 ( .A(invader_4_coord_y[3]), .B(\invader_fsm_4/sub_124/carry [3]), 
        .Y(\invader_fsm_4/sub_124/carry [4]) );
  XNOR2X1 U109 ( .A(\invader_fsm_4/sub_124/carry [3]), .B(invader_4_coord_y[3]), .Y(\invader_fsm_4/N73 ) );
  OR2X1 U110 ( .A(invader_4_coord_y[4]), .B(\invader_fsm_4/sub_124/carry [4]), 
        .Y(\invader_fsm_4/sub_124/carry [5]) );
  XNOR2X1 U111 ( .A(\invader_fsm_4/sub_124/carry [4]), .B(invader_4_coord_y[4]), .Y(\invader_fsm_4/N74 ) );
  XNOR2X1 U112 ( .A(invader_4_coord_y[5]), .B(\invader_fsm_4/sub_124/carry [5]), .Y(\invader_fsm_4/N75 ) );
  OR2X1 U113 ( .A(invader_3_coord_y[2]), .B(invader_3_coord_y[1]), .Y(
        \invader_fsm_3/sub_124/carry [3]) );
  XNOR2X1 U114 ( .A(invader_3_coord_y[1]), .B(invader_3_coord_y[2]), .Y(
        \invader_fsm_3/N72 ) );
  OR2X1 U115 ( .A(invader_3_coord_y[3]), .B(\invader_fsm_3/sub_124/carry [3]), 
        .Y(\invader_fsm_3/sub_124/carry [4]) );
  XNOR2X1 U116 ( .A(\invader_fsm_3/sub_124/carry [3]), .B(invader_3_coord_y[3]), .Y(\invader_fsm_3/N73 ) );
  OR2X1 U117 ( .A(invader_3_coord_y[4]), .B(\invader_fsm_3/sub_124/carry [4]), 
        .Y(\invader_fsm_3/sub_124/carry [5]) );
  XNOR2X1 U118 ( .A(\invader_fsm_3/sub_124/carry [4]), .B(invader_3_coord_y[4]), .Y(\invader_fsm_3/N74 ) );
  XNOR2X1 U119 ( .A(invader_3_coord_y[5]), .B(\invader_fsm_3/sub_124/carry [5]), .Y(\invader_fsm_3/N75 ) );
  OR2X1 U120 ( .A(invader_2_coord_y[2]), .B(invader_2_coord_y[1]), .Y(
        \invader_fsm_2/sub_124/carry [3]) );
  XNOR2X1 U121 ( .A(invader_2_coord_y[1]), .B(invader_2_coord_y[2]), .Y(
        \invader_fsm_2/N72 ) );
  OR2X1 U122 ( .A(invader_2_coord_y[3]), .B(\invader_fsm_2/sub_124/carry [3]), 
        .Y(\invader_fsm_2/sub_124/carry [4]) );
  XNOR2X1 U123 ( .A(\invader_fsm_2/sub_124/carry [3]), .B(invader_2_coord_y[3]), .Y(\invader_fsm_2/N73 ) );
  OR2X1 U124 ( .A(invader_2_coord_y[4]), .B(\invader_fsm_2/sub_124/carry [4]), 
        .Y(\invader_fsm_2/sub_124/carry [5]) );
  XNOR2X1 U125 ( .A(\invader_fsm_2/sub_124/carry [4]), .B(invader_2_coord_y[4]), .Y(\invader_fsm_2/N74 ) );
  XNOR2X1 U126 ( .A(invader_2_coord_y[5]), .B(\invader_fsm_2/sub_124/carry [5]), .Y(\invader_fsm_2/N75 ) );
  OR2X1 U127 ( .A(invader_1_coord_y[2]), .B(invader_1_coord_y[1]), .Y(
        \invader_fsm_1/sub_124/carry [3]) );
  XNOR2X1 U128 ( .A(invader_1_coord_y[1]), .B(invader_1_coord_y[2]), .Y(
        \invader_fsm_1/N72 ) );
  OR2X1 U129 ( .A(invader_1_coord_y[3]), .B(\invader_fsm_1/sub_124/carry [3]), 
        .Y(\invader_fsm_1/sub_124/carry [4]) );
  XNOR2X1 U130 ( .A(\invader_fsm_1/sub_124/carry [3]), .B(invader_1_coord_y[3]), .Y(\invader_fsm_1/N73 ) );
  OR2X1 U131 ( .A(invader_1_coord_y[4]), .B(\invader_fsm_1/sub_124/carry [4]), 
        .Y(\invader_fsm_1/sub_124/carry [5]) );
  XNOR2X1 U132 ( .A(\invader_fsm_1/sub_124/carry [4]), .B(invader_1_coord_y[4]), .Y(\invader_fsm_1/N74 ) );
  XNOR2X1 U133 ( .A(invader_1_coord_y[5]), .B(\invader_fsm_1/sub_124/carry [5]), .Y(\invader_fsm_1/N75 ) );
  OR2X1 U134 ( .A(player_coord_x[0]), .B(n61), .Y(
        \main_game_fsm/sub_60/carry [1]) );
  XNOR2X1 U135 ( .A(n61), .B(player_coord_x[0]), .Y(\main_game_fsm/N30 ) );
  OR2X1 U136 ( .A(\invader_fsm_1/N84 ), .B(n69), .Y(
        \main_game_fsm/sub_60_2/carry [1]) );
  XNOR2X1 U137 ( .A(n69), .B(\invader_fsm_1/N84 ), .Y(\main_game_fsm/N36 ) );
  OR2X1 U138 ( .A(player_coord_x[0]), .B(n331), .Y(
        \main_game_fsm/sub_64/carry [1]) );
  XNOR2X1 U139 ( .A(n331), .B(player_coord_x[0]), .Y(\main_game_fsm/N44 ) );
  OR2X1 U140 ( .A(\invader_fsm_2/N84 ), .B(n69), .Y(
        \main_game_fsm/sub_64_2/carry [1]) );
  XNOR2X1 U141 ( .A(n69), .B(\invader_fsm_2/N84 ), .Y(\main_game_fsm/N50 ) );
  OR2X1 U142 ( .A(player_coord_x[0]), .B(n54), .Y(
        \main_game_fsm/sub_68/carry [1]) );
  XNOR2X1 U143 ( .A(n54), .B(player_coord_x[0]), .Y(\main_game_fsm/N58 ) );
  OR2X1 U144 ( .A(\invader_fsm_3/N84 ), .B(n69), .Y(
        \main_game_fsm/sub_68_2/carry [1]) );
  XNOR2X1 U145 ( .A(n69), .B(\invader_fsm_3/N84 ), .Y(\main_game_fsm/N64 ) );
  OR2X1 U146 ( .A(player_coord_x[0]), .B(n418), .Y(
        \main_game_fsm/sub_72/carry [1]) );
  XNOR2X1 U147 ( .A(n418), .B(player_coord_x[0]), .Y(\main_game_fsm/N72 ) );
  OR2X1 U148 ( .A(\invader_fsm_4/N84 ), .B(n69), .Y(
        \main_game_fsm/sub_72_2/carry [1]) );
  XNOR2X1 U149 ( .A(n69), .B(\invader_fsm_4/N84 ), .Y(\main_game_fsm/N78 ) );
  XOR2X1 U150 ( .A(invader_4_coord_x[1]), .B(invader_4_coord_x[2]), .Y(
        \invader_fsm_4/N86 ) );
  XOR2X1 U151 ( .A(n19), .B(invader_4_coord_x[4]), .Y(\invader_fsm_4/N88 ) );
  XOR2X1 U152 ( .A(n7), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N89 ) );
  XOR2X1 U153 ( .A(invader_3_coord_x[1]), .B(invader_3_coord_x[2]), .Y(
        \invader_fsm_3/N86 ) );
  XOR2X1 U154 ( .A(n20), .B(invader_3_coord_x[4]), .Y(\invader_fsm_3/N88 ) );
  XOR2X1 U155 ( .A(n6), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N89 ) );
  XOR2X1 U156 ( .A(invader_2_coord_x[1]), .B(invader_2_coord_x[2]), .Y(
        \invader_fsm_2/N86 ) );
  XOR2X1 U157 ( .A(n21), .B(invader_2_coord_x[4]), .Y(\invader_fsm_2/N88 ) );
  XOR2X1 U158 ( .A(n9), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N89 ) );
  XOR2X1 U159 ( .A(invader_1_coord_x[1]), .B(invader_1_coord_x[2]), .Y(
        \invader_fsm_1/N86 ) );
  XOR2X1 U160 ( .A(n22), .B(invader_1_coord_x[4]), .Y(\invader_fsm_1/N88 ) );
  XOR2X1 U161 ( .A(n8), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N89 ) );
  XOR2X1 U162 ( .A(shield_coord_x[1]), .B(shield_coord_x[2]), .Y(
        \shield_fsm/N13 ) );
  XOR2X1 U163 ( .A(n17), .B(shield_coord_x[3]), .Y(\shield_fsm/N14 ) );
  NAND2X1 U164 ( .A(n17), .B(shield_coord_x[3]), .Y(n47) );
  XOR2X1 U165 ( .A(invader_bullet_coord_x[1]), .B(invader_bullet_coord_x[2]), 
        .Y(\shield_fsm/N21 ) );
  XOR2X1 U166 ( .A(n10), .B(invader_bullet_coord_x[5]), .Y(\shield_fsm/N24 )
         );
  XOR2X1 U167 ( .A(player_bullet_coord_x[1]), .B(player_bullet_coord_x[2]), 
        .Y(\shield_fsm/N37 ) );
  XOR2X1 U168 ( .A(n24), .B(player_bullet_coord_x[5]), .Y(\shield_fsm/N40 ) );
  AND2X2 U169 ( .A(n450), .B(n449), .Y(\main_game_fsm/N113 ) );
  AND2X2 U170 ( .A(n546), .B(n545), .Y(\player_fsm/N37 ) );
  AND2X2 U171 ( .A(n578), .B(n591), .Y(n579) );
  AND2X2 U172 ( .A(n582), .B(n597), .Y(n583) );
  AND2X2 U173 ( .A(player_coord_x[3]), .B(n944), .Y(n600) );
  AND2X2 U174 ( .A(n941), .B(n940), .Y(\invader_bullet_fsm/N13 ) );
  INVX2 U175 ( .A(\main_game_fsm/n99 ), .Y(n98) );
  INVX2 U176 ( .A(\main_game_fsm/n98 ), .Y(n99) );
  INVX2 U177 ( .A(\main_game_fsm/n97 ), .Y(n100) );
  INVX2 U178 ( .A(\main_game_fsm/n95 ), .Y(n101) );
  INVX2 U179 ( .A(\main_game_fsm/n101 ), .Y(n102) );
  INVX2 U180 ( .A(\main_game_fsm/n102 ), .Y(n103) );
  INVX2 U181 ( .A(\main_game_fsm/n94 ), .Y(n104) );
  INVX2 U182 ( .A(reset), .Y(n105) );
  INVX2 U183 ( .A(\player_fsm/n67 ), .Y(n106) );
  INVX2 U184 ( .A(player_right_motion), .Y(n107) );
  INVX2 U185 ( .A(\player_fsm/n68 ), .Y(n108) );
  INVX2 U186 ( .A(player_left_motion), .Y(n109) );
  INVX2 U187 ( .A(\invader_fsm_4/n82 ), .Y(n110) );
  INVX2 U188 ( .A(\invader_fsm_4/n78 ), .Y(n111) );
  INVX2 U189 ( .A(\invader_fsm_3/n88 ), .Y(n112) );
  INVX2 U190 ( .A(\invader_fsm_3/n78 ), .Y(n113) );
  INVX2 U191 ( .A(\invader_fsm_2/n78 ), .Y(n114) );
  INVX2 U192 ( .A(\invader_fsm_1/n85 ), .Y(n115) );
  INVX2 U193 ( .A(play), .Y(n117) );
  INVX2 U194 ( .A(invader_fire), .Y(n118) );
  INVX2 U195 ( .A(\main_game_fsm/n179 ), .Y(n119) );
  INVX2 U196 ( .A(main_game_state[1]), .Y(n120) );
  INVX2 U197 ( .A(\invader_fsm_4/n80 ), .Y(n121) );
  INVX2 U198 ( .A(\invader_fsm_4/n60 ), .Y(n122) );
  INVX2 U199 ( .A(\invader_fsm_3/n80 ), .Y(n123) );
  INVX2 U200 ( .A(\invader_fsm_3/n60 ), .Y(n124) );
  INVX2 U201 ( .A(\invader_fsm_2/n80 ), .Y(n125) );
  INVX2 U202 ( .A(\invader_fsm_2/n59 ), .Y(n126) );
  INVX2 U203 ( .A(\invader_fsm_1/n87 ), .Y(n127) );
  INVX2 U204 ( .A(\invader_fsm_1/n59 ), .Y(n128) );
  INVX2 U205 ( .A(move_down), .Y(n129) );
  INVX2 U206 ( .A(\invader_fsm_2/n84 ), .Y(n130) );
  INVX2 U207 ( .A(\invader_fsm_1/n80 ), .Y(n131) );
  INVX2 U208 ( .A(\player_bullet_fsm/n30 ), .Y(n132) );
  INVX2 U209 ( .A(\player_bullet_fsm/n35 ), .Y(n133) );
  INVX2 U210 ( .A(\player_bullet_fsm/n33 ), .Y(n134) );
  INVX2 U211 ( .A(\player_bullet_fsm/n32 ), .Y(n135) );
  INVX2 U212 ( .A(\player_bullet_fsm/n31 ), .Y(n136) );
  INVX2 U213 ( .A(\player_bullet_fsm/n28 ), .Y(n137) );
  INVX2 U214 ( .A(\invader_bullet_fsm/n22 ), .Y(n138) );
  INVX2 U215 ( .A(\invader_bullet_fsm/n21 ), .Y(n139) );
  INVX2 U216 ( .A(\invader_bullet_fsm/n20 ), .Y(n140) );
  INVX2 U217 ( .A(\invader_bullet_fsm/n14 ), .Y(n141) );
  INVX2 U218 ( .A(\invader_fsm_4/n74 ), .Y(n142) );
  INVX2 U219 ( .A(\invader_fsm_4/n92 ), .Y(n143) );
  INVX2 U220 ( .A(\invader_fsm_4/n97 ), .Y(n144) );
  INVX2 U221 ( .A(\invader_fsm_4/n75 ), .Y(n145) );
  INVX2 U222 ( .A(\invader_fsm_3/n74 ), .Y(n146) );
  INVX2 U223 ( .A(\invader_fsm_3/n92 ), .Y(n147) );
  INVX2 U224 ( .A(\invader_fsm_3/n97 ), .Y(n148) );
  INVX2 U225 ( .A(\invader_fsm_3/n75 ), .Y(n149) );
  INVX2 U226 ( .A(\invader_fsm_2/n73 ), .Y(n150) );
  INVX2 U227 ( .A(\invader_fsm_2/n90 ), .Y(n151) );
  INVX2 U228 ( .A(\invader_fsm_2/n95 ), .Y(n152) );
  INVX2 U229 ( .A(\invader_fsm_1/n73 ), .Y(n153) );
  INVX2 U230 ( .A(\invader_fsm_1/n90 ), .Y(n154) );
  INVX2 U231 ( .A(\invader_fsm_1/n95 ), .Y(n155) );
  INVX2 U232 ( .A(\shield_fsm/n68 ), .Y(n156) );
  INVX2 U233 ( .A(\shield_fsm/n71 ), .Y(n157) );
  INVX2 U234 ( .A(\shield_fsm/n64 ), .Y(n158) );
  INVX2 U235 ( .A(\main_game_fsm/next_state [1]), .Y(n159) );
  INVX2 U236 ( .A(\main_game_fsm/n104 ), .Y(n160) );
  INVX2 U237 ( .A(\main_game_fsm/prev_invader_outofbounds ), .Y(n161) );
  INVX2 U238 ( .A(\main_game_fsm/next_state [0]), .Y(n162) );
  INVX2 U239 ( .A(main_game_state[0]), .Y(n163) );
  INVX2 U240 ( .A(\main_game_fsm/n115 ), .Y(n164) );
  INVX2 U241 ( .A(n458), .Y(n165) );
  INVX2 U242 ( .A(\main_game_fsm/n113 ), .Y(n166) );
  INVX2 U243 ( .A(n454), .Y(n167) );
  INVX2 U244 ( .A(\main_game_fsm/n111 ), .Y(n168) );
  INVX2 U245 ( .A(n462), .Y(n169) );
  INVX2 U246 ( .A(\main_game_fsm/n110 ), .Y(n170) );
  INVX2 U247 ( .A(\main_game_fsm/N94 ), .Y(n171) );
  INVX2 U248 ( .A(n474), .Y(n172) );
  INVX2 U249 ( .A(n470), .Y(n173) );
  INVX2 U250 ( .A(n466), .Y(n174) );
  INVX2 U251 ( .A(\main_game_fsm/diff_alive4 [3]), .Y(n175) );
  INVX2 U252 ( .A(\main_game_fsm/diff_alive4 [1]), .Y(n176) );
  INVX2 U253 ( .A(\main_game_fsm/N70 ), .Y(n177) );
  INVX2 U254 ( .A(\main_game_fsm/diff_alive3 [5]), .Y(n178) );
  INVX2 U255 ( .A(\main_game_fsm/diff_alive3 [4]), .Y(n179) );
  INVX2 U256 ( .A(\main_game_fsm/diff_alive3 [2]), .Y(n180) );
  INVX2 U257 ( .A(\main_game_fsm/N56 ), .Y(n181) );
  INVX2 U258 ( .A(\main_game_fsm/n121 ), .Y(n182) );
  INVX2 U259 ( .A(\main_game_fsm/n120 ), .Y(n183) );
  INVX2 U260 ( .A(\main_game_fsm/n118 ), .Y(n184) );
  INVX2 U261 ( .A(\main_game_fsm/N88 ), .Y(n185) );
  INVX2 U262 ( .A(n510), .Y(n186) );
  INVX2 U263 ( .A(n506), .Y(n187) );
  INVX2 U264 ( .A(n502), .Y(n188) );
  INVX2 U265 ( .A(\main_game_fsm/diff_alive2 [3]), .Y(n189) );
  INVX2 U266 ( .A(\main_game_fsm/diff_alive2 [1]), .Y(n190) );
  INVX2 U267 ( .A(\main_game_fsm/N42 ), .Y(n191) );
  INVX2 U268 ( .A(\main_game_fsm/diff_alive1 [5]), .Y(n192) );
  INVX2 U269 ( .A(\main_game_fsm/diff_alive1 [4]), .Y(n193) );
  INVX2 U270 ( .A(\main_game_fsm/diff_alive1 [2]), .Y(n194) );
  INVX2 U271 ( .A(\main_game_fsm/N28 ), .Y(n195) );
  INVX2 U272 ( .A(n536), .Y(n196) );
  INVX2 U273 ( .A(\player_fsm/N18 ), .Y(n197) );
  INVX2 U274 ( .A(\player_fsm/N17 ), .Y(n198) );
  INVX2 U275 ( .A(n566), .Y(n199) );
  INVX2 U276 ( .A(n562), .Y(n200) );
  INVX2 U277 ( .A(\player_fsm/N15 ), .Y(n201) );
  INVX2 U278 ( .A(\player_fsm/N13 ), .Y(n202) );
  INVX2 U279 ( .A(n482), .Y(n203) );
  INVX2 U280 ( .A(n494), .Y(n204) );
  INVX2 U281 ( .A(n518), .Y(n205) );
  INVX2 U282 ( .A(n530), .Y(n206) );
  INVX2 U283 ( .A(n553), .Y(n207) );
  INVX2 U284 ( .A(n478), .Y(n208) );
  INVX2 U285 ( .A(n490), .Y(n209) );
  INVX2 U286 ( .A(n514), .Y(n210) );
  INVX2 U287 ( .A(n526), .Y(n211) );
  INVX2 U288 ( .A(n549), .Y(n212) );
  INVX2 U289 ( .A(n593), .Y(n213) );
  INVX2 U290 ( .A(n576), .Y(n214) );
  INVX2 U291 ( .A(n587), .Y(n215) );
  INVX2 U292 ( .A(n486), .Y(n216) );
  INVX2 U293 ( .A(n498), .Y(n217) );
  INVX2 U294 ( .A(n522), .Y(n218) );
  INVX2 U295 ( .A(n534), .Y(n219) );
  INVX2 U296 ( .A(n599), .Y(n220) );
  INVX2 U297 ( .A(\player_fsm/n61 ), .Y(n221) );
  INVX2 U298 ( .A(\player_fsm/next_state [1]), .Y(n222) );
  INVX2 U299 ( .A(\player_fsm/state[0] ), .Y(n223) );
  INVX2 U300 ( .A(\player_fsm/next_state [0]), .Y(n224) );
  INVX2 U301 ( .A(\shield_fsm/n74 ), .Y(n225) );
  INVX2 U302 ( .A(n614), .Y(n226) );
  INVX2 U303 ( .A(n630), .Y(n227) );
  INVX2 U304 ( .A(\shield_fsm/N13 ), .Y(n228) );
  INVX2 U305 ( .A(shield_coord_x[1]), .Y(n229) );
  INVX2 U306 ( .A(n607), .Y(n230) );
  INVX2 U307 ( .A(n623), .Y(n231) );
  INVX2 U308 ( .A(shield_coord_x[2]), .Y(n232) );
  INVX2 U309 ( .A(n603), .Y(n233) );
  INVX2 U310 ( .A(n619), .Y(n234) );
  INVX2 U311 ( .A(shield_coord_x[3]), .Y(n235) );
  INVX2 U312 ( .A(shield_coord_y[2]), .Y(n236) );
  INVX2 U313 ( .A(\shield_fsm/n69 ), .Y(n237) );
  INVX2 U314 ( .A(\shield_fsm/next_state [1]), .Y(n238) );
  INVX2 U315 ( .A(\shield_fsm/state[0] ), .Y(n239) );
  INVX2 U316 ( .A(shield_hp[1]), .Y(n240) );
  INVX2 U317 ( .A(shield_hp[0]), .Y(n241) );
  INVX2 U318 ( .A(\main_game_fsm/n100 ), .Y(n242) );
  INVX2 U319 ( .A(\invader_fsm_1/n96 ), .Y(n243) );
  INVX2 U320 ( .A(\invader_fsm_1/N34 ), .Y(n244) );
  INVX2 U321 ( .A(\invader_fsm_1/N33 ), .Y(n245) );
  INVX2 U322 ( .A(invader_1_coord_y[5]), .Y(n246) );
  INVX2 U323 ( .A(\invader_fsm_1/N40 ), .Y(n247) );
  INVX2 U324 ( .A(invader_1_coord_y[4]), .Y(n248) );
  INVX2 U325 ( .A(n650), .Y(n249) );
  INVX2 U326 ( .A(n646), .Y(n250) );
  INVX2 U327 ( .A(n657), .Y(n251) );
  INVX2 U328 ( .A(n667), .Y(n252) );
  INVX2 U329 ( .A(n663), .Y(n253) );
  INVX2 U330 ( .A(\invader_fsm_1/N31 ), .Y(n254) );
  INVX2 U331 ( .A(\invader_fsm_1/N38 ), .Y(n255) );
  INVX2 U332 ( .A(invader_1_coord_y[2]), .Y(n256) );
  INVX2 U333 ( .A(invader_1_coord_y[1]), .Y(n257) );
  INVX2 U334 ( .A(n645), .Y(n258) );
  INVX2 U335 ( .A(n654), .Y(n259) );
  INVX2 U336 ( .A(\invader_fsm_1/N29 ), .Y(n260) );
  INVX2 U337 ( .A(\invader_fsm_1/N70 ), .Y(n261) );
  INVX2 U338 ( .A(\invader_fsm_1/state[1] ), .Y(n262) );
  INVX2 U339 ( .A(n635), .Y(n263) );
  INVX2 U340 ( .A(n706), .Y(n264) );
  INVX2 U341 ( .A(\invader_fsm_1/N18 ), .Y(n265) );
  INVX2 U342 ( .A(\invader_fsm_1/N17 ), .Y(n266) );
  INVX2 U343 ( .A(\invader_fsm_1/N24 ), .Y(n267) );
  INVX2 U344 ( .A(invader_1_coord_x[4]), .Y(n268) );
  INVX2 U345 ( .A(\invader_fsm_1/N16 ), .Y(n269) );
  INVX2 U346 ( .A(n683), .Y(n270) );
  INVX2 U347 ( .A(\invader_fsm_1/N22 ), .Y(n271) );
  INVX2 U348 ( .A(n679), .Y(n272) );
  INVX2 U349 ( .A(n703), .Y(n273) );
  INVX2 U350 ( .A(invader_1_coord_x[2]), .Y(n274) );
  INVX2 U351 ( .A(n693), .Y(n275) );
  INVX2 U352 ( .A(n689), .Y(n276) );
  INVX2 U353 ( .A(\invader_fsm_1/N15 ), .Y(n277) );
  INVX2 U354 ( .A(n678), .Y(n278) );
  INVX2 U355 ( .A(n700), .Y(n279) );
  INVX2 U356 ( .A(\invader_fsm_1/N13 ), .Y(n280) );
  INVX2 U357 ( .A(invader_1_display), .Y(n281) );
  INVX2 U358 ( .A(\invader_fsm_1/move_interval_toggle ), .Y(n282) );
  INVX2 U359 ( .A(\invader_fsm_1/n70 ), .Y(n283) );
  INVX2 U360 ( .A(\invader_fsm_1/n69 ), .Y(n284) );
  INVX2 U361 ( .A(\invader_fsm_1/state[0] ), .Y(n285) );
  INVX2 U362 ( .A(\invader_fsm_1/next_state [0]), .Y(n286) );
  INVX2 U363 ( .A(\invader_fsm_2/n96 ), .Y(n287) );
  INVX2 U364 ( .A(\invader_fsm_2/N34 ), .Y(n288) );
  INVX2 U365 ( .A(\invader_fsm_2/N33 ), .Y(n289) );
  INVX2 U366 ( .A(invader_2_coord_y[5]), .Y(n290) );
  INVX2 U367 ( .A(\invader_fsm_2/N40 ), .Y(n291) );
  INVX2 U368 ( .A(invader_2_coord_y[4]), .Y(n292) );
  INVX2 U369 ( .A(n724), .Y(n293) );
  INVX2 U370 ( .A(n720), .Y(n294) );
  INVX2 U371 ( .A(n731), .Y(n295) );
  INVX2 U372 ( .A(n741), .Y(n296) );
  INVX2 U373 ( .A(n737), .Y(n297) );
  INVX2 U374 ( .A(\invader_fsm_2/N31 ), .Y(n298) );
  INVX2 U375 ( .A(\invader_fsm_2/N38 ), .Y(n299) );
  INVX2 U376 ( .A(invader_2_coord_y[2]), .Y(n300) );
  INVX2 U377 ( .A(invader_2_coord_y[1]), .Y(n301) );
  INVX2 U378 ( .A(n719), .Y(n302) );
  INVX2 U379 ( .A(n728), .Y(n303) );
  INVX2 U380 ( .A(\invader_fsm_2/N29 ), .Y(n304) );
  INVX2 U381 ( .A(\invader_fsm_2/N70 ), .Y(n305) );
  INVX2 U382 ( .A(\invader_fsm_2/state[1] ), .Y(n306) );
  INVX2 U383 ( .A(n709), .Y(n307) );
  INVX2 U384 ( .A(n780), .Y(n308) );
  INVX2 U385 ( .A(\invader_fsm_2/N18 ), .Y(n309) );
  INVX2 U386 ( .A(\invader_fsm_2/N17 ), .Y(n310) );
  INVX2 U387 ( .A(\invader_fsm_2/N24 ), .Y(n311) );
  INVX2 U388 ( .A(invader_2_coord_x[4]), .Y(n312) );
  INVX2 U389 ( .A(\invader_fsm_2/N16 ), .Y(n313) );
  INVX2 U390 ( .A(n757), .Y(n314) );
  INVX2 U391 ( .A(n753), .Y(n315) );
  INVX2 U392 ( .A(n777), .Y(n316) );
  INVX2 U393 ( .A(n767), .Y(n317) );
  INVX2 U394 ( .A(n763), .Y(n318) );
  INVX2 U395 ( .A(\invader_fsm_2/N15 ), .Y(n319) );
  INVX2 U396 ( .A(\invader_fsm_2/N22 ), .Y(n320) );
  INVX2 U397 ( .A(invader_2_coord_x[2]), .Y(n321) );
  INVX2 U398 ( .A(n752), .Y(n322) );
  INVX2 U399 ( .A(n774), .Y(n323) );
  INVX2 U400 ( .A(\invader_fsm_2/N13 ), .Y(n324) );
  INVX2 U401 ( .A(invader_2_display), .Y(n325) );
  INVX2 U402 ( .A(\invader_fsm_2/move_interval_toggle ), .Y(n326) );
  INVX2 U403 ( .A(\invader_fsm_2/n70 ), .Y(n327) );
  INVX2 U404 ( .A(\invader_fsm_2/n69 ), .Y(n328) );
  INVX2 U405 ( .A(\invader_fsm_2/state[0] ), .Y(n329) );
  INVX2 U406 ( .A(\invader_fsm_2/next_state [0]), .Y(n330) );
  INVX2 U407 ( .A(\invader_fsm_2/N84 ), .Y(n331) );
  INVX2 U408 ( .A(\invader_fsm_3/n98 ), .Y(n332) );
  INVX2 U409 ( .A(\invader_fsm_3/N34 ), .Y(n333) );
  INVX2 U410 ( .A(\invader_fsm_3/N33 ), .Y(n334) );
  INVX2 U411 ( .A(invader_3_coord_y[5]), .Y(n335) );
  INVX2 U412 ( .A(\invader_fsm_3/N40 ), .Y(n336) );
  INVX2 U413 ( .A(invader_3_coord_y[4]), .Y(n337) );
  INVX2 U414 ( .A(n798), .Y(n338) );
  INVX2 U415 ( .A(n794), .Y(n339) );
  INVX2 U416 ( .A(n805), .Y(n340) );
  INVX2 U417 ( .A(n815), .Y(n341) );
  INVX2 U418 ( .A(n811), .Y(n342) );
  INVX2 U419 ( .A(\invader_fsm_3/N31 ), .Y(n343) );
  INVX2 U420 ( .A(\invader_fsm_3/N38 ), .Y(n344) );
  INVX2 U421 ( .A(invader_3_coord_y[2]), .Y(n345) );
  INVX2 U422 ( .A(invader_3_coord_y[1]), .Y(n346) );
  INVX2 U423 ( .A(n793), .Y(n347) );
  INVX2 U424 ( .A(n802), .Y(n348) );
  INVX2 U425 ( .A(\invader_fsm_3/N29 ), .Y(n349) );
  INVX2 U426 ( .A(\invader_fsm_3/N70 ), .Y(n350) );
  INVX2 U427 ( .A(\invader_fsm_3/state[1] ), .Y(n351) );
  INVX2 U428 ( .A(n783), .Y(n352) );
  INVX2 U429 ( .A(n854), .Y(n353) );
  INVX2 U430 ( .A(\invader_fsm_3/N18 ), .Y(n354) );
  INVX2 U431 ( .A(\invader_fsm_3/N17 ), .Y(n355) );
  INVX2 U432 ( .A(\invader_fsm_3/N24 ), .Y(n356) );
  INVX2 U433 ( .A(invader_3_coord_x[4]), .Y(n357) );
  INVX2 U434 ( .A(n831), .Y(n358) );
  INVX2 U435 ( .A(\invader_fsm_3/N22 ), .Y(n359) );
  INVX2 U436 ( .A(n827), .Y(n360) );
  INVX2 U437 ( .A(n851), .Y(n361) );
  INVX2 U438 ( .A(n841), .Y(n362) );
  INVX2 U439 ( .A(n837), .Y(n363) );
  INVX2 U440 ( .A(\invader_fsm_3/N15 ), .Y(n364) );
  INVX2 U441 ( .A(invader_3_coord_x[2]), .Y(n365) );
  INVX2 U442 ( .A(n826), .Y(n366) );
  INVX2 U443 ( .A(n848), .Y(n367) );
  INVX2 U444 ( .A(\invader_fsm_3/N13 ), .Y(n368) );
  INVX2 U445 ( .A(invader_3_display), .Y(n369) );
  INVX2 U446 ( .A(\invader_fsm_3/move_interval_toggle ), .Y(n370) );
  INVX2 U447 ( .A(\invader_fsm_3/n71 ), .Y(n371) );
  INVX2 U448 ( .A(\invader_fsm_3/n70 ), .Y(n372) );
  INVX2 U449 ( .A(\invader_fsm_3/state[0] ), .Y(n373) );
  INVX2 U450 ( .A(\invader_fsm_3/next_state [0]), .Y(n374) );
  INVX2 U451 ( .A(\invader_fsm_4/n98 ), .Y(n375) );
  INVX2 U452 ( .A(\invader_fsm_4/N34 ), .Y(n376) );
  INVX2 U453 ( .A(\invader_fsm_4/N33 ), .Y(n377) );
  INVX2 U454 ( .A(invader_4_coord_y[5]), .Y(n378) );
  INVX2 U455 ( .A(\invader_fsm_4/N40 ), .Y(n379) );
  INVX2 U456 ( .A(invader_4_coord_y[4]), .Y(n380) );
  INVX2 U457 ( .A(n872), .Y(n381) );
  INVX2 U458 ( .A(n868), .Y(n382) );
  INVX2 U459 ( .A(n879), .Y(n383) );
  INVX2 U460 ( .A(n889), .Y(n384) );
  INVX2 U461 ( .A(n885), .Y(n385) );
  INVX2 U462 ( .A(\invader_fsm_4/N31 ), .Y(n386) );
  INVX2 U463 ( .A(\invader_fsm_4/N38 ), .Y(n387) );
  INVX2 U464 ( .A(invader_4_coord_y[2]), .Y(n388) );
  INVX2 U465 ( .A(invader_4_coord_y[1]), .Y(n389) );
  INVX2 U466 ( .A(n867), .Y(n390) );
  INVX2 U467 ( .A(n876), .Y(n391) );
  INVX2 U468 ( .A(\invader_fsm_4/N29 ), .Y(n392) );
  INVX2 U469 ( .A(\invader_fsm_4/N70 ), .Y(n393) );
  INVX2 U470 ( .A(\invader_fsm_4/state[1] ), .Y(n394) );
  INVX2 U471 ( .A(n857), .Y(n395) );
  INVX2 U472 ( .A(n928), .Y(n396) );
  INVX2 U473 ( .A(\invader_fsm_4/N18 ), .Y(n397) );
  INVX2 U474 ( .A(\invader_fsm_4/N17 ), .Y(n398) );
  INVX2 U475 ( .A(\invader_fsm_4/N24 ), .Y(n399) );
  INVX2 U476 ( .A(invader_4_coord_x[4]), .Y(n400) );
  INVX2 U477 ( .A(n905), .Y(n401) );
  INVX2 U478 ( .A(n901), .Y(n402) );
  INVX2 U479 ( .A(n925), .Y(n403) );
  INVX2 U480 ( .A(n915), .Y(n404) );
  INVX2 U481 ( .A(n911), .Y(n405) );
  INVX2 U482 ( .A(\invader_fsm_4/N15 ), .Y(n406) );
  INVX2 U483 ( .A(\invader_fsm_4/N22 ), .Y(n407) );
  INVX2 U484 ( .A(invader_4_coord_x[2]), .Y(n408) );
  INVX2 U485 ( .A(n900), .Y(n409) );
  INVX2 U486 ( .A(n922), .Y(n410) );
  INVX2 U487 ( .A(\invader_fsm_4/N13 ), .Y(n411) );
  INVX2 U488 ( .A(invader_4_display), .Y(n412) );
  INVX2 U489 ( .A(\invader_fsm_4/move_interval_toggle ), .Y(n413) );
  INVX2 U490 ( .A(\invader_fsm_4/n71 ), .Y(n414) );
  INVX2 U491 ( .A(\invader_fsm_4/n70 ), .Y(n415) );
  INVX2 U492 ( .A(\invader_fsm_4/state[0] ), .Y(n416) );
  INVX2 U493 ( .A(\invader_fsm_4/next_state [0]), .Y(n417) );
  INVX2 U494 ( .A(\invader_fsm_4/N84 ), .Y(n418) );
  INVX2 U495 ( .A(\shield_fsm/N35 ), .Y(n419) );
  INVX2 U496 ( .A(\player_bullet_fsm/N22 ), .Y(n424) );
  INVX2 U497 ( .A(n932), .Y(n425) );
  INVX2 U498 ( .A(player_bullet_coord_y[4]), .Y(n426) );
  INVX2 U499 ( .A(player_bullet_coord_y[2]), .Y(n428) );
  INVX2 U500 ( .A(playerbullet_state[0]), .Y(n429) );
  INVX2 U501 ( .A(\player_bullet_fsm/next_state[0] ), .Y(n430) );
  INVX2 U502 ( .A(\invader_bullet_fsm/state[0] ), .Y(n432) );
  INVX2 U503 ( .A(\player_fsm/N27 ), .Y(n433) );
  INVX2 U504 ( .A(\player_fsm/N26 ), .Y(n434) );
  INVX2 U505 ( .A(\player_fsm/N24 ), .Y(n435) );
  INVX2 U506 ( .A(\player_fsm/N22 ), .Y(n436) );
  INVX2 U507 ( .A(\shield_fsm/N19 ), .Y(n437) );
  INVX2 U508 ( .A(invader_bullet_coord_x[5]), .Y(n438) );
  INVX2 U509 ( .A(invader_bullet_coord_x[4]), .Y(n439) );
  INVX2 U510 ( .A(invader_bullet_coord_x[1]), .Y(n440) );
  INVX2 U511 ( .A(invader_bullet_coord_x[3]), .Y(n441) );
  INVX2 U512 ( .A(invader_bullet_coord_x[2]), .Y(n442) );
  INVX2 U513 ( .A(\player_fsm/N40 ), .Y(n443) );
  INVX2 U514 ( .A(n934), .Y(n444) );
  INVX2 U515 ( .A(invader_bullet_coord_y[1]), .Y(n445) );
  INVX2 U516 ( .A(invader_bullet_coord_y[3]), .Y(n446) );
  INVX2 U517 ( .A(invader_bullet_coord_y[0]), .Y(n448) );
  AOI21X1 U518 ( .A(closest_invader_coord_y[2]), .B(closest_invader_coord_y[1]), .C(closest_invader_coord_y[3]), .Y(n450) );
  NOR2X1 U519 ( .A(closest_invader_coord_y[5]), .B(closest_invader_coord_y[4]), 
        .Y(n449) );
  NOR2X1 U520 ( .A(\main_game_fsm/n116 ), .B(n170), .Y(n462) );
  AOI22X1 U521 ( .A(n168), .B(\main_game_fsm/n117 ), .C(n170), .D(
        \main_game_fsm/n116 ), .Y(n461) );
  OAI21X1 U522 ( .A(n168), .B(\main_game_fsm/n117 ), .C(n169), .Y(n460) );
  NAND2X1 U523 ( .A(n184), .B(\main_game_fsm/n112 ), .Y(n454) );
  NAND3X1 U524 ( .A(n454), .B(\main_game_fsm/n119 ), .C(n166), .Y(n451) );
  OAI21X1 U525 ( .A(n184), .B(\main_game_fsm/n112 ), .C(n451), .Y(n458) );
  AOI21X1 U526 ( .A(n183), .B(\main_game_fsm/n114 ), .C(n182), .Y(n452) );
  NAND2X1 U527 ( .A(n452), .B(n164), .Y(n453) );
  OAI21X1 U528 ( .A(n183), .B(\main_game_fsm/n114 ), .C(n453), .Y(n457) );
  NOR2X1 U529 ( .A(n166), .B(\main_game_fsm/n119 ), .Y(n455) );
  OAI21X1 U530 ( .A(n167), .B(n455), .C(n165), .Y(n456) );
  OAI21X1 U531 ( .A(n458), .B(n457), .C(n456), .Y(n459) );
  OAI22X1 U532 ( .A(n462), .B(n461), .C(n460), .D(n459), .Y(
        \main_game_fsm/N100 ) );
  NOR2X1 U533 ( .A(n178), .B(\main_game_fsm/diff_alive4 [5]), .Y(n474) );
  AOI22X1 U534 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n179), .C(
        \main_game_fsm/diff_alive4 [5]), .D(n178), .Y(n473) );
  OAI21X1 U535 ( .A(\main_game_fsm/diff_alive4 [4]), .B(n179), .C(n172), .Y(
        n472) );
  NAND2X1 U536 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n175), .Y(n466) );
  NAND3X1 U537 ( .A(n466), .B(n180), .C(\main_game_fsm/diff_alive4 [2]), .Y(
        n463) );
  OAI21X1 U538 ( .A(\main_game_fsm/diff_alive3 [3]), .B(n175), .C(n463), .Y(
        n470) );
  AOI21X1 U539 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n176), .C(
        \main_game_fsm/diff_alive3 [0]), .Y(n464) );
  NAND2X1 U540 ( .A(n464), .B(\main_game_fsm/diff_alive4 [0]), .Y(n465) );
  OAI21X1 U541 ( .A(\main_game_fsm/diff_alive3 [1]), .B(n176), .C(n465), .Y(
        n469) );
  NOR2X1 U542 ( .A(\main_game_fsm/diff_alive4 [2]), .B(n180), .Y(n467) );
  OAI21X1 U543 ( .A(n174), .B(n467), .C(n173), .Y(n468) );
  OAI21X1 U544 ( .A(n470), .B(n469), .C(n468), .Y(n471) );
  OAI22X1 U545 ( .A(n474), .B(n473), .C(n472), .D(n471), .Y(
        \main_game_fsm/N94 ) );
  NOR2X1 U546 ( .A(n53), .B(n942), .Y(n486) );
  AOI22X1 U547 ( .A(n943), .B(n400), .C(player_coord_x[5]), .D(n53), .Y(n485)
         );
  OAI21X1 U548 ( .A(n943), .B(n400), .C(n216), .Y(n484) );
  NAND2X1 U549 ( .A(invader_4_coord_x[3]), .B(n70), .Y(n478) );
  NAND3X1 U550 ( .A(n478), .B(n408), .C(n944), .Y(n475) );
  OAI21X1 U551 ( .A(invader_4_coord_x[3]), .B(n70), .C(n475), .Y(n482) );
  AOI21X1 U552 ( .A(invader_4_coord_x[1]), .B(n73), .C(\invader_fsm_4/N84 ), 
        .Y(n476) );
  NAND2X1 U553 ( .A(n476), .B(player_coord_x[0]), .Y(n477) );
  OAI21X1 U554 ( .A(invader_4_coord_x[1]), .B(n73), .C(n477), .Y(n481) );
  NOR2X1 U555 ( .A(player_coord_x[2]), .B(n408), .Y(n479) );
  OAI21X1 U556 ( .A(n208), .B(n479), .C(n203), .Y(n480) );
  OAI21X1 U557 ( .A(n482), .B(n481), .C(n480), .Y(n483) );
  OAI22X1 U558 ( .A(n486), .B(n485), .C(n484), .D(n483), .Y(
        \main_game_fsm/N70 ) );
  NOR2X1 U559 ( .A(n57), .B(player_coord_x[5]), .Y(n498) );
  AOI22X1 U560 ( .A(player_coord_x[4]), .B(n357), .C(n942), .D(n57), .Y(n497)
         );
  OAI21X1 U561 ( .A(player_coord_x[4]), .B(n357), .C(n217), .Y(n496) );
  NAND2X1 U562 ( .A(invader_3_coord_x[3]), .B(n70), .Y(n490) );
  NAND3X1 U563 ( .A(n490), .B(n365), .C(player_coord_x[2]), .Y(n487) );
  OAI21X1 U564 ( .A(invader_3_coord_x[3]), .B(n70), .C(n487), .Y(n494) );
  AOI21X1 U565 ( .A(invader_3_coord_x[1]), .B(n73), .C(\invader_fsm_3/N84 ), 
        .Y(n488) );
  NAND2X1 U566 ( .A(n488), .B(player_coord_x[0]), .Y(n489) );
  OAI21X1 U567 ( .A(invader_3_coord_x[1]), .B(n73), .C(n489), .Y(n493) );
  NOR2X1 U568 ( .A(player_coord_x[2]), .B(n365), .Y(n491) );
  OAI21X1 U569 ( .A(n209), .B(n491), .C(n204), .Y(n492) );
  OAI21X1 U570 ( .A(n494), .B(n493), .C(n492), .Y(n495) );
  OAI22X1 U571 ( .A(n498), .B(n497), .C(n496), .D(n495), .Y(
        \main_game_fsm/N56 ) );
  NOR2X1 U572 ( .A(n192), .B(\main_game_fsm/diff_alive2 [5]), .Y(n510) );
  AOI22X1 U573 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n193), .C(
        \main_game_fsm/diff_alive2 [5]), .D(n192), .Y(n509) );
  OAI21X1 U574 ( .A(\main_game_fsm/diff_alive2 [4]), .B(n193), .C(n186), .Y(
        n508) );
  NAND2X1 U575 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n189), .Y(n502) );
  NAND3X1 U576 ( .A(n502), .B(n194), .C(\main_game_fsm/diff_alive2 [2]), .Y(
        n499) );
  OAI21X1 U577 ( .A(\main_game_fsm/diff_alive1 [3]), .B(n189), .C(n499), .Y(
        n506) );
  AOI21X1 U578 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n190), .C(
        \main_game_fsm/diff_alive1 [0]), .Y(n500) );
  NAND2X1 U579 ( .A(n500), .B(\main_game_fsm/diff_alive2 [0]), .Y(n501) );
  OAI21X1 U580 ( .A(\main_game_fsm/diff_alive1 [1]), .B(n190), .C(n501), .Y(
        n505) );
  NOR2X1 U581 ( .A(\main_game_fsm/diff_alive2 [2]), .B(n194), .Y(n503) );
  OAI21X1 U582 ( .A(n188), .B(n503), .C(n187), .Y(n504) );
  OAI21X1 U583 ( .A(n506), .B(n505), .C(n504), .Y(n507) );
  OAI22X1 U584 ( .A(n510), .B(n509), .C(n508), .D(n507), .Y(
        \main_game_fsm/N88 ) );
  NOR2X1 U585 ( .A(n60), .B(n942), .Y(n522) );
  AOI22X1 U586 ( .A(n943), .B(n312), .C(player_coord_x[5]), .D(n60), .Y(n521)
         );
  OAI21X1 U587 ( .A(n943), .B(n312), .C(n218), .Y(n520) );
  NAND2X1 U588 ( .A(invader_2_coord_x[3]), .B(n70), .Y(n514) );
  NAND3X1 U589 ( .A(n514), .B(n321), .C(n944), .Y(n511) );
  OAI21X1 U590 ( .A(invader_2_coord_x[3]), .B(n70), .C(n511), .Y(n518) );
  AOI21X1 U591 ( .A(invader_2_coord_x[1]), .B(n73), .C(\invader_fsm_2/N84 ), 
        .Y(n512) );
  NAND2X1 U592 ( .A(n512), .B(player_coord_x[0]), .Y(n513) );
  OAI21X1 U593 ( .A(invader_2_coord_x[1]), .B(n73), .C(n513), .Y(n517) );
  NOR2X1 U594 ( .A(n944), .B(n321), .Y(n515) );
  OAI21X1 U595 ( .A(n210), .B(n515), .C(n205), .Y(n516) );
  OAI21X1 U596 ( .A(n518), .B(n517), .C(n516), .Y(n519) );
  OAI22X1 U597 ( .A(n522), .B(n521), .C(n520), .D(n519), .Y(
        \main_game_fsm/N42 ) );
  NOR2X1 U598 ( .A(n64), .B(player_coord_x[5]), .Y(n534) );
  AOI22X1 U599 ( .A(player_coord_x[4]), .B(n268), .C(n942), .D(n64), .Y(n533)
         );
  OAI21X1 U600 ( .A(player_coord_x[4]), .B(n268), .C(n219), .Y(n532) );
  NAND2X1 U601 ( .A(invader_1_coord_x[3]), .B(n70), .Y(n526) );
  NAND3X1 U602 ( .A(n526), .B(n274), .C(player_coord_x[2]), .Y(n523) );
  OAI21X1 U603 ( .A(invader_1_coord_x[3]), .B(n70), .C(n523), .Y(n530) );
  AOI21X1 U604 ( .A(invader_1_coord_x[1]), .B(n73), .C(\invader_fsm_1/N84 ), 
        .Y(n524) );
  NAND2X1 U605 ( .A(n524), .B(player_coord_x[0]), .Y(n525) );
  OAI21X1 U606 ( .A(invader_1_coord_x[1]), .B(n73), .C(n525), .Y(n529) );
  NOR2X1 U607 ( .A(player_coord_x[2]), .B(n274), .Y(n527) );
  OAI21X1 U608 ( .A(n211), .B(n527), .C(n206), .Y(n528) );
  OAI21X1 U609 ( .A(n530), .B(n529), .C(n528), .Y(n531) );
  OAI22X1 U610 ( .A(n534), .B(n533), .C(n532), .D(n531), .Y(
        \main_game_fsm/N28 ) );
  NAND2X1 U611 ( .A(n73), .B(n69), .Y(n535) );
  OAI21X1 U612 ( .A(n69), .B(n73), .C(n535), .Y(\player_fsm/N79 ) );
  NOR2X1 U613 ( .A(n535), .B(n944), .Y(n537) );
  AOI21X1 U614 ( .A(n535), .B(n944), .C(n537), .Y(n536) );
  NAND2X1 U615 ( .A(n537), .B(n70), .Y(n538) );
  OAI21X1 U616 ( .A(n537), .B(n70), .C(n538), .Y(\player_fsm/N81 ) );
  XNOR2X1 U617 ( .A(n943), .B(n538), .Y(\player_fsm/N82 ) );
  NOR2X1 U618 ( .A(n943), .B(n538), .Y(n539) );
  XOR2X1 U619 ( .A(n942), .B(n539), .Y(\player_fsm/N83 ) );
  NOR2X1 U620 ( .A(player_coord_x[3]), .B(player_coord_x[2]), .Y(n541) );
  NOR2X1 U621 ( .A(player_coord_x[5]), .B(player_coord_x[4]), .Y(n540) );
  NAND2X1 U622 ( .A(n541), .B(n540), .Y(\player_fsm/N72 ) );
  NOR2X1 U623 ( .A(\player_fsm/N42 ), .B(\player_fsm/N41 ), .Y(n544) );
  OR2X1 U624 ( .A(\player_fsm/N45 ), .B(\player_fsm/N44 ), .Y(n542) );
  NOR2X1 U625 ( .A(\player_fsm/N43 ), .B(n542), .Y(n543) );
  NAND3X1 U626 ( .A(n544), .B(n443), .C(n543), .Y(\player_fsm/N46 ) );
  NOR2X1 U627 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n546) );
  NOR2X1 U628 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n545) );
  OAI21X1 U629 ( .A(n942), .B(n434), .C(n433), .Y(n559) );
  NAND2X1 U630 ( .A(n942), .B(n434), .Y(n554) );
  OAI21X1 U631 ( .A(\player_fsm/N25 ), .B(n65), .C(n554), .Y(n557) );
  NAND2X1 U632 ( .A(player_coord_x[3]), .B(n435), .Y(n549) );
  NAND3X1 U633 ( .A(n549), .B(n71), .C(\player_fsm/N23 ), .Y(n547) );
  OAI21X1 U634 ( .A(player_coord_x[3]), .B(n435), .C(n547), .Y(n553) );
  OAI22X1 U635 ( .A(\player_fsm/N22 ), .B(n73), .C(n437), .D(n69), .Y(n548) );
  OAI21X1 U636 ( .A(player_coord_x[1]), .B(n436), .C(n548), .Y(n552) );
  NOR2X1 U637 ( .A(\player_fsm/N23 ), .B(n71), .Y(n550) );
  OAI21X1 U638 ( .A(n212), .B(n550), .C(n207), .Y(n551) );
  OAI21X1 U639 ( .A(n553), .B(n552), .C(n551), .Y(n556) );
  NAND3X1 U640 ( .A(n554), .B(n65), .C(\player_fsm/N25 ), .Y(n555) );
  OAI21X1 U641 ( .A(n557), .B(n556), .C(n555), .Y(n558) );
  OR2X1 U642 ( .A(n559), .B(n558), .Y(\player_fsm/N28 ) );
  OAI21X1 U643 ( .A(invader_bullet_coord_x[5]), .B(n198), .C(n197), .Y(n572)
         );
  NAND2X1 U644 ( .A(invader_bullet_coord_x[5]), .B(n198), .Y(n567) );
  OAI21X1 U645 ( .A(\player_fsm/N16 ), .B(n439), .C(n567), .Y(n570) );
  NAND2X1 U646 ( .A(invader_bullet_coord_x[3]), .B(n201), .Y(n562) );
  NAND3X1 U647 ( .A(n562), .B(n442), .C(\player_fsm/N14 ), .Y(n560) );
  OAI21X1 U648 ( .A(invader_bullet_coord_x[3]), .B(n201), .C(n560), .Y(n566)
         );
  OAI22X1 U649 ( .A(\player_fsm/N13 ), .B(n440), .C(n69), .D(n437), .Y(n561)
         );
  OAI21X1 U650 ( .A(invader_bullet_coord_x[1]), .B(n202), .C(n561), .Y(n565)
         );
  NOR2X1 U651 ( .A(\player_fsm/N14 ), .B(n442), .Y(n563) );
  OAI21X1 U652 ( .A(n200), .B(n563), .C(n199), .Y(n564) );
  OAI21X1 U653 ( .A(n566), .B(n565), .C(n564), .Y(n569) );
  NAND3X1 U654 ( .A(n567), .B(n439), .C(\player_fsm/N16 ), .Y(n568) );
  OAI21X1 U655 ( .A(n570), .B(n569), .C(n568), .Y(n571) );
  OR2X1 U656 ( .A(n572), .B(n571), .Y(\player_fsm/N19 ) );
  NOR2X1 U657 ( .A(invader_bullet_coord_y[3]), .B(invader_bullet_coord_y[2]), 
        .Y(n574) );
  NOR2X1 U658 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n573) );
  NAND2X1 U659 ( .A(n574), .B(n573), .Y(n575) );
  OR2X1 U660 ( .A(n575), .B(invader_bullet_coord_y[1]), .Y(\player_fsm/N38 )
         );
  AOI21X1 U661 ( .A(invader_bullet_coord_y[1]), .B(invader_bullet_coord_y[0]), 
        .C(n575), .Y(\player_fsm/N47 ) );
  NOR2X1 U662 ( .A(n438), .B(n942), .Y(n599) );
  OR2X1 U663 ( .A(n439), .B(player_coord_x[4]), .Y(n594) );
  NAND2X1 U664 ( .A(player_coord_x[4]), .B(n439), .Y(n582) );
  NAND2X1 U665 ( .A(n594), .B(n582), .Y(n596) );
  OR2X1 U666 ( .A(n71), .B(invader_bullet_coord_x[2]), .Y(n578) );
  NAND2X1 U667 ( .A(invader_bullet_coord_x[2]), .B(n71), .Y(n588) );
  NAND2X1 U668 ( .A(n578), .B(n588), .Y(n590) );
  NAND2X1 U669 ( .A(player_coord_x[0]), .B(n437), .Y(n576) );
  OAI21X1 U670 ( .A(invader_bullet_coord_x[1]), .B(n576), .C(n73), .Y(n577) );
  OAI21X1 U671 ( .A(n214), .B(n440), .C(n577), .Y(n580) );
  NAND2X1 U672 ( .A(player_coord_x[3]), .B(n441), .Y(n591) );
  OAI21X1 U673 ( .A(n590), .B(n580), .C(n579), .Y(n581) );
  NOR2X1 U674 ( .A(n441), .B(player_coord_x[3]), .Y(n593) );
  NAND2X1 U675 ( .A(n581), .B(n213), .Y(n584) );
  NAND2X1 U676 ( .A(player_coord_x[5]), .B(n438), .Y(n597) );
  OAI21X1 U677 ( .A(n596), .B(n584), .C(n583), .Y(n585) );
  NAND2X1 U678 ( .A(n220), .B(n585), .Y(\player_fsm/N20 ) );
  NOR2X1 U679 ( .A(n437), .B(player_coord_x[0]), .Y(n587) );
  OAI21X1 U680 ( .A(n215), .B(n440), .C(player_coord_x[1]), .Y(n586) );
  OAI21X1 U681 ( .A(invader_bullet_coord_x[1]), .B(n587), .C(n586), .Y(n589)
         );
  OAI21X1 U682 ( .A(n590), .B(n589), .C(n588), .Y(n592) );
  OAI21X1 U683 ( .A(n593), .B(n592), .C(n591), .Y(n595) );
  OAI21X1 U684 ( .A(n596), .B(n595), .C(n594), .Y(n598) );
  OAI21X1 U685 ( .A(n599), .B(n598), .C(n597), .Y(\player_fsm/N29 ) );
  AOI21X1 U686 ( .A(n600), .B(player_coord_x[4]), .C(player_coord_x[5]), .Y(
        \player_fsm/N74 ) );
  NAND2X1 U687 ( .A(shield_coord_x[3]), .B(n26), .Y(n603) );
  NAND3X1 U688 ( .A(n603), .B(n232), .C(\shield_fsm/N37 ), .Y(n601) );
  OAI21X1 U689 ( .A(shield_coord_x[3]), .B(n26), .C(n601), .Y(n607) );
  OAI21X1 U690 ( .A(n420), .B(n229), .C(\shield_fsm/N35 ), .Y(n602) );
  OAI21X1 U691 ( .A(shield_coord_x[1]), .B(player_bullet_coord_x[1]), .C(n602), 
        .Y(n606) );
  NOR2X1 U692 ( .A(\shield_fsm/N37 ), .B(n232), .Y(n604) );
  OAI21X1 U693 ( .A(n233), .B(n604), .C(n230), .Y(n605) );
  OAI21X1 U694 ( .A(n607), .B(n606), .C(n605), .Y(n609) );
  NOR2X1 U695 ( .A(n31), .B(\shield_fsm/N40 ), .Y(n608) );
  NAND3X1 U696 ( .A(n609), .B(n38), .C(n608), .Y(\shield_fsm/N42 ) );
  NAND2X1 U697 ( .A(player_bullet_coord_x[4]), .B(n47), .Y(n611) );
  NAND3X1 U698 ( .A(n611), .B(n422), .C(\shield_fsm/N14 ), .Y(n610) );
  OAI21X1 U699 ( .A(player_bullet_coord_x[4]), .B(n47), .C(n610), .Y(n614) );
  OAI21X1 U700 ( .A(\shield_fsm/N14 ), .B(n422), .C(n611), .Y(n616) );
  OAI22X1 U701 ( .A(\shield_fsm/N13 ), .B(n421), .C(n229), .D(n420), .Y(n612)
         );
  OAI21X1 U702 ( .A(player_bullet_coord_x[2]), .B(n228), .C(n612), .Y(n613) );
  OAI21X1 U703 ( .A(n614), .B(n613), .C(n49), .Y(n615) );
  AOI21X1 U704 ( .A(n226), .B(n616), .C(n615), .Y(\shield_fsm/N34 ) );
  NAND2X1 U705 ( .A(shield_coord_x[3]), .B(n25), .Y(n619) );
  NAND3X1 U706 ( .A(n619), .B(n232), .C(\shield_fsm/N21 ), .Y(n617) );
  OAI21X1 U707 ( .A(shield_coord_x[3]), .B(n25), .C(n617), .Y(n623) );
  OAI21X1 U708 ( .A(n440), .B(n229), .C(\shield_fsm/N19 ), .Y(n618) );
  OAI21X1 U709 ( .A(shield_coord_x[1]), .B(invader_bullet_coord_x[1]), .C(n618), .Y(n622) );
  NOR2X1 U710 ( .A(\shield_fsm/N21 ), .B(n232), .Y(n620) );
  OAI21X1 U711 ( .A(n234), .B(n620), .C(n231), .Y(n621) );
  OAI21X1 U712 ( .A(n623), .B(n622), .C(n621), .Y(n625) );
  NOR2X1 U713 ( .A(n32), .B(\shield_fsm/N24 ), .Y(n624) );
  NAND3X1 U714 ( .A(n625), .B(n37), .C(n624), .Y(\shield_fsm/N26 ) );
  NAND2X1 U715 ( .A(invader_bullet_coord_x[4]), .B(n47), .Y(n627) );
  NAND3X1 U716 ( .A(n627), .B(n441), .C(\shield_fsm/N14 ), .Y(n626) );
  OAI21X1 U717 ( .A(invader_bullet_coord_x[4]), .B(n47), .C(n626), .Y(n630) );
  OAI21X1 U718 ( .A(\shield_fsm/N14 ), .B(n441), .C(n627), .Y(n632) );
  OAI22X1 U719 ( .A(\shield_fsm/N13 ), .B(n442), .C(n229), .D(n440), .Y(n628)
         );
  OAI21X1 U720 ( .A(invader_bullet_coord_x[2]), .B(n228), .C(n628), .Y(n629)
         );
  OAI21X1 U721 ( .A(n630), .B(n629), .C(n438), .Y(n631) );
  AOI21X1 U722 ( .A(n227), .B(n632), .C(n631), .Y(\shield_fsm/N18 ) );
  OAI21X1 U723 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(
        invader_1_coord_x[2]), .Y(n634) );
  NOR2X1 U724 ( .A(invader_1_coord_x[5]), .B(invader_1_coord_x[4]), .Y(n633)
         );
  NAND3X1 U725 ( .A(n634), .B(n62), .C(n633), .Y(n635) );
  OR2X1 U726 ( .A(\invader_fsm_1/N89 ), .B(n27), .Y(n639) );
  OAI21X1 U727 ( .A(\invader_fsm_1/N84 ), .B(n63), .C(\invader_fsm_1/N86 ), 
        .Y(n637) );
  NOR2X1 U728 ( .A(n27), .B(\invader_fsm_1/N89 ), .Y(n636) );
  OAI21X1 U729 ( .A(n33), .B(n637), .C(n636), .Y(n638) );
  OAI21X1 U730 ( .A(\invader_fsm_1/N88 ), .B(n639), .C(n638), .Y(n640) );
  NOR2X1 U731 ( .A(n660), .B(player_bullet_coord_y[5]), .Y(n642) );
  NOR2X1 U732 ( .A(\invader_fsm_1/N40 ), .B(n642), .Y(n641) );
  AOI22X1 U733 ( .A(n641), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n660), .Y(n653) );
  NOR2X1 U734 ( .A(\invader_fsm_1/N42 ), .B(n642), .Y(n643) );
  OAI21X1 U735 ( .A(player_bullet_coord_y[4]), .B(n247), .C(n643), .Y(n652) );
  NAND2X1 U736 ( .A(n251), .B(n427), .Y(n646) );
  NAND3X1 U737 ( .A(n646), .B(n255), .C(player_bullet_coord_y[2]), .Y(n644) );
  OAI21X1 U738 ( .A(n251), .B(n427), .C(n644), .Y(n650) );
  AOI22X1 U739 ( .A(n423), .B(n259), .C(n431), .D(n261), .Y(n645) );
  OAI21X1 U740 ( .A(n259), .B(n423), .C(n258), .Y(n649) );
  NOR2X1 U741 ( .A(player_bullet_coord_y[2]), .B(n255), .Y(n647) );
  OAI21X1 U742 ( .A(n250), .B(n647), .C(n249), .Y(n648) );
  OAI21X1 U743 ( .A(n650), .B(n649), .C(n648), .Y(n651) );
  OAI22X1 U744 ( .A(\invader_fsm_1/N42 ), .B(n653), .C(n652), .D(n651), .Y(
        \invader_fsm_1/N43 ) );
  NOR2X1 U745 ( .A(invader_1_coord_y[1]), .B(\invader_fsm_1/N70 ), .Y(n655) );
  AOI21X1 U746 ( .A(\invader_fsm_1/N70 ), .B(invader_1_coord_y[1]), .C(n655), 
        .Y(n654) );
  NAND2X1 U747 ( .A(n655), .B(n256), .Y(n656) );
  OAI21X1 U748 ( .A(n655), .B(n256), .C(n656), .Y(\invader_fsm_1/N38 ) );
  NOR2X1 U749 ( .A(n656), .B(invader_1_coord_y[3]), .Y(n658) );
  AOI21X1 U750 ( .A(n656), .B(invader_1_coord_y[3]), .C(n658), .Y(n657) );
  NAND2X1 U751 ( .A(n658), .B(n248), .Y(n659) );
  OAI21X1 U752 ( .A(n658), .B(n248), .C(n659), .Y(\invader_fsm_1/N40 ) );
  NOR2X1 U753 ( .A(n659), .B(invader_1_coord_y[5]), .Y(\invader_fsm_1/N42 ) );
  AOI21X1 U754 ( .A(n659), .B(invader_1_coord_y[5]), .C(\invader_fsm_1/N42 ), 
        .Y(n660) );
  OAI21X1 U755 ( .A(player_bullet_coord_y[5]), .B(n245), .C(n244), .Y(n673) );
  NAND2X1 U756 ( .A(player_bullet_coord_y[5]), .B(n245), .Y(n668) );
  OAI21X1 U757 ( .A(\invader_fsm_1/N32 ), .B(n426), .C(n668), .Y(n671) );
  NAND2X1 U758 ( .A(player_bullet_coord_y[3]), .B(n254), .Y(n663) );
  NAND3X1 U759 ( .A(n663), .B(n428), .C(\invader_fsm_1/N30 ), .Y(n661) );
  OAI21X1 U760 ( .A(player_bullet_coord_y[3]), .B(n254), .C(n661), .Y(n667) );
  OAI22X1 U761 ( .A(\invader_fsm_1/N29 ), .B(n423), .C(n261), .D(n431), .Y(
        n662) );
  OAI21X1 U762 ( .A(player_bullet_coord_y[1]), .B(n260), .C(n662), .Y(n666) );
  NOR2X1 U763 ( .A(\invader_fsm_1/N30 ), .B(n428), .Y(n664) );
  OAI21X1 U764 ( .A(n253), .B(n664), .C(n252), .Y(n665) );
  OAI21X1 U765 ( .A(n667), .B(n666), .C(n665), .Y(n670) );
  NAND3X1 U766 ( .A(n668), .B(n426), .C(\invader_fsm_1/N32 ), .Y(n669) );
  OAI21X1 U767 ( .A(n671), .B(n670), .C(n669), .Y(n672) );
  OR2X1 U768 ( .A(n673), .B(n672), .Y(\invader_fsm_1/N35 ) );
  NOR2X1 U769 ( .A(n706), .B(player_bullet_coord_x[5]), .Y(n675) );
  NOR2X1 U770 ( .A(\invader_fsm_1/N24 ), .B(n675), .Y(n674) );
  AOI22X1 U771 ( .A(n674), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n706), .Y(n686) );
  NOR2X1 U772 ( .A(\invader_fsm_1/N26 ), .B(n675), .Y(n676) );
  OAI21X1 U773 ( .A(player_bullet_coord_x[4]), .B(n267), .C(n676), .Y(n685) );
  NAND2X1 U774 ( .A(n273), .B(n422), .Y(n679) );
  NAND3X1 U775 ( .A(n679), .B(n271), .C(player_bullet_coord_x[2]), .Y(n677) );
  OAI21X1 U776 ( .A(n273), .B(n422), .C(n677), .Y(n683) );
  AOI22X1 U777 ( .A(n420), .B(n279), .C(n419), .D(n61), .Y(n678) );
  OAI21X1 U778 ( .A(n279), .B(n420), .C(n278), .Y(n682) );
  NOR2X1 U779 ( .A(player_bullet_coord_x[2]), .B(n271), .Y(n680) );
  OAI21X1 U780 ( .A(n272), .B(n680), .C(n270), .Y(n681) );
  OAI21X1 U781 ( .A(n683), .B(n682), .C(n681), .Y(n684) );
  OAI22X1 U782 ( .A(\invader_fsm_1/N26 ), .B(n686), .C(n685), .D(n684), .Y(
        \invader_fsm_1/N27 ) );
  OAI21X1 U783 ( .A(player_bullet_coord_x[5]), .B(n266), .C(n265), .Y(n699) );
  NAND2X1 U784 ( .A(player_bullet_coord_x[5]), .B(n266), .Y(n694) );
  OAI21X1 U785 ( .A(\invader_fsm_1/N16 ), .B(n50), .C(n694), .Y(n697) );
  NAND2X1 U786 ( .A(player_bullet_coord_x[3]), .B(n277), .Y(n689) );
  NAND3X1 U787 ( .A(n689), .B(n421), .C(\invader_fsm_1/N14 ), .Y(n687) );
  OAI21X1 U788 ( .A(player_bullet_coord_x[3]), .B(n277), .C(n687), .Y(n693) );
  OAI22X1 U789 ( .A(\invader_fsm_1/N13 ), .B(n420), .C(n61), .D(n419), .Y(n688) );
  OAI21X1 U790 ( .A(player_bullet_coord_x[1]), .B(n280), .C(n688), .Y(n692) );
  NOR2X1 U791 ( .A(\invader_fsm_1/N14 ), .B(n421), .Y(n690) );
  OAI21X1 U792 ( .A(n276), .B(n690), .C(n275), .Y(n691) );
  OAI21X1 U793 ( .A(n693), .B(n692), .C(n691), .Y(n696) );
  NAND3X1 U794 ( .A(n694), .B(n50), .C(\invader_fsm_1/N16 ), .Y(n695) );
  OAI21X1 U795 ( .A(n697), .B(n696), .C(n695), .Y(n698) );
  OR2X1 U796 ( .A(n699), .B(n698), .Y(\invader_fsm_1/N19 ) );
  NOR2X1 U797 ( .A(invader_1_coord_x[1]), .B(\invader_fsm_1/N84 ), .Y(n701) );
  AOI21X1 U798 ( .A(\invader_fsm_1/N84 ), .B(invader_1_coord_x[1]), .C(n701), 
        .Y(n700) );
  NAND2X1 U799 ( .A(n701), .B(n274), .Y(n702) );
  OAI21X1 U800 ( .A(n701), .B(n274), .C(n702), .Y(\invader_fsm_1/N22 ) );
  NOR2X1 U801 ( .A(n702), .B(invader_1_coord_x[3]), .Y(n704) );
  AOI21X1 U802 ( .A(n702), .B(invader_1_coord_x[3]), .C(n704), .Y(n703) );
  NAND2X1 U803 ( .A(n704), .B(n268), .Y(n705) );
  OAI21X1 U804 ( .A(n704), .B(n268), .C(n705), .Y(\invader_fsm_1/N24 ) );
  NOR2X1 U805 ( .A(n705), .B(invader_1_coord_x[5]), .Y(\invader_fsm_1/N26 ) );
  AOI21X1 U806 ( .A(n705), .B(invader_1_coord_x[5]), .C(\invader_fsm_1/N26 ), 
        .Y(n706) );
  OAI21X1 U807 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(
        invader_2_coord_x[2]), .Y(n708) );
  NOR2X1 U808 ( .A(invader_2_coord_x[5]), .B(invader_2_coord_x[4]), .Y(n707)
         );
  NAND3X1 U809 ( .A(n708), .B(n59), .C(n707), .Y(n709) );
  OR2X1 U810 ( .A(\invader_fsm_2/N89 ), .B(n28), .Y(n713) );
  OAI21X1 U811 ( .A(\invader_fsm_2/N84 ), .B(n58), .C(\invader_fsm_2/N86 ), 
        .Y(n711) );
  NOR2X1 U812 ( .A(n28), .B(\invader_fsm_2/N89 ), .Y(n710) );
  OAI21X1 U813 ( .A(n34), .B(n711), .C(n710), .Y(n712) );
  OAI21X1 U814 ( .A(\invader_fsm_2/N88 ), .B(n713), .C(n712), .Y(n714) );
  NOR2X1 U815 ( .A(n734), .B(player_bullet_coord_y[5]), .Y(n716) );
  NOR2X1 U816 ( .A(\invader_fsm_2/N40 ), .B(n716), .Y(n715) );
  AOI22X1 U817 ( .A(n715), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n734), .Y(n727) );
  NOR2X1 U818 ( .A(\invader_fsm_2/N42 ), .B(n716), .Y(n717) );
  OAI21X1 U819 ( .A(player_bullet_coord_y[4]), .B(n291), .C(n717), .Y(n726) );
  NAND2X1 U820 ( .A(n295), .B(n427), .Y(n720) );
  NAND3X1 U821 ( .A(n720), .B(n299), .C(player_bullet_coord_y[2]), .Y(n718) );
  OAI21X1 U822 ( .A(n295), .B(n427), .C(n718), .Y(n724) );
  AOI22X1 U823 ( .A(n423), .B(n303), .C(n431), .D(n305), .Y(n719) );
  OAI21X1 U824 ( .A(n303), .B(n423), .C(n302), .Y(n723) );
  NOR2X1 U825 ( .A(player_bullet_coord_y[2]), .B(n299), .Y(n721) );
  OAI21X1 U826 ( .A(n294), .B(n721), .C(n293), .Y(n722) );
  OAI21X1 U827 ( .A(n724), .B(n723), .C(n722), .Y(n725) );
  OAI22X1 U828 ( .A(\invader_fsm_2/N42 ), .B(n727), .C(n726), .D(n725), .Y(
        \invader_fsm_2/N43 ) );
  NOR2X1 U829 ( .A(invader_2_coord_y[1]), .B(\invader_fsm_2/N70 ), .Y(n729) );
  AOI21X1 U830 ( .A(\invader_fsm_2/N70 ), .B(invader_2_coord_y[1]), .C(n729), 
        .Y(n728) );
  NAND2X1 U831 ( .A(n729), .B(n300), .Y(n730) );
  OAI21X1 U832 ( .A(n729), .B(n300), .C(n730), .Y(\invader_fsm_2/N38 ) );
  NOR2X1 U833 ( .A(n730), .B(invader_2_coord_y[3]), .Y(n732) );
  AOI21X1 U834 ( .A(n730), .B(invader_2_coord_y[3]), .C(n732), .Y(n731) );
  NAND2X1 U835 ( .A(n732), .B(n292), .Y(n733) );
  OAI21X1 U836 ( .A(n732), .B(n292), .C(n733), .Y(\invader_fsm_2/N40 ) );
  NOR2X1 U837 ( .A(n733), .B(invader_2_coord_y[5]), .Y(\invader_fsm_2/N42 ) );
  AOI21X1 U838 ( .A(n733), .B(invader_2_coord_y[5]), .C(\invader_fsm_2/N42 ), 
        .Y(n734) );
  OAI21X1 U839 ( .A(player_bullet_coord_y[5]), .B(n289), .C(n288), .Y(n747) );
  NAND2X1 U840 ( .A(player_bullet_coord_y[5]), .B(n289), .Y(n742) );
  OAI21X1 U841 ( .A(\invader_fsm_2/N32 ), .B(n426), .C(n742), .Y(n745) );
  NAND2X1 U842 ( .A(player_bullet_coord_y[3]), .B(n298), .Y(n737) );
  NAND3X1 U843 ( .A(n737), .B(n428), .C(\invader_fsm_2/N30 ), .Y(n735) );
  OAI21X1 U844 ( .A(player_bullet_coord_y[3]), .B(n298), .C(n735), .Y(n741) );
  OAI22X1 U845 ( .A(\invader_fsm_2/N29 ), .B(n423), .C(n305), .D(n431), .Y(
        n736) );
  OAI21X1 U846 ( .A(player_bullet_coord_y[1]), .B(n304), .C(n736), .Y(n740) );
  NOR2X1 U847 ( .A(\invader_fsm_2/N30 ), .B(n428), .Y(n738) );
  OAI21X1 U848 ( .A(n297), .B(n738), .C(n296), .Y(n739) );
  OAI21X1 U849 ( .A(n741), .B(n740), .C(n739), .Y(n744) );
  NAND3X1 U850 ( .A(n742), .B(n426), .C(\invader_fsm_2/N32 ), .Y(n743) );
  OAI21X1 U851 ( .A(n745), .B(n744), .C(n743), .Y(n746) );
  OR2X1 U852 ( .A(n747), .B(n746), .Y(\invader_fsm_2/N35 ) );
  NOR2X1 U853 ( .A(n780), .B(player_bullet_coord_x[5]), .Y(n749) );
  NOR2X1 U854 ( .A(\invader_fsm_2/N24 ), .B(n749), .Y(n748) );
  AOI22X1 U855 ( .A(n748), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n780), .Y(n760) );
  NOR2X1 U856 ( .A(\invader_fsm_2/N26 ), .B(n749), .Y(n750) );
  OAI21X1 U857 ( .A(player_bullet_coord_x[4]), .B(n311), .C(n750), .Y(n759) );
  NAND2X1 U858 ( .A(n316), .B(n422), .Y(n753) );
  NAND3X1 U859 ( .A(n753), .B(n320), .C(player_bullet_coord_x[2]), .Y(n751) );
  OAI21X1 U860 ( .A(n316), .B(n422), .C(n751), .Y(n757) );
  AOI22X1 U861 ( .A(n420), .B(n323), .C(n419), .D(n331), .Y(n752) );
  OAI21X1 U862 ( .A(n323), .B(n420), .C(n322), .Y(n756) );
  NOR2X1 U863 ( .A(player_bullet_coord_x[2]), .B(n320), .Y(n754) );
  OAI21X1 U864 ( .A(n315), .B(n754), .C(n314), .Y(n755) );
  OAI21X1 U865 ( .A(n757), .B(n756), .C(n755), .Y(n758) );
  OAI22X1 U866 ( .A(\invader_fsm_2/N26 ), .B(n760), .C(n759), .D(n758), .Y(
        \invader_fsm_2/N27 ) );
  OAI21X1 U867 ( .A(player_bullet_coord_x[5]), .B(n310), .C(n309), .Y(n773) );
  NAND2X1 U868 ( .A(player_bullet_coord_x[5]), .B(n310), .Y(n768) );
  OAI21X1 U869 ( .A(\invader_fsm_2/N16 ), .B(n50), .C(n768), .Y(n771) );
  NAND2X1 U870 ( .A(player_bullet_coord_x[3]), .B(n319), .Y(n763) );
  NAND3X1 U871 ( .A(n763), .B(n421), .C(\invader_fsm_2/N14 ), .Y(n761) );
  OAI21X1 U872 ( .A(player_bullet_coord_x[3]), .B(n319), .C(n761), .Y(n767) );
  OAI22X1 U873 ( .A(\invader_fsm_2/N13 ), .B(n420), .C(n331), .D(n419), .Y(
        n762) );
  OAI21X1 U874 ( .A(player_bullet_coord_x[1]), .B(n324), .C(n762), .Y(n766) );
  NOR2X1 U875 ( .A(\invader_fsm_2/N14 ), .B(n421), .Y(n764) );
  OAI21X1 U876 ( .A(n318), .B(n764), .C(n317), .Y(n765) );
  OAI21X1 U877 ( .A(n767), .B(n766), .C(n765), .Y(n770) );
  NAND3X1 U878 ( .A(n768), .B(n50), .C(\invader_fsm_2/N16 ), .Y(n769) );
  OAI21X1 U879 ( .A(n771), .B(n770), .C(n769), .Y(n772) );
  OR2X1 U880 ( .A(n773), .B(n772), .Y(\invader_fsm_2/N19 ) );
  NOR2X1 U881 ( .A(invader_2_coord_x[1]), .B(\invader_fsm_2/N84 ), .Y(n775) );
  AOI21X1 U882 ( .A(\invader_fsm_2/N84 ), .B(invader_2_coord_x[1]), .C(n775), 
        .Y(n774) );
  NAND2X1 U883 ( .A(n775), .B(n321), .Y(n776) );
  OAI21X1 U884 ( .A(n775), .B(n321), .C(n776), .Y(\invader_fsm_2/N22 ) );
  NOR2X1 U885 ( .A(n776), .B(invader_2_coord_x[3]), .Y(n778) );
  AOI21X1 U886 ( .A(n776), .B(invader_2_coord_x[3]), .C(n778), .Y(n777) );
  NAND2X1 U887 ( .A(n778), .B(n312), .Y(n779) );
  OAI21X1 U888 ( .A(n778), .B(n312), .C(n779), .Y(\invader_fsm_2/N24 ) );
  NOR2X1 U889 ( .A(n779), .B(invader_2_coord_x[5]), .Y(\invader_fsm_2/N26 ) );
  AOI21X1 U890 ( .A(n779), .B(invader_2_coord_x[5]), .C(\invader_fsm_2/N26 ), 
        .Y(n780) );
  OAI21X1 U891 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(
        invader_3_coord_x[2]), .Y(n782) );
  NOR2X1 U892 ( .A(invader_3_coord_x[5]), .B(invader_3_coord_x[4]), .Y(n781)
         );
  NAND3X1 U893 ( .A(n782), .B(n55), .C(n781), .Y(n783) );
  OR2X1 U894 ( .A(\invader_fsm_3/N89 ), .B(n29), .Y(n787) );
  OAI21X1 U895 ( .A(\invader_fsm_3/N84 ), .B(n56), .C(\invader_fsm_3/N86 ), 
        .Y(n785) );
  NOR2X1 U896 ( .A(n29), .B(\invader_fsm_3/N89 ), .Y(n784) );
  OAI21X1 U897 ( .A(n35), .B(n785), .C(n784), .Y(n786) );
  OAI21X1 U898 ( .A(\invader_fsm_3/N88 ), .B(n787), .C(n786), .Y(n788) );
  NOR2X1 U899 ( .A(n808), .B(player_bullet_coord_y[5]), .Y(n790) );
  NOR2X1 U900 ( .A(\invader_fsm_3/N40 ), .B(n790), .Y(n789) );
  AOI22X1 U901 ( .A(n789), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n808), .Y(n801) );
  NOR2X1 U902 ( .A(\invader_fsm_3/N42 ), .B(n790), .Y(n791) );
  OAI21X1 U903 ( .A(player_bullet_coord_y[4]), .B(n336), .C(n791), .Y(n800) );
  NAND2X1 U904 ( .A(n340), .B(n427), .Y(n794) );
  NAND3X1 U905 ( .A(n794), .B(n344), .C(player_bullet_coord_y[2]), .Y(n792) );
  OAI21X1 U906 ( .A(n340), .B(n427), .C(n792), .Y(n798) );
  AOI22X1 U907 ( .A(n423), .B(n348), .C(n431), .D(n350), .Y(n793) );
  OAI21X1 U908 ( .A(n348), .B(n423), .C(n347), .Y(n797) );
  NOR2X1 U909 ( .A(player_bullet_coord_y[2]), .B(n344), .Y(n795) );
  OAI21X1 U910 ( .A(n339), .B(n795), .C(n338), .Y(n796) );
  OAI21X1 U911 ( .A(n798), .B(n797), .C(n796), .Y(n799) );
  OAI22X1 U912 ( .A(\invader_fsm_3/N42 ), .B(n801), .C(n800), .D(n799), .Y(
        \invader_fsm_3/N43 ) );
  NOR2X1 U913 ( .A(invader_3_coord_y[1]), .B(\invader_fsm_3/N70 ), .Y(n803) );
  AOI21X1 U914 ( .A(\invader_fsm_3/N70 ), .B(invader_3_coord_y[1]), .C(n803), 
        .Y(n802) );
  NAND2X1 U915 ( .A(n803), .B(n345), .Y(n804) );
  OAI21X1 U916 ( .A(n803), .B(n345), .C(n804), .Y(\invader_fsm_3/N38 ) );
  NOR2X1 U917 ( .A(n804), .B(invader_3_coord_y[3]), .Y(n806) );
  AOI21X1 U918 ( .A(n804), .B(invader_3_coord_y[3]), .C(n806), .Y(n805) );
  NAND2X1 U919 ( .A(n806), .B(n337), .Y(n807) );
  OAI21X1 U920 ( .A(n806), .B(n337), .C(n807), .Y(\invader_fsm_3/N40 ) );
  NOR2X1 U921 ( .A(n807), .B(invader_3_coord_y[5]), .Y(\invader_fsm_3/N42 ) );
  AOI21X1 U922 ( .A(n807), .B(invader_3_coord_y[5]), .C(\invader_fsm_3/N42 ), 
        .Y(n808) );
  OAI21X1 U923 ( .A(player_bullet_coord_y[5]), .B(n334), .C(n333), .Y(n821) );
  NAND2X1 U924 ( .A(player_bullet_coord_y[5]), .B(n334), .Y(n816) );
  OAI21X1 U925 ( .A(\invader_fsm_3/N32 ), .B(n426), .C(n816), .Y(n819) );
  NAND2X1 U926 ( .A(player_bullet_coord_y[3]), .B(n343), .Y(n811) );
  NAND3X1 U927 ( .A(n811), .B(n428), .C(\invader_fsm_3/N30 ), .Y(n809) );
  OAI21X1 U928 ( .A(player_bullet_coord_y[3]), .B(n343), .C(n809), .Y(n815) );
  OAI22X1 U929 ( .A(\invader_fsm_3/N29 ), .B(n423), .C(n350), .D(n431), .Y(
        n810) );
  OAI21X1 U930 ( .A(player_bullet_coord_y[1]), .B(n349), .C(n810), .Y(n814) );
  NOR2X1 U931 ( .A(\invader_fsm_3/N30 ), .B(n428), .Y(n812) );
  OAI21X1 U932 ( .A(n342), .B(n812), .C(n341), .Y(n813) );
  OAI21X1 U933 ( .A(n815), .B(n814), .C(n813), .Y(n818) );
  NAND3X1 U934 ( .A(n816), .B(n426), .C(\invader_fsm_3/N32 ), .Y(n817) );
  OAI21X1 U935 ( .A(n819), .B(n818), .C(n817), .Y(n820) );
  OR2X1 U936 ( .A(n821), .B(n820), .Y(\invader_fsm_3/N35 ) );
  NOR2X1 U937 ( .A(n854), .B(player_bullet_coord_x[5]), .Y(n823) );
  NOR2X1 U938 ( .A(\invader_fsm_3/N24 ), .B(n823), .Y(n822) );
  AOI22X1 U939 ( .A(n822), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n854), .Y(n834) );
  NOR2X1 U940 ( .A(\invader_fsm_3/N26 ), .B(n823), .Y(n824) );
  OAI21X1 U941 ( .A(player_bullet_coord_x[4]), .B(n356), .C(n824), .Y(n833) );
  NAND2X1 U942 ( .A(n361), .B(n422), .Y(n827) );
  NAND3X1 U943 ( .A(n827), .B(n359), .C(player_bullet_coord_x[2]), .Y(n825) );
  OAI21X1 U944 ( .A(n361), .B(n422), .C(n825), .Y(n831) );
  AOI22X1 U945 ( .A(n420), .B(n367), .C(n419), .D(n54), .Y(n826) );
  OAI21X1 U946 ( .A(n367), .B(n420), .C(n366), .Y(n830) );
  NOR2X1 U947 ( .A(player_bullet_coord_x[2]), .B(n359), .Y(n828) );
  OAI21X1 U948 ( .A(n360), .B(n828), .C(n358), .Y(n829) );
  OAI21X1 U949 ( .A(n831), .B(n830), .C(n829), .Y(n832) );
  OAI22X1 U950 ( .A(\invader_fsm_3/N26 ), .B(n834), .C(n833), .D(n832), .Y(
        \invader_fsm_3/N27 ) );
  OAI21X1 U951 ( .A(player_bullet_coord_x[5]), .B(n355), .C(n354), .Y(n847) );
  NAND2X1 U952 ( .A(player_bullet_coord_x[5]), .B(n355), .Y(n842) );
  OAI21X1 U953 ( .A(\invader_fsm_3/N16 ), .B(n50), .C(n842), .Y(n845) );
  NAND2X1 U954 ( .A(player_bullet_coord_x[3]), .B(n364), .Y(n837) );
  NAND3X1 U955 ( .A(n837), .B(n421), .C(\invader_fsm_3/N14 ), .Y(n835) );
  OAI21X1 U956 ( .A(player_bullet_coord_x[3]), .B(n364), .C(n835), .Y(n841) );
  OAI22X1 U957 ( .A(\invader_fsm_3/N13 ), .B(n420), .C(n54), .D(n419), .Y(n836) );
  OAI21X1 U958 ( .A(player_bullet_coord_x[1]), .B(n368), .C(n836), .Y(n840) );
  NOR2X1 U959 ( .A(\invader_fsm_3/N14 ), .B(n421), .Y(n838) );
  OAI21X1 U960 ( .A(n363), .B(n838), .C(n362), .Y(n839) );
  OAI21X1 U961 ( .A(n841), .B(n840), .C(n839), .Y(n844) );
  NAND3X1 U962 ( .A(n842), .B(n50), .C(\invader_fsm_3/N16 ), .Y(n843) );
  OAI21X1 U963 ( .A(n845), .B(n844), .C(n843), .Y(n846) );
  OR2X1 U964 ( .A(n847), .B(n846), .Y(\invader_fsm_3/N19 ) );
  NOR2X1 U965 ( .A(invader_3_coord_x[1]), .B(\invader_fsm_3/N84 ), .Y(n849) );
  AOI21X1 U966 ( .A(\invader_fsm_3/N84 ), .B(invader_3_coord_x[1]), .C(n849), 
        .Y(n848) );
  NAND2X1 U967 ( .A(n849), .B(n365), .Y(n850) );
  OAI21X1 U968 ( .A(n849), .B(n365), .C(n850), .Y(\invader_fsm_3/N22 ) );
  NOR2X1 U969 ( .A(n850), .B(invader_3_coord_x[3]), .Y(n852) );
  AOI21X1 U970 ( .A(n850), .B(invader_3_coord_x[3]), .C(n852), .Y(n851) );
  NAND2X1 U971 ( .A(n852), .B(n357), .Y(n853) );
  OAI21X1 U972 ( .A(n852), .B(n357), .C(n853), .Y(\invader_fsm_3/N24 ) );
  NOR2X1 U973 ( .A(n853), .B(invader_3_coord_x[5]), .Y(\invader_fsm_3/N26 ) );
  AOI21X1 U974 ( .A(n853), .B(invader_3_coord_x[5]), .C(\invader_fsm_3/N26 ), 
        .Y(n854) );
  OAI21X1 U975 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(
        invader_4_coord_x[2]), .Y(n856) );
  NOR2X1 U976 ( .A(invader_4_coord_x[5]), .B(invader_4_coord_x[4]), .Y(n855)
         );
  NAND3X1 U977 ( .A(n856), .B(n52), .C(n855), .Y(n857) );
  OR2X1 U978 ( .A(\invader_fsm_4/N89 ), .B(n30), .Y(n861) );
  OAI21X1 U979 ( .A(\invader_fsm_4/N84 ), .B(n51), .C(\invader_fsm_4/N86 ), 
        .Y(n859) );
  NOR2X1 U980 ( .A(n30), .B(\invader_fsm_4/N89 ), .Y(n858) );
  OAI21X1 U981 ( .A(n36), .B(n859), .C(n858), .Y(n860) );
  OAI21X1 U982 ( .A(\invader_fsm_4/N88 ), .B(n861), .C(n860), .Y(n862) );
  NOR2X1 U983 ( .A(n882), .B(player_bullet_coord_y[5]), .Y(n864) );
  NOR2X1 U984 ( .A(\invader_fsm_4/N40 ), .B(n864), .Y(n863) );
  AOI22X1 U985 ( .A(n863), .B(player_bullet_coord_y[4]), .C(
        player_bullet_coord_y[5]), .D(n882), .Y(n875) );
  NOR2X1 U986 ( .A(\invader_fsm_4/N42 ), .B(n864), .Y(n865) );
  OAI21X1 U987 ( .A(player_bullet_coord_y[4]), .B(n379), .C(n865), .Y(n874) );
  NAND2X1 U988 ( .A(n383), .B(n427), .Y(n868) );
  NAND3X1 U989 ( .A(n868), .B(n387), .C(player_bullet_coord_y[2]), .Y(n866) );
  OAI21X1 U990 ( .A(n383), .B(n427), .C(n866), .Y(n872) );
  AOI22X1 U991 ( .A(n423), .B(n391), .C(n431), .D(n393), .Y(n867) );
  OAI21X1 U992 ( .A(n391), .B(n423), .C(n390), .Y(n871) );
  NOR2X1 U993 ( .A(player_bullet_coord_y[2]), .B(n387), .Y(n869) );
  OAI21X1 U994 ( .A(n382), .B(n869), .C(n381), .Y(n870) );
  OAI21X1 U995 ( .A(n872), .B(n871), .C(n870), .Y(n873) );
  OAI22X1 U996 ( .A(\invader_fsm_4/N42 ), .B(n875), .C(n874), .D(n873), .Y(
        \invader_fsm_4/N43 ) );
  NOR2X1 U997 ( .A(invader_4_coord_y[1]), .B(\invader_fsm_4/N70 ), .Y(n877) );
  AOI21X1 U998 ( .A(\invader_fsm_4/N70 ), .B(invader_4_coord_y[1]), .C(n877), 
        .Y(n876) );
  NAND2X1 U999 ( .A(n877), .B(n388), .Y(n878) );
  OAI21X1 U1000 ( .A(n877), .B(n388), .C(n878), .Y(\invader_fsm_4/N38 ) );
  NOR2X1 U1001 ( .A(n878), .B(invader_4_coord_y[3]), .Y(n880) );
  AOI21X1 U1002 ( .A(n878), .B(invader_4_coord_y[3]), .C(n880), .Y(n879) );
  NAND2X1 U1003 ( .A(n880), .B(n380), .Y(n881) );
  OAI21X1 U1004 ( .A(n880), .B(n380), .C(n881), .Y(\invader_fsm_4/N40 ) );
  NOR2X1 U1005 ( .A(n881), .B(invader_4_coord_y[5]), .Y(\invader_fsm_4/N42 )
         );
  AOI21X1 U1006 ( .A(n881), .B(invader_4_coord_y[5]), .C(\invader_fsm_4/N42 ), 
        .Y(n882) );
  OAI21X1 U1007 ( .A(player_bullet_coord_y[5]), .B(n377), .C(n376), .Y(n895)
         );
  NAND2X1 U1008 ( .A(player_bullet_coord_y[5]), .B(n377), .Y(n890) );
  OAI21X1 U1009 ( .A(\invader_fsm_4/N32 ), .B(n426), .C(n890), .Y(n893) );
  NAND2X1 U1010 ( .A(player_bullet_coord_y[3]), .B(n386), .Y(n885) );
  NAND3X1 U1011 ( .A(n885), .B(n428), .C(\invader_fsm_4/N30 ), .Y(n883) );
  OAI21X1 U1012 ( .A(player_bullet_coord_y[3]), .B(n386), .C(n883), .Y(n889)
         );
  OAI22X1 U1013 ( .A(\invader_fsm_4/N29 ), .B(n423), .C(n393), .D(n431), .Y(
        n884) );
  OAI21X1 U1014 ( .A(player_bullet_coord_y[1]), .B(n392), .C(n884), .Y(n888)
         );
  NOR2X1 U1015 ( .A(\invader_fsm_4/N30 ), .B(n428), .Y(n886) );
  OAI21X1 U1016 ( .A(n385), .B(n886), .C(n384), .Y(n887) );
  OAI21X1 U1017 ( .A(n889), .B(n888), .C(n887), .Y(n892) );
  NAND3X1 U1018 ( .A(n890), .B(n426), .C(\invader_fsm_4/N32 ), .Y(n891) );
  OAI21X1 U1019 ( .A(n893), .B(n892), .C(n891), .Y(n894) );
  OR2X1 U1020 ( .A(n895), .B(n894), .Y(\invader_fsm_4/N35 ) );
  NOR2X1 U1021 ( .A(n928), .B(player_bullet_coord_x[5]), .Y(n897) );
  NOR2X1 U1022 ( .A(\invader_fsm_4/N24 ), .B(n897), .Y(n896) );
  AOI22X1 U1023 ( .A(n896), .B(player_bullet_coord_x[4]), .C(
        player_bullet_coord_x[5]), .D(n928), .Y(n908) );
  NOR2X1 U1024 ( .A(\invader_fsm_4/N26 ), .B(n897), .Y(n898) );
  OAI21X1 U1025 ( .A(player_bullet_coord_x[4]), .B(n399), .C(n898), .Y(n907)
         );
  NAND2X1 U1026 ( .A(n403), .B(n422), .Y(n901) );
  NAND3X1 U1027 ( .A(n901), .B(n407), .C(player_bullet_coord_x[2]), .Y(n899)
         );
  OAI21X1 U1028 ( .A(n403), .B(n422), .C(n899), .Y(n905) );
  AOI22X1 U1029 ( .A(n420), .B(n410), .C(n419), .D(n418), .Y(n900) );
  OAI21X1 U1030 ( .A(n410), .B(n420), .C(n409), .Y(n904) );
  NOR2X1 U1031 ( .A(player_bullet_coord_x[2]), .B(n407), .Y(n902) );
  OAI21X1 U1032 ( .A(n402), .B(n902), .C(n401), .Y(n903) );
  OAI21X1 U1033 ( .A(n905), .B(n904), .C(n903), .Y(n906) );
  OAI22X1 U1034 ( .A(\invader_fsm_4/N26 ), .B(n908), .C(n907), .D(n906), .Y(
        \invader_fsm_4/N27 ) );
  OAI21X1 U1035 ( .A(player_bullet_coord_x[5]), .B(n398), .C(n397), .Y(n921)
         );
  NAND2X1 U1036 ( .A(player_bullet_coord_x[5]), .B(n398), .Y(n916) );
  OAI21X1 U1037 ( .A(\invader_fsm_4/N16 ), .B(n50), .C(n916), .Y(n919) );
  NAND2X1 U1038 ( .A(player_bullet_coord_x[3]), .B(n406), .Y(n911) );
  NAND3X1 U1039 ( .A(n911), .B(n421), .C(\invader_fsm_4/N14 ), .Y(n909) );
  OAI21X1 U1040 ( .A(player_bullet_coord_x[3]), .B(n406), .C(n909), .Y(n915)
         );
  OAI22X1 U1041 ( .A(\invader_fsm_4/N13 ), .B(n420), .C(n418), .D(n419), .Y(
        n910) );
  OAI21X1 U1042 ( .A(player_bullet_coord_x[1]), .B(n411), .C(n910), .Y(n914)
         );
  NOR2X1 U1043 ( .A(\invader_fsm_4/N14 ), .B(n421), .Y(n912) );
  OAI21X1 U1044 ( .A(n405), .B(n912), .C(n404), .Y(n913) );
  OAI21X1 U1045 ( .A(n915), .B(n914), .C(n913), .Y(n918) );
  NAND3X1 U1046 ( .A(n916), .B(n50), .C(\invader_fsm_4/N16 ), .Y(n917) );
  OAI21X1 U1047 ( .A(n919), .B(n918), .C(n917), .Y(n920) );
  OR2X1 U1048 ( .A(n921), .B(n920), .Y(\invader_fsm_4/N19 ) );
  NOR2X1 U1049 ( .A(invader_4_coord_x[1]), .B(\invader_fsm_4/N84 ), .Y(n923)
         );
  AOI21X1 U1050 ( .A(\invader_fsm_4/N84 ), .B(invader_4_coord_x[1]), .C(n923), 
        .Y(n922) );
  NAND2X1 U1051 ( .A(n923), .B(n408), .Y(n924) );
  OAI21X1 U1052 ( .A(n923), .B(n408), .C(n924), .Y(\invader_fsm_4/N22 ) );
  NOR2X1 U1053 ( .A(n924), .B(invader_4_coord_x[3]), .Y(n926) );
  AOI21X1 U1054 ( .A(n924), .B(invader_4_coord_x[3]), .C(n926), .Y(n925) );
  NAND2X1 U1055 ( .A(n926), .B(n400), .Y(n927) );
  OAI21X1 U1056 ( .A(n926), .B(n400), .C(n927), .Y(\invader_fsm_4/N24 ) );
  NOR2X1 U1057 ( .A(n927), .B(invader_4_coord_x[5]), .Y(\invader_fsm_4/N26 )
         );
  AOI21X1 U1058 ( .A(n927), .B(invader_4_coord_x[5]), .C(\invader_fsm_4/N26 ), 
        .Y(n928) );
  XOR2X1 U1059 ( .A(\player_bullet_fsm/add_89/carry [5]), .B(
        player_bullet_coord_y[5]), .Y(\player_bullet_fsm/N26 ) );
  NAND2X1 U1060 ( .A(player_bullet_coord_y[1]), .B(player_bullet_coord_y[0]), 
        .Y(n930) );
  NAND2X1 U1061 ( .A(player_bullet_coord_y[3]), .B(player_bullet_coord_y[2]), 
        .Y(n929) );
  OAI21X1 U1062 ( .A(n930), .B(n929), .C(n48), .Y(n931) );
  OAI21X1 U1063 ( .A(player_bullet_coord_y[5]), .B(player_bullet_coord_y[4]), 
        .C(n931), .Y(n932) );
  NAND2X1 U1064 ( .A(n445), .B(n448), .Y(n933) );
  OAI21X1 U1065 ( .A(n448), .B(n445), .C(n933), .Y(\invader_bullet_fsm/N26 )
         );
  NOR2X1 U1066 ( .A(n933), .B(invader_bullet_coord_y[2]), .Y(n935) );
  AOI21X1 U1067 ( .A(n933), .B(invader_bullet_coord_y[2]), .C(n935), .Y(n934)
         );
  NAND2X1 U1068 ( .A(n935), .B(n446), .Y(n936) );
  OAI21X1 U1069 ( .A(n935), .B(n446), .C(n936), .Y(\invader_bullet_fsm/N28 )
         );
  XNOR2X1 U1070 ( .A(invader_bullet_coord_y[4]), .B(n936), .Y(
        \invader_bullet_fsm/N29 ) );
  NOR2X1 U1071 ( .A(invader_bullet_coord_y[4]), .B(n936), .Y(n937) );
  XOR2X1 U1072 ( .A(invader_bullet_coord_y[5]), .B(n937), .Y(
        \invader_bullet_fsm/N30 ) );
  OR2X1 U1073 ( .A(invader_bullet_coord_y[2]), .B(invader_bullet_coord_y[1]), 
        .Y(n938) );
  NOR2X1 U1074 ( .A(invader_bullet_coord_y[0]), .B(n938), .Y(n941) );
  OR2X1 U1075 ( .A(invader_bullet_coord_y[5]), .B(invader_bullet_coord_y[4]), 
        .Y(n939) );
  NOR2X1 U1076 ( .A(invader_bullet_coord_y[3]), .B(n939), .Y(n940) );
  NOR2X1 U1077 ( .A(n82), .B(n430), .Y(\player_bullet_fsm/n30 ) );
  NOR2X1 U1078 ( .A(\invader_bullet_fsm/n38 ), .B(n82), .Y(
        \invader_bullet_fsm/n53 ) );
  NOR2X1 U1079 ( .A(\invader_bullet_fsm/n25 ), .B(n81), .Y(
        \invader_bullet_fsm/n48 ) );
  NOR2X1 U1080 ( .A(n82), .B(n447), .Y(\invader_bullet_fsm/n47 ) );
  NAND2X1 U1081 ( .A(\invader_bullet_fsm/N26 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n35 ) );
  NAND2X1 U1082 ( .A(n444), .B(\invader_bullet_fsm/next_state[0] ), .Y(
        \invader_bullet_fsm/n33 ) );
  NAND2X1 U1083 ( .A(\invader_bullet_fsm/N28 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n31 ) );
  NAND2X1 U1084 ( .A(\invader_bullet_fsm/N29 ), .B(
        \invader_bullet_fsm/next_state[0] ), .Y(\invader_bullet_fsm/n28 ) );
endmodule

