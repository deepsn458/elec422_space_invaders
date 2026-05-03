| Define Vectors with escaped brackets
vector PadFrame64_0/p_player_x PadFrame64_0/p_player_coord_x\[3\] PadFrame64_0/p_player_coord_x\[2\] PadFrame64_0/p_player_coord_x\[1\] PadFrame64_0/p_player_coord_x\[0\]
vector PadFrame64_0/p_inv1_x PadFrame64_0/p_invader_1_coord_x\[3\] PadFrame64_0/p_invader_1_coord_x\[2\] PadFrame64_0/p_invader_1_coord_x\[1\] PadFrame64_0/p_invader_1_coord_x\[0\]
vector PadFrame64_0/p_inv1_y PadFrame64_0/p_invader_1_coord_y\[3\] PadFrame64_0/p_invader_1_coord_y\[2\] PadFrame64_0/p_invader_1_coord_y\[1\] PadFrame64_0/p_invader_1_coord_y\[0\]
vector PadFrame64_0/p_inv2_x PadFrame64_0/p_invader_2_coord_x\[3\] PadFrame64_0/p_invader_2_coord_x\[2\] PadFrame64_0/p_invader_2_coord_x\[1\] PadFrame64_0/p_invader_2_coord_x\[0\]
vector PadFrame64_0/p_inv2_y PadFrame64_0/p_invader_2_coord_y\[3\] PadFrame64_0/p_invader_2_coord_y\[2\] PadFrame64_0/p_invader_2_coord_y\[1\] PadFrame64_0/p_invader_2_coord_y\[0\]
vector PadFrame64_0/p_s_x PadFrame64_0/p_shield_coord_x\[3\] PadFrame64_0/p_shield_coord_x\[2\] PadFrame64_0/p_shield_coord_x\[1\] PadFrame64_0/p_shield_coord_x\[0\]
vector PadFrame64_0/p_s_y PadFrame64_0/p_shield_coord_y\[3\] PadFrame64_0/p_shield_coord_y\[2\] PadFrame64_0/p_shield_coord_y\[1\] PadFrame64_0/p_shield_coord_y\[0\]
vector PadFrame64_0/p_s_hp PadFrame64_0/p_shield_hp\[1\] PadFrame64_0/p_shield_hp\[0\]
vector PadFrame64_0/p_pb_x PadFrame64_0/p_player_bullet_coord_x\[3\] PadFrame64_0/p_player_bullet_coord_x\[2\] PadFrame64_0/p_player_bullet_coord_x\[1\] PadFrame64_0/p_player_bullet_coord_x\[0\]
vector PadFrame64_0/p_pb_y PadFrame64_0/p_player_bullet_coord_y\[3\] PadFrame64_0/p_player_bullet_coord_y\[2\] PadFrame64_0/p_player_bullet_coord_y\[1\] PadFrame64_0/p_player_bullet_coord_y\[0\]
vector PadFrame64_0/p_ib_x PadFrame64_0/p_invader_bullet_coord_x\[3\] PadFrame64_0/p_invader_bullet_coord_x\[2\] PadFrame64_0/p_invader_bullet_coord_x\[1\] PadFrame64_0/p_invader_bullet_coord_x\[0\]
vector PadFrame64_0/p_ib_y PadFrame64_0/p_invader_bullet_coord_y\[3\] PadFrame64_0/p_invader_bullet_coord_y\[2\] PadFrame64_0/p_invader_bullet_coord_y\[1\] PadFrame64_0/p_invader_bullet_coord_y\[0\]

| Setup Analyzer
ana PadFrame64_0/p_clka PadFrame64_0/p_clkb PadFrame64_0/p_reset PadFrame64_0/p_player_left_input PadFrame64_0/p_player_right_input PadFrame64_0/p_player_shoot_input PadFrame64_0/p_player_x PadFrame64_0/p_inv1_x PadFrame64_0/p_inv1_y PadFrame64_0/p_inv2_x PadFrame64_0/p_inv2_y PadFrame64_0/p_s_hp PadFrame64_0/p_pb_y PadFrame64_0/p_ib_y PadFrame64_0/p_s_x PadFrame64_0/p_s_y

