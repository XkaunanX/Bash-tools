# Bash

Las primera linea que escribiras en un archivo de bash script es llamado `shebang`. Esta linea en cualquier script determina la habilidad del script para ser ejecutado como un ejecutable independiente sin tener que teclear sh, bash, python, php, etcetera en la termina.

```bash
#!/usr/bin/env bash
```

## Variables

Crear variables en bash es similar a otros lenguajes. No existen los tipos de datos. Una variable en bash puede contener un numero, un caracter, una cadena de caracteres, etc. No tienes que declarar una variable, solo asignarle un valor creara la variable.

Ejemplo:
```bash
str="hola mundo"
```
La linea anterior crea una variable `str` y asigna "hola mundo" a esta. El valor de la variable es obtenido añadiendo el `$` al inicio de la variable.

Ejemplo:
```bash
echo $str   # hola mundo
```
## Arreglos
Como en otros lenguajes, bash tambien tiene arreglos. Un arreglo es una variable que contiene multiples valores. No hay un limite maximo en el tamaño de un arreglo. Los arreglos en bash son base cero. El primer elemento es indexado con elemento 0.Hay varias maneras de crear arreglos en bash las cuales se muestran a continuacion.

Examples:
```bash
array[0]=val
array[1]=val
array[2]=val
array=([2]=val [0]=val [1]=val)
array=(val val val)
```
Para mostrar el valor especifico de un indice se utiliza la siguiente sintaxis:

```bash
${array[i]}     # donde i es el indice
```

Si no se proporciona un indice, se asume el elemento 0. Para encontrar cuandos valores hay en el arreglo utilice la siguiente sintaxis:

```bash
${#array[@]}
```

Bash tambien tiene soporte para condiciones ternarias. Revisa algunos de los siguientes ejemplos.
```bash
${varname:-word}    # if varname exists and isn't null, return its value; otherwise return word
${varname:=word}    # if varname exists and isn't null, return its value; otherwise set it word and then return its value
${varname:+word}    # if varname exists and isn't null, return word; otherwise return null
${varname:offset:length}    # performs substring expansion. It returns the substring of $varname starting at offset and up to length characters
```

## Substituir Cadenas

Revisa algunos ejemplos de sintaxis para como manipular cadenas

```bash
${variable#pattern}         # si el patron corresponde al inicio del valor la variable, elimina la parte mas corta que corresponda y regresa el resto 
${variable##pattern}        # si el patron corresponde a el inicio del valor de la variable, elimina la parte mas larga y regresa el resto 
${variable%pattern}         # si el patron corresponde a el final del valor de la variable, elimina la parte mas corta y regresa el resto 
${variable%%pattern}        # si el patron corresponde a el final del valor de la variable, elimina la parte mas larga y regresa el resto 
${variable/pattern/string}  # el patron mas largo que corresponda en la variable es reemplazado por string. Solo la primera coincidencia es reemplazada.
${variable//pattern/string} # el patron mas largo que corresponda en la variable es reemplazado por string. Todas las coincidencias son reemplazadas.
${#varname}     # regresa el largo del valor de la variable como un caracter de cadena 
```

## Funciones

Como en casi todos los lenguajes de prograrmacion, se pueden utilizar funciones para agrupar piezas de codigo de una manera mas logica o para practicar el divino arte de la recursion. Declarar una funcion solo consiste en escribir function mi_funcion { mi_codigo }. Llamar a la funcion es como llamar a cualquier otro programa, solo hay que escribir su nombre.

```bash
function nombre() {
    comandos de shell
}
```

Ejemplo:
```bash
#!/bin/bash
function hola {
   echo mundo!
}
hola

function say {
    echo $1
}
say "hola mundo!"
```

Cuando ejecutas el ejemplo anterior la funcion `hola` enviara como salida "mundo!". Las funciones anteriores `hola` y `say` son identicas. La principal diferencia es que la funcion `say`. Esta funcion, imprime el primer argumento que recibe. Argumentos dentro las funciones son tratados en la misma manera que los argumentos dinamicos que se dan al script.

## Condicionales

Las instrucciones condicionales en bash son similares a otros lenguajes de programacion. Las condiciones tienen muchas formas, como por ejemplo la forma mas basica es `if` expresion `then` instrucciones, donde instrucciones solo se ejecutan si la expresion es verdadera.

