#!/bin/sh

#Ejercicio1

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

#Petición de datos.
#Se utiliza el while para comprobar que se ha introducido realmente un número
error=0
while [ $error -eq 0 ]; do
	read -p "Introduce el valor de a: " a
	entero $a
done
error=0
while [ $error -eq 0 ]; do
	read -p "Introduce el valor de b: " b
	entero $b
done
error=0
while [ $error -eq 0 ]; do
	read -p "Introduce el valor de c: " c
	entero $c
done

#Representación y cálculo de los resultados


echo "El resultado de 2*b+3*(a-c) es: "$((2*b+3*(a-c)))
echo "El resultado de a%b es: "$((a%b))
echo "El resultado de a/c es: "$((a/c))
echo "El resultado de a*(b/c) es: "$((a*(b/c)))
echo "El resultado de (a*c)%b es: "$(((a*c)%b))


