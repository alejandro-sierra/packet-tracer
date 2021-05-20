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

opciones(){
case $1 in
    0)
    #nada
    printf "\t \tNo \t \tNo \t \tNo\n"
    ;;
    1)
    #ejecucion
    printf "\t \tNo \t \tNo \t \tSi\n"
    ;;
    2)
    #escritura
    printf "\t \tNo \t \tSi \t \tNo\n"
    ;;
    3)
    #escritura y ejecucion
    printf "\t \tNo \t \tSi \t \tSi\n"
    ;;
    4)
    #lectura
    printf "\t \tSi \t \tNo \t \tNo\n"
    ;;
    5)
    #lectura y ejecucion
    printf "\t \tSi \t \tNo \t \tSi\n"
    ;;
    6)
    #lectura y escritura
    printf "\t \tSi \t \tSi \t \tNo\n"
    ;;
    7)
    #lectura, escritura y ejecucion
    printf "\t \tSi \t \tSi \t \tSi\n"
    ;;
esac
}

error=0 #aqui pedimos lo datos, y comprobamos que el error es igual a 1, es decir, se cumplen las condiciones 
while [ $error -eq 0 ]; 
do 
    read -p "Introduce los permisos en octal: " permisos
    octal $permisos
    echo ""
done

numero1=$(echo $permisos | cut -c1)
numero2=$(echo $permisos | cut -c2)
numero3=$(echo $permisos | cut -c3)

# printf "             Lectura        Escritura       Ejecución\n"
# printf "Usuario"
# opciones $numero1
# printf "Grupo"
# opciones $numero2
# printf "Resto"
# opciones $numero3
# printf "\n"

printf "             Lectura        Escritura       Ejecución\n"
printf "Usuario"
opciones $numero1
printf "Grupo"
opciones $numero2
printf "Resto"
opciones $numero3
printf "\n"