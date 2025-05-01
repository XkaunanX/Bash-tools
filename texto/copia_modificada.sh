#!/bin/bash

if [ "$(realpath $1)" != "/home/damip/Escritorio/Bash" ]
then
    echo "Debe ingresar la carpeta tp2 como parametros"
    exit
fi

mkdir -p scripts-sh

for item in $1/*
do
    if [ -f "$item" ]
    then
        sed "s/bash/sh/g" $item > scrips-sh/$(basename $item .sh)-mod.sh
    fi
done

sed "1s/bash/sh/g" $item > scrips-sh/$(basename $item .sh)-mod.sh
sed "1,3s/bash/sh/g" $item > scrips-sh/$(basename $item .sh)-mod.sh