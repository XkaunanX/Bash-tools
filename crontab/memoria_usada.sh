#!/bin/bash
# 1)Crear un script que guarde en un archivo cada 23 minutos la memoria usada
# y la memoria libre.
echo "Usado: $(free -m | tail -n +2 | head -1 | awk '{print $3}')" >> "./directorio/informe.txt" # Importante
echo "Libre: $(free -m | tail -n +2 | head -1 | awk '{print $4}')" >> "./directorio/informe.txt"
# Crontab
# minuto hora dia(mes) mes dia(semana)
# /23 * * * * /pathAbsoluto/