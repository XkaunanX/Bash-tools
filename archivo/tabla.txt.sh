#!/bin/bash

#Hacer un script que me permita generar en forma aleatoria las tablas de
#multiplicar para cualquier numero entero, sin necesidad de cortar la
#ejecucion del script, me deberia solicitar por cada tabla realizada si quiero
#seguir con la generacion de otra tabla, caso contrario se corta la generacion
#y termina el script. La cantidad de iteraciones a multiplicar la paso por
#parametro y sera la misma para todas las tablas que desee generar.
#Cada tabla generada debe ser guardada en un archivo con nombres distintos,
#ejemplo el nombre de la tabla del 2 sera "tabla2", la del 5 "tabla5" y asi
#sucesivamente.
#El formato y contenido del archivo de salida debe ser asi:
#
#Tabla del 2
#
#2 x 0   = 0
#2 x 1   = 2
#2 x 2   = 4
#2 x 3   = 6
#2 x 4   = 8
#2 x 5   = 10
#2 x 6   = 12
#2 x 7   = 14
#2 x 8   = 16
#2 x 9   = 18
#2 x 10  = 20
#2 x 11  = 22
#2 x 12  = 24
#------------
#------------
#etc

if [[ ! $1 =~ ^[0-9]+$ ]];
then
	echo "Debe ser numerico"
	exit
fi

num=$(( RANDOM % 100 + 1))

echo "$num" 

for (( i=1; i<=$1; i++ ));
do
	op=$((num*i))
	echo "$num x $i = $op"
	echo "$num x $i = $op" >> "tabla$num.txt"
done

read -p "Desea seguir generando multiplos: " k

if [ "$k"  == "S" ];
then
	./parcial7.sh "$1"
else
	exit
fi