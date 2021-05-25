#!/bin/sh

#Ejercicio2

#Compruebo que haya al menos un parametro

if [ $# -eq 0 ];
then
	echo "No has introducido ningun archivo."
elif [ $# -ge 10 ];

#Si hay más de nueve aviso

then
	echo "Has introducido más de 9 archivos, solo admite nueve parámetros como máximo"
else

#Voy buscando uno a uno los archivos

	for num;
	do

#Búsqueda sin tener en cuenta los errores

		ruta_archivo=$(find / -name $num 2>errores1.txt)

#Si no lo encuentra avisa

		if [ -z $ruta_archivo ];
		then
			echo "El archivo o directorio $num no existe"
		else
			error=0

#Si lo encuentra pregunta si lo borra.

			while [ $error -eq 0 ];
			do
				read -p "Quieres borrar $ruta_archivo (y/n)?" borrar

#Si contesta que si lo borra.

				if [ $borrar = y ] || [ $borrar = Y ];
				then
					error=1
					rm -r $ruta_archivo

#Si contesta que no, no hace nada.

				elif [ $borrar = n ] || [ $borrar = N ];
				then
					error=1 
				fi
			done
		fi	
	done
fi




