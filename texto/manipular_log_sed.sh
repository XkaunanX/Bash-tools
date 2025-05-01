#!/bin/bash

#Eliminar las lineas en blanco de un archivo
sed -i '/^$/d' "archivo.txt"

#Eliminar las 10 primeras lineas
sed -i '1,10d' "archivo.txt"

#Reemplazar todas las apariciones de una palabra en un archivo
sed -i 's/bash/sh/g' "archivo.txt"

#Reemplazar en una linea especifica
sed -i '2,5s/bash/sh/' "archivo.txt"

# Insertar "Nuevo texto" antes de la linea 3
sed -i '3i Nuevo texto' "archivo.txt"

# Conservar solo las lineas que contienen "INFO"
sed -i '/INFO/!d' archivo.txt

# Eliminar todas las lineas que contienen "ERROR"
sed -i '/ERROR/d' archivo.txt

# Reemplazar todo desde "inicio" hasta el final de la linea por "nuevo texto"
sed -i 's/inicio.*/nuevo texto/' archivo.txt