#!/bin/bash

value_3() {
	local i
	for (( i=1; i<=5; i++ )); do
		echo "access_log_$i.log"
		print_separators
		awk '$6 ~ /[4|5]0[0-9]/' ./nginx_logs/access_log_$i.log
		print_separators
	done
}
