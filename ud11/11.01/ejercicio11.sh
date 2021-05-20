#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11
# Realiza un script que pasándole una cadena de tres cifras numéricas como
# argumento si son válidas para el formato octal de la orden chmod debe
# informar de los permisos que representan.
# Por ejemplo para sh ejercicio11.sh 644 mostrará por pantalla:
#         Lectura  Escritura  Ejecución
# Usuario    Si       Si         No
# Grupo      Si       No         No
# Resto      Si       No         No
#
# Puesdes usar "printf" en lugar de "echo" para formatear el texto.

octal(){
if [ -z $1 ];
then 
    error=0
    clear
else 
    tam=${#1} #comprobamos que el tamano es 3 digitos
    if [ $tam -eq 3 ];
    then
        nodigitos=$(echo $1 | sed s/[0-7]//g) #comrpobamos que esten entre el 0 y el 7
        if [ -n "$nodigitos" ];
        then
          error=0
        else
          error=1
        fi
    else
        error=0
    fi
fi
}

#Petición de datos.
#Se utiliza el while para comprobar que se ha introducido realmente un número
error=0
while [ $error -eq 0 ]; do
    read -p "Introduce los permisos en octal: " permisos
    octal $permisos
    echo ""
done




