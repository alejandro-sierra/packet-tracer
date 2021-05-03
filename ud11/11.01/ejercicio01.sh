#!/bin/sh

#autor Alejandro Ballesta Sierras
#Ejercicio01

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
  read -p "Introduce el valor de a: " a
entero $a
  read -p "Introduce el valor de b: " b
entero $b
  read -p "Introduce el valor de c: " c
entero $c
echo ""
done


#Operacion 2 * b + 3 * (a-c)
operacionA(){
  Suma=$((2*$b+3*($a-$c)))
  echo "El resultado de la operacion 2 * b + 3 * (a-c) es:" $Suma
}
operacionA
echo ""

#Operacion a%b
operacionB(){
  Suma=$(($a%$b))
  echo "El resultado de la operacion a%b es:" $Suma
}
operacionB
echo ""

#Operacion a/c
OperacionC(){
  Suma=$(($a/$b))
  echo "El resultado de la operacion a / b es:" $Suma
}
OperacionC
echo ""

#Operacion a * (b / c)
OperacionD(){
  Suma=$(($a*($b/$c)))
  echo "El resultado de la operacion a * (b / c) es:" $Suma
}
OperacionD
echo ""

#Operacion (a * b) % b
OperacionE(){
  Suma=$((($a*$b)%$b))
  echo "El resultado de la operacion (a * b) % b es:" $Suma
}
OperacionE
