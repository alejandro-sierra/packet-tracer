#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-02
# Crea un script que elimine archivos o directorios pasados como parámetros
# (da igual el número hasta un máximo de 9). Deberá comprobar que los
# ficheros o directorios existen y si se le ha pasado más de nueve
# parámetros, si es así dará un error. También deberá preguntar si está seguro
# de llevar a cabo la acción.

if [ $# -lt 1 ] || [ $# -gt 9 ];
then
    echo "Numero de parametros introducido erroneo"
    exit
fi

for i in $*
do
    resultado=$(find / -name $i  2>null)

    if [ -z "$resultado" ];
    then 
    echo "No existe el fichero"
    else
    rm -ri $resultado
    fi  
done