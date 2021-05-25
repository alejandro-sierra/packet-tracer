#!/bin/sh

#Ejercicio5
#Para la representación de las tablas de multiplicar hago dos for
for i in $(seq 1 10);
	do
	for j in $(seq 1 10);
	do
#Hago el calculo y lo muestro
		echo "$i*$j="$((i*j))
#Pongo el retardo después de cada cálculo
		sleep 0.25
	done
#Pongo el retardo después de cada tabla.
	sleep 2
done

