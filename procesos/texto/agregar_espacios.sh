#!/bin/bash

if [ ! -d $1 ]
then
    echo "<Paramtero 1> debe ser directorio"
    exit
fi

for item in $1/*
do
    if [ -f "$item" ]
    then
        sed "s/^/   /" $item    #INICIO
        sed "s/$/   /" $item    #FINAL
    fi
done