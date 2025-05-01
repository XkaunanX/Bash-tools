#!/bin/bash

echo "1) 0%   - porcentaje de memoria virtual"
echo "2) 50%  - Porcentaje de memoria virtual"
echo "3) 100% - Porcentaje de memoria virtual"

read -r porcentaje

if [ $porcentaje -eq 1 ];
then
    sudo sysctl vm.swappiness=0
    echo "Swap 0%"
elif [ $porcentaje -eq 2 ];
then
    sudo sysctl vm.swappiness=50
    echo "Swap 50%"
elif [ $porcentaje -eq 3 ];
then
    sudo sysctl vm.swappiness=100
    echo "Swap 100%"
else
    echo "Entrada no valida"
fi