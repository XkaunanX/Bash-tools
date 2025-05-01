#!/bin/bash

if ! command -v ifconfig &> /dev/null; then
    echo "El comando ifconfig no esta disponible. Asegurate de tener el paquete net-tools instalado."
    exit
fi

# Extraer la direccion fisica, IP y mascara de subred
echo "$(ifconfig | grep -i 'ether' | awk '{print $2}')"
echo "$(ifconfig | grep 'inet ' | awk '{print $2}')"
echo "$(ifconfig | grep 'inet ' | awk '{print $4}')"