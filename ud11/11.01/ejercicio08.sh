#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio08
# Crea un shell script que permita jugar a “Doble o Nada”. El jugador apuesta
# una cantidad y tira una moneda (como en el ejercicio6). Si sale cara obtiene el
# doble de la cantidad apostada. Si sale cruz lo pierde todo.

ramdom=`shuf -i 0-1 -n 1`
# 1 = cara
# 0 = cruz (lo pierde todo)

read -p "Cantidad a apostar: " numero #cantidad a apostar
if [ $ramdom -eq 1 ]; # si el numero ramdom es igual a 1 seguimos
then
    let "resultado=numero*2"
    echo "Cantidad ganada $resultado!"
else
    echo "Nada! Lo pierdes todo!"
fi
