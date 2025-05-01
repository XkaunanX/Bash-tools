#!/bin/bash

# Realize un script que termine todos los procesos de todos los usuarios que pertenecen a un grupo
# especificado. Si el grupo no se pasa como parámetro, el script termina todos los procesos
# del grupo de usuarios "staff".

# Verificar si se pasó un grupo como parámetro
if [ -n "$1" ]; then
    grupo="$1"
else
    grupo="staff"  # Si no se pasa un grupo, se usa "staff" como grupo por defecto
fi

# Obtener todos los usuarios del grupo especificado
usuarios=$(getent group "$grupo" | cut -d: -f4)

# Iterar sobre cada usuario y matar todos sus procesos
for usuario in $usuarios; do
    echo "Terminando todos los procesos de '$usuario'..."
    pkill -u "$usuario"  # Terminar todos los procesos del usuario
done
