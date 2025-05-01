#!/bin/bash

menu() {
    echo "Menu de opciones para el comando grep:"
    echo "1) Buscar un patrón en un archivo"
    echo "2) Buscar un patrón en múltiples archivos"
    echo "3) Buscar un patrón ignorando mayúsculas y minúsculas"
    echo "4) Buscar un patrón y mostrar el número de línea"
    echo "5) Buscar un patrón y mostrar las líneas que no coinciden"
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
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo "Buscando el patrón '$patron' en el archivo '$archivo':"
            grep "$patron" "$archivo"
            ;;
        2)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese los nombres de los archivos (separados por espacios): "
            read archivos
            echo "Buscando el patrón '$patron' en los archivos '$archivos':"
            grep "$patron" $archivos
            ;;
        3)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patrón '$patron' en el archivo '$archivo', ignorando mayúsculas y minúsculas:"
            grep -i "$patron" "$archivo"
            ;;
        4)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patrón '$patron' en el archivo '$archivo', mostrando el número de línea:"
            grep -n "$patron" "$archivo"
            ;;
        5)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patrón '$patron' en el archivo '$archivo' y mostrando las líneas que no coinciden:"
            grep -v "$patron" "$archivo"
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
