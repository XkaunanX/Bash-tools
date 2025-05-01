#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <filtro>"
    echo "Filtros disponibles: emerg, alert, crit, err, warn, notice, info, debug"
    exit 1
fi

# Asignar el parametro a una variable
filtro=$1

# Verificar si el filtro es valido
case $filtro in
    emerg|alert|crit|err|warn|notice|info|debug)
        ;;
    *)
        echo "Filtro no valido. Use uno de los siguientes: emerg, alert, crit, err, warn, notice, info, debug"
        exit 1
        ;;
esac

sudo dmesg | grep -i "$filtro"