#!/bin/bash

# Realize un script que termine todos los procesos de un usuario especifico que se esten ejecutando
# desde hace mas de 1 hora (60 minutos). Si el usuario no pasa un nombre de usuario,
# se ejecuta para el usuario actual.

# Verificar si se ha pasado un nombre de usuario como parametro
if [ -n "$1" ]; then
    usuario="$1"
else
    usuario="$USER"  # Si no se pasa un nombre de usuario, se usa el actual
fi

# Buscar todos los procesos de ese usuario que esten en ejecucion por mas de 1 hora
ps -u "$usuario" -eo pid,etime,comm --sort=etime | while read pid etime comm; do
    # Extraer las horas de ejecucion para compararlas
    if [[ "$etime" =~ ([0-9]+)-([0-9]+):([0-9]+) ]]; then
        # Si la ejecucion dura mas de 1 dia
        kill "$pid"
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por mas de 1 dia)."
    elif [[ "$etime" =~ ([0-9]+):([0-9]+) ]]; then
        # Si la ejecucion dura mas de 1 hora
        kill "$pid"
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por mas de 1 hora)."
    fi
done
