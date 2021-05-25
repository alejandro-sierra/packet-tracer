#!/bin/sh

#Ejercicio9

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

#Inicio todas las variables para ver cuanto acumula cuanto apuesta y cuanto gana
apuesta=0
veces=0
acumulado=0
gastado=0
clear
#Muestro el menu con una opción de salir, mientras no instroduzca la salida seguiré pidiendo
while [ $apuesta != "x" ]; do
	echo "¿Qué prefieres cara o cruz?"
	echo "1. Cara"
	echo "2. Cruz"
	echo "x. Salir"
	error=0
#Compruebo que es un valor válido para cara o cruz
	while [ $error -eq 0 ]; do
		read -p "Introduce tu decisión: " apuesta
		entero $apuesta
		if [ $apuesta != "x" ];
		then
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
		else
			error=1
		fi
	done
#Si no he introducido la opción de salir 
	if [ $apuesta != "x" ];
		then
#Añado un intento
		veces=$((veces+1))
		error=0
#Pido la apuesta
		while [ $error -eq 0 ]; do
		read -p "¿Cuál es tu apuesta?: " numero
		entero $numero
		done
#Añado el gasto al gasto total
		gastado=$((gastado+numero))
#Hago el calculo de cara o cruz
		numero_aleatorio=$(date "+%N" | cut -c7)
		if [ $numero_aleatorio -le 4 ]; 
			then
			resultado=1
			else
			resultado=2
		fi
#Compruebo si no ha acertado
		if [ $apuesta -ne $resultado ];
			then
			echo "Has perdido"
#Calculo que he perdido para saber el acumulado
			acumulado=$((acumulado-numero))
			sleep 5
			clear
		else
#Si he ganado lo sumo y le digo que ha ganado y cuanto tiene de bote
			acumulado=$((acumulado+numero))
			echo "Has ganado y tienes un bote de $acumulado"
			sleep 5
			clear
		fi
	fi
done
#Cuando dice de salir le doy los resultados que ha obtenido.
echo "Has apostado $gastado en total en $veces tiradas. Y has ganado $acumulado"
