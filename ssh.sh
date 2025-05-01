#!/bin/bash

menu() {
    echo "Menu de opciones para el comando ssh:"
    echo "1) Conectar a un servidor remoto"
    echo "2) Ejecutar un comando en un servidor remoto"
    echo "3) Copiar una clave SSH publica a un servidor remoto"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese la direccion del servidor remoto (usuario@host): "
            read servidor_remoto
            echo "Conectando a '$servidor_remoto'..."
            ssh $servidor_remoto
            ;;
        2)
            echo -n "Ingrese la direccion del servidor remoto (usuario@host): "
            read servidor_remoto
            echo -n "Ingrese el comando que desea ejecutar en el servidor remoto: "
            read comando
            echo "Ejecutando '$comando' en '$servidor_remoto'..."
            ssh $servidor_remoto "$comando"
            ;;
        3)
            echo -n "Ingrese la direccion del servidor remoto (usuario@host): "
            read servidor_remoto
            echo "Copiando clave SSH publica a '$servidor_remoto'..."
            ssh-copy-id $servidor_remoto
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
