#!/bin/bash
#2. Realice un script donde se le pase como pametro un directorio y recorra todos los archivos .sh que hayan sido modificados
#hace menos de un mes, con permisos 755 los guarde en una carpeta con nombre "encontrados", y crear un link a dicha carpeta en el directorio actual.
if [ ! -d $1 ]; then
    echo "Uso: <directorio>"
    exit
fi
mkdir ./directorio/encontrados/
for file in $(find $1 -type f -name "*.sh" -mtime -30 -perm 755);do
    cp $file ./directorio/encontrados/
done
ln -sf ./directorio/encontrados/ ./directorio/enlace_encontrados