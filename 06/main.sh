#!/bin/bash

set -euo pipefail

source "./check_input.sh"
source "./log_1.sh"
source "./date_2.sh"
source "./mask_3.sh"
source "./separators.sh"

print_separators
check_input "$@"

if [[ $1 -eq 1 ]]; then
	echo "good 1"
fi

if [ $1 -eq 2 ]; then
	echo "good 2"
fi

if [ $1 -eq 3 ]; then
	echo "good 3"
fi
