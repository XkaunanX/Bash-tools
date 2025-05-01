#!/bin/bash

if [ ! -d $1 ];
then
	echo "Uso: <directorio>"
	exit
fi

tar -czf /tmp/bkp_$(date "+%d_%m_%y").tar.gz $(find $1 -name "*.mp4" -size +5M)

# crontab -e

#min hora dia(mes) mes dia(semana) /pathAbsoluto

# 0 5 * * 0 /home/damip/backup.sh /home/