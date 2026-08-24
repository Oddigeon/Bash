#!/bin/bash

check_input() {
	if [[ $# -ne 3 ]]; then
		echo "Error. Enter 3 parameters." >&2
		print_separators
		exit 1
	fi
}
