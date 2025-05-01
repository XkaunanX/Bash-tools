#!/bin/bash

# Crear un script que verifica si un proceso con un nombre específico está en ejecución. 
# Si está en ejecución, lo termina; si no está en ejecución, lo inicia.

# Verificar si se pasó un nombre de proceso como parámetro
if [ -n "$1" ]; then
    proceso="$1"
else
    echo "Debe especificar el nombre de un proceso."
    exit 1
fi

# Buscar el PID del proceso
pid=$(pgrep -x "$proceso")

if [ -n "$pid" ]; then
    # Si el proceso está en ejecución, lo terminamos
    kill "$pid"
    echo "Proceso '$proceso' (PID $pid) terminado."
else
    # Si el proceso no está en ejecución, lo iniciamos
    echo "Proceso '$proceso' no encontrado. Iniciando..."
    "$proceso" &  # Inicia el proceso en segundo plano
    echo "Proceso '$proceso' iniciado."
fi
