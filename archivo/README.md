## cat

El comando `cat` (abreviatura de _concatenate_) en Bash sirve Mostrar el contenido de archivos en la terminal

    cat archivo.txt

Concatenar varios archivos en uno solo

    cat archivo1.txt archivo2.txt > combinado.txt

Crear archivos nuevos desde la terminal

    cat > nuevo.txt

### Ejemplo de Caso de Uso

Muestra los usuarios que tienen `/bin/bash` como shell por defecto.

    cat /etc/passwd | grep bash | cut -d: -f1

## chmod

El comando `chmod` (_change mode_) se usa para **cambiar los permisos de acceso** a archivos o directorios en sistemas Unix/Linux.

Sirve para definir **quien puede leer, escribir o ejecutar** un archivo o directorio:

-   **r** (read): permiso de lectura.
    
-   **w** (write): permiso de escritura.
    
-   **x** (execute): permiso de ejecucion.

**Con notacion simbolica:**

    chmod u+x script.sh

**Con notacion numerica (octal):**

    chmod 755 programa

### Ejemplo de Caso de Uso

Dar permiso de ejecucion a un script solo al usuario

    chmod 100 script.sh

## cp

El comando `cp` en Linux sirve para **copiar archivos y directorios**.

    cp [opciones] origen destino

## gunzip

El comando `gunzip` sirve para **descomprimir archivos con extension `.gz`**, que fueron comprimidos previamente con `gzip`.

    gunzip archivo.gz

## head

El comando `head` sirve para **mostrar las primeras lineas de un archivo de texto**

    head [opciones] archivo

## ls

El comando `ls` sirve para **listar el contenido de un directorio** en sistemas Unix/Linux.

    ls [opciones] [ruta]

### Ejemplo de Caso de Uso

Mostrar archivos `.log` con informacion detallada en `/var/log`.

    ls -lh /var/log | grep ".log"

## mv

El comando `mv` en Linux sirve para **mover o renombrar archivos y directorios**.

    mv [opciones] origen destino

### Ejemplo de Caso de Uso

Mover todos los archivos `.log` a `/var/logs/`

    mv *.log /var/logs/

## rm

El comando `rm` en Linux sirve para **eliminar archivos y directorios** del sistema de archivos

    rm [opciones] archivo(s)

## tail

El comando `tail` en Linux sirve para **mostrar las ultimas lineas de un archivo de texto**.

    tail [opciones] archivo

## touch

El comando `touch` en Linux se utiliza para **crear archivos vacios** o **modificar las fechas de acceso y modificacion** de un archivo existente.

    touch [opciones] archivo

## stat

El comando `stat` en Linux proporciona informacion detallada sobre un archivo o directorio, incluyendo sus **atributos, tamaño, fechas de acceso/modificacion** y **permisos**

    stat [opciones] archivo

Ver detalles sobre un archivo:

    stat archivo.txt

**Salida tipica**:

      File: archivo.txt
      Size: 1234       Blocks: 8          IO Block: 4096   regular file
    Device: 802h/2050d  Inode: 12345678    Links: 1
    Access: 2023-05-01 10:30:00.000000000 +0000
    Modify: 2023-05-01 10:30:00.000000000 +0000
    Change: 2023-05-01 10:30:00.000000000 +0000
     Birth: -

### Informacion que proporciona `stat`:

-   **Tamaño del archivo**.
    
-   **Cantidad de bloques ocupados**.
    
-   **Permisos** (lectura, escritura, ejecucion).
    
-   **Fechas** (acceso, modificacion, cambio).
    
-   **Dispositivo e inode**.
    
-   **Numero de enlaces** al archivo.

