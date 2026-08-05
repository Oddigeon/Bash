#!/bin/bash

chmod +x print.sh
./print.sh

echo ""
echo "do you want write data to a file? (y - yes, n - no)"
read answer

if [[ $answer == y || $answer == Y ]]; then
	file="$(date +'%d_%m_%y_%H_%M_%S').status"
	./print.sh > "${file}"
	echo ""
	echo "Saved to a file ${file}"
else
	echo ""
	echo "Data was not saved"
fi
