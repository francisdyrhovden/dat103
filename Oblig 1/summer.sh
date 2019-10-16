#!/bin/bash
declare -i sum=0
echo "Skriv inn tall, avslutt med CTRL+D"
#leser ett tegn
while read key
do
	#hvis det trykkes CTRL+D
	if [[ $key == $'\04' ]];
	then
		break;
	fi
	#Summerer sammen
	sum+=$key
done
printf "\nSum av tallene: $sum\n"