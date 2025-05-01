#!/bin/bash

menu() {
    echo "Menu de opciones para el comando export:"
    echo "1) Establecer una variable de entorno"
    echo "2) Ver las variables de entorno"
    echo "3) Eliminar una variable de entorno"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre de la variable: "
            read variable
            echo -n "Ingrese el valor para '$variable': "
            read valor
            export "$variable"="$valor"
            echo "La variable de entorno '$variable' ha sido establecida a '$valor'."
            ;;
        2)
            echo "Mostrando las variables de entorno actuales:"
            export
            ;;
        3)
            echo -n "Ingrese el nombre de la variable para eliminar: "
            read variable
            unset "$variable"
            echo "La variable de entorno '$variable' ha sido eliminada."
            ;;
        4)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo
done
