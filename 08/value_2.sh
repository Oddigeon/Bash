#!/bin/bash

value_2() {
	local i
	for (( i=1; i<=5; i++ )); do
		awk '{print $1}' ./nginx_logs/access_log_$i.log | sort -u
		print_separators
	done
}
