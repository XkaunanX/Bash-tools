#!/bin/bash

menu() {
    echo "Menu de opciones para el comando awk:"
    echo "1) Imprimir el contenido de una columna específica"
    echo "2) Imprimir las líneas que cumplen con un patrón"
    echo "3) Realizar una operación aritmética con columnas"
    echo "4) Imprimir una línea completa con un patrón específico"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el número de la columna: "
            read columna
            echo "Imprimiendo el contenido de la columna $columna:"
            awk "{print \$$columna}" "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patrón de búsqueda: "
            read patron
            echo "Imprimiendo las líneas que coinciden con el patrón '$patron':"
            awk "/$patron/" "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la operación aritmética con las columnas (por ejemplo, \$1+\$2): "
            read operacion
            echo "Realizando la operación aritmética '$operacion' en el archivo:"
            awk "{print $operacion}" "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patrón de búsqueda para la línea completa: "
            read patron
            echo "Imprimiendo las líneas completas que coinciden con el patrón '$patron':"
            awk "\$0 ~ /$patron/" "$archivo"
            ;;
        5)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
