#!/bin/bash

#autor Alejandro Ballesta Sierras
# ejercicio06
# Crea un script para jugar a adivinar un número entre 1 y 10 (este número será
# generado al azar por el ordenador, para ello puede utilizar el comando date +
# %N y de allí coges cualquier número menos el primero y los dos últimos). El
# programa ira preguntando números al usuario hasta que acierte.

ramdom=`shuf -i 1-10 -n 1`

for ((;;))
do
    read -p "Adivina el numero: " numero
    if [ $numero -eq $ramdom ];
    then
        echo "Numero correcto!"
        break
    else
        echo "Vuelve a intentarlo"
    fi
    echo ' '
done