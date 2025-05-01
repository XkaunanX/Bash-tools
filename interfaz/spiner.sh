#!/bin/bash

# Mensaje de inicio
echo -n "Cargando... "

# Spinner
sp="/-\|"
while true
do
  for i in $(seq 0 3)
  do
    echo -n "${sp:$i:1}"
    sleep 0.2
    echo -n "\b"  # Retrocede un carácter
  done
done