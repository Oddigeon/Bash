#!/bin/bash

if [ $# -eq 1 ]; then
	if [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
		echo "error! parameter must be text."
	else
		echo "$1"
	fi
else 
	echo "you must use only one parameter!"
fi
