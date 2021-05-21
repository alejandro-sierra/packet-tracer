#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-06
# Modifica el script anterior para añadir dos idiomas a nuestro diccionario: el
# catalán y el euskera. Ahora en lugar de pasar como parámetros, al lanzar
# un script aparecerá un menú que indicará en que sentido quiere traducir.
# Después preguntará la palabra a traducir. Si la palabra no se encuentra en el
# diccionario, se le dará al usuario la opción de incluirla en los cuatro idiomas.

if [ $# -ne 2 ]; #Comprobamos que son han pasado 2 parametros
then 
    echo "Parametro 1: orden de la traduccion (ING/ESP/CAT/EUSK/BUL)"
    echo "Parametro 2: palabra a traducir"
    echo ""
    exit
fi

#Comprobamos que el orden ($1) es correcto
case $1 in
    ESP)
    grep -i $2 ./diccionario.txt | cut -d: -f1
    ;;
    ING)
    grep -i $2 ./diccionario.txt | cut -d: -f2
    ;;
    CAT)
    grep -i $2 ./diccionario.txt | cut -d: -f3
    ;;
    EUSK)
    grep -i $2 ./diccionario.txt | cut -d: -f4
    ;;
    BUL)
    grep -i $2 ./diccionario.txt | cut -d: -f5
    ;;
    *)
        echo "Parametro 1 incorrecto, solo podemos traducir a español(ESP), inglés(ING), catalan(CAT), euskera(EUSK) y bulgaro(BUL)."
    ;;
esac

#Comprobamos que la palabra a traducir ($2) esta en el diccionario
busqueda=$(grep -c $2 ./diccionario.txt)
if [ $busqueda -eq 0 ];
then
    echo "No tenemos esa palabra registrada en nuesto diccionario"
    read -p "Añade la palabra (ESP): " esp
    read -p "Añade la palabra (ING): " ing
    read -p "Añade la palabra (CAT): " cat
    read -p "Añade la palabra (EUSK): " eusk
    read -p "Añade la palabra (BUL): " bul
    echo $esp":"$ing":"$cat":"$eusk":"$bul":" >> ./diccionario.txt
fi