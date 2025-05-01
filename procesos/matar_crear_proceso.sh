#!/bin/bash

# Crear un script que verifica si un proceso con un nombre especifico esta en ejecucion. 
# Si esta en ejecucion, lo termina; si no esta en ejecucion, lo inicia.

# Verificar si se paso un nombre de proceso como parametro
if [ -n "$1" ]; then
    proceso="$1"
else
    echo "Debe especificar el nombre de un proceso."
    exit 1
fi

# Buscar el PID del proceso
pid=$(pgrep -x "$proceso")

if [ -n "$pid" ]; then
    # Si el proceso esta en ejecucion, lo terminamos
    kill "$pid"
    echo "Proceso '$proceso' (PID $pid) terminado."
else
    # Si el proceso no esta en ejecucion, lo iniciamos
    echo "Proceso '$proceso' no encontrado. Iniciando..."
    "$proceso" &  # Inicia el proceso en segundo plano
    echo "Proceso '$proceso' iniciado."
fi
