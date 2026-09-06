#!/bin/bash

check_input() {
	if [[ $# -ne 1 ]]; then
		echo "Error. Enter 1 parameter from 1 to 4." >&2
		print_separators
		exit 1
	fi

	if [[ ! $1 =~ ^[1-4]{1}$ ]]; then
		echo "Error. Enter 1 parameter from 1 to 4." >&2
		print_separators
		exit 1
	fi
}

check_value() {
	if [[ $1 -eq 1 ]]; then
		value_1
	fi

#	if [[ $1 -eq 2 ]]; then
		#value_2
#	fi

#	if [[ $1 -eq 3 ]]; then
		#value_3
#	fi

#	if [[ $1 -eq 4 ]]; then
		#value_4
#	fi
}