```bash
if [ expresion ]; then
    se ejecutara solo si la expresion es verdadera    
else
    se ejecutara solo si la expresion es falsa
fi
```
En ocasiones, si las condiciones se vuelven confusas, se pueden escribir las mismas utilizando `case statements`.

```bash
case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac
```

Ejemplos de expresiones:

```bash
statement1 && statement2  # ambas condiciones son verdaderas
statement1 || statement2  # por lo menos una de las condiciones son verdaderas

str1=str2       # str1 es igual a str2
str1!=str2      # str1 no es igual a str2
str1<str2       # str1 es menor que str2
str1>str2       # str1 es mayor que str2
-n str1         # str1 no es nulo (tiene una longitud mayor que 0)
-z str1         # str1 es nulo (tiene una longitud de 0)

-a file         # el archivo existe
-d file         # el archivo existe y es un directorio
-e file         # el archivo existe, mismo funcionamiento que -a
-f file         # el archivo existe y es un archivo normal (por ejemplo, no es un directorio o un tipo de archivo especial) 
-r file         # se tiene permiso de lectura
-s file         # el archivo existe y NO esta vacio
-w file         # se tiene permiso de escritura
-x file         # se tiene permisos para ejecutar el archivo o de busqueda si es un directorio
-N file         # el archivo fue modificado desde la ultima lectura
-O file         # eres el dueño del archivo
-G file         # el ID del grupo del archivo es igual que el de tu usuario (o en alguno de tus grupos si tienes varios)

file1 -nt file2     # file1 es mas nuevo que file2
file1 -ot file2     # file1 es mas viejo que file2

-lt     # menor que
-le     # menor o igual que
-eq     # igual
-ge     # mayor o igual que
-gt     # mayor que
-ne     # no es igual
```

## Ciclos

Hay tres tipos de ciclos en bash. `for`, `while` y `until`.


Diferentes sintaxis de `for` :
```bash
for x := 1 to 10 do
begin
  statements
end

for name [in list]
do
  statements that can use $name
done

for (( initialisation ; ending condition ; update ))
do
  statements...
done
```

Sintaxis de `while` :
```bash
while condition; do
  statements
done
```

Sintaxis de `until` :
```bash
until condition; do
  statements
done
```

## Variables de Entorno

Las variables de entorno son variables que contienen información sobre el entorno del sistema, como el sistema operativo, el nombre de usuario, el directorio de trabajo actual, etc. Pueden ser utilizadas por los procesos y scripts que se ejecutan en el sistema.

Para establecer o modificar una variable de entorno, se usa el comando `export`:

```bash
export VAR_NAME="valor"
```

Para ver el valor de una variable de entorno, se puede usar el comando `echo`:

```bash
echo $VAR_NAME
```

Algunas variables de entorno comunes incluyen:

    `HOME`: El directorio home del usuario.
    `PATH`: Una lista de directorios donde el sistema busca los ejecutables.
    `USER`: El nombre de usuario del usuario actual.
    `SHELL`: El tipo de shell que se está utilizando.

Ejemplo:

```bash
export MY_VAR="Hola Mundo"
echo $MY_VAR  # Muestra: Hola Mundo
```

## Parámetros Posicionales

Los parámetros posicionales son los valores que se pasan a un script o función cuando se invoca. Estos se asignan automáticamente cuando se ejecuta un script, y se accede a ellos con `$1, $2, ..., $n` donde `n` es el número del parámetro.

Ejemplo de uso de parámetros en un script:

```bash
#!/bin/bash
echo "El primer parámetro es: $1"
echo "El segundo parámetro es: $2"
```

Si ejecutas el script con:

./script.sh Hola Mundo

La salida será:

El primer parámetro es: Hola
El segundo parámetro es: Mundo

También puedes acceder a todos los parámetros posicionales con `$@` o `$*`:

```bash
echo "Todos los parámetros: $@"
```

El número total de parámetros pasados se puede ver con `$#`:

```bash
echo "Número de parámetros: $#"
```

En Bash, `$$` se usa para obtener el PID (Process ID) del proceso actual. Es decir, devuelve el número de identificación único del proceso que está ejecutando el script o comando. Esto puede ser útil para crear nombres de archivos temporales únicos, para el manejo de logs, o para diferenciar procesos en ejecución.

```bash
echo "El PID de este script es $$"
```
