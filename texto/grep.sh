#!/bin/bash

menu() {
    echo "Menu de opciones para el comando grep:"
    echo "1) Buscar un patron en un archivo"
    echo "2) Buscar un patron en multiples archivos"
    echo "3) Buscar un patron ignorando mayusculas y minusculas"
    echo "4) Buscar un patron y mostrar el numero de linea"
    echo "5) Buscar un patron y mostrar las lineas que no coinciden"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron que desea buscar: "
            read patron
            echo "Buscando el patron '$patron' en el archivo '$archivo':"
            grep "$patron" "$archivo"
            ;;
        2)
            echo -n "Ingrese el patron que desea buscar: "
            read patron
            echo -n "Ingrese los nombres de los archivos (separados por espacios): "
            read archivos
            echo "Buscando el patron '$patron' en los archivos '$archivos':"
            grep "$patron" $archivos
            ;;
        3)
            echo -n "Ingrese el patron que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patron '$patron' en el archivo '$archivo', ignorando mayusculas y minusculas:"
            grep -i "$patron" "$archivo"
            ;;
        4)
            echo -n "Ingrese el patron que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patron '$patron' en el archivo '$archivo', mostrando el numero de linea:"
            grep -n "$patron" "$archivo"
            ;;
        5)
            echo -n "Ingrese el patron que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patron '$patron' en el archivo '$archivo' y mostrando las lineas que no coinciden:"
            grep -v "$patron" "$archivo"
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo
done
