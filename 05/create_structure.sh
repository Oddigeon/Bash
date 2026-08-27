#!/bin/bash

init_log() {
	{
		echo "=== Log of file/dir generation ==="
		echo "Start time: $start_time"
		print_separators
	} > "$log_path"
}

log_entry() {
	local log_path=$1
	local full_path=$2
	local size=$3
	local created
	created=$(date '+%d-%m-%Y %H:%M:%S')

	if [[ $size == "-" ]]; then
		echo "[DIR ] $full_path | created: $created" >> "$log_path"
	else
		echo "[FILE] $full_path | created: $created | size: %size bytes" >> "$log_path"
	fi
}

create_structure() {
	local dir_count=$(( (RANDOM % 100) + 1 ))
	echo "oops... $dir_count subfolders will be created."

	local current_path=$current_dir
	local d 
	for (( i=1; i<$dir_count; i++ )); do
		check_dick_space
		local dir_name
		dir_name=$(generate_dated_name "$dir_chars" 5)
		current_path="${current_path}/${dir_name}"

		mkdir -p $current_path
		#log_entry

		local file_count=$(( (RANDOM % 10) + 1 ))
		local f

		for (( f=0; f<file_count; f++)); do
			check_disk_space
			local file_base file_ext file_name file_path
			file_base=$(generate_dated_name "$filename" 5)
			file_ext=$(generate_ext "$ext")
			file_name="${file_base}.${file_ext}"
			file_path="${currrent_path}/${file_name}"

			truncate -s "$size_value" "$file_path"
			#log_entry
		done
	done
}
