#!/bin/bash
read -p "Hva er hendelsen? " userinput
grep "$userinput" "$1" | awk '{ SUM += $2} END { print SUM }'