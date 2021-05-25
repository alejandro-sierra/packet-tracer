#!/bin/sh

#Ejercicio4

#Compruebo si hay algun archivo a buscar

if [ $# -eq 0];
then
	echo "No hay ningun archivo que buscar"
else
#Si has puesto dos o más archivos aviso de que solo buscaré el primero
	if [ $# -ge 2 ];
	then
		echo "Has introducido más de uno archivo, solo se buscará el primero"
	fi
#Busco el archivo sin que aparezcan errores
	ruta_archivo=$(find / -name $1 2>errores.txt)
#Compruebo si lo he encontrado.
	if [ -z $ruta_archivo ];
	then
		echo "El archivo $1 no existe"
	else
#Digo donde está el archivo y cuento cuantas líneas tiene el archivo
		echo "El archivo se encuentra en "$ruta_archivo" y tiene "$(wc $ruta_archivo | tr -s ' ' | cut -d ' ' -f2) "lineas" 
	fi
fi

