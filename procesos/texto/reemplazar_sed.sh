#!/bin/bash

#Realice un script que reciba un archivo y si este tiene más de 4 lineas
#le modifique todas las coincidencias de la palabra bash por Linux en las
#lineas de la 1 a la 4.

if [ ! -f "$1" ];
then
	echo "Debe ser archivo"
	exit
fi

lin=$(wc -l < $1)

if [ $lin -gt 4 ];
then
	sed -i '1,4 s/bash/Linux/g' "$1"
fi