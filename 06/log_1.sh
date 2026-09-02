#!/bin/bash

input_log_path() {
	read -p "Enter path to log file: " log_path
	print_separators
	check_input_log_path "$log_path"
}

clean_by_log() {
	local log_path=$1
	local line path removed=0

	while IFS= read -r line; do
		if [[ $line =~ ^\[(DIR\ |FILE)\]\ (.+)\ \|\ created: ]]; then
			path="${BASH_REMATCH[2]}"
			is_forbidden_path "$path" && continue

			if [[ -e $path ]]; then
				rm -rf -- "$path"
				echo "Removed: $path"
				removed=$((removed + 1))
			fi
		fi
	done < "$log_path"

	print_separators
	echo "Removed $removed from log file"
}
