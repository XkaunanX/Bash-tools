#!/bin/bash

#Hacer un script al cual se le pase como parametro un nombre de usuarioy un
#numero que representa un tamaño en bytes. El script debe imprimir la cantidad
#de ficheros que hay dentro (recursivamente) del home del usaurio pasado como
#argumento, que tengan un tamaño en bytes mayor al numero pasado como 2do
#argumento.
#En caso de no encontrar ningun usuario en el sistema cuyo nombre sea exactamente
#igual al primer parametro, imprimir el mensaje de error "usuario no encontrado".

if id "$1" >/dev/null 2>&1  ;
then
	echo "existe"
else
	echo "no existe"
	exit
fi

a=$(find "/home/$1" -type f -size +"$2"c)
echo "$a"