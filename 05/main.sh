#!/bin/bash

current_dir=$(pwd)
dir_chars=$1
file_chars=$2
file_size=$3
filename=${file_chars%.*}
ext=${file_chars#*.}
size_value=${file_size%kb}

source "$current_dir/check_input.sh"
source "$current_dir/separators.sh"
source "$current_dir/check_disk.sh"

print_separators
check_input "$@"
check_disk_space

#log_path="$current_dir/file.log"
#init_log 

#create_structure "$dir_chars" "$filename" "$ext" "$size_value"
print_separators

echo "Done"
