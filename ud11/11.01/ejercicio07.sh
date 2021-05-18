#!/bin/bash

#autor Alejandro Ballesta Sierra
#ejercicio07
# Crea un script que pida una contraseña y permita tres intentos. Si el usuario da
# la contraseña correcta muestra un mensaje de bienvenida. Si no es así,
# mostrará un mensaje de error. La contraseña se encuentra especificada en
# una variable dentro del script (PASS= “Mi contraseña”).

PASS="1234"
for ((i=1;i<=3;i++))
do
    read -p "Escribe la contrasenya: " password
    if [ $PASS = $password ];
    then
        echo "Bienvenido al sistema"
        break
    fi
    if [ $i -eq 3 ] ;
    then
        echo "Limite de intentos alcanzado"
    fi
done

