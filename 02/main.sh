#!/bin/bash

if [ $# -ne 0 ]; then
	echo "Error. don't need to pass parameters"
	exit 1
fi

source ./commands.sh

chmod +x ./save.sh
./save.sh
