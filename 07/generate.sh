#!/bin/bash

generate() {
	local count j
	local filename=$1 count_day=$2
	count=$((100 + RANDOM % 901))
	for (( f=1; f<=count; f++ )); do
		ip=$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)

		http_codes=(200 201 400 401 403 404 500 501 502 503)
		index_code=$((RANDOM % ${#http_codes[@]}))
		code=${http_codes[$index_code]}

		http_methods=(GET POST PUT PATCH DELETE)
		index_method=$((RANDOM % ${#http_methods[@]}))
		method=${http_methods[$index_method]}

		day=$(($(date '+%d') + $count_day))
		date=$(date '+/%b/%Y:%H:%M:%S')
		final_date="$day$date"

		url="/page_$((RANDOM % 1000))"

		agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
		index_agent=$((RANDOM %${#agents[@]}))
		agent=${agents[$index_agent]}

		echo "$ip - - [$final_date +0000] $code \"$method $url HTTP/1.1\" \"-\" $agent" >> $filename
	done
}
