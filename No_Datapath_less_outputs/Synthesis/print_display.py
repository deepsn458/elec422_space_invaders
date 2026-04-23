#///////////////////////////////////////////
#// print_display.py
#//
#// Written: jc165@rice.edu
#// Created: 18 Mar 2026
#// Modified: 16 Apr 2026 (Migrated Datapath matrix generation to Python)
#//
#// Purpose: Printing script that reads the verilog tb log file and
#// prints the matrix into a visualisable display
#// 
#////////////////////////////////////////////////////////////////////////////////////////////////
import os

def clear_screen():
    # Clears the terminal screen for a clean frame update
    os.system('cls' if os.name == 'nt' else 'clear')

def set_pixel(matrix, x, y):
    """Sets a pixel in the matrix if it is within bounds."""
    if 0 <= x < 16 and 0 <= y < 16:
        matrix[y][x] = 1

def draw_player(matrix, x, disp):
    if not disp: return
    coords = [(x, 0), (x-1, 0), (x+1, 0), (x, 0+1)]
    for cx, cy in coords:
        set_pixel(matrix, cx, cy)

def draw_invader_1(matrix, x, y, disp):
    if not disp: return
    coords = [(x, y), (x-1, y), (x+1, y), (x, y-1), (x-1, y+1), (x+1, y+1)]
    for cx, cy in coords:
        set_pixel(matrix, cx, cy)

def draw_invader_2(matrix, x, y, disp):
    if not disp: return
    coords = [(x, y), (x-1, y), (x+1, y), (x, y+1), (x, y-1)]
    for cx, cy in coords:
        set_pixel(matrix, cx, cy)

def draw_invader_3(matrix, x, y, disp):
    if not disp: return
    coords = [(x, y), (x-1, y), (x+1, y), (x, y+1), (x, y-1), (x-1, y+1), (x+1, y+1)]
    for cx, cy in coords:
        set_pixel(matrix, cx, cy)

def draw_invader_4(matrix, x, y, disp):
    if not disp: return
    coords = [(x, y), (x-1, y+1), (x+1, y+1), (x-1, y-1), (x+1, y-1)]
    for cx, cy in coords:
        set_pixel(matrix, cx, cy)

def draw_shield(matrix, x, y, hp):
    if hp == 0: return
    
    # Bottom Layer (row == Y)
    set_pixel(matrix, x-2, y)
    set_pixel(matrix, x-1, y)
    set_pixel(matrix, x, y)
    if hp != 1: set_pixel(matrix, x+1, y)
    set_pixel(matrix, x+2, y)
    
    # Top Layer (row == Y + 1)
    set_pixel(matrix, x-2, y+1)
    if hp == 3: set_pixel(matrix, x-1, y+1)
    if hp != 1: set_pixel(matrix, x, y+1)
    set_pixel(matrix, x+1, y+1)
    set_pixel(matrix, x+2, y+1)

def draw_bullet(matrix, x, y, disp):
    if disp: set_pixel(matrix, x, y)

def render_log(filename):
    try:
        with open(filename, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Verilog log file not found!")
        return

    frame_title = ""
    # matrix[y][x] format, 32x32. Initialize full of 0s
    matrix = []

    for line in lines:
        line = line.strip()
        
        if line.startswith("TIME:"):
            frame_title = line
            matrix = [[0]*16 for _ in range(16)]
            
        elif line == "END_FRAME":
            clear_screen()
            print("=" * 33)
            print(frame_title)
            print("=" * 33)
            
            # Print the matrix from Y=31 down to Y=0 to match screen mapping
            for row_idx in range(15, -1, -1):
                row_str = "".join(['██' if matrix[row_idx][c] else '  ' for c in range(16)])
                print(row_str)
            
            print("=" * 33)
            input("\nPress [Enter] to see the next frame...")
            
        elif line: 
            parts = line.split()
            entity = parts[0]
            
            try:
                if entity == "player":
                    draw_player(matrix, int(parts[1]), int(parts[2]))
                elif entity == "invader_1":
                    draw_invader_1(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
                elif entity == "invader_2":
                    draw_invader_2(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
                elif entity == "invader_3":
                    draw_invader_3(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
                elif entity == "invader_4":
                    draw_invader_4(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
                elif entity == "shield":
                    draw_shield(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
                elif entity == "player_bullet" or entity == "invader_bullet":
                    draw_bullet(matrix, int(parts[1]), int(parts[2]), int(parts[3]))
            except ValueError:
                # Silently skip drawing this entity if coordinates or state are 'x' or 'z'
                pass
            
    print("End of log reached.")

if __name__ == "__main__":
    render_log("top_display_log.txt")