#!/bin/bash

generate() {
	local count j
	count=$((100 + RANDOM % 901))
	for (( f=1; f<=count; f++ )); do
		echo "hello" >> $filename
	done
}
