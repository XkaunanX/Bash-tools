#!/bin/bash

# Mensaje de inicio
echo -n "Cargando"
for i in {1..5}
do
  echo -n "."
  sleep 1  # Pausa de 1 segundo entre los puntos
done

echo " Listo!"  # Mensaje final