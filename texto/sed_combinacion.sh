#!/bin/bash

#1) Hacer un script que modifique las palabras "bash" por "sh" que se encuentren en la 3ra linea de los archi
#vos .sh de un directorio pasado por parametro.

# Sintaxis sed: sed -i 'fila s/inicial/final'

for file in $(find -type f -name "*.sh");do
    sed -i '3s/bash/sh/' "$file"            # Importante 
done