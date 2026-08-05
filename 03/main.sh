#!/bin/bash

if [ $# -ne 4 ]; then
	echo "error! enter 4 parameters from 1 to 6. try to run script again" 
	exit 1
fi

for arg in "$@"; do
	if ! [[ $arg =~ ^[1-6]$ ]]; then
		echo "error! parametrs must be from 1 to 6" >&2
		exit 1
	fi
done

if [ $1 -eq $2 ]; then
	echo "error! colors of background and of font must be different" >&2
	exit 1
fi

if [ $3 -eq $4 ]; then
	echo "error! colors of background and of font must be different" >&2
	exit 1
fi

chmod +x color.sh
source ./color.sh

export name_back="\033[$(back $1)m"
export name_font="\033[$(font $2)m"
export value_back="\033[$(back $3)m"
export value_font="\033[$(font $4)m"
export RESET="\033[0m"

chmod +x commands.sh
source ./commands.sh

chmod +x print.sh
./print.sh

