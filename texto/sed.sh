#!/bin/bash

menu() {
    echo "Menu de opciones para el comando sed:"
    echo "1) Reemplazar una cadena en un archivo"
    echo "2) Reemplazar una cadena en múltiples archivos"
    echo "3) Eliminar líneas de un archivo que coincidan con un patrón"
    echo "4) Insertar texto antes de una línea en un archivo"
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
            echo -n "Ingrese el patrón para eliminar las líneas: "
            read patron
            echo "Eliminando las líneas que coincidan con el patrón '$patron' en el archivo '$archivo':"
            sed "/$patron/d" "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la línea antes de la cual insertar el texto: "
            read linea
            echo -n "Ingrese el texto que desea insertar: "
            read texto
            echo "Insertando '$texto' antes de la línea $linea en el archivo '$archivo':"
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
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
