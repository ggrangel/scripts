#!/bin/bash
#
# Create a file for writing python cses solution and a input test file
#
# Usage:
#
# ```sh
# $ ./cses.sh name_of_file
# ```
#
# Dependencies:
#
# None
#

if [ $# -ne 1 ]; then
	echo "Please provide 1 arg: filename"
	exit 1
fi

filename=$1
filename="${filename%.*}"
full_filename="$filename".py # remove extension (if exists) and add .py

cp "$HOME/scripts/utils/cses_template.py" "$full_filename"

testfilename="$filename"_tests

touch "$testfilename"

nvim -O "$testfilename" "$full_filename"