| Start Logging Data
logfile magic_display_log.txt
w PadFrame64_0/p_player_x PadFrame64_0/p_player_display PadFrame64_0/p_inv1_x PadFrame64_0/p_inv1_y PadFrame64_0/p_invader_1_display PadFrame64_0/p_inv2_x PadFrame64_0/p_inv2_y PadFrame64_0/p_invader_2_display PadFrame64_0/p_s_x PadFrame64_0/p_s_y PadFrame64_0/p_s_hp PadFrame64_0/p_pb_x PadFrame64_0/p_pb_y PadFrame64_0/p_player_bullet_display PadFrame64_0/p_ib_x PadFrame64_0/p_ib_y PadFrame64_0/p_invader_bullet_display
display automatic
| Clock Definition
clock PadFrame64_0/p_clka 1 0 0 0
clock PadFrame64_0/p_clkb 0 0 1 0

| Initialization
echo TEST: Initialization
l PadFrame64_0/p_reset
l PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
l PadFrame64_0/p_player_shoot_input
c
h PadFrame64_0/p_reset
c
l PadFrame64_0/p_reset

| First game sequence
echo TEST: First game sequence
h PadFrame64_0/p_player_shoot_input
c 4
l PadFrame64_0/p_player_shoot_input
c 2
h PadFrame64_0/p_player_shoot_input
c 2

| Movement: Right
echo TEST: Movement: Right
l PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 6
c 4

| Movement: Left
echo TEST: Movement: Left
h PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 11
c 9

| Boundary Test: Left
echo TEST: Left Boundary Hit...
h PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 26

| Rapid Fire Pulse (10 Pulses)
echo TEST: Rapid Fire Pulse...
l PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c

| Going right while shooting
echo TEST: Strafing Right while shooting...
h PadFrame64_0/p_player_shoot_input
l PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 11

| Boundary Test: Right
echo TEST: Right Boundary Hit...
c 19

| Both left and right inputs
echo TEST: Left and Right conflict...
l PadFrame64_0/p_player_shoot_input
h PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 5

| Idle and center
echo TEST: Idle Game State (Watching alien movement)...
l PadFrame64_0/p_player_shoot_input
l PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 30
echo TEST: Move center
h PadFrame64_0/p_player_left_input
c 8
echo TEST: Stay center
l PadFrame64_0/p_player_left_input
c 40

| second game
echo TEST: Start another game
h PadFrame64_0/p_player_shoot_input
c 4
l PadFrame64_0/p_player_shoot_input
c 2
h PadFrame64_0/p_player_shoot_input
c 2

| Movement: Left
echo TEST: Movement: Left
h PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 5
c 8

| Movement: Right
echo TEST: Movement: Right
l PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 12
c 17

| Boundary Test: Left
echo TEST: Left Boundary Hit...
h PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 20

| Back Right
echo TEST: Go back right
l PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 20

| Rapid Fire Pulse (10 Pulses)
echo TEST: Rapid Fire Pulse...
l PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c
h PadFrame64_0/p_player_shoot_input; c; l PadFrame64_0/p_player_shoot_input; c

| Going right while shooting
echo TEST: Strafing Right while shooting...
h PadFrame64_0/p_player_shoot_input
l PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 20

| Boundary Test: Right
echo TEST: Right Boundary Hit...
c 40

| Both left and right input
echo TEST: Left and Right conflict...
l PadFrame64_0/p_player_shoot_input
h PadFrame64_0/p_player_left_input
h PadFrame64_0/p_player_right_input
c 5

| Idle and center
echo TEST: Idle Game State (Watching alien movement)...
l PadFrame64_0/p_player_shoot_input
l PadFrame64_0/p_player_left_input
l PadFrame64_0/p_player_right_input
c 100
echo TEST: Move center
h PadFrame64_0/p_player_left_input
c 16
echo TEST: Stay center
l PadFrame64_0/p_player_left_input
c 40

echo Simulation Complete.
logfile
path
