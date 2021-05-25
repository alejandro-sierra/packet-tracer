#!/bin/bash

#Ejercicio2

#Función para dar de alta los usuarios.

alta_usuarios() {
#Doy de alta el grupo alumnos si no existe
	creadoa=$(grep alumnos /etc/group)
	if [ -z $creadoa ];
	then
		sudo addgroup alumnos
	fi
#Cambio los espacios por guiones para poder recorrer línea a línea el fichero
	lineas=$(cat $1 | tr ' ' '-')
#Recorro el fichero por líneas
	for i in $(echo $lineas);
	do
#Extraigo los valores que quiero
		Login=$(echo $i | cut -d',' -f6)
		Grupo=$(echo $i | cut -d',' -f4 | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz')
		Clave=$(echo $i | cut -d',' -f3)
		Nombre=$(echo $i | cut -d',' -f1,2 | tr ',' ' ' | tr '-' ' ')
#Compruebo si el grupo está creado
		creado=$(grep $Grupo /etc/group)
		if [ -z $creado ];
		then
#Creo el grupo
			sudo addgroup $Grupo
		fi
#Añadimos el usuario comprobando si el usuario está creado
		creadou=$(cut -f1 /etc/passwd | grep $Login | tr '\n ' ';')
		if [ -z $creadou ];
		then
			sudo useradd -c "$Nombre" -d /home/$Login -s /bin/bash -G alumnos $Login
			sudo echo "$Login:$Clave" | chpasswd -m
			sudo usermod -a -G $Grupo $Login
			echo "Usuario de $Nombre creado"
		fi
	done

}
#Compruebo si hay algún parámtero
if [ $# -eq 0 ];
then
	echo "No puedo dar de alta usuarios porque no has introducido ningún archivo"

#Compruebo si hay más de un parámetro.
	else
	if [ $# -ge 2 ];
	then
		echo "Has introducido más de un parámetro sólo tendré en cuenta el primer parámetro"
	fi
#Compruebo si exite el archivo.
	encontrado=$(find ~ -name $1)
	if [ -z $encontrado ];
	then
		echo "el archivo no existe"
	else
#Compruebo el formato del archivo comprobando si hay 6 campos separados por ,
		sexto_campo=$(cut -d',' -f6 $1 | tr '\n' ',')
		septimo_campo=$(cut -d',' -f7 $1)
		if [ -z $sexto_campo ];
		then
			echo "El formato del archivo no es correcto"
		elif [ -z $septimo_campo ];
		then
			alta_usuarios $1
		else
#Si hay siete o más también está mal
			echo "El formato del archivo no es correcto $sexto_campo"
		fi
	fi
fi
		