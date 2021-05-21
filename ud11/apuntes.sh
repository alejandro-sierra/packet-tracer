#!/bin/bash
# Esto es un comentario

echo "HolaMundo!"
echo 'HolaMundo!'
echo uno; echo dos; echo tres
echo -e "Esto es un saldo de linea\nAqui salto"

#*****Operaciones*****
numero=3
echo $numero+4
Suma=$(($numero+4))
echo $Suma
Suma=$[$numero+4]
echo $Suma

#*****.*****
echo $0 #Esto devulve el nombre del fichero 
echo $1 #el primer parametro de entrada (./ pruebas Alejandro Ballesta)
echo $2 #el segundo parametro introducido
echo $* #muestra todos los parametros introducidos
echo $# #numero deparametros introducidos
echo $?

#*****Condicionales*****
numero=7
if [ -n $3 ]; #-n el parametro no es nulo
then
  echo "El tercer parametro es: $3"
else
  echo "No hay tercer parametro"
fi


