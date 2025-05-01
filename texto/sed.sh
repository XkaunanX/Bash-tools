#!/bin/bash

menu() {
    echo "Menu de opciones para el comando sed:"
    echo "1) Reemplazar una cadena en un archivo"
    echo "2) Reemplazar una cadena en multiples archivos"
    echo "3) Eliminar lineas de un archivo que coincidan con un patron"
    echo "4) Insertar texto antes de una linea en un archivo"
    echo "5) Reemplazar y guardar el archivo original"
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
            echo -n "Ingrese la cadena a buscar: "
            read buscar
            echo -n "Ingrese la cadena de reemplazo: "
            read reemplazo
            echo "Reemplazando '$buscar' por '$reemplazo' en el archivo '$archivo':"
            sed "s/$buscar/$reemplazo/g" "$archivo"
            ;;
        2)
            echo -n "Ingrese la cadena a buscar: "
            read buscar
            echo -n "Ingrese la cadena de reemplazo: "
            read reemplazo
            echo -n "Ingrese los nombres de los archivos (separados por espacios): "
            read archivos
            echo "Reemplazando '$buscar' por '$reemplazo' en los archivos '$archivos':"
            sed -i "s/$buscar/$reemplazo/g" $archivos
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron para eliminar las lineas: "
            read patron
            echo "Eliminando las lineas que coincidan con el patron '$patron' en el archivo '$archivo':"
            sed "/$patron/d" "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la linea antes de la cual insertar el texto: "
            read linea
            echo -n "Ingrese el texto que desea insertar: "
            read texto
            echo "Insertando '$texto' antes de la linea $linea en el archivo '$archivo':"
            sed "$linea i $texto" "$archivo"
            ;;
        5)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la cadena a buscar: "
            read buscar
            echo -n "Ingrese la cadena de reemplazo: "
            read reemplazo
            echo "Reemplazando '$buscar' por '$reemplazo' y guardando en el archivo '$archivo':"
            sed -i "s/$buscar/$reemplazo/g" "$archivo"
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
