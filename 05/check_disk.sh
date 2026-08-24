#!/bin/bash

min_bytes=$(( 1024 * 1024 * 1024 ))

free_space() {
	df 
