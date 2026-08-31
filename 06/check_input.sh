#!/bin/bash

check_input() {
	if [[ $# -ne 1 ]] || [[ ! $1 =~ ^[1|2|3]$ ]]; then
		echo "Error. Enter 1 parameter from 1 to 3."
		exit 1
	fi
	echo "good"
}
