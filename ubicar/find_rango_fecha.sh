#!/bin/bash

#Realice un script que reciba como parametro un directorio y copie en una carpeta
#llamada bk los archivos de ese directorio que fueron modificados en el anio 2023.
#Tambien informar por pantalla la cantidad de archivos que fueron copiados

if [ ! -d $1 ]
then
	echo "<Parametro1> Debe ser un directorio"
	exit
fi

mkdir -p bk

for archivo in $(find . -type f -newermt 2024-1-1 ! -newermt 2025-1-1)
do
	cp $archivo ./bk/
done

find . -type f -newermt 2024-1-1 ! -newermt 2025-1-1 | wc -l
