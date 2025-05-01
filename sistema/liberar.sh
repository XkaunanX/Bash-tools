#!/bin/bash

vmstat > "mem-actual.txt"

echo "Selecciona el nivel de liberacion de memoria"
echo "0. No liberar nada"
echo "1. Liberar pagecache"
echo "2. Liberar inodos y dentries"
echo "3. Liberar pagechache, inodos y dentries"

read -p "Ingresar el nivel (0-3)" nivel

case $nivel in
    0)
        echo "No se liberara memoria."
        ;;
    1)
        echo "Liberando pagecache..."
        sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"
        ;;
    2)
        echo "Liberando inodos y dentries..."
        sudo sh -c "echo 2 > /proc/sys/vm/drop_caches"
        ;;
    3)
        echo "Liberando pagecache, inodos y dentries..."
        sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
        ;;
    *)
        echo "Opcion no valida. Saliendo."
        exit 1
        ;;
esac