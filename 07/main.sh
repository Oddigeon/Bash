#!/bin/bash

set -euo pipefail

source "./generate.sh"

mkdir -p nginx_logs

filename="./nginx_logs/access_log"

for ((i=1; i<=5; i++ )); do
	filename="./nginx_logs/access_log_$i.log"
	echo "Генерация файла $filename"
	touch $filename
	generate $filename 
done

echo "Done"
