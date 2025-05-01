#!/bin/bash

#5) Hacer un scripts que informe:
#a) Los procesos esperando por CPU
#b) El numero de procesos en estado dormido
#c) Si dichos proceso estan usando memoria swap
#d) La cantidad de memoria intercambiada desde el disco
#e) La cantidad de memoria intercambiada hacia el disco

echo "Procesos esperando por la CPU: $(vmstat | head -1 | awk '{print $1}')"

echo "Procesos Blockeados: $(vmstat | head -1 | awk '{print $2}')"

echo "Porcentaje de uso de memoria swap: $(vmstat | head -1 | awk '{print $3}')"

echo "Porcentaje de memoria intercambiada desde el disco: $(vmstat | head -1 | awk '{print $6}')"

echo "Porcentaje de uso de memoria intercambiada hacia el disco: $(vmstat | head -1 | awk '{print $6}')"