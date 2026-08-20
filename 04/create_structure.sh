#!/bin/bash

init_log() {
	local log_path="$1"
	{
		echo "Log of file/dir generation"
		echo "Started: $(date '+%d-%m-%Y %H:%M:%S')"
		print_separators
	} > "$log_path"
}

log_entry() {
	local log_path="$1"
	local full_path="$2"
	local size="$3"
	local created=$(date '+%d-%m-%Y %H:%M:%S')

	if [[ $size == "-" ]]; then
		echo "[DIR ] $full_path | creared: $created" >> "$log_path"
	else
		echo "[FILE] $full_path | created: $created | size: $size bytes" >> "$log_path"
	fi
}


create_structure() {
	local base_path=$1
	local dir_count=$2
	local dir_charset=$3
	local file_count=$4
	local name_charset=$5
	local ext_charset=$6
	local size_kb=$7
	local log_path=$8

	local size_bytes=$(( $size_kb * 1024 ))
	local current_path=$base_path

	local d f
	for (( d=1; d<=dir_count; d++ )); do
		check_disk_space

		local dir_name
		dir_name=$(generate_dated_name "$dir_charset" 4)
		current_path="${current_path}/${dir_name}"

		mkdir -p ${current_path}
		log_entry "$log_path" "$current_path" "-"

		for (( f=1; f<=file_count; f++ )); do
			check_disk_space

			local file_base file_ext file_name file_path
			file_base=$(generate_dated_name "$name_charset" 4)
			file_ext=$(generate_ext "$ext_charset")
			file_name="${file_base}.${file_ext}"
			file_path="${current_path}/${file_name}"

			truncate -s "${size_bytes}" "$file_path"
			log_entry "$log_path" "$file_path" "$size_bytes"
		done
	done
}
