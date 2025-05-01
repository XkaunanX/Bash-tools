#!/bin/bash
#Script para procesar archivos eliminando líneas en 
#blanco y creando enlaces simbólicos para archivos .sh
if [ ! -d "$1" ];then
    echo "Uso: <directorio>"
    exit
fi
mkdir -p ./directorio/simbolico/
for file in $(find $1 -type f -name "*.sh" -perm -u=x); do
    sed -i '/^$/d' $file
done
find $1 -type f -name "*.sh" -perm -u=x -exec ln -s {} ./directorio/simbolico/ \;