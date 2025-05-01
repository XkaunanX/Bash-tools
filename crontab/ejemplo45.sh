#!/bin/bash

#2° Desarrolle un script en bash que tenga 3 opciones:
#a) Compilar: en esta opcion se compilara el programa desarrollado en en punto 1°
#b) Ejecutar programa: en esta opcion se ejecutara el programa y se dejara el texto 
#resultante en un archivo llamado "archivo_resultante.txt"
#c) Tarea programada: en este punto se debe guardar en un archivo llamado "resultado.cron" la linea 
#para que la tarea del punto 2°b se ejecute los lunes y los jueves del mes de agosto a las 23:59hs

echo "a) compilar"
echo "b) ejecutar"
echo "c) tarea programdada"

read -p "Ingrese un caracter: " input

case $input in
    a)
        echo "compilando..."
        gcc parcial5_1.c -o parcial5_1
    ;;
    b)
        echo "ejecutando..."
        echo "$(./ejemplo45.sh)" > ./directorio/archivo_resultante.txt
    ;;
    c)
        echo "59 23 * 8 1,4 $(pwd)/parcial5_1 > $(pwd)/directorio/archivo_resultante.txt" > ./directorio/resultado.cron # Importante
    ;;
    *)
        echo "error"
        exit
    ;;
esac