#!/bin/bash

value_4() {
	local i
	for i in {1..5}; do
		echo "access_log_$i.log"
		print_separators
		awk '$6 ~ /[4|5]0[0-9]/' ./nginx_logs/access_log_$i.log | awk '{print $1}' | sort -u
		print_separators
	done
}
