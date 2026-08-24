#!/bin/bash

current_dir=$(pwd)
dir_chars=$1
file_chars=$2
file_size=$3
size_value=${file_size%kb}

source "$current_dir/check_input.sh"
source "$current_dir/separators.sh"

print_separators
check_input "$@"
