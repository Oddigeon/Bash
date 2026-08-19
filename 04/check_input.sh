#!/bin/bash

#abs_path=$1
#dir_count=$2
#dir_chars=$3
#file_count=$4
#file_chars=$5
#size_file=$6

check_input() {

	if [[ $# -ne 6 ]]; then
		echo "Error. Enter 6 parameters." >&2
		print_separators
		exit 1
	fi

	local base_path=$1
	local dir_count=$2
	local dir_chars=$3
	local file_count=$4
	local file_chars=$5
	local size_file=$6

	if [[ ! $base_path =~ ^/ ]]; then
		echo "Error parameter 1. The path should start from '/'" >&2
		print_separators
		exit 1
	fi

	if [[ ! $dir_count =~ ^[0-9]+$ ]] || [[ $dir_count -lt 1 ]]; then
		echo "Error parameter 2. Enter a number greater than 1." >&2
		print_separators
		exit 1
	fi

	if [[ ! $dir_chars =~ ^[a-zA-Z]{1,7}$ ]]; then
		echo "Error parameter 3. Enter the letters." >&2
		print_separators
		exit 1
	fi

	if [[ ! $file_count =~ ^[0-9]+$ ]] || [[ $file_count -lt 1 ]]; then
		echo "Error parameter 4. Enter a number greater than 1." >&2
		print_separators
		exit 1
	fi

	if [[ ! $file_chars =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
		echo "Error parameter 5. Enter the letters (filename - max 7, extension - max 3)" >&2
		print_separators
		exit 1
	fi

	if [[ ! $size_file =~ ^([0-9]+)kb$ ]]; then
		echo "Error parameter 6. Enter the file size in the format: {number}kb (max 100kb)" >&2
		print_separators
		exit 1
	fi

	local size_value=${size_file%kb}
	if [[ $size_value -gt 100 ]]; then
		echo "Error parameter 6. Max file size is 100kb." >&2
		print_separators
		exit 1
	fi

	echo "Correct input."
	print_separators
	#chmod +x ./generate_name.sh
	#source ./generate_name.sh "$@"
}

