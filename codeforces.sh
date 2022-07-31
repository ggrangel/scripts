#!/bin/bash
#
# Create a file for writing python codeforces solution and a input test file
# Both files will have a proper name defined by the number and the filename given as arguments
#
# Usage:
#
# ```sh
# $ ./codeforces.sh 1781b name_of_file
# ```
#
# Dependencies:
#
# None
#

if [ $# -ne 2 ]; then
	echo "Please provide 2 args: problem number and filename"
	exit 1
fi

number=$1
filename="$number"_$2
filename="${filename%.*}.py" # remove extension (if exists) and add .py

cp "$HOME/scripts/utils/codeforces_template.py" "$filename"

sed -i "s/XXXX/$number/" "$filename"

testfilename="$number"_tests
touch "$testfilename"

nvim -O "$testfilename" "$filename"
