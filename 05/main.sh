#!/bin/bash

current_dir=$(pwd)
dir_chars=$1
file_chars=$2
file_size=$3
filename=${file_chars%.*}
ext=${file_chars#*.}
size_value=${file_size%[Mm][Bb]}

start_time=$(date '+%d-%m-%Y %H:%M:%S')
start_ts=$(date +%s)

source "$current_dir/check_input.sh"
source "$current_dir/separators.sh"
source "$current_dir/check_disk.sh"
source "$current_dir/create_structure.sh"

print_separators
check_input "$@"
check_forbidden_path
detailed_check_disk_space

log_path="${current_dir}/file.log"
init_log 

#create_structure "$dir_chars" "$filename" "$ext" "$size_value"
create_structure

end_time=$(date '+%d-%m-%Y %H:%M:%S')
end_ts=$(date +%s)
elapsed=$(( $start_ts - $end_ts ))

print_separators

echo "Done"
echo "Start time: $start_time"
echo "End time: $end_time"
echo "Total time: $elapsed sec"

{
	print_separators
	echo "Start time: $start_time"
	echo "End time: $end_time"
	echo "Total time: $elapsed sec"
} >> "$log_path"
