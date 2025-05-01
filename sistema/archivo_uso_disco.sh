#!/bin/bash
#3) Genere un archivo de nombre "DISK" con informacion del porcentaje de uso de la
#particion donde esta montada la raiz del sistema linux y la particion /boot.
# La evaluacion se da por aprobada, si se encuentran las salidas de los archivos
#solicitados con los totales correctos, caso contrario se da por desaprobado elexamen, sin #excepcion.
echo "porcentaje de /: $(df / | tail -1 | awk '{print $5}')" > ./directorio/DISK.txt
echo "porcentaje de /boot: $(df /boot/efi | tail -1 | awk '{print $5}')" >> ./directorio/DISK.txt # Importante