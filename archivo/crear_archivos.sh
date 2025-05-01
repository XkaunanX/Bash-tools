#!/bin/bash

#Hacer un script que lea por parametro el archivo de usuarios del servidor
#y realice lo siguiente:

#1) Chequear adentro del script que se pase el archivo correcto y el pasaje
#de parametro.

#2) Genere un archivo de nombre "usu1" con los usuarios que comiencen con "sol"
#y guarde en el mismo el nombre de usuario y el shell correspondiente, en la
#ultima linea del archivo guardar el total de usuarios de este punto.

#3) Genere un archivo de nombre "usu2" con los usuarios que comiencen con so2 y
#guarde en el mismo el nombre de usuario y el UiD correspondiente, en la ultima
#linea del archivo guardar el total de usuarios de este punto.

#4) Genere un archivo de nombre "usu3" con los usuarios que comiencen con so3
#y guarde en el mismo el nombre de usuario y el GiD correspondiente, en la
#ultima linea del archivo guardar el total de usuarios de este punto.

#5) Genere un archivo de nombre "usu4" con los usuarios que comiencen con so4 
#y guarde en el mismo el nombre de usuario y el home correspondiente, en la
#ultima linea del archivo guardar el total de usuarios.

#6) Contabilizar el total de usuarios de todas las categorias y guardar en un
#archivo de nombre "total general" con la informacion Total general de usuarios
#leidos = xx

if [ "$(realpath $1)" != "/etc/passwd" ];
then
	echo "No es el archivo de usuarios"
	exit
fi

aux=0

user=$(grep "sol" "$1" | cut -d':' -f 1,7)

echo "$user" > "usu1.txt"

tot=$(wc -l < "usu1.txt")

aux=$((aux + tot))

echo "$tot" >> "usu1.txt"

user=$(grep "^so2" "$1" | cut -d':' -f 1,3)

echo "$user" > "usu2.txt"

tot=$(wc -l < "usu2.txt")

aux=$((aux + tot))

echo "$tot" >> "usu2.txt"

user=$(grep "^so3" "$1" | cut -d':' -f 1,4)

echo "$user" > "usu3.txt"

tot=$(wc -l < "usu3.txt")

aux=$((aux + tot))

echo "$tot" > "usu3.txt"

user=$(grep "^so4" "$1" | cut -d':' -f 1,6)

echo "$user" >> "usu4.txt"

tot=$(wc -l < "usu4.txt")

aux=$((aux + tot))

echo "$tot" >> "usu4.txt"

echo "Leido: $aux" >> "Total_general.txt"

echo "finalizado"