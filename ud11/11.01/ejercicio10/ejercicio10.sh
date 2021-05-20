#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio10
# Modifica el script anterior para que podamos guardar las puntuaciones del
# jugador en un archivo de texto. Al final de cada partida se mostrará los cinco
# mejores jugadores ordenados por la cantidad ganada (deberás guardar la
# puntuación de todos los jugadores en un archivo de texto llamado
# puntuaciones.txt, para ello utiliza el comando echo así como los
# redireccionadores).

i=1
fin=0

read -p "Nombre del jugador: " nombre #nombre del jugados que se guardara en la lista
read -p "Cantidad a apostar: " numero
#igualo el numero al resultado para que al salir del while no coja la variable nuero de aqui arriba
resultado=$numero 
while [ $fin -eq 0 ];
do
    ramdom=`shuf -i 0-1 -n 1`

    if [ $ramdom -eq 1 ];
    then
        let "resultado=resultado*2"
        echo "Numero de jugadas $i"
        echo "Cantidad ganada $resultado!"
    else
        echo "Nada! Lo pierdes todo!"
        exit
    fi
    echo ""
    read -p "Quieres abandonar? (x/n): " salir
    if [ $salir = "x" ];
    then
        fin=1
    fi
    i=$((i+1))
done
echo "$resultado {$nombre}" >>puntuaciones.txt # le ponemos doble redireccion para que almacene todos los nombres
echo "*****TOP 5*****"
sort -rn puntuaciones.txt | head -5 | cat #sort ordena de forma descendente, head -5 me da los primeros 5 y cat me los lista