#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.03-01
#Realiza un script que te pida introducir un nombre de usuario. Comprobar si
# está dado de alta como usuario del sistema buscándolo en el fichero
# /etc/passwd y sacando después el mensaje adecuado. Si está dado de alta
# en el sistema, nos devuelva los siguientes datos:
# a) Su directorio de trabajo.
# b) Mensaje de si está conectado o no actualmente al sistema.
# c) Si está conectado actualmente al sistema nos devuelva desde donde (que
# dirección IP o terminal).
# d) Consultando el fichero /etc/group devuelva en una línea los grupos a los
# que pertenece.

read -p "Introduce el nombre de un usuario: " usuario

#comprobamos que el usuario existe, si no es asi salimos del script
existe=$(grep -c $usuario /etc/passwd)
if [ $existe -eq 0 ];
then
    echo "Usuario no existe"
    exit
fi

#Sacamos por pantalla el directorio del usuario
directorio=$(grep -i $usuario /etc/passwd | cut -d: -f6)
echo "Direcctorio de trabajo: $directorio"

#Comprobamos que esta conectado en el sistema en este momento
conectado=$(who | grep -c $usuario )
if [ $conectado -eq 0 ];
then
    echo "Usuario conectado: NO"
    boolean=0
else
    echo "Usuario conectado: SI"
    boolean=1
fi

#En el caso de que el usuario este conectado (comprobado con boolean), mostramos su ip o terminal desde el que esta consctado
terminal=$(finger | grep $usuario | tr -s ' ' | cut -d ' ' -f4)
if [ $boolean -eq 1 ];
then
    echo "La TTY del usuario es: $terminal"
fi

#Sacamos los grupos a los que pertenece el usuario
grupos=$(grep $usuario /etc/group | cut -d: -f1)
echo "Grupos a los que pertenece :" $grupos