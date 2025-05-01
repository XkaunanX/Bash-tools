#!/bin/bash

# Barra de progreso simulada
echo -n "Cargando: ["
for i in {1..50}
do
  echo -n "#"
  sleep 0.1  # Pausa corta para simular progreso
done
echo "] Hecho!"