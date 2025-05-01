#!/bin/bash

# Inicializar variables
sumatoria=0
contador=0

# Verificar si se paso una direccion IP como parametro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <direccion_IP>"
    exit 1
fi

# Realizar el ping y capturar los resultados
resultado=$(ping -c 4 "$1")

# Comprobar si hubo error en el ping
if echo "$resultado" | grep -q "unreachable"; then
    echo "No hay conectividad con $1"
    exit 1
fi

# Extraer los tiempos de round-trip
tiempos=$(echo "$resultado" | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')

# Calcular el minimo
minimo=$(echo "$tiempos" | sort -n | head -n 1)

# Procesar los tiempos para sumarlos y contar
for tiempo in $tiempos; do
    sumatoria=$(echo "$sumatoria + $tiempo" | bc)
    ((contador++))
done

# Calcular el promedio
if [ $contador -ne 0 ]; then
    promedio=$(echo "$sumatoria / $contador" | bc -l)
else
    promedio=0
fi

# Calcular el maximo
maximo=$(echo "$tiempos" | sort -n | tail -n 1)

# Mostrar el informe
echo "Informe de conectividad para $1:"
echo "Conectividad: Existe"
echo "Tiempo de round-trip:"
echo "Minimo: $minimo ms"
echo "Promedio: $promedio ms"
echo "Maximo: $maximo ms"