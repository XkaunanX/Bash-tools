#!/bin/bash

if [ ! -f "$1" ]
then
    echo "Debe ingresar un archivo como parametro"
    exit
fi

#sed "2,4d" $1

read -p "ingresar el primer valor del rango: " num1
read -p "ingresar el segundo valor del rango: " num2

let rango=num2-num1

if [ $(wc -l $1 | cut -d" " -f1) -ge $rango ]
then
    sed "$num1,$num2 d" $1
fi