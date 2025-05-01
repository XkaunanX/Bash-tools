#!/bin/bash

menu() {
    echo "Menu de opciones para el comando awk:"
    echo "1) Imprimir el contenido de una columna especifica"
    echo "2) Imprimir las lineas que cumplen con un patron"
    echo "3) Realizar una operacion aritmetica con columnas"
    echo "4) Imprimir una linea completa con un patron especifico"
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
            echo -n "Ingrese el numero de la columna: "
            read columna
            echo "Imprimiendo el contenido de la columna $columna:"
            awk "{print \$$columna}" "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron de busqueda: "
            read patron
            echo "Imprimiendo las lineas que coinciden con el patron '$patron':"
            awk "/$patron/" "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la operacion aritmetica con las columnas (por ejemplo, \$1+\$2): "
            read operacion
            echo "Realizando la operacion aritmetica '$operacion' en el archivo:"
            awk "{print $operacion}" "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron de busqueda para la linea completa: "
            read patron
            echo "Imprimiendo las lineas completas que coinciden con el patron '$patron':"
            awk "\$0 ~ /$patron/" "$archivo"
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
