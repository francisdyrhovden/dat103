#!/bin/bash
declare -i number=$1
for ((i=0;i<number;i++))
do
	echo "$2"
done
