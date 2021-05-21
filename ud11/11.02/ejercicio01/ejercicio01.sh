#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-01
# Crea un script que se le pase un nombre de archivo como parámetro y
# muestre por pantalla que tipo de archivo es. Además, si es un directorio
# mostrará su contenido y si es un fichero lo mostrará por pantalla.

resultado=$(find / -name $1 2>null)

if [ -z "$resultado" ] #comprobamos que la variable resultado esta vacia
then 
  echo "No existe el fichero"
else
    if [ -d $resultado ] #si es un directorio 
    then
    echo "Es un directorio"
    echo ""
        ls -l $resultado
    else
    echo "Es un fichero"
    echo ""
        cat $resultado
    fi
fi