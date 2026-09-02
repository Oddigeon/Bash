#!/bin/bash

source "./generate.sh"

mkdir -p nginx_log

filename="./nginx_log/access_log"

for ((i=1; i<=5; i++ )); do
	filename="./nginx_log/access_log_$i.log"
	echo $filename
done
