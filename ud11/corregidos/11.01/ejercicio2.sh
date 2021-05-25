#!/bin/sh

#Ejercicio2

#Obtención de la hora
hora=$(date +%T | cut -d':' -f1 )

#Comprobación de la franja horaria en la que estoy.
if [ $hora -ge 8 ] && [ $hora -lt 15 ];
then
	echo "Por la mañana"
elif [ $hora -ge 15 ] && [ $hora -lt 20 ];
then
	echo "Por la tarde"
else
	echo "Por la noche"
fi
