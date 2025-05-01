#!/bin/bash
#2° Desarrolle un script en bash que tenga 3 opciones:
#a) Compilar: en esta opcion se compilara el programa desarrollado en en punto 1°
#b) Ejecutar programa: en esta opcion se ejecutara el programa y se dejara el texto resultante en un archivo llamado "archivo_resultante.txt"
#c) Empaquetar y comprimir: en esta opcion se empaquetara y comprimira el archivo 
#"archivo_resultante.txt" proveniente del punto 2°b, el arhivo resultante de este punto se llamara "comprimido
#_${fecha}.tar.gz, donde la fecha tendra desde el ano hasta los segundos, por ejemplo comprimido_2021-12-03-11-30-25.tar.gz
echo "a. Compilar"
echo "b. Ejecutar"
echo "c. Empaquetar y comprimir"
read -p "ingrese un caracter: " input
case $input in
    a)
        echo "compilando..."
        gcc parcial6_1.c -o parcial6_1
    ;;
    b)
        echo "ejecutando..."
        echo "$(./ejemplo46.sh)" > ./directorio/archivo_resultante.txt
    ;;
    c)
        echo "empaquetando y comprimiendo..."
        tar -czf "comprimido_$(date +%Y_%m_%e_%H_%M_%S).tar.gz" ./directorio/archivo_resultante.txt
    ;;
    *)
        echo "error"
        exit
    ;;
esac