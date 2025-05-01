#!/bin/bash

# Simulacion de carga con porcentaje
for i in {1..100}
do
  echo -ne "Cargando... $i%\r"  # \r regresa el cursor al inicio de la linea
  sleep 0.1
done
echo -e "\n¡Carga completada!"