#///////////////////////////////////////////
#// print_display.py
#//
#// Written: jc165@rice.edu
#// Created: 18 Mar 2026
#//
#// Purpose: Printing script that reads the verilog tb log file and
#// prints the matrix into a visualisable display
#// 
#////////////////////////////////////////////////////////////////////////////////////////////////
import os

def clear_screen():
    # Clears the terminal screen for a clean frame update
    os.system('cls' if os.name == 'nt' else 'clear')

def render_log(filename):
    try:
        with open(filename, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Verilog log file not found!")
        return

    frame_title = ""
    matrix = []

    for line in lines:
        line = line.strip()
        
        if line.startswith("TIME:"):
            # Start of a new frame
            frame_title = line
            matrix = []
            
        elif line == "END_FRAME":
            # Frame is complete, time to draw it
            clear_screen()
            print("=" * 66)
            print(frame_title)
            print("=" * 66)
            
            # Print the matrix with block characters
            for row in matrix:
                rendered_row = row.replace('1', '██').replace('0', '  ')
                print(rendered_row)
            
            print("=" * 66)
            
            # Pause and wait for the user to proceed to the next frame
            input("\nPress [Enter] to see the next frame...")
            
        elif line: 
            # This is a string of 1s and 0s making up a row
            matrix.append(line[::-1])
            
    print("End of log reached.")

if __name__ == "__main__":
    render_log("display_log.txt")