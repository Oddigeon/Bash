#!/bin/bash

set -euo pipefail 

source "./check_input.sh"
source "./check_disk.sh"
source "./generate_name.sh"
source "./separators.sh"

print_separators

check_input "$@"

base_path=$1
dir_count=$2
dir_chars=$3
file_count=$4
file_chars=$5
size_file=$6
filename="${file_chars%.*}"
ext="${file_chars#*.}"
size="${size_file%kb}"

check_disk_space

mkdir -p "$base_path"

# log file

# create structures: dirs, files etc.

generate_name

print_separators

echo "Done."

