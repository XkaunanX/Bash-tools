#!/bin/bash

# LIMPIAR PANTALLA
clear

# MOSTRAR INFORMACION DEL USO EN DISCO
echo "Informacion del uso en disco"
echo ""

# EJECUTAR COMANDO df
df -h
echo ""

# BUSCAR EN LA SALIDA DEL COMANDO ANTERIOR EL ESPACIO DISPONIBLE EN EL SISTEMA DE ARCHIVOS RAIZ
espacio_disponible=$(df -h | grep -w "/" | awk '{print $4}')

# MOSTRAR UN MENSAJE CON EL ESPACIO DISPONIBLE
echo "El espacio disponible en el sistema de archivos raiz es: $espacio_disponible"
echo ""

read -rp "Presione cualquier tecla para continuar..."