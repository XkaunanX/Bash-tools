#!/bin/bash

if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
    echo "Por favor, introduce un número entero válido."
    exit
fi