#!/bin/bash

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



#autor Alejandro Ballesta Sierras
#ejercicio03
# Crea un script que pida un número e indique si se trata de un número par y si es
# número primo.

resultado=$((numero%2))
if [ $numero = 1 ] #comprobacion del 1
then
  echo "el numero es impar"
  echo "el numero no es primo"
elif [ $numero = 2 ] #comprobacion del 2
then
  echo "el numero es par"
  echo "el numero es primo"
elif [ $resultado -eq 0 ]; #comprobamos que el numero es par o impar
then 
  echo "el numero es par"
else
  echo "el numero es impar"
  for (( i=2 ; i<$numero ; i++ )); #recorremos el for empezando por el 2 y terminado por un antes del numero indicado
  do
    resultado=$((numero%$i))
    if [ $resultado -eq 0 ]; #si el resultado es 0 sabemos que es primo
    then  
      echo "el numero no es primo"
      break;
    else 
      fin=$(($numero-1))
      if [ $i -eq $fin ];
      then  
       echo "el numero es primo"
      fi
    fi
  done
fi

