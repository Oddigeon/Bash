#!/bin/bash

generate() {
	local count j
	count=$((100 + RANDOM % 901))
	for (( f=1; f<=count; f++ )); do
		ip=$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)

		http_codes=(200 201 400 401 403 404 500 501 502 503)
		index_code=$((RANDOM % ${#http_codes}))
		code=${http_codes[$index_code]}

		http_methods=(GET POST PUT PATCH DELETE)
		index_method=$((RANDOM % ${#http_methods}))
		method=${http_methods[$index_method]}

		date=$(date '+%a')

		url="https://page_$((RANDOM % 1000))"

		agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
		index_agent=$((RANDOM %${#agents}))
		agent=${agents[$index_agent]}

		echo "$ip -- [$date +0000] $code $method $url $agent" >> $filename
	done
}
