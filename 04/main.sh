#!/bin/bash

set -euo pipefail 

script_dir="$(cd "$(dirname $0)" && pwd)"

source "${script_dir}/check_input.sh"
source "${script_dir}/check_disk.sh"
source "${script_dir}/generate_name.sh"
source "${script_dir}/separators.sh"

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

detailed_check_disk_space

mkdir -p "$base_path"

# log file

# create structures: dirs, files etc.

generate_name

print_separators

echo "Done."

