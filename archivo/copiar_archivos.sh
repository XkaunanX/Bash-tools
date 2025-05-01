#!/bin/bash

#Realizar un script que reciba un directorio como parametro copie a un
#directorio llamado nuevo todos los archivos que contengan en su interior la
#palabra bash.

echo "Inicio"

if [ ! -d "$1" ]
then
	echo "<Parametro1> debe ser directorio"
	exit
fi

mkdir -p nuevo

for archivo in $(grep -lr "Nombre" "$1")
do
	cp -f "$archivo" "./nuevo"
done