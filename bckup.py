#!/usr/bin/env python3

import sys
from pathlib import Path
from shutil import copytree

HOME = Path.home()
BCKUP_FOLDER = Path(__file__).parent / "backup/"


FOLDERS_PATH = {
    # "cope": HOME,
    # "Default": HOME / ".config" / "BraveSoftware" / "Brave-Browser",
    # "projects": HOME,
    ".todo": HOME,
}

if __name__ == "__main__":
    Path(BCKUP_FOLDER).mkdir(parents=True, exist_ok=True)

    if len(sys.argv) <= 1:
        print("You need to choose between backup (-b) or restore (-r)")
        sys.exit()

    elif sys.argv[1] == '-b':
        for folder, path in FOLDERS_PATH.items():
            copytree(src=path / Path(folder), dst=BCKUP_FOLDER / Path(folder))

    elif sys.argv[1] == '-r':
        for folder, path in FOLDERS_PATH.items():
            copytree(dst=path / Path(folder), src=BCKUP_FOLDER / Path(folder))

    else:
        print("Do you want to backup (-b) or restore (-r)?")
