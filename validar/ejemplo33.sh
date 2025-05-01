#!/bin/bash

if [ ! -f "$1" ]
then
    echo "El parametro $1 no es un fichero valido"
    exit
fi