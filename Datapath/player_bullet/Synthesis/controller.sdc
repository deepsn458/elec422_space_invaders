###################################################################

# Created by write_sdc on Mon Mar  2 23:11:13 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_driving_cell -lib_cell INVX1 [get_ports clka]
set_driving_cell -lib_cell INVX1 [get_ports clkb]
set_driving_cell -lib_cell INVX1 [get_ports restart]
set_driving_cell -lib_cell INVX1 [get_ports brake]
set_driving_cell -lib_cell INVX1 [get_ports left]
set_driving_cell -lib_cell INVX1 [get_ports right]
create_clock [get_ports clka]  -period 20  -waveform {0 10}
set_input_delay -clock clka  1  [get_ports clkb]
set_input_delay -clock clka  1  [get_ports restart]
set_input_delay -clock clka  1  [get_ports brake]
set_input_delay -clock clka  1  [get_ports left]
set_input_delay -clock clka  1  [get_ports right]
set_output_delay -clock clka  1  [get_ports {state[2]}]
set_output_delay -clock clka  1  [get_ports {state[1]}]
set_output_delay -clock clka  1  [get_ports {state[0]}]
set_output_delay -clock clka  1  [get_ports l0]
set_output_delay -clock clka  1  [get_ports l1]
set_output_delay -clock clka  1  [get_ports l2]
set_output_delay -clock clka  1  [get_ports r0]
set_output_delay -clock clka  1  [get_ports r1]
set_output_delay -clock clka  1  [get_ports r2]
set_output_delay -clock clka  1  [get_ports error]
