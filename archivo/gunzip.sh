#!/bin/bash

menu() {
    echo "Menu de opciones para el comando gunzip:"
    echo "1) Descomprimir un archivo .gz"
    echo "2) Descomprimir varios archivos .gz"
    echo "3) Ver el contenido de un archivo comprimido sin descomprimirlo"
    echo "4) Descomprimir con un nombre de archivo diferente"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo .gz a descomprimir: "
            read archivo
            echo "Descomprimiendo el archivo '$archivo':"
            gunzip "$archivo"
            ;;
        2)
            echo -n "Ingrese los archivos .gz a descomprimir (separados por espacio): "
            read archivos
            echo "Descomprimiendo los archivos '$archivos':"
            gunzip $archivos
            ;;
        3)
            echo -n "Ingrese el archivo .gz para ver su contenido: "
            read archivo
            echo "Mostrando el contenido del archivo '$archivo' sin descomprimirlo:"
            zcat "$archivo"
            ;;
        4)
            echo -n "Ingrese el archivo .gz a descomprimir: "
            read archivo
            echo -n "Ingrese el nuevo nombre para el archivo descomprimido: "
            read nuevo_nombre
            echo "Descomprimiendo '$archivo' y guardando como '$nuevo_nombre':"
            gunzip -c "$archivo" > "$nuevo_nombre"
            ;;
        5)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo
done
