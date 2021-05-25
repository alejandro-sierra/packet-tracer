#!/bin/sh

#Ejercicio3

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
			clear
		else
			error=1
		fi
	fi
}

#Petición de los datos
error=0
while [ $error -eq 0 ]; do
	read -p "Dame un número: " numero
	entero $numero
done

#Comprobación de si el número es par
if [ $((numero%2)) -eq 0 ];
then
	echo "El número es par"
#Si es par y es 2 además de par es primo.
	if [ $((numero)) -eq 2 ];
	then
		echo "El número es primo"
	fi
else 
#Si no es par y es igual a 1 es primo.
	if [ $((numero)) -eq 1];
	then
		echo "El número es primo"
	else
#Comprobación si el número impar es primo. Compruebo con una secuencia desde el 2 al número que he introducido
		for i in $(seq 2 $(($numero)));
		do
#Si he llegado al número es primo
			if [ $numero -eq $i ]; 
			then
				echo "El número es primo"
			break
			fi
#Si la división es cero no es primo
			if [ $((numero%i)) -eq 0 ];
			then	
				echo "El número no es primo"
#Salgo del for porque no me hace falta seguir, ya se que no es primo.
				break
			fi
		done
	fi
fi

