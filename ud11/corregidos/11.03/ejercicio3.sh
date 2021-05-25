#!/bin/bash
#*********************************************
#Ejercicio 3 de la práctica 3 del Tema 11
#*********************************************
salida=0
while [ $salida -eq 0 ]; do
echo "a) Ver información de los procesos del sistema con información detallada"
echo "b) Matar proceso en ejecución (pasar número proceso como parámetro)"
echo "c) Salir"

read -p "¿Qué quiere hacer? " opcion
case $opcion in
	a) top #Muestra la información detallada de todos los procesos del sistema #top -n 1 -b
	;;
	b) procesoEjecucion=$(ps -e | grep -n $1) #Comprueba si el proceso está en ejecución, y si lo está esta variable tendrá un valor, sino no
	   if [ $# -eq 0 ]; then #Si no hemos introducido un parámetro entrará aqui
		echo "No has introducido ningún proceso a eliminar."
	   elif [ -z $procesoEjecucion ]; then #Si no está en ejecución aqui
		echo "El proceso no está en ejecución"
	   else
		kill -9 $1 #Mata al proceso que hemos pasado como parámetro
	   fi
	;;
	c) salida=1
	;;
	*)
	;;
esac
done
