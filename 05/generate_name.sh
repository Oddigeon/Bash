#!/bin/bash

generate_name() {
	local charset=$1
	local length=$2
	local n=${#charset}
	local pattern=""
	local i

	for (( i=0; i<n; i++ )); do
		pattern+="${charset:i:1}.*"
	done

	local result
	while true; do
		result=""
		for (( i=0; i<length; i++ )); do
			result+="${charset:((RANDOM % n)):1}"
		done
		if [[ $result =~ $pattern ]]; then
			break
		fi
	done

	echo "$result"
}

generate_dated_name() {
	local charset=$1
	local min_length=$2
	local n=${#charset}

	local base_len=$((if n > min_length ? n: min_length ))
	local extra=$(( RANDOM % 4 ))
	local final_len=$(( base_len + extra )) 
	local name_part=$(generate_name "$charset" "$final_len")
	local date_name=$(date +%d%m%Y)

	echo "${name_part}_${date_name}"
}

generate_ext() {
	local charset=$1
	generate_name "$charset" "${#charset}"
}
