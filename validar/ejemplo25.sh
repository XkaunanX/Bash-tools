#!/bin/bash

if id "$1" >/dev/null 2>&1  ;
then
	echo "existe"
else
	echo "no existe"
	exit
fi