## bg y fg

El comando `bg` en Bash sirve para **reanudar un proceso detenido (suspendido) y enviarlo al segundo plano**, permitiendo que siga ejecutandose mientras podes seguir usando la terminal.

El comando `fg` en sistemas Unix/Linux se usa para **llevar un proceso detenido o en segundo plano al primer plano**.

### Ejemplos de Casos de uso
Caso 1: **Editar archivos mientras compila un proyecto grande**

```bash
    make
```

olvidaste editar algo, asi que:

```bash
    Ctrl+Z           # pausa la compilacion
    bg               # reanuda en segundo plano
    nano main.c      # empezas a editar
```
Ahora, el proyecto se sigue compilando mientras vos editas archivos sin abrir otra terminal.

Caso 2: **Monitoreo y multitarea**
Estas monitoreando logs con `tail` en un servidor remoto pero queres ejecutar comandos de mantenimiento en paralelo.

```bash
    tail -f /var/log/syslog
```
Lo suspendes:

```bash
    Ctrl+Z
    bg
```

Ahora podes ejecutar otros comandos como:

```bash
    apt update
    htop
    systemctl restart apache2
```

Mientras tanto, el `tail` sigue mostrando logs en segundo plano. Podes volver al monitoreo con:

```bash
    fg
```

## ps

El comando `ps` (de **process status**) en Unix/Linux sirve para **ver los procesos que estan corriendo en el sistema**.

```bash
      PID TTY          TIME CMD
     1234 pts/0    00:00:00 bash
     1256 pts/0    00:00:00 ps
```

### Ejemplo de Caso de uso

Buscar un proceso especifico

```bash
    ps aux | grep nginx
```

## top

El comando **`top`** en sistemas Unix/Linux muestra en tiempo real una lista de los procesos que se estan ejecutando en el sistema, proporcionando informacion sobre el uso de la CPU, la memoria y otros recursos del sistema.

```bash
    top - 15:21:14 up 1 day,  3:54,  2 users,  load average: 0.15, 0.10, 0.05
    Tasks: 165 total,   1 running, 164 sleeping,   0 stopped,   0 zombie
    %Cpu(s):  5.0 us,  1.0 sy,  0.0 ni, 93.0 id,  0.5 wa,  0.0 hi,  0.5 si,  0.0 st
    MiB Mem :   8192.0 total,   3200.0 free,   4000.0 used,   992.0 buff/cache
    MiB Swap:   2048.0 total,   2000.0 free,    48.0 used.   2000.0 avail Mem
    
      PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
     1234 root      20   0   1024M   200M   100M S   20.0  2.4   1:30.00 process1
     5678 user      20   0    500M   100M    50M S    5.0  1.2   0:15.00 process2
```

## jobs

El comando **`jobs`** en sistemas Unix/Linux se utiliza para **listar los trabajos o procesos en segundo plano** que se estan ejecutando en la terminal actual. Estos trabajos pueden estar en ejecucion o detenidos (en espera).

```bash
    [1]+  1234 Running                 sleep 100 &
    [2]-  5678 Stopped                 vim
```

## kill

El comando **`kill`** en sistemas Unix/Linux se utiliza para **enviar señales a procesos**, normalmente para terminarlos.

```bash
    kill <PID>
```

### Ejemplo de Caso de uso

**Forzar la terminacion de un proceso con `SIGKILL`**

Si un proceso no termina despues de la señal `SIGTERM`, puedes usar **SIGKILL** para forzarlo a finalizar de inmediato:

```bash
    kill -9 1234
```

## killall

El comando **`killall`** en sistemas Unix/Linux se utiliza para **matar todos los procesos con un nombre especifico**. A diferencia del comando `kill`, que requiere el **PID** (Process ID) de un proceso, `killall` permite terminar procesos por su **nombre**.

```bash
    killall <nombre_del_proceso>
```

### Ejemplo de Caso de uso

Si deseas detener todos los procesos de un programa sin matarlos, puedes usar `SIGSTOP`:

```bash
    killall -STOP firefox
```

Si no estas seguro de que procesos se van a terminar con `killall`, puedes usar el comando `-v` (verbose) para obtener mas informacion sobre que procesos seran afectados:

```bash
    killall -v firefox
```
Tambien puedes usar el parametro `-i` para que `killall` te pida confirmacion antes de matar cada proceso. Esto es util cuando hay multiples procesos similares:

```bash
    killall -i firefox
```

### Resumen de señales comunes:

-   **`SIGTERM` (15)**: Señal de terminacion ordenada (por defecto con `killall`).
    
-   **`SIGKILL` (9)**: Señal de terminacion forzada, el proceso no puede ignorarla.
    
-   **`SIGSTOP` (19)**: Detiene el proceso sin eliminarlo.
    
-   **`SIGCONT` (18)**: Reanuda un proceso detenido.

## nohup

El comando **`nohup`** en sistemas Unix/Linux se utiliza para **ejecutar un comando o programa de manera que continue ejecutandose incluso si la sesion del usuario termina o se cierra la terminal**. Esto es util cuando deseas que un proceso se siga ejecutando despues de cerrar la terminal o cuando te desconectas de la sesion SSH, por ejemplo.

```bash
    nohup <comando> &
```
Este comando ejecutara el script **`mi_script.sh`** en segundo plano y continuara ejecutandose incluso si la terminal se cierra.

### Ejemplo de Caso de uso

Si tienes un proceso que puede durar mucho tiempo y no quieres que se detenga al cerrar la terminal o perder la conexion, `nohup` es ideal. Ejemplo, ejecutar un servidor web o un script de backup:

```bash
    nohup python server.py &
```

Este comando ejecutara el servidor **`server.py`** en segundo plano y no se detendra aunque cierres la terminal.

**Ver el output de un proceso ejecutado con `nohup`**
Por defecto, la salida estandar y el error estandar de un proceso ejecutado con `nohup` se redirigen a un archivo llamado **`nohup.out`**. Puedes ver este archivo para revisar el resultado o errores del proceso:

```bash
    cat nohup.out
```

**Ejecutar procesos en un servidor remoto (con SSH)**

Cuando te conectas a un servidor remoto usando SSH y deseas ejecutar un proceso largo sin preocuparte de desconectarte, puedes usar `nohup` para mantener el proceso en ejecucion:

```bash
    nohup ssh user@remote-server "long-running-command" &
```

## pgrep

El comando **`pgrep`** en sistemas Unix/Linux se utiliza para **buscar procesos en ejecucion** basandose en el nombre o patron de su comando.

```bash
    pgrep <nombre_del_proceso>
```

### Ejemplo de Caso de uso

Para buscar procesos ejecutados por un usuario especifico, puedes usar la opcion **`-u`** y el nombre de usuario:

```bash
    pgrep -u user1 firefox
```

### Opciones utiles:

-   **`-l`**: Muestra el nombre del proceso junto con el PID.
    
-   **`-u`**: Filtra por el usuario que ejecuto el proceso.
    
-   **`-f`**: Busca en los argumentos completos del proceso (no solo el nombre).
    
-   **`-v`**: Invertir la busqueda, muestra los procesos que no coinciden con el patron.