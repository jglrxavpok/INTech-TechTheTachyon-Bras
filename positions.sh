#!/bin/bash

echo "[=== DEBUT ===]"
echo "Positions disponibles: 'droit', 'accel', 'distributeur', 'sol', 'stockage'"
echo "Tapez 'stop' pour sortir du programme proprement"
sleepTime=1s
perif="/dev/ttyACM0" # Chemin de la Teensy reliée aux XL qu'il faut commander
sudo chmod a+rw $perif

pos1=180
pos2=180
pos3=180

function set_pos {
	echo "echo \"1 $1\" > $perif"
	echo "1 $1" > $perif
	if [ $pos1 -ne $1 ]; then
		head -3 $perif
	else
		head -1 $perif
	fi
	echo "echo \"2 $2\" > $perif"
	echo "2 $2" > $perif
	if [ $pos2 -ne $2 ]; then
		head -3 $perif
	else
		head -1 $perif
	fi
	echo "echo \"3 $3\" > $perif"
	echo "3 $3" > $perif
	if [ $pos3 -ne $3 ]; then
		head -3 $perif
	else
		head -1 $perif
	fi
	echo "$pos3 / $3"
	pos1=$1
	pos2=$2
	pos3=$3
}
while true; do
	echo "Position: "
	read line
	case "$line" in
		"droit") # met le bras tout droit
		set_pos 180 180 180
		;;
		"accel") # met le bras en position pour l'accélérateur de particules
		set_pos 180 225 135
		;;
		"distributeur")
		set_pos 180 315 225
		;;
		"sol")
		set_pos 135 270 135
		;;
		"stockage")
		set_pos 225 180 225
		;;
		"stop")
		break;;
		*)
		echo "Position non reconnue: $line";;
	esac
done


echo "[=== FIN ===]"
