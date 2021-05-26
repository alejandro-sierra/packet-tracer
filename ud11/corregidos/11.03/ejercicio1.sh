#!/bin/bash

#Ejercicio1

#Pedimos el nombre de usuario a buscar

read -p "Dime el nombre de usuario a buscar: " usuario

#Buscamos si el usuario esta dado de alta

encontrado=$(cut -d: -f1 /etc/passwd | grep $usuario)

#Si no está dado de alta avisamos

if [ -z $encontrado ];
then
	echo "No se ha encontrado el usuario"

#Si esta dado de alta mostramos los datos que nos pide
else
	directorio=$(grep $usuario /etc/passwd | cut -d: -f6)
	echo "El directorio de trabajo de $usuario es $directorio"
#comprobamos si esta conectado.
	conectado=$(who | grep $usuario)
	if [ -z $conectado ];
	then
		echo "El usuario $usuario no está conectado"
	else
#Miramos desde que ip
		ip=$(who | tr -s' ' | grep $usuario | cut -d' ' -f5)
		echo "El usuario $usuario está conectado a la ip: $ip"
	fi
#Miro a ver a que grupos pertenece el usuario
	grupos=$(grep $usuario /etc/group | cut -d: -f1 | tr '\n' ',')
	echo "Y pertenece a los siguientes grupos: $grupos"
fi
