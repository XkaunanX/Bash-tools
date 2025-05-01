#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cut:"
    echo "1) Cortar una columna específica de un archivo por delimitador"
    echo "2) Cortar caracteres específicos de una línea"
    echo "3) Cortar un rango de caracteres de una línea"
    echo "4) Cortar por delimitador y mostrar múltiples columnas"
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
            echo -n "Ingrese el delimitador (por ejemplo, ',' o '\t'): "
            read delimitador
            echo -n "Ingrese el número de columna: "
            read columna
            echo "Cortando la columna $columna del archivo '$archivo' por delimitador '$delimitador':"
            cut -d "$delimitador" -f "$columna" "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el número de caracteres a cortar: "
            read caracteres
            echo "Cortando los primeros $caracteres caracteres de cada línea en el archivo '$archivo':"
            cut -c 1-"$caracteres" "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el rango de caracteres a cortar (por ejemplo, 1-5): "
            read rango
            echo "Cortando los caracteres del rango '$rango' en el archivo '$archivo':"
            cut -c "$rango" "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el delimitador (por ejemplo, ',' o '\t'): "
            read delimitador
            echo -n "Ingrese las columnas a mostrar (por ejemplo, 1,2,3): "
            read columnas
            echo "Cortando las columnas '$columnas' del archivo '$archivo' por delimitador '$delimitador':"
            cut -d "$delimitador" -f "$columnas" "$archivo"
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
