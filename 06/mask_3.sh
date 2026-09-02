#!/bin/bash

input_mask() {
	read -p "Enter chars from Part 2: " mask
	check_input_mask "$mask"
	print_separators
}

clean_by_mask() {
	local chars=$1
	local pattern="[${chars}]+_[0-9]{6}(\.[${chars}]{1,3})?"
	local dir path removed=0

	for dir in "${SEARCH_DIRS[@]}"; do
		[[ -d $dir ]] || continue
		while IFS= read -r -d '' path; do
			is_forbidden_path "$path" && continue
			rm -rf -- "$path"
			echo "Removed: $path"
			removed=$((removed + 1))
		done < <(find "$dir" -mindepth 1 -regextype posix-extended -regex ".*/${pattern}\$" -print0 2>/dev/null)
	done

	print_separators
	echo "Done. Removed $removed"
}
