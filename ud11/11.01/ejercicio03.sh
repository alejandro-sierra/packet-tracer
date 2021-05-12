#!/bin/sh

#autor Alejandro Ballesta Sierras
#Ejercicio03

#Función para saber si el valor introducido es un número
entero() {

#Si la variable no tiene datos error a 0
  if [ -z $1 ];
then 
  error=0
clear
else 
nodigitos=$(echo $1 | sed s/[0-9]//g)
#Si la variable contiene algo que no sean números error a 0 y si son solo números error a 1
if [ -n "$nodigitos" ];
then
  error=0
else
  error=1
fi
fi
}

#Petición de datos.
#Se utiliza el while para comprobar que se ha introducido realmente un número
error=0
while [ $error -eq 0 ]; do
  read -p "Introduce un numero: " numero
entero $numero
echo ""
done

# UN NUMERO ES PRIMO SI ES DIVISIBLE SOLO ENTRE 1 Y SI MISMO
#
# 17 es primo, 17 % 1 = 0 y 17 % 17 = 1
#
# 27 no es primo, 27 % 3 = 0

primo(){
contador=2
while [ $contador -lt $numero ]
do
  if [ $primo%$contador=0 ]; then
    echo "El $numero NO es primo"
  else
    echo "El $numero SI es primo"
  fi
   contador=$(( contador+1 ))
done
}
