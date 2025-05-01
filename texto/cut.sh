#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cut:"
    echo "1) Cortar una columna especifica de un archivo por delimitador"
    echo "2) Cortar caracteres especificos de una linea"
    echo "3) Cortar un rango de caracteres de una linea"
    echo "4) Cortar por delimitador y mostrar multiples columnas"
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
            echo -n "Ingrese el numero de columna: "
            read columna
            echo "Cortando la columna $columna del archivo '$archivo' por delimitador '$delimitador':"
            cut -d "$delimitador" -f "$columna" "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el numero de caracteres a cortar: "
            read caracteres
            echo "Cortando los primeros $caracteres caracteres de cada linea en el archivo '$archivo':"
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
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo
done
