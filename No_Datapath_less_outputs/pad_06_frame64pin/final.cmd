| Define Vectors with escaped brackets
vector p_player_x p_player_coord_x\[3\] p_player_coord_x\[2\] p_player_coord_x\[1\] p_player_coord_x\[0\]
vector p_inv1_x p_invader_1_coord_x\[3\] p_invader_1_coord_x\[2\] p_invader_1_coord_x\[1\] p_invader_1_coord_x\[0\]
vector p_inv1_y p_invader_1_coord_y\[3\] p_invader_1_coord_y\[2\] p_invader_1_coord_y\[1\] p_invader_1_coord_y\[0\]
vector p_inv2_x p_invader_2_coord_x\[3\] p_invader_2_coord_x\[2\] p_invader_2_coord_x\[1\] p_invader_2_coord_x\[0\]
vector p_inv2_y p_invader_2_coord_y\[3\] p_invader_2_coord_y\[2\] p_invader_2_coord_y\[1\] p_invader_2_coord_y\[0\]
vector p_s_x p_shield_coord_x\[3\] p_shield_coord_x\[2\] p_shield_coord_x\[1\] p_shield_coord_x\[0\]
vector p_s_y p_shield_coord_y\[3\] p_shield_coord_y\[2\] p_shield_coord_y\[1\] p_shield_coord_y\[0\]
vector p_s_hp p_shield_hp\[1\] p_shield_hp\[0\]
vector p_pb_x p_player_bullet_coord_x\[3\] p_player_bullet_coord_x\[2\] p_player_bullet_coord_x\[1\] p_player_bullet_coord_x\[0\]
vector p_pb_y p_player_bullet_coord_y\[3\] p_player_bullet_coord_y\[2\] p_player_bullet_coord_y\[1\] p_player_bullet_coord_y\[0\]
vector p_ib_x p_invader_bullet_coord_x\[3\] p_invader_bullet_coord_x\[2\] p_invader_bullet_coord_x\[1\] p_invader_bullet_coord_x\[0\]
vector p_ib_y p_invader_bullet_coord_y\[3\] p_invader_bullet_coord_y\[2\] p_invader_bullet_coord_y\[1\] p_invader_bullet_coord_y\[0\]

| Setup Analyzer
ana p_clka p_clkb p_reset p_player_left_input p_player_right_input p_player_shoot_input p_player_x p_inv1_x p_inv1_y p_inv2_x p_inv2_y p_s_hp p_pb_y p_ib_y p_s_x p_s_y

| Start Logging Data
logfile magic_display_log.txt
w p_player_x p_player_display p_inv1_x p_inv1_y p_invader_1_display p_inv2_x p_inv2_y p_invader_2_display p_s_x p_s_y p_s_hp p_pb_x p_pb_y p_player_bullet_display p_ib_x p_ib_y p_invader_bullet_display
display automatic
| Clock Definition
clock p_clka 1 0 0 0
clock p_clkb 0 0 1 0

| Initialization
echo TEST: Initialization
l p_reset
l p_player_left_input
l p_player_right_input
l p_player_shoot_input
c
h p_reset
c
l p_reset

| First game sequence
echo TEST: First game sequence
h p_player_shoot_input
c 4
l p_player_shoot_input
c 2
h p_player_shoot_input
c 2

| Movement: Right
echo TEST: Movement: Right
l p_player_left_input
h p_player_right_input
c 6
c 4

| Movement: Left
echo TEST: Movement: Left
h p_player_left_input
l p_player_right_input
c 11
c 9

| Boundary Test: Left
echo TEST: Left Boundary Hit...
h p_player_left_input
l p_player_right_input
c 26

| Rapid Fire Pulse (10 Pulses)
echo TEST: Rapid Fire Pulse...
l p_player_left_input
l p_player_right_input
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c

| Going right while shooting
echo TEST: Strafing Right while shooting...
h p_player_shoot_input
l p_player_left_input
h p_player_right_input
c 11

| Boundary Test: Right
echo TEST: Right Boundary Hit...
c 19

| Both left and right inputs
echo TEST: Left and Right conflict...
l p_player_shoot_input
h p_player_left_input
h p_player_right_input
c 5

| Idle and center
echo TEST: Idle Game State (Watching alien movement)...
l p_player_shoot_input
l p_player_left_input
l p_player_right_input
c 30
echo TEST: Move center
h p_player_left_input
c 8
echo TEST: Stay center
l p_player_left_input
c 40

| second game
echo TEST: Start another game
h p_player_shoot_input
c 4
l p_player_shoot_input
c 2
h p_player_shoot_input
c 2

| Movement: Left
echo TEST: Movement: Left
h p_player_left_input
l p_player_right_input
c 5
c 8

| Movement: Right
echo TEST: Movement: Right
l p_player_left_input
h p_player_right_input
c 12
c 17

| Boundary Test: Left
echo TEST: Left Boundary Hit...
h p_player_left_input
l p_player_right_input
c 20

| Back Right
echo TEST: Go back right
l p_player_left_input
h p_player_right_input
c 20

| Rapid Fire Pulse (10 Pulses)
echo TEST: Rapid Fire Pulse...
l p_player_left_input
l p_player_right_input
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c
h p_player_shoot_input; c; l p_player_shoot_input; c

| Going right while shooting
echo TEST: Strafing Right while shooting...
h p_player_shoot_input
l p_player_left_input
h p_player_right_input
c 20

| Boundary Test: Right
echo TEST: Right Boundary Hit...
c 40

| Both left and right input
echo TEST: Left and Right conflict...
l p_player_shoot_input
h p_player_left_input
h p_player_right_input
c 5

| Idle and center
echo TEST: Idle Game State (Watching alien movement)...
l p_player_shoot_input
l p_player_left_input
l p_player_right_input
c 100
echo TEST: Move center
h p_player_left_input
c 16
echo TEST: Stay center
l p_player_left_input
c 40

echo Simulation Complete.
logfile
path