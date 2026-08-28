#!/bin/bash

set -euo pipefail

current_dir=$(pwd)
dir_chars=$1
file_chars=$2
file_size=$3
filename=${file_chars%.*}
ext=${file_chars#*.}
size_value=${file_size%[Mm][Bb]}

start_time=$(date '+%d-%m-%Y %H:%M:%S')
start_ts=$(date +%s)
log_path="${current_dir}/file.log"

source "./check_input.sh"
source "./separators.sh"
source "./check_disk.sh"
source "./generate_name.sh"
source "./create_structure.sh"

finish() {
	local end_time end_ts elapsed
	end_time=$(date '+%d-%m-%Y %H:%M:%S')
	end_ts=$(date +%s)
	elapsed=$(( end_ts - start_ts ))

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
}
trap finish EXIT

print_separators
check_input "$@"
check_forbidden_path "$current_dir"
detailed_check_disk_space

init_log
create_structure
