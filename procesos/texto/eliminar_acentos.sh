#!/bin/bash

# Verificar si se paso una ruta
if [ -z "$1" ]; then
    echo "Uso: $0 /ruta/a/la/carpeta"
    exit 1
fi

RAIZ="$1"

# Funcion para eliminar acentos
eliminar_acentos() {
    local archivo="$1"
    
    # Reemplazar acentos en el contenido (inplace)
    sed -i \
        -e 's/a/a/g' -e 's/e/e/g' -e 's/i/i/g' -e 's/o/o/g' -e 's/u/u/g' \
        -e 's/A/A/g' -e 's/E/E/g' -e 's/I/I/g' -e 's/O/O/g' -e 's/U/U/g' \
        "$archivo"
}

# Recorremos todos los archivos de forma recursiva
find "$RAIZ" -type f | while read -r archivo; do
    # Solo archivos de texto legibles por el usuario
    if file "$archivo" | grep -qE 'text'; then
        eliminar_acentos "$archivo"
        echo "Acentos eliminados en: $archivo"
    fi
done
