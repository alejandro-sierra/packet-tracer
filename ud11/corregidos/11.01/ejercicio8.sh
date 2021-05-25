#!/bin/sh

#Ejercicio8

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

#Pregunto por la apuesta que quieres hacer

error=0
while [ $error -eq 0 ]; do
	read -p "¿Cuál es tu apuesta?: " numero
	entero $numero
done

#Muestro un menu para identificar si quiero cara o cruz
echo "¿Qué prefieres cara o cruz?"
echo "1. Cara"
echo "2. Cruz"
error=0
#Introdusco el valor de cara o cruz
while [ $error -eq 0 ]; do
	read -p "Introduce tu decisión: " apuesta
	entero $apuesta
	while [ $error -eq 1 ]; do
		if [ $apuesta -ge 3 ]; then
		error=0
		while [ $error -eq 0 ]; do
		read -p "Solo puedes introducir 1 ó 2: " apuesta
		entero $apuesta
		done
		else
		break
		fi
	done
done

#Genero un número aleatorio para decidir si sale cara o cruz
numero_aleatorio=$(date "+%N" | cut -c7)
if [ $numero_aleatorio -le 4 ]; 
	then
	resultado=1
	else
	resultado=2
fi
#Compruebo si he acertado
if [ $apuesta -ne $resultado ];
	then
	echo "Has perdido"
	else
	echo "Has ganado $((numero*2))"
fi

