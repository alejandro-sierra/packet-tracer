#!/bin/sh

#Ejercicio4

#Variable iniciada para salir del bucle para comprobar los tres parámteros introducidos

salida=0

#Compruebo que hay tres parametros y si no aviso

if [ $# -eq 0 ];
then
	echo "No has introducido ningun parámetro."
	elif [ $# -ne 3 ];
	then
		echo "No has introducido los tres prámetros necesarios"
	else

#Recorro los tres parametros para comprobar que existen

		i=0
		for num;
		do
			i=$((i+1))

#Con el primero busco si existe el fichero y si no existe aviso y finalizo el programa

			if [ $i -eq 1 ];
			then
				ruta_archivo=$(find ~ -name $num 2>errores1.txt)
				if [ -z $ruta_archivo ];
				then
					echo "El archivo o directorio $num no existe"
					salida=1
				fi
			fi

#Con el segundo compruebo si se ha introducido la opción correctamente y si no lo ha hecho aviso y saldo del programa

			if [ $i -eq 2 ];	
			then
				if [ $num = 'ASC' ] || [ $num = 'DES' ];
				then
					orden=$num
				else
					echo "No sé como ordenar el archivo"
					salida=1
				fi
			fi

#Con el tercero le asigno la variable archivo salida

			if [ $i -eq 3 ];
			then
				archivo_salida=$num
			fi					
		done

#Si los parametros están bien

		if [ $salida -ne 1 ];
		then

#Orden ascendente

			if [ $orden = 'ASC' ];
			then
				cat $ruta_archivo | sort >archivo_salida
			else

#orden descendente
				cat $ruta_archivo | sort -r >archivo_salida
			fi
		fi
	fi	
		
