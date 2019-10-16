#!/bin/bash
declare -i tidsintervall=$2
filnavn=$1
eksisterer=false

if [ ! -e $filnavn ]
then
	echo "Filen finnes ikke"
	while [ "$eksisterer" = false ]
	do
		echo "Sjekker om fil er opprettet"
		if [ -e $filnavn ]
		then
			echo "Fil $filnavn ble opprettet"
			eksisterer=true
			echo "Programmet avsluttes"
			break;
		fi
		sleep $tidsintervall
	done

else
	echo "Filen finnes"
	eksisterer=true
	endret=false
	declare -i dato=$(date -r $filnavn +%s)
	declare -i nydato

	while [ "$eksisterer" = true -a "$endret" = false ]
	do
		echo "Sjekker om fil \"$filnavn\" er slettet eller endret"
		if [ ! -e $filnavn ]
		then
			echo "Fil $filnavn ble slettet"
			eksisterer=false
			echo "Programmet avsluttes"
			break;
		else
			nydato=$(date -r $filnavn +%s)
			if [ $nydato -gt $dato ]
			then
				echo "Fil $filnavn ble endret"	
				endret=true
				echo "Programmet avsluttes"
				break;
			fi
		fi
		sleep $tidsintervall
	done
fi