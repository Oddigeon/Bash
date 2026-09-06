#!/bin/bash

set -euo pipefail

source "./check_input.sh"
source "./separators.sh"
source "./value_1.sh"

print_separators
check_input "$@"

check_value "$@"
