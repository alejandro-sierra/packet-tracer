#!/bin/sh

#Ejercicio5
#Variable para saber si he metido los parámetros correctos 
salida=1
#Si no hay ningún parámtero aviso
if [ $# -eq 0 ];
then
	echo "No has introducido ningun parámetro."
	salida=0
#Si solo hay un parámetro aviso
elif [ $# -lt 2 ];
then
	echo "No has introducido la palabra a traducir"
	salida=0
else
#Si son más de dos cojo los dos primeros como válidos y si hay más aviso
	traduccion=$1
	palabra=$2
	if [ $# -ge 3 ];
	then
		echo "Has introducido más de 2 parametros, sólo comprobaré los dos primeros"
	fi
fi
#Si el número de parámteros es correcto
if [ $salida = 1 ];
then
#Compruebo si quiero traducir al inglés
	if [ $traduccion = ENG ] || [ $traduccion = eng ];
	then
#Busco la palabra en el diccionario
		traducida=$(grep $palabra: diccionario5.txt | cut -d: -f2)
#Si no la encuentro aviso y pregunto si quieres añadirla		
		if [ -z $traducida ];
		then
			error=0
			while [ $error = 0 ];
			do
				read -p "La palabra no está en el diccionario. ¿Quieres añadirla? (y/n)" anadir

#Si la quiero añadir le pregunto cual es la traducción y lo añado al final del fichero diccionario5.txt
				if [ $anadir = y ] || [ $anadir = Y ]];
				then
					read -p "Dime la traducción al inglés: " traducida
					echo "$palabra:$traducida:">>diccionario5.txt
					error=1
#Si no la quiere añadir le aviso que se añadirá la palabra
				elif [ $anadir = n ] || [ $anadir = n ]];
				then
					echo "No se añadirá la palabra"
					error=1
				fi
			done
		else
#Si me ha dado la palabra ya en inglés le aviso y si no muestro la traducción.
		if [ $palabra = $traducida ];
		then
			echo "Ya me has dado la palabra en inglés"
		else
			echo "La traducción al inglés de $palabra es $traducida"
		fi
	fi
#Si quiero traducir al castellano
	elif [ $traduccion = ESP ] || [ $traduccion = esp ];
	then
#Busco la palabra
		traducida=$(grep :$palabra: diccionario5.txt | cut -d: -f1)
#Si no la encuentro aviso y pregunto si quiere añadirla
		if [ -z $traducida ];
		then
			error=0
			while [ $error = 0 ];
			do
				read -p "La palabra no está en el diccionario. ¿Quieres añadirla? (y/n)" anadir
#Si quiere añadirla le pregunto por la traducción y lo añado al final del archivo diccionario5.txt
				if [ $anadir = y ] || [ $anadir = Y ]];
				then
					read -p "Dime la traducción al español: " traducida
					echo "$traducida:$palabra:">>diccionario5.txt
					error=1
				elif [ $anadir = n ] || [ $anadir = n ]];
				then
					echo "No se añadirá la palabra"
					error=1
				fi
			done
		else
			echo "La traducción al castellano de $palabra es $traducida"
		fi
	else
#Si no me ha puesto bien el parámtero del idioma le aviso
		echo "No sé a que idioma tengo que traducir"
	fi
fi
