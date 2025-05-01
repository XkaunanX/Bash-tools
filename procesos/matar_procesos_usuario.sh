#!/bin/bash

# Termina todos los procesos del usuario pasado como parametro
pkill -u "$1"  # Mata todos los procesos de un usuario
echo "Todos los procesos de '$1' han sido terminados."
