#!/bin/bash

# "DD-MM-YYYY HH:MM" -> "YYYY-MM-DD HH:MM" (the form `date -d` understands)
to_iso_datetime() {
	local dt=$1
	local d=${dt:0:2} m=${dt:3:2} y=${dt:6:4} time=${dt:11}
	echo "${y}-${m}-${d} ${time}"
}

input_create_date() {
	read -p "Input the start date and time (DD-MM-YYYY HH:MM):" start_date
	check_input_datetime "$start_date"

	read -p "INput the end date and time (DD-MM-YYYY HH:MM):" end_date
	check_input_datetime "$end_date"

	print_separators
}

clean_by_date() {
	local start=$1
	local end=$2
	local start_ts end_ts

	# GNU date can't parse "DD-MM-YYYY HH:MM" directly - rearrange to
	# "YYYY-MM-DD HH:MM" first.
	start_ts=$(date -d "$(to_iso_datetime "$start")" +%s) || { echo "Error. Bad start date" >&2; exit 1; }
	end_ts=$(date -d "$(to_iso_datetime "$end")" +%s) || { echo "Error. Bad end date" >&2; exit 1; }

	if (( start_ts > end_ts )); then
		echo "Error. Start date is after end date" >&2
		exit 1
	fi

	local dir path mtime removed=0
	for dir in "${SEARCH_DIRS[@]}"; do
		[[ -d $dir ]] || continue
		while IFS= read -r -d '' path; do
			is_forbidden_path "$path" && continue
			mtime=$(stat -c %Y -- "$path" 2>/dev/null) || continue
			if (( mtime >= start_ts && mtime <= end_ts )); then
				rm -rf -- "$path"
				echo "Removed: $path"
				removed=$((removed + 1))
			fi
		done < <(find "$dir" -mindepth 1 -regextype posix-extended -regex ".*/${NAME_PATTERN}\$" -print0 2>/dev/null)
	done

	print_separators
	echo "Done. Removed $removed"
}
