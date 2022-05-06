#!/bin/python
#
# Sets a random wallpaper to all screens. Also, permanently deletes a wallpaper that's set on a screen.
#
# Usage:
#
# ```sh
# $ ./wallpaper.py set
# $ ./wallpaper.py remove <screen_nr>
# ```
#
# Dependencies:
#
# None


import json
import os
import random
import subprocess
import sys
from pathlib import Path

curr_wallpapers_file = Path.home() / "tmp" / "currentWallpapers.json"
wallpapers_folder = Path.home() / "drive" / "wallpapers"


def _write_wallpapers_to_json(wallpapers):
    with open(curr_wallpapers_file, "w") as file:
        json.dump(wallpapers, file)


def _build_feh_command(wallpapers):
    feh_command = ["feh", "--no-fehbg"]

    for wp in wallpapers:
        feh_command += ["--bg-fill", wp]

    return feh_command


def _set_wallpaper(mon):
    with open(curr_wallpapers_file, "r") as file:
        wallpapers = json.load(file)

    wallpapers[str(mon)] = str(random.choice(list(wallpapers_folder.iterdir())))

    feh_command = _build_feh_command(list(wallpapers.values()))

    subprocess.run(feh_command, check=True, text=True)

    _write_wallpapers_to_json(wallpapers)


def set_all_wallpapers():
    conn_monitors = subprocess.run(
        ["xrandr", "-q"], check=True, text=True, stdout=subprocess.PIPE
    )

    n_monitors = len(
        [line for line in conn_monitors.stdout.splitlines() if "connected" in line]
    )

    chosen_wallpapers = dict()

    for idx in range(1, n_monitors + 1):
        file = random.choice(list(wallpapers_folder.iterdir()))
        chosen_wallpapers[idx] = str(file)

    feh_command = _build_feh_command(list(chosen_wallpapers.values()))

    subprocess.run(feh_command, check=True, text=True)

    _write_wallpapers_to_json(chosen_wallpapers)


def rm_wallpaper(mon):
    with open(curr_wallpapers_file, "r") as file:
        wallpapers = json.load(file)

    file = wallpapers[str(mon)]

    if Path(file).is_file():
        os.remove(file)
        print(f"{file} removed.")

    _set_wallpaper(mon)


if __name__ == "__main__":
    options = sys.argv[1:]

    match options:
        case ["set" | "s"]:
            set_all_wallpapers()

        case ["remove" | "r", screen]:
            rm_wallpaper(screen)

        case ["help" | "h"]:
            print(
                "[--set or -s] to set wallpapers in all screens\n[--remove or -r + SCR] to remove wallpaper from SCR"
            )

        case _:
            print("Wrong option")
