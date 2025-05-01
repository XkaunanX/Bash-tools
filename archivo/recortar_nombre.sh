#!/bin/bash

if [ ! -d "$1" ];then
	echo "Parametro 1 no es directorio"
	exit
fi

rec=0
prom=0

for it in "$1"/*
do
	if [ -f "$it" ] && [ "$(wc -l < $it)" -gt 10 ]; then
		rec=$((rec + 1))
		L="$(wc -l < $it)"
		prom=$((prom + L))
		echo "Nombre del archivo $(basename "$it")"
		nom="$(basename "$it")_recortado"
		touch "$nom"
		head "$it" >> "$nom"
	fi 
done

prom=$((prom / rec))

echo "rec: $rec"
echo "prom: $prom"