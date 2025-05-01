#!/bin/bash

# Verificar si se proporcionó un archivo como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe."
    exit 1
fi

# Contar las palabras más comunes en el archivo
echo "Contando las palabras más comunes en '$archivo':"
cat "$archivo" | tr -s ' ' '\n' | sort | uniq -c | sort -rn | head -10