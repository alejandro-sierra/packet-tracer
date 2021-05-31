#!/bin/bash

# **********************************************************************************
#autor Alejandro Ballesta Sierra
#Ejercicio 11.04 - 01
#
# Realiza un script que permita crear un informe de las IP libres en la red en la
# que se encuentra el equipo. Debe contener las siguientes opciones (60%):
# a) El nombre del informe y su ubicación serán pasados como parámetros. Si no
# los encuentra, preguntará al usuario por ellos en lugar de cerrar la
# aplicación.
# b) El informe contendrá un listado de todas las IP de la red a la que pertenece
# el equipo indicando si está libe o no (usa el comando ping).
# c) En el informe debe aparecer el tipo de red (A, B o C) en el que está inmerso
# el ordenador con el nombre de la red, su broadcast y su máscara de
# subred.
# NOTA: para facilitar los cálculos asumimos que el equipo donde se ejecuta el script
# se encuentra en una única red. Sólo posee una tarjeta de red.
# ************************************************************************************

correcto=0
while [ $correcto -eq 0 ];
do
    #Comprobamos que nos pasan parametros
    if [ $# -gt 0 ] && [ $# -lt 3 ]; 
    then
        nombre=$1
        ubicacion=$2
    #Sino nos pasan parametros los pediremos
    else
        echo "***** INFORMACION DEL INFOMRE *****"
        read -p "Cual sera el nombre del informe: " nombre
        read -p "Y cual sera la ubicación del mismo: " ubicacion
    fi

    #Comprobamos que la ubicacion exite y si es una carpeta (para que pueda almacenar los informes)
    busquedaUbicacion=$(find / -name $ubicacion  2>null)
    if [ -z "$busquedaUbicacion" ] || [ -f "$busquedaUbicacion" ];
    then
        echo "No es un direcctorio o no existe"
        exit
    else
        correcto=1
    fi
done

#Tipo A: 8
#Tipo B: 16
#Tipo C: 24

# Averiguamos de que tipo es la ip
tipo=$(hostname -I | cut -d. -f1)
if [ $tipo -ge 0 ] && [ $tipo -le 127 ];
then
    resultado="Red de tipo: A" 
elif [ $tipo -ge 128 ] && [ $tipo -le 191 ];
then
    resultado="Red de tipo: B"
elif [ $tipo -ge 192 ] && [ $tipo -le 223 ];
then
    resultado="Red de tipo: C"
else
    resultado="La ip del equipo no esta dentro del rango permitido"
fi

#Escribimos el principio del fichero a crear
nombreRed=$(hostname -I)
broadcast=$(ifconfig | grep $nombreRed | tr -s ' ' ';' | cut -d';' -f7)
mascara=$(ifconfig | grep $nombreRed | tr -s ' ' ';' | cut -d';' -f5)

echo "********** INFORMACION RELEVANTE DE LA RED **********" >> $busquedaUbicacion"/"$nombre
echo "$resultado  Nombre de la red: $nombreRed  Broadcast: $broadcast  Mascara: $mascara" >> $busquedaUbicacion"/"$nombre
echo " " >> $busquedaUbicacion"/"$nombre

#Y aqui escribimos cada ip en una linea, diciendo si esta disponible o no
echo "Escribiendo la lista, esto puede tardar unos minutos. Perdón por las molestias."
host=$(hostname -I | cut -d'.' -f1,2,3)
for ((i=1;i<=254;i++));
do
    conexion=$(ping -c5 $host"."$i | grep "ttl=64")
    if [[ -z $conexion ]];
    then
        echo "$host"."$i: Disponible" >> $busquedaUbicacion"/"$nombre
    else
        echo "$host"."$i: No Disponible" >> $busquedaUbicacion"/"$nombre
    fi
done