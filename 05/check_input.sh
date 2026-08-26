#!/bin/bash

check_input() {
	if [[ $# -ne 3 ]]; then
		echo "Error. Enter 3 parameters." >&2
		print_separators
		exit 1
	fi

	#local dir_chars=$1
	#local file_chars=$2
	#local file_size=$3
	#local size_value=${file_size%[Mm][Bb]}

	if [[ ! $dir_chars =~ ^[a-zA-Z]{1,7}$ ]]; then
		echo "Error parameter 1. Enter the letter."
		print_separators
		exit 1
	fi

	if [[ ! $file_chars =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
		echo "Error parameter 2. Enter the letters (file name max 7 symbols, file ext max 3"
		print_separators
		exit 1
	fi

	if [[ ! $file_size =~ ^([0-9]+)[Mm][Bb]$ ]]; then
		echo "Error parameter 3. Enter the file size in the format: (number)Mb (max 100Mb)"
		print_separators
		exit 1
	fi

	if [[ $size_value -gt 100 ]] || [[ $size_value -lt 1 ]]; then
		echo "Error parameter 3. Enter a value from 1 to 100 Mb"
		print_separators
		exit 1
	fi
}


check_forbidden_path() {
	if [[ $current_dir =~ (^|/)s?bin(/|$) ]]; then
		echo "Error. Cannot create dirs and files in structure with 'bin' or 'sbin'." >&2
		print_separators
		exit 1
	fi
}
