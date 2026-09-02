#!/bin/bash

check_input() {

	if [[ $# -ne 1 ]]; then
		echo "Error. Enter 1 parameter from 1 to 3." >&2
		print_separators
		exit 1
	fi

	if [[ ! $1 =~ ^[1-3]$ ]]; then
		echo "Error. Enter 1 parameter from 1 to 3." >&2
		print_separators
		exit 1
	fi
}

check_input_log_path() {

	if [[ ! $log_path == /* ]]; then
		echo "Error. Enter an absolute path to the log file." >&2
		print_separators
		exit 1
	fi

	if [[ ! -f $log_path ]]; then
		echo "Error. File log does not exist." >&2
		print_separators
		exit 1
	fi
}

check_input_datetime() {
	local dt=$1

	if [[ ! $dt =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}\ [0-9]{2}:[0-9]{2}$ ]]; then
		echo "Error. Enter date and time in format: DD-MM-YYYY HH:MM" >&2
		print_separators
		exit 1
	fi
}

check_input_mask() {
	local mask=$1
	if [[ ! $mask =~ ^[a-zA-Z]{1,7}$ ]]; then
		echo "Error. Enter max 7 letters" >&2
		print_separators
		exit 1
	fi
}

is_forbidden_path() {
	local path=$1
	[[ $path =~ (^|/)s?bin(/|$) ]]
}
