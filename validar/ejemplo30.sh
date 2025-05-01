#!/bin/bash

if [ ! -x "$1" ]
then
    echo "No tienes permiso para ejecutar el script"
    exit
fi