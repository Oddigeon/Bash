#!/bin/bash

font () {
	case $1 in 
		1) echo -n "37" ;;
		2) echo -n "31" ;;
		3) echo -n "32" ;;
		4) echo -n "34" ;;
		5) echo -n "35" ;;
		6) echo -n "30" ;;
	esac
}
back () {
	case $1 in
		1) echo -n "47" ;;
		2) echo -n "41" ;; 
		3) echo -n "42" ;;
		4) echo -n "44" ;;
		5) echo -n "45" ;;
		6) echo -n "40" ;;
	esac
}
