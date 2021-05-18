#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio09
# Modificar el script anterior para que permita ir jugando hasta que el jugador
# decida abandonar el juego (para ello deberá pulsar la tecla “x” del teclado). El
# programa debe sacar por pantalla el número de jugadas y el total ganado por
# el jugador.

ramdom=`shuf -i 0-1 -n 1`
# 1 = cara
# 0 = cruz


read -p "Cantidad a apostar: " numero
if [ $ramdom -eq 1 ];
then
    let "resultado=numero*2"
    echo "Cantidad ganada $resultado!"
else
    echo "Nada! Lo pierdes todo!"
fi
