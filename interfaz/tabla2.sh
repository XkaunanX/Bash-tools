#!/bin/bash

# Definir los colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m' # Para resetear el color

# Imprimir la tabla con bordes de línea continua y colores
echo -e "${BLUE}─────────────────────────────────────────────${RESET}"
echo -e "${BLUE}│ ${RED}Nombre${RESET}           │ ${GREEN}Edad${RESET}  │ ${YELLOW}Ciudad${RESET}      │${BLUE}"
echo -e "${BLUE}─────────────────────────────────────────────${RESET}"
echo -e "${RED}│ Juan               │  25   │ Madrid       │${RESET}"
echo -e "${RED}│ Maria              │  30   │ Barcelona    │${RESET}"
echo -e "${RED}│ Pedro              │  22   │ Valencia     │${RESET}"
echo -e "${BLUE}─────────────────────────────────────────────${RESET}"