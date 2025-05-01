#!/bin/bash

if [ ! -d "$1" ];
then
	echo "Debe ser directorio"
	exit
fi

touch perm.txt

find $1 -type f -mtime -2 -perm /g=x >> "perm.txt"