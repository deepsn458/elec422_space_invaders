###################################################################

# Created by write_sdc on Tue Apr 28 22:32:19 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_driving_cell -lib_cell INVX1 [get_ports clka]
set_driving_cell -lib_cell INVX1 [get_ports clkb]
set_driving_cell -lib_cell INVX1 [get_ports reset]
set_driving_cell -lib_cell INVX1 [get_ports play]
set_driving_cell -lib_cell INVX1 [get_ports invader_direction]
set_driving_cell -lib_cell INVX1 [get_ports move_down]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_x[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_x[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_x[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_x[0]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_y[3]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_y[2]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_y[1]}]
set_driving_cell -lib_cell INVX1 [get_ports {player_bullet_coord_y[0]}]
create_clock [get_ports clka]  -period 20  -waveform {0 10}
set_input_delay -clock clka  1  [get_ports clkb]
set_input_delay -clock clka  1  [get_ports reset]
set_input_delay -clock clka  1  [get_ports play]
set_input_delay -clock clka  1  [get_ports invader_direction]
set_input_delay -clock clka  1  [get_ports move_down]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_x[3]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_x[2]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_x[1]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_x[0]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_y[3]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_y[2]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_y[1]}]
set_input_delay -clock clka  1  [get_ports {player_bullet_coord_y[0]}]
set_output_delay -clock clka  1  [get_ports display]
set_output_delay -clock clka  1  [get_ports playerbullet_invader_collision_signal]
set_output_delay -clock clka  1  [get_ports {invader_coord_x[3]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_x[2]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_x[1]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_x[0]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_y[3]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_y[2]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_y[1]}]
set_output_delay -clock clka  1  [get_ports {invader_coord_y[0]}]
set_output_delay -clock clka  1  [get_ports invader_outofbounds_signal]
set_output_delay -clock clka  1  [get_ports {state[1]}]
set_output_delay -clock clka  1  [get_ports {state[0]}]
