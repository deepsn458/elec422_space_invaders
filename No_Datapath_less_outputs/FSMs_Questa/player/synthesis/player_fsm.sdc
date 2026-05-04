###################################################################

# Created by write_sdc on Mon May  4 08:27:04 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_driving_cell -lib_cell INVX1 [get_ports clka]
set_driving_cell -lib_cell INVX1 [get_ports clkb]
set_driving_cell -lib_cell INVX1 [get_ports reset]
set_driving_cell -lib_cell INVX1 [get_ports play]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_x[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_x[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_x[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_x[0]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_y[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_y[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_y[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {invader_bullet_coord_y[0]}]
set_driving_cell -lib_cell INVX1 [get_ports player_left_input]
set_driving_cell -lib_cell INVX1 [get_ports player_right_input]
create_clock [get_ports clka]  -period 20  -waveform {0 10}
set_input_delay -clock clka  1  [get_ports clkb]
set_input_delay -clock clka  1  [get_ports reset]
set_input_delay -clock clka  1  [get_ports play]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_x[3]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_x[2]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_x[1]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_x[0]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_y[3]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_y[2]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_y[1]}]
set_input_delay -clock clka  1  [get_ports {invader_bullet_coord_y[0]}]
set_input_delay -clock clka  1  [get_ports player_left_input]
set_input_delay -clock clka  1  [get_ports player_right_input]
set_output_delay -clock clka  1  [get_ports invaderbullet_player_collision_signal]
set_output_delay -clock clka  1  [get_ports {player_coord_x[3]}]
set_output_delay -clock clka  1  [get_ports {player_coord_x[2]}]
set_output_delay -clock clka  1  [get_ports {player_coord_x[1]}]
set_output_delay -clock clka  1  [get_ports {player_coord_x[0]}]
set_output_delay -clock clka  1  [get_ports {player_coord_y[3]}]
set_output_delay -clock clka  1  [get_ports {player_coord_y[2]}]
set_output_delay -clock clka  1  [get_ports {player_coord_y[1]}]
set_output_delay -clock clka  1  [get_ports {player_coord_y[0]}]
set_output_delay -clock clka  1  [get_ports display]
set_output_delay -clock clka  1  [get_ports {state[1]}]
set_output_delay -clock clka  1  [get_ports {state[0]}]
