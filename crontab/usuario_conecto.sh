#!/bin/bash

if [ -z "$1" ];
then
	echo "Uso: <Usuario>"
	exit
fi

mes=$(date +"%b")

if [ -n "$(last -F "$1" | grep -i $mes)" ];
then
	echo "$1 se conecto"
else
	echo "$1 no se conecto"
fi
 
# crontab -e

# minuto hora dia(mes) mes dia(semana)

# * * * * 1,4 /home/damip/conexion.sh damip