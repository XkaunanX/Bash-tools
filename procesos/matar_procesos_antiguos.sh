#!/bin/bash

# Realize un script que termine todos los procesos de un usuario específico que se estén ejecutando
# desde hace más de 1 hora (60 minutos). Si el usuario no pasa un nombre de usuario,
# se ejecuta para el usuario actual.

# Verificar si se ha pasado un nombre de usuario como parámetro
if [ -n "$1" ]; then
    usuario="$1"
else
    usuario="$USER"  # Si no se pasa un nombre de usuario, se usa el actual
fi

# Buscar todos los procesos de ese usuario que estén en ejecución por más de 1 hora
ps -u "$usuario" -eo pid,etime,comm --sort=etime | while read pid etime comm; do
    # Extraer las horas de ejecución para compararlas
    if [[ "$etime" =~ ([0-9]+)-([0-9]+):([0-9]+) ]]; then
        # Si la ejecución dura más de 1 día
        kill "$pid"
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por más de 1 día)."
    elif [[ "$etime" =~ ([0-9]+):([0-9]+) ]]; then
        # Si la ejecución dura más de 1 hora
        kill "$pid"
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por más de 1 hora)."
    fi
done
