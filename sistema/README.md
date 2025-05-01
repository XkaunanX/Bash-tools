## df

El comando `df` (disk free) en Linux se utiliza para **mostrar la cantidad de espacio libre y utilizado** en los sistemas de archivos montados.

    df [opciones] [archivo...]

Ver el espacio de disco de todos los sistemas de archivos:

    df

Muestra la cantidad de espacio usado y disponible para todos los sistemas de archivos montados en el sistema.

    Filesystem     1K-blocks    Used Available Use% Mounted on
    /dev/sda1       10240000 5120000  5120000  50% /
    /dev/sdb1       20480000  1024000  19456000   5% /mnt/data

## du

El comando `du` (Disk Usage) se utiliza en sistemas basados en Unix para estimar y mostrar el espacio en disco utilizado por archivos y directorios.

    du [opciones] [archivo o directorio]

### Opciones comunes:

-   `-h` : Muestra el tamaño en un formato legible para los humanos (por ejemplo, KB, MB, GB).
    
-   `-s` : Muestra solo el total del directorio sin mostrar subdirectorios.
    
-   `-a` : Muestra el tamaño de todos los archivos, no solo de los directorios.
    
-   `--max-depth=N` : Muestra solo hasta una cierta profundidad de subdirectorios. Por ejemplo, `--max-depth=1` solo mostrara el tamaño de los subdirectorios de primer nivel.

## date

El comando `date` en sistemas basados en Unix (como Linux) se utiliza para mostrar o establecer la fecha y hora del sistema.

**Mostrar la fecha y hora en formato personalizado**:

    date "+%Y-%m-%d %H:%M:%S"

### Ejemplo de Caso de Uso

Para generar un archivo de registro con la fecha y hora exacta de su creacion. Puedes usar `date` con un formato personalizado para incluir la fecha y hora en el nombre del archivo.

    logfile="logfile_$(date '+%Y-%m-%d_%H-%M-%S').txt"
    touch "$logfile"

Crea un archivo de registro con un nombre que incluye la fecha y la hora exactas en que se creo. Esto es util para mantener registros ordenados y evitar sobrescribir archivos antiguos.

## dig

El comando `dig` (Domain Information Groper) se utiliza en sistemas basados en Unix (como Linux) para realizar consultas de DNS (Domain Name System). Permite obtener informacion sobre registros DNS de un dominio, como direcciones IP, registros MX (para correos electronicos), registros de texto (TXT), registros de nombre de servidor (NS), entre otros.

    dig [opciones] [dominio] [tipo_de_registro]
    
**Consultar registros de tipo MX (Mail Exchanger)**:

    dig example.com MX

**Salida esperada**:

    ; <<>> DiG 9.16.1-Ubuntu <<>> example.com MX
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 12345
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1
    ;; QUESTION SECTION:
    ;example.com.                   IN      MX
    ;; ANSWER SECTION:
    example.com.            3600    IN      MX      10 mail.example.com.
    ;; AUTHORITY SECTION:
    example.com.            3600    IN      NS      a.iana-servers.net.
    ;; ADDITIONAL SECTION:
    a.iana-servers.net.     3600    IN      A       199.43.135.53

## last

El comando `last` en Linux y otros sistemas Unix se utiliza para mostrar un registro de los ultimos inicios de sesion en el sistema, es decir, muestra un historial de los usuarios que han iniciado sesion, la duracion de su sesion y otra informacion relacionada.

    last [opciones] [usuario]

**Salida esperada**:

    username tty1         :0               Wed May  1 08:40   still logged in
    username pts/1        :0               Wed May  1 09:00   gone - no logout
    username tty2         :0               Wed May  1 09:15   gone - no logout

## ping

El comando `ping` en sistemas Linux, Unix y Windows se utiliza para verificar la conectividad entre tu maquina y otra maquina (generalmente un servidor o una direccion IP) en una red. El comando envia paquetes de datos a la direccion IP especificada y espera una respuesta. Si la maquina de destino responde, el comando proporciona informacion sobre el tiempo que tardo en recibir la respuesta.

    ping [opciones] <direccion>

**Verificar la conectividad con un host (por ejemplo, google.com):**

    PING google.com (142.250.183.14) 56(84) bytes of data.
    64 bytes from 142.250.183.14: icmp_seq=1 ttl=118 time=14.7 ms
    64 bytes from 142.250.183.14: icmp_seq=2 ttl=118 time=14.9 ms
    64 bytes from 142.250.183.14: icmp_seq=3 ttl=118 time=15.1 ms

