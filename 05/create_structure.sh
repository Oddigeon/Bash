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
		echo "[FILE] $full_path | created: $created | size: ${size}Mb" >> "$log_path"
	fi
}

select_base_dir() {
	local candidates=("$current_dir" "/tmp" "/var/tmp" "$HOME")
	local valid=()
	local c
	for c in "${candidates[@]}"; do
		if [[ -d $c && -w $c && ! $c =~ (^|/)s?bin(/|$) ]]; then
			valid+=("$c")
		fi
	done
	echo "${valid[$((RANDOM % ${#valid[@]}))]}"
}

create_structure() {
	local dir_count=$(( (RANDOM % 100) + 1 ))
	echo "$dir_count subfolders will be created."

	local d
	for (( d=0; d<dir_count; d++ )); do
		check_disk_space

		local base_dir dir_name current_path
		base_dir=$(select_base_dir)
		dir_name=$(generate_dated_name "$dir_chars" 5)
		current_path="${base_dir}/${dir_name}"
		check_forbidden_path "$current_path"

		mkdir -p "$current_path"
		log_entry "$log_path" "$current_path" "-"

		local file_count=$(( (RANDOM % 10) + 1 ))
		local f

		for (( f=0; f<file_count; f++ )); do
			check_disk_space
			local file_base file_ext file_name file_path
			file_base=$(generate_dated_name "$filename" 5)
			file_ext=$(generate_ext "$ext")
			file_name="${file_base}.${file_ext}"
			file_path="${current_path}/${file_name}"

			if ! fallocate -l "${size_value}M" "$file_path" 2>/dev/null; then
				dd if=/dev/zero of="$file_path" bs=1M count="$size_value" status=none
			fi
			log_entry "$log_path" "$file_path" "$size_value"
		done
	done
}
