#!/bin/bash

#Realice un script que reciba como parametro un directorio y guarde en un archivo 
#llamado permisos.txt los nombres de los archivos que tienen permiso de escritura
#para el grupo y fueron modificados en los ultimos 10 dias. Tener en cuenta los 
#subdirectorios.

if [ ! -d "$1" ]
then
	echo "<Parametro1> Debe se un directorio"
	exit
fi

find . -type f -perm /u=x -mtime -10 > permisos.txt
