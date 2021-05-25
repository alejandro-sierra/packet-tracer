#!/bin/sh

#Ejercicio11

#función que calcula que permiso tiene
permisos() {
	case $1 in
		0)
			printf "\t    No \t\t     No \t     No \n"
		;;
		1)
			printf "\t    No \t\t     No \t     Sí \n"
		;;
		2)
			printf "\t    No \t\t     Sí \t     No \n"
		;;
		3)
			printf "\t    No \t\t     Sí \t     Sí \n"
		;;
		4)
			printf "\t    Sí \t\t     No \t     No \n"
		;;
		5)
			printf "\t    Sí \t\t     No \t     Sí \n"
		;;
		6)
			printf "\t    Sí \t\t     Sí \t     No \n"
		;;
		7)
			printf "\t    Sí \t\t     Sí \t     Sí \n"
		;;
	esac
}
#Si ha metido más de dos permisos informo de que solo compruebo el primero
if [ $# -ge 2 ];
then
	echo "Has introducido más de un parámetro, solo comprobaré el primero"
fi
#Compruebo si hay al menos un permiso introducido
if [ -z $1 ];
then 
	echo "No has introducido ningún parámetro"
else 
#Compruebo si tiene formato de permisos
	nodigitos=$(echo $1 | sed s/[0-7]//g)
	parametro=$1
#Cuento cuantos caracteres tengo. Para ser un permiso tienen que ser tres
	caracteres=$(echo ${#parametro})
#Si no tiene el formato númerico aviso
	if [ -n "$nodigitos" ];
	then
		echo "No tienen el formato de permisos"
#Si tiene tres caracteres y son números entre el 0 y el 7 muestro en pantalla los permisos	
	elif [ $caracteres -eq 3 ]; 
	then
		printf "\t Lectura \t Escritura \t Ejecución \n"
		usuario=$(echo $1 | cut -c1)
#Imprimo el permiso de usuario
		printf "Usuario"
		permisos $usuario
		grupo=$(echo $1 | cut -c2)
#Imprimo el permiso de grupo
		printf "Grupo"
		permisos $grupo
		resto=$(echo $1 | cut -c3)
Imrimo el permiso de resto.
		printf "Resto"
		permisos $resto
		else
#Como no son tres caracteres no tiene el formato
		echo "No tienen el formato de permisos"
	fi
fi