## whoami

El comando `whoami` en sistemas Linux y Unix se utiliza para mostrar el nombre de usuario con el que estas actualmente autenticado en el sistema.

### ¿Por que es util?

El comando `whoami` es util para saber rapidamente bajo que usuario estas trabajando, especialmente si tienes permisos de usuario y de superusuario (root) o si estas operando en un entorno con multiples cuentas de usuario. Puede ser util cuando trabajas en scripts o administras servidores y necesitas confirmar el usuario que esta ejecutando un proceso.

## w

El comando `w` en sistemas Linux y Unix muestra informacion sobre los usuarios actualmente conectados al sistema, asi como sus actividades y la informacion del sistema.

     18:00:01 up 2 days,  3:15,  3 users,  load average: 0.12, 0.09, 0.08
    USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
    usuario1 tty7     :0               14:30    2:45m  0.05s  0.00s /usr/lib/xorg/Xorg
    usuario2 pts/0    :0               16:00    1.00s  0.12s  0.02s w
    usuario3 pts/1    :0               17:45    0.00s  0.02s  0.00s w

-   **Primera linea:**
    
    -   Muestra la hora actual del sistema, el tiempo que ha estado en funcionamiento (up), el numero de usuarios conectados y el promedio de carga del sistema en los ultimos 1, 5 y 15 minutos.
        
-   **Segunda linea en adelante (usuarios conectados):**
    
    -   **USER**: Nombre del usuario.
        
    -   **TTY**: Terminal o consola donde el usuario esta conectado.
        
    -   **FROM**: Direccion de origen desde donde el usuario esta conectado (por ejemplo, `:0` significa que esta en la consola local).
        
    -   **LOGIN@**: Hora a la que el usuario inicio sesion.
        
    -   **IDLE**: Tiempo que el usuario ha estado inactivo.
        
    -   **JCPU**: Tiempo total de CPU utilizado por los procesos del terminal.
        
    -   **PCPU**: Tiempo de CPU utilizado por el proceso actual.
        
    -   **WHAT**: El comando o proceso que el usuario esta ejecutando.

## uptime

El comando `uptime` muestra el tiempo que ha estado en funcionamiento el sistema, asi como el numero de usuarios conectados y la carga promedio del sistema.

     18:15:20 up 3 days,  4:30,  3 users,  load average: 0.05, 0.10, 0.08
### Explicacion de la salida:

-   **Hora actual:** `18:15:20` — La hora exacta del sistema.
    
-   **Tiempo de actividad del sistema:** `up 3 days, 4:30` — El sistema ha estado en funcionamiento durante 3 dias y 4 horas con 30 minutos.
    
-   **Numero de usuarios conectados:** `3 users` — Tres usuarios estan actualmente conectados al sistema.
    
-   **Carga promedio del sistema:** `load average: 0.05, 0.10, 0.08` — Los tres numeros representan la carga promedio del sistema durante los ultimos 1, 5 y 15 minutos, respectivamente. La carga promedio mide el numero de procesos que estan en espera de ser ejecutados por el CPU.
    

### ¿Que significa la carga promedio?

-   Si los numeros de carga promedio son menores que el numero de CPUs disponibles en el sistema, el sistema esta funcionando bien.
    
-   Si la carga promedio es mayor que el numero de CPUs, podria ser una señal de que el sistema esta sobrecargado y los procesos estan esperando mas tiempo para ejecutarse.

## uname

El comando `uname` se utiliza para mostrar informacion sobre el sistema operativo y la arquitectura de la maquina en la que se esta ejecutando.

    uname

### Opciones comunes de `uname`:

-   **`-s`**: Muestra el nombre del kernel (sistema operativo).
    
-   **`-n`**: Muestra el nombre del nodo de la red (hostname).
    
-   **`-r`**: Muestra la version del kernel.
    
-   **`-v`**: Muestra la informacion de la version del kernel.
    
-   **`-m`**: Muestra la arquitectura de la maquina (por ejemplo, x86_64).
    
-   **`-p`**: Muestra el tipo de procesador (por ejemplo, "i686").
    
-   **`-i`**: Muestra el tipo de hardware de la plataforma (por ejemplo, "x86").
    
-   **`-o`**: Muestra el nombre del sistema operativo.

