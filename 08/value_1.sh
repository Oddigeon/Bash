#!/bin/bash

value_1() {
	echo $(cat ./nginx_logs/access_log_1.log | awk '{print $6}' | sort -n)
	print_separators
}
