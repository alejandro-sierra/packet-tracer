#!/bin/bash

#autor Alejandro Ballesta Sierras
# ejercicio05
# Realiza un script para que muestre las 10 primeras tablas de multiplicar por
# pantalla. Existirá un tiempo de espera de dos segundos entre tabla y tabla y de
# un cuarto de segundo entre cada una de las operaciones de las tablas.

for ((i=1;i<=10;i++))
do
    for((j=1;j<=10;j++))
    do
        let "resultado=i*j"
        sleep 0.25s
        printf "$i*$j=$resultado %s\n"
    done
    printf "\n"
    sleep 2s
done