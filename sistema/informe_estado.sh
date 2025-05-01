#!/bin/bash

echo "Usuarios conectados: $(who | wc -l)"

echo "Timepo encendido: $(uptime -p)"

echo "Promedio de carga en los ultimos 1, 5 y 15 minutos: $(uptime | awk '{print $2}')"