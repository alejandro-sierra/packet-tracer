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

#Comprobamos que nos pasan parametros
if [ $# -eq 2 ]; 
then
    nombre=$1
    ubicacion=$2
#Sino nos pasan parametros los pediremos
else
    echo "***** INFORMACION DEL INFOMRE *****"
    read -p "Cual sera el nombre del informe: " nombre
    read -p "Y cual sera la ubicación del mismo: " ubicacion
fi

correcto=0
while [ $correcto -eq 0 ];
do
    #Comprobamos que la ubicacion exite y si es una carpeta, si no lo es nos volvera a perdir la ubicacion.
    busquedaUbicacion=$(find / -name $ubicacion  2>null)
    if [ -z "$busquedaUbicacion" ] || [ -f "$busquedaUbicacion" ];
    then
        echo "No es un direcctorio o no existe"
        read -p "Escribe una ubicacion valida: " ubicacion
        correcto=0
    else
        correcto=1
    fi
done


#Escribimos el principio del fichero a crear
nombreRed=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f3)
#Como no podemos sacas el nombre de la red, he puesto la ip del equipo desde el que se ejecuta
mascara=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f4)
broadcast=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f6)


if [ $mascara -eq 8 ];
then
    masc=255.0.0.0
    tipo="A"
elif [ $mascara -eq 16 ]
then    
    masc=255.255.0.0
    tipo="B"
elif [ $mascara -eq 24 ]
then    
    masc=255.255.255.0
    tipo="C"
fi

echo "********** INFORMACION RELEVANTE DE LA RED **********" >> $busquedaUbicacion"/"$nombre
echo "Tipo: $tipo  IP: $nombreRed  Broadcast: $broadcast  Mascara: $masc" >> $busquedaUbicacion"/"$nombre
echo " " >> $busquedaUbicacion"/"$nombre


echo "Escribiendo la lista, esto puede tardar unos minutos. Perdón por las molestias."
case $mascara in
    8) #tipoA
    ipA=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f3 | cut -d'.' -f1)
    for ((i=1;i<=255;i++));
    do
        for ((j=1;j<=255;j++));
        do
            for ((k=1;k<=254;k++));
            do
                conexion=$(ping -c5 $ipA"."$i"."$j"."$k | grep "ttl=64")
                if [[ -z $conexion ]];
                then
                    echo "$ipA"."$i"."$j"."$k: Disponible" >> $busquedaUbicacion"/"$nombre
                else
                    echo "$ipA"."$i"."$j"."$k: No Disponible" >> $busquedaUbicacion"/"$nombre
                fi
            done
        done
    done
    ;;
    16) #tipoB
        ipB=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f3 | cut -d'.' -f1,2)
    for ((i=1;i<=255;i++));
    do
        for ((j=1;j<=254;j++));
        do
            conexion=$(ping -c5 $ipB"."$i"."$j | grep "ttl=64")
            if [[ -z $conexion ]];
            then
                echo "$ipB"."$i"."$j: Disponible" >> $busquedaUbicacion"/"$nombre
            else
                echo "$ipB"."$i"."$j: No Disponible" >> $busquedaUbicacion"/"$nombre
            fi
        done
    done
    ;;
    24) #tipoC
    ipC=$(ip addr | grep global | tr -s ' ' '/' | cut -d'/' -f3 | cut -d'.' -f1,2,3)
    for ((i=1;i<=254;i++));
    do
        conexion=$(ping -c5 $ipC"."$i | grep "ttl=64")
        if [[ -z $conexion ]];
        then
            echo "$ipC"."$i: Disponible" >> $busquedaUbicacion"/"$nombre
        else
            echo "$ipC"."$i: No Disponible" >> $busquedaUbicacion"/"$nombre
        fi
    done
    ;;
esac