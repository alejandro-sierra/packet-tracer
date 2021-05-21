#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-04
# Crea un script que ordene un archivo de texto en orden ascendente o
# descendente según se le indique. El script debe realizar las siguientes
# operaciones:
# a) el archivo ordenado se guardará en uno nuevo.
# b) todas las variables necesarias serán pasadas como parámetros: fichero
# a ordenar, modo de orden y fichero de salida.
# c) para orden ascendente se usará el parámetro ASC.
# d) para orden descendente se usará el parámetro DES.
# e) debe comprobar si existen todos los parámetros antes de empezar la
# ejecución del programa (si falta algún parámetro se le indicará al usuario
# y no se le dejará continuar hasta que lo introduzca).

if [ $# -ne 3 ];
then 
    echo "Parametro 1: fichero a ordenar"
    echo "Parametro 2: orden ASC (ascendente) o DES (descendete)"
    echo "Parametro 3: fichero nuevo donde guardar el resultado"
    echo ""
    exit
fi

#Comprobamos que el fichero ($1) existe
fichero=$(find / -name $1  2>null)
if [ -z "$fichero" ]
then 
echo "No existe el fichero, pon uno valido"
exit
fi

#Comprobamos que el orden ($2) es correcto
case $2 in
    ASC)
    echo "Fichero ordenado ascendentemente"
    sort $fichero > $3
    ;;
    DES)
    echo "Fichero ordenado descendentemente"
    sort -r $fichero > $3
    ;;
    *)
        echo "Parametro 2 invalido"
    ;;
esac