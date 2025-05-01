## whereis

El comando `whereis` en Linux se utiliza para localizar el **binario**, **codigo fuente** y **paginas de manual** de un comando o programa.

    whereis [comando]

### ejemplo de uso

    whereis ls

Salida:

    ls: /bin/ls /usr/share/man/man1/ls.1.gz

### Ejemplos de Casos de Usos

**Buscar archivos de manual de un comando**

    whereis -m ls

**Buscar el codigo fuente de un comando**:

    whereis -s gcc

## which 

El comando `which` en Linux se utiliza para **localizar la ruta completa** de un comando ejecutable en el sistema, buscando en los directorios listados en la variable de entorno `PATH`

    which [comando]

## find

El comando `find` en Linux se utiliza para **buscar archivos y directorios** dentro de un sistema de archivos, de acuerdo con una serie de criterios de busqueda.

    find [ruta] [criterios de busqueda] [acciones]

### Ejemplos de Caso de Uso

**Buscar un archivo por nombre**: Si deseas buscar un archivo con un nombre especifico dentro de un directorio (y sus subdirectorios), puedes usar:

    find /ruta/del/directorio -name "archivo.txt"

**Buscar archivos con un patron de nombre**: Para buscar todos los archivos con una extension especifica (por ejemplo, `.txt`):

    find . -name "*.txt"

**Buscar archivos por tipo**: Si deseas buscar solo archivos regulares (no directorios ni enlaces simbolicos):

    find /ruta/del/directorio -type f

**Buscar archivos por tamaño**: Para buscar archivos mayores a un cierto tamaño (por ejemplo, archivos mayores a 1GB):

    find /ruta/del/directorio -size +1G

**Buscar archivos por fecha de modificacion**: Para encontrar archivos modificados en los ultimos 7 dias:

    find /ruta/del/directorio -mtime -7

**Ejecutar un comando sobre los archivos encontrados**: Puedes usar `find` para realizar una accion sobre los archivos encontrados, como eliminar los archivos:

    find /ruta/del/directorio -name "*.log" -exec rm {} \;