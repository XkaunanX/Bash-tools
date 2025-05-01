## awk

El comando `awk` es una herramienta poderosa en Linux y Unix que se utiliza para procesar y analizar texto, especialmente para trabajar con archivos de texto que están organizados en columnas o campo

Sintaxis básica de `awk`:

    awk 'acciones' archivo

Ejemplos comunes de uso:

**Imprimir columnas específicas**:

    awk '{print $1}' archivo.txt

**Usar delimitadores específicos**:

    awk -F, '{print $1, $2}' archivo.csv

**Realizar operaciones matemáticas**:

    awk '/pattern/ {print $0}' archivo.txt

### Ejemplo de Caso de Uso

Generar un informe con el total de ventas por **producto** (es decir, cuántas unidades de cada producto se vendieron en total y el total de dinero generado por cada producto).

    awk -F, 'NR > 1 {venta[$3]+=$4*$5} END {for (producto in venta) print producto, venta[producto]}' ventas.log

## cut

El comando `cut` en Linux y Unix se utiliza para extraer secciones de texto de cada línea de un archivo o entrada estándar.

Sintaxis básica:

    cut [opciones] archivo

### cut comunes

**Cortar por rangos de caracteres**:

    cut -c1-5 archivo.txt

**Cortar por múltiples campos**:

    cut -d',' -f1,3 archivo.csv

### Resumen de opciones comunes:

-   **-d**: Especifica el delimitador (por ejemplo, una coma, un espacio, etc.).
    
-   **-f**: Selecciona los campos que se van a mostrar (por número, o rangos de campos).
    
-   **-c**: Selecciona un rango de caracteres.


### Ejemplo de Caso de Uso

Obtener el número de solicitudes (líneas) por cada dirección IP, pero solo aquellas que recibieron un código de estado 200 (solicitudes exitosas).

    grep ' 200 ' accesos.log | cut -d' ' -f1 | sort | uniq -c | sort -nr

## grep

El comando `grep` en Linux se utiliza para buscar texto en archivos o en la salida de otros comandos. La búsqueda se realiza mediante expresiones regulares, lo que permite patrones de búsqueda complejos.

Sintaxis básica:

    grep [opciones] patrón [archivo...]


### Ejemplo de Caso de Uso

encontrar todas las líneas que contienen el término "error" en los logs de Apache (`/var/log/apache2/error.log`).

    grep "error" /var/log/apache2/error.log

## sed

El comando `sed` (Stream Editor) en Linux es una herramienta poderosa para realizar manipulaciones de texto de manera no interactiva. Se usa principalmente para hacer modificaciones en un flujo de datos (ya sea un archivo o una entrada estándar), como buscar, reemplazar, eliminar o insertar texto, todo de forma automatizada y sin necesidad de abrir un editor de texto.

Sintaxis básica:

    sed [opciones] 'expresión' archivo

Ejemplos básicos:

Reemplazar todas las ocurrencias en cada línea:

    sed 's/palabra1/palabra2/g' archivo.txt

Eliminar una línea específica:

    sed '3d' archivo.txt

Eliminar líneas que coincidan con una expresión regular:

    sed '/patron/d' archivo.txt

Reemplazar texto en el archivo original (modificar directamente el archivo):

    sed -i 's/palabra1/palabra2/' archivo.txt

Insertar una línea antes o después de una línea específica:

    sed '3a Esta es la nueva línea' archivo.txt

### Ejemplo de Caso de Uso

Reemplazar todas las referencias a una IP antigua por una nueva. Utilizas `sed` para hacer el reemplazo de manera automática:

    sed -i 's/192.168.0.1/192.168.1.1/g' config.txt

