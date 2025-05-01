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
        -e 's/á/a/g' -e 's/é/e/g' -e 's/í/i/g' -e 's/ó/o/g' -e 's/ú/u/g' \
        -e 's/Á/A/g' -e 's/É/E/g' -e 's/Í/I/g' -e 's/Ó/O/g' -e 's/Ú/U/g' \
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
