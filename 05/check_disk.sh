#!/bin/bash

min_bytes=$(( 1024 * 1024 * 1024 ))

free_space() {
	df -B1 --output=avail / | tail -1
}

check_disk_space() {
	free_bytes=$(free_space)
	if [[ $free_bytes -le $min_bytes ]]; then
		echo "Attention. There is less than 1 Gb of free space on '/'" >&2
		exit 1
	fi
}

detailed_check_disk_space() {
	print_separators
	echo "Disk usage on '/':"
	df -h /
	check_disk_space
	print_separators
	echo "Disk check is over."
	print_separators
}
