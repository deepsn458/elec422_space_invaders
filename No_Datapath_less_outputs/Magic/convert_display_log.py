#from __future__ import annotations

import argparse
import re
from pathlib import Path
from typing import Dict, List

# Example input frame in the source log:
# ib_y=1101 ib_x=1001 pb_y=0010 pb_x=1000 s_hp=11 inv2_y=1101 inv2_x=1001
# inv1_y=1101 inv1_x=0101 player_x=0111 invader_bullet_display=0
# player_bullet_display=0 invader_2_display=1 invader_1_display=1
# player_display=1
# time = 21240.000ns

FIELD_PATTERN = re.compile(r"([A-Za-z0-9_]+)\s*=\s*([^\s]+)")
TIME_PATTERN = re.compile(r"time\s*=\s*([^\s]+)", re.IGNORECASE)

REQUIRED_FIELDS = [
    "player_x",
    "player_display",
    "inv1_x",
    "inv1_y",
    "invader_1_display",
    "inv2_x",
    "inv2_y",
    "invader_2_display",
    "s_hp",
    "pb_x",
    "pb_y",
    "player_bullet_display",
    "ib_x",
    "ib_y",
    "invader_bullet_display",
]


def parse_frames(text: str) -> List[Dict[str, str]]:
    """Parse the source log into a list of frame dictionaries."""
    frames: List[Dict[str, str]] = []
    current: Dict[str, str] = {}

    for raw_line in text.splitlines():
        line = raw_line.strip()
        if not line:
            continue

        time_match = TIME_PATTERN.search(line)
        if time_match:
            current["time"] = time_match.group(1)

            missing = [name for name in REQUIRED_FIELDS if name not in current]
            if missing:
                raise ValueError(
                    "Encountered a completed frame with missing fields: "
                    + ", ".join(missing)
                )

            frames.append(current)
            current = {}
            continue

        for key, value in FIELD_PATTERN.findall(line):
            current[key] = value

    if current:
        raise ValueError(
            "Input ended with an incomplete frame. Missing final 'time = ...' line?"
        )

    return frames


def format_frame(frame: Dict[str, str]) -> str:
    """Convert one parsed frame into the requested output format."""
    return "\n".join(
        [
            f"TIME: {frame['time']} | TEST:",
            f"player  {int(frame['player_x'],2)} {int(str(frame['player_display']),2)}",
            f"invader_1  {int(frame['inv1_x'],2)} {int(frame['inv1_y'],2)} {int(frame['invader_1_display'],2)}",
            f"invader_2  {int(frame['inv2_x'],2)} {int(frame['inv2_y'],2)} {int(frame['invader_2_display'],2)}",
            f"shield  7  4 {int(frame['s_hp'],2)}",
            f"player_bullet  {int(frame['pb_x'],2)}  {int(frame['pb_y'],2)} {int(frame['player_bullet_display'],2)}",
            f"invader_bullet  {int(frame['ib_x'],2)}  {int(frame['ib_y'],2)} {int(frame['invader_bullet_display'],2)}",
            "END_FRAME",
        ]
    )


def convert_file(input_path: Path, output_path: Path) -> None:
    text = input_path.read_text(encoding="utf-8")
    frames = parse_frames(text)
    converted = "\n\n".join(format_frame(frame) for frame in frames) + "\n"
    output_path.write_text(converted, encoding="utf-8")
    print(f"Converted {len(frames)} frames -> {output_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert the display log into the frame-based format."
    )
    parser.add_argument(
        "input",
        nargs="?",
        default="magic_display_log.txt",
        help="Path to the source log file",
    )
    parser.add_argument(
        "output",
        nargs="?",
        default="top_display_log.txt",
        help="Path to the converted output file",
    )
    args = parser.parse_args()

    convert_file(Path(args.input), Path(args.output))