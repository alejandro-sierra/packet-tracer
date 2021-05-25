#!/bin/sh

#Ejercicio1

#Compruebo si hay algun parametro

if [ $# -eq 0 ];
then
	echo "No has introducido ningun archivo."
elif [ $# -ge 2 ];

#Aviso si hay más de un parametro sólo utilizará el primero

then
	echo "Has introducido más de uno archivo, solo se buscará el primero"
fi

#Busqueda del archivo sin tener en cuentas los errores

ruta_archivo=$(find / -name $1 2>errores1.txt)

#Si no lo encuentra se avisa de que el archivo no existe

if [ -z $ruta_archivo ];
then
	echo "El archivo o directorio $1 no existe"
else

#Se comprueba si es un directorio o fichero

	if [ -d $ruta_archivo ];
	then 

#Es un directorio y muestra los archivos que contiene

		echo "$1 es un directorio y contiene los siguientes archivos:" 
		ls -l $ruta_archivo
	else

#Es un fichero y muestra su contenido

		echo "$1 es un fichero del tipo $tipo y su contenido es:"
		cat $ruta_archivo
	fi
fi

