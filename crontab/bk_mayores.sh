#!/bin/bash
# 2)Realizar en bash un script que busque en una carpeta pasada por parametro todos los
# archivos .mp4 que tengan un tamanio mayor a 5 Mb,
# y los comprima en un .tar.gz que tenga en su nombre la fecha separada por_
# por ejemplo bkp_2023_11_29.tar.gz
# Correr este script todos los domingos a las 5 de la maniana.
if [ -z $1 ]; then
    echo "Uso: <directorio>"
    exit
fi
mkdir -p "./directorio/bkp/"
for file in $(find $1 -type f -name "*.mp4" -size +5M); do # Importante
    cp $file "./directorio/bkp/"
done
tar -czf "./directorio/bkp_$(date +%Y_%m_%d).tar.gz" "./directorio/bkp/" # Importante
# Crontab
# minuto hora dia(Mes) Mes dia(semana)
#  * 5 * * 0 /pathAbsoluto