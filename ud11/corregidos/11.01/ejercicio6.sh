#!/bin/sh

#Ejercicio6


#Función para saber si el valor introducido es un número

entero() {
	if [ -z $1 ];
	then 
		error=0
		clear
	else 
		nodigitos=$(echo $1 | sed s/[0-9]//g)
		if [ -n "$nodigitos" ];
		then
			error=0
		else
			error=1
		fi
	fi
}
#Calculo número aleatorio

numero_aleatorio=$(date "+%N" | cut -c7)

#Petición del número para la comprobació.
error=0
while [ $error -eq 0 ]; do
	read -p "Dime un número entre 0 y 9: " numero
	entero $numero
done
error=0
#Mientras no acierte el número seguiré pidiendo el dato.
while [ $numero -ne $numero_aleatorio ]; 
	do
		while [ $error -eq 0 ]; do
		read -p "Fallaste, prueba con otro número: " numero
		entero $numero
	done
	error=0
done
echo "Acertaste"