## vmstat

El comando `vmstat` (abreviatura de **Virtual Memory Statistics**) se utiliza para mostrar informacion sobre el sistema, incluyendo estadisticas de memoria, procesos, entradas/salidas, intercambios de memoria (swapping) y CPU. Este comando es util para monitorear el rendimiento del sistema en tiempo real y para diagnosticar problemas relacionados con la memoria y el uso de la CPU.

    vmstat [opciones] [intervalo] [numero de muestras]

### Opciones comunes:

-   **`intervalo`**: El intervalo de tiempo en segundos entre cada actualizacion de las estadisticas.
    
-   **`numero de muestras`**: El numero de veces que se debe mostrar la informacion (puede ser usado junto con el intervalo).
    
-   **`-s`**: Muestra estadisticas detalladas sobre la memoria.
    
-   **`-d`**: Muestra estadisticas de dispositivos de bloque.
    
-   **`-t`**: Muestra la hora de la ultima actualizacion.

### Salida de `vmstat`:

La salida tipica de `vmstat` contiene varias columnas que brindan informacion sobre los diferentes aspectos del sistema:

1.  **Procs** (Procesos):
    
    -   **r**: El numero de procesos en ejecucion o esperando en la cola de ejecucion.
        
    -   **b**: El numero de procesos bloqueados, esperando a ser ejecutados.
        
2.  **Memory** (Memoria):
    
    -   **swpd**: La cantidad de memoria virtual utilizada (en kilobytes).
        
    -   **free**: La cantidad de memoria libre disponible (en kilobytes).
        
    -   **buff**: La cantidad de memoria usada como buffer (en kilobytes).
        
    -   **cache**: La cantidad de memoria usada como cache (en kilobytes).
        
3.  **Swap** (Intercambio):
    
    -   **si**: La cantidad de memoria swap (intercambiada desde el disco hacia la memoria) que se ha movido hacia la memoria.
        
    -   **so**: La cantidad de memoria swap que se ha movido desde la memoria hacia el disco.
        
4.  **IO** (Entrada/Salida):
    
    -   **bi**: La cantidad de bloques leidos desde el dispositivo de bloque (en bloques de 512 bytes).
        
    -   **bo**: La cantidad de bloques escritos en el dispositivo de bloque (en bloques de 512 bytes).
        
5.  **System** (Sistema):
    
    -   **in**: La cantidad de interrupciones por segundo, incluyendo interrupciones de hardware y software.
        
    -   **cs**: La cantidad de cambios de contexto por segundo (cuando la CPU cambia de un proceso a otro).
        
6.  **CPU**:
    
    -   **us**: Porcentaje de tiempo de CPU utilizado por procesos en modo de usuario.
        
    -   **sy**: Porcentaje de tiempo de CPU utilizado por procesos en modo de sistema (kernel).
        
    -   **id**: Porcentaje de tiempo en que la CPU esta inactiva.
        
    -   **wa**: Porcentaje de tiempo de la CPU esperando a que se completen las operaciones de I/O.
        
    -   **st**: Porcentaje de tiempo robado a la maquina por maquinas virtuales.


    procs -----------memory---------- ---swap-- -----io---- --system-- ----cpu----
     r  b   swpd   free   buff  cache   si  so   bi   bo   in   cs us sy id wa st
     1  0  10240  34512  14912  67880    0   0    5   10   31   46  3  1 96  0  0
     2  0  10240  34512  14912  67880    0   0    5   10   31   45  3  1 96  0  0

## ifconfig

El comando `ifconfig` (abreviatura de **interface configuration**) se utiliza en sistemas Unix y Linux para **ver y configurar interfaces de red**.

## netstat

El comando `netstat` (abreviatura de **network statistics**) se utiliza para **mostrar informacion sobre las conexiones de red, tablas de enrutamiento, interfaces de red, estadisticas y mas**.

**Mostrar direcciones y puertos con procesos asociados**:

`netstat -tulnp` 

-   `-t`: TCP
    
-   `-u`: UDP
    
-   `-l`: Listening
    
-   `-n`: Direcciones numericas
    
-   `-p`: Proceso/Programa

## free

El comando `free` se utiliza para **mostrar informacion sobre el uso de memoria del sistema**, incluyendo:

                  total        used        free      shared  buff/cache   available
    Mem:        16318456     4230564     8652380      432584     3445520    11392452
    Swap:        2097148           0     2097148


