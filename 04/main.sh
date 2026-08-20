#!/bin/bash

set -euo pipefail 

script_dir="$(cd "$(dirname $0)" && pwd)"

source "${script_dir}/check_input.sh"
source "${script_dir}/check_disk.sh"
source "${script_dir}/generate_name.sh"
source "${script_dir}/create_structure.sh"
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

log_path="${base_path}/file.log"
init_log "$log_path"

create_structure "$base_path" "$dir_count" "$dir_chars" "$file_count" "$filename" "$ext" "$size" "$log_path"

print_separators

echo "Done."
echo "Structure created in $base_path"
echo "Log file: $log_path"
