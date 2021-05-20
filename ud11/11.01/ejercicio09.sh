#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio09
# Modificar el script anterior para que permita ir jugando hasta que el jugador
# decida abandonar el juego (para ello deberá pulsar la tecla “x” del teclado). El
# programa debe sacar por pantalla el número de jugadas y el total ganado por
# el jugador.

# 1 = cara
# 0 = cruz (lo pierde todo)

i=1

read -p "Cantidad a apostar: " numero #cantidad a postar
for ((;;));
do
    ramdom=`shuf -i 0-1 -n 1`

    if [ $ramdom -eq 1 ]; #si el numero ramdom es 1 seguimos jugando
    then
        let "numero=numero*2" #doblamos la cantidad
        echo "Numero de jugadas $i"
        echo "Cantidad ganada $numero!"
    else
        echo "Nada! Lo pierdes todo!"
        break
    fi
    echo ""
    read -p "Quieres abandonar? (x/n): " salir #al introducir x salimos del bucle
    if [ $salir = "x" ];
    then
        break
    fi
    i=$((i+1)) #i es igual al numero de partidas jugadas
done