#!/bin/bash

set -euo pipefail

source "./check_input.sh"
source "./log_1.sh"
source "./date_2.sh"
source "./mask_3.sh"
source "./separators.sh"

SEARCH_DIRS=("$HOME" "/tmp" "/var/tmp" "$(pwd)")
NAME_PATTERN='[A-Za-z]+_[0-9]{6}(\.[A-Za-z]{1,3})?'

print_separators
check_input "$@"

case "$1" in
	1)
		input_log_path
		clean_by_log "$log_path"
		;;
	2)
		input_create_date
		clean_by_date "$start_date" "$end_date"
		;;
	3)
		input_mask
		clean_by_mask "$mask"
		;;
esac

