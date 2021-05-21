#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-05
# Crea un script para elaborar un traductor de palabras inglés-español
# español-inglés. Deberás utilizar un diccionario almacenado en un archivo de
# texto que contenga las palabras traducidas. Tendrá las siguientes
# características:
# a) el diccionario contendrá un mínimo de 25 palabras traducidas.
# b) el orden de la traducción y la palabra serán especificadas como
# parámetros.
# c) si la palabra a buscar no se encuentra en el diccionario, se le dará la
# opción al usuario a añadirla.

if [ $# -ne 2 ]; #Comprobamos que son han pasado 2 parametros
then 
    echo "Parametro 1: orden de la traduccion (ING/ESP)"
    echo "Parametro 2: palabra a traducir"
    echo ""
    exit
fi

#Comprobamos que el orden ($1) es correcto
case $1 in
    ING)
    grep -i $2 ./diccionario.txt | cut -d: -f2
    ;;
    ESP)
    grep -i $2 ./diccionario.txt | cut -d: -f1
    ;;
    *)
        echo "Parametro 1 incorrecto, solo podemos traducir al español (ESP) o al inglés (ING)."
    ;;
esac

#Comprobamos que la palabra a traducir ($2) esta en el diccionario
busqueda=$(grep -c $2 ./diccionario.txt)
if [ $busqueda -eq 0 ];
then
    echo "No tenemos esa palabra registrada en nuesto diccionario"
    read -p "Añade la palabra (ESP): " esp
    read -p "Añade la palabra (ING): " ing
    echo $esp":"$ing":" >> ./diccionario.txt
fi