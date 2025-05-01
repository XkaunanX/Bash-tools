#!/bin/bash

#Realizar un script que reciba dos archivos por parametro, y que muestre por
#pantalla el nombre del archivo de mayor tamaño y su nombre. Y sin son iguales
#mostrar el mensaje "son iguales".

echo "Inicio programa"

if [ ! -f "$1" ] && [ ! -f "$2" ]
then

	echo "<Parametro 1> <Parametro 2> deben ser archivos regulares"
	exit
fi

tam1=$(stat "$1" | grep "Tamaño" | awk {'print $2'})
tam2=$(stat "$2" | grep "Tamaño" | awk {'print $2'})

if test $tam1 -lt $tam2
then
	echo "$1 es mayor: $tam1"
elif test "$tam1" -eq "$tam2"
then
	echo "son iguales"
else
	echo "$2 es mayor: $tam2"
fi

echo "finalizando programa"