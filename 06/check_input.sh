#!/bin/bash

check_input() {

	if [[ $# -ne 1 ]]; then
		echo "Error. Enter 1 parameter from 1 to 3." >&2
		print_separators
		exit 1
	fi

	if [[ ! $1 =~ ^[1|2|3]$ ]]; then
		echo "Error. Enter 1 parameter from 1 to 3." >&2
		print_separators
		exit 1
	fi
}

check_input_log_path() {

	if [[ ! $log_path == /* ]]; then
		echo "error" >&2
		print_separators
		exit 1
	fi
}
