#!/bin/bash

echo "1) Directorio"
echo "2) Archivo"

read -p "Opcion: " k

con=0

case $k in
1)
	read -p "Directorio: " dir
	if [ -d $dir ]; then
		tam=$(( $(stat -c %s "$dir") / 1024))
		for item in "$dir"/*; do
			aux=$(($(stat -c %s "$item") / 1024))
			if [ $aux -lt $tam ]; then
				tam=$aux
			fi
			perm=$(stat -c "%a" "$item")
			if [ "$perm" -eq 644 ]; then
				con=$((con + 1))
			fi
		done
		echo "menor: $tam"
		echo "cantidad con: $con"
	else
		echo "Debe ser directorio"
	fi
;;
2)
	read -p "Archivo: " arc
	chmod 766 "$arc"
	cat "$arc" > "archivo_copiado"
	val=$(wc -l < "$arc")
	val=$((val - 5))
	lin=$(head -n "$val" "$arc")
	cat "$arc" > "$(basename $arc)-mod" 
	echo "$(cat archivo_copiado)"
	echo "$lin"
	path=$(basename "$arc")-mod
	echo "$(cat $path)"
;;
*)
	echo "incorrecto"
;;
esac