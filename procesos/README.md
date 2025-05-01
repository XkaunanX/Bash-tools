## bg y fg

El comando `bg` en Bash sirve para **reanudar un proceso detenido (suspendido) y enviarlo al segundo plano**, permitiendo que siga ejecutándose mientras podes seguir usando la terminal.

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
Estás monitoreando logs con `tail` en un servidor remoto pero querés ejecutar comandos de mantenimiento en paralelo.

```bash
    tail -f /var/log/syslog
```
Lo suspendés:

```bash
    Ctrl+Z
    bg
```

Ahora podés ejecutar otros comandos como:

```bash
    apt update
    htop
    systemctl restart apache2
```

Mientras tanto, el `tail` sigue mostrando logs en segundo plano. Podés volver al monitoreo con:

```bash
    fg
```

## ps

El comando `ps` (de **process status**) en Unix/Linux sirve para **ver los procesos que están corriendo en el sistema**.

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

El comando **`top`** en sistemas Unix/Linux muestra en tiempo real una lista de los procesos que se están ejecutando en el sistema, proporcionando información sobre el uso de la CPU, la memoria y otros recursos del sistema.

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

El comando **`jobs`** en sistemas Unix/Linux se utiliza para **listar los trabajos o procesos en segundo plano** que se están ejecutando en la terminal actual. Estos trabajos pueden estar en ejecución o detenidos (en espera).

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

**Forzar la terminación de un proceso con `SIGKILL`**

Si un proceso no termina después de la señal `SIGTERM`, puedes usar **SIGKILL** para forzarlo a finalizar de inmediato:

```bash
    kill -9 1234
```

## killall

El comando **`killall`** en sistemas Unix/Linux se utiliza para **matar todos los procesos con un nombre específico**. A diferencia del comando `kill`, que requiere el **PID** (Process ID) de un proceso, `killall` permite terminar procesos por su **nombre**.

```bash
    killall <nombre_del_proceso>
```

### Ejemplo de Caso de uso

Si deseas detener todos los procesos de un programa sin matarlos, puedes usar `SIGSTOP`:

```bash
    killall -STOP firefox
```

Si no estás seguro de qué procesos se van a terminar con `killall`, puedes usar el comando `-v` (verbose) para obtener más información sobre qué procesos serán afectados:

```bash
    killall -v firefox
```
También puedes usar el parámetro `-i` para que `killall` te pida confirmación antes de matar cada proceso. Esto es útil cuando hay múltiples procesos similares:

```bash
    killall -i firefox
```

### Resumen de señales comunes:

-   **`SIGTERM` (15)**: Señal de terminación ordenada (por defecto con `killall`).
    
-   **`SIGKILL` (9)**: Señal de terminación forzada, el proceso no puede ignorarla.
    
-   **`SIGSTOP` (19)**: Detiene el proceso sin eliminarlo.
    
-   **`SIGCONT` (18)**: Reanuda un proceso detenido.

## nohup

El comando **`nohup`** en sistemas Unix/Linux se utiliza para **ejecutar un comando o programa de manera que continúe ejecutándose incluso si la sesión del usuario termina o se cierra la terminal**. Esto es útil cuando deseas que un proceso se siga ejecutando después de cerrar la terminal o cuando te desconectas de la sesión SSH, por ejemplo.

```bash
    nohup <comando> &
```
Este comando ejecutará el script **`mi_script.sh`** en segundo plano y continuará ejecutándose incluso si la terminal se cierra.

### Ejemplo de Caso de uso

Si tienes un proceso que puede durar mucho tiempo y no quieres que se detenga al cerrar la terminal o perder la conexión, `nohup` es ideal. Ejemplo, ejecutar un servidor web o un script de backup:

```bash
    nohup python server.py &
```

Este comando ejecutará el servidor **`server.py`** en segundo plano y no se detendrá aunque cierres la terminal.

**Ver el output de un proceso ejecutado con `nohup`**
Por defecto, la salida estándar y el error estándar de un proceso ejecutado con `nohup` se redirigen a un archivo llamado **`nohup.out`**. Puedes ver este archivo para revisar el resultado o errores del proceso:

```bash
    cat nohup.out
```

**Ejecutar procesos en un servidor remoto (con SSH)**

Cuando te conectas a un servidor remoto usando SSH y deseas ejecutar un proceso largo sin preocuparte de desconectarte, puedes usar `nohup` para mantener el proceso en ejecución:

```bash
    nohup ssh user@remote-server "long-running-command" &
```

## pgrep

El comando **`pgrep`** en sistemas Unix/Linux se utiliza para **buscar procesos en ejecución** basándose en el nombre o patrón de su comando.

```bash
    pgrep <nombre_del_proceso>
```

### Ejemplo de Caso de uso

Para buscar procesos ejecutados por un usuario específico, puedes usar la opción **`-u`** y el nombre de usuario:

```bash
    pgrep -u user1 firefox
```

### Opciones útiles:

-   **`-l`**: Muestra el nombre del proceso junto con el PID.
    
-   **`-u`**: Filtra por el usuario que ejecutó el proceso.
    
-   **`-f`**: Busca en los argumentos completos del proceso (no solo el nombre).
    
-   **`-v`**: Invertir la búsqueda, muestra los procesos que no coinciden con el patrón.