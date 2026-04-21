| Define Vectors with escaped brackets
vector player_x player_coord_x\[3\] player_coord_x\[2\] player_coord_x\[1\] player_coord_x\[0\]
vector inv1_x invader_1_coord_x\[3\] invader_1_coord_x\[2\] invader_1_coord_x\[1\] invader_1_coord_x\[0\]
vector inv1_y invader_1_coord_y\[3\] invader_1_coord_y\[2\] invader_1_coord_y\[1\] invader_1_coord_y\[0\]
vector inv2_x invader_2_coord_x\[3\] invader_2_coord_x\[2\] invader_2_coord_x\[1\] invader_2_coord_x\[0\]
vector inv2_y invader_2_coord_y\[3\] invader_2_coord_y\[2\] invader_2_coord_y\[1\] invader_2_coord_y\[0\]
vector s_x shield_coord_x\[3\] shield_coord_x\[2\] shield_coord_x\[1\] shield_coord_x\[0\]
vector s_y shield_coord_y\[3\] shield_coord_y\[2\] shield_coord_y\[1\] shield_coord_y\[0\]
vector s_hp shield_hp\[1\] shield_hp\[0\]
vector pb_x player_bullet_coord_x\[3\] player_bullet_coord_x\[2\] player_bullet_coord_x\[1\] player_bullet_coord_x\[0\]
vector pb_y player_bullet_coord_y\[3\] player_bullet_coord_y\[2\] player_bullet_coord_y\[1\] player_bullet_coord_y\[0\]
vector ib_x invader_bullet_coord_x\[3\] invader_bullet_coord_x\[2\] invader_bullet_coord_x\[1\] invader_bullet_coord_x\[0\]
vector ib_y invader_bullet_coord_y\[3\] invader_bullet_coord_y\[2\] invader_bullet_coord_y\[1\] invader_bullet_coord_y\[0\]

| Setup Analyzer
ana clka clkb reset player_left_input player_right_input player_shoot_input player_x inv1_x inv1_y inv2_x inv2_y s_hp pb_y ib_y

| Clock Definition
clock clka 1 0 0 0
clock clkb 0 0 1 0

| Initialization
l reset
l player_left_input
l player_right_input
l player_shoot_input
c
h reset
c
l reset

| First game sequence
h player_shoot_input
c 4
l player_shoot_input
c 2
h player_shoot_input
c 2

| Movement: Right
l player_left_input
h player_right_input
c 6
c 4

| Movement: Left
h player_left_input
l player_right_input
c 11
c 9

| Boundary Test: Left
h player_left_input
l player_right_input
c 26

| Rapid Fire Pulse (10 Pulses)
l player_left_input
l player_right_input
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c

| Going right while shooting
h player_shoot_input
l player_left_input
h player_right_input
c 11

| Boundary Test: Right
c 19

| Both left and right inputs
l player_shoot_input
h player_left_input
h player_right_input
c 5

| Idle and center
l player_shoot_input
l player_left_input
l player_right_input
c 30
h player_left_input
c 8
l player_left_input
c 40

| second game
h player_shoot_input
c 4
l player_shoot_input
c 2
h player_shoot_input
c 2

| Movement: Left
h player_left_input
l player_right_input
c 5
c 8

| Movement: Right
l player_left_input
h player_right_input
c 12
c 17

| Boundary Test: Left
h player_left_input
l player_right_input
c 20

| Back Right
l player_left_input
h player_right_input
c 20

| Rapid Fire Pulse (10 Pulses)
l player_left_input
l player_right_input
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c
h player_shoot_input; c; l player_shoot_input; c

| Going right while shooting
h player_shoot_input
l player_left_input
h player_right_input
c 20

| Boundary Test: Right
c 40

| Both left and right input
l player_shoot_input
h player_left_input
h player_right_input
c 5

| Idle and center
l player_shoot_input
l player_left_input
l player_right_input
c 100
h player_left_input
c 16
l player_left_input
c 40

path