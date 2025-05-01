#!/bin/bash
#Genere un archivo de nombre "PROC" con informacion de los procesos de cualquier
#usuario que pase por parametro. En caso de pasar mi propio usuario debe dejar
#en un archivo de nombre "Mis-Proc" el PID y nombre del proceso, con el siguiente
#formato:
#	PID Nombre Proceso
#En caso de no pasar parametro, solamente realizo los pasos 1 y 3
if [ -n "$1" ]; then
    ps -u $1 -eo pid,comm > "./directorio/PROC.txt"
else
    ps -u $USER -eo pid,comm > "./directorio/Mis-Proc.txt" # Importante
fi