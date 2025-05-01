#!/bin/bash
echo "Memoria RAM total: $(free | tail -2 | head -1 | awk '{print $2}') KB" > ./directorio/info-ram.txt
echo "Memoria libre: $(free | tail -2 | head -1 | awk '{print $4}') KB" >> ./directorio/info-ram.txt
echo "Memoria ocupada: $(free | tail -2 | head -1 | awk '{print $3}') KB" >> ./directorio/info-ram.txt
echo "Memoria disponible: $(free | tail -2 | head -1 | awk '{print $7}') KB" >> ./directorio/info-ram.txt
