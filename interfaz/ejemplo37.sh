#!/bin/bash

# Definir el nombre del archivo de salida
archivo="info_sistema.txt"

# Obtener la informacion y guardarla en el archivo
{
    echo "Arquitectura del procesador: $(uname -m)"
    echo "Nombre de la maquina: $(uname -n)"
    echo "Sistema operativo: $(uname -o)"
    echo "Version del kernel: $(uname -r)"
} > "$archivo"

# Confirmar que el archivo ha sido creado
echo "La informacion del sistema se ha guardado en $archivo."
