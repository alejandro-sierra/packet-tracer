#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio02
# Crea un script que al ejecutarlo muestre por pantalla uno de estos mensajes
# “Buenos días”, “Buenas tardes” o “Buenas noches”, en función de la hora que
# sea en el sistema (de 8:00 de la mañana a 15:00 será mañana, de 15:00 a 20:00
# será tarde y el resto será noche). Para obtener la hora del sistema utiliza el
# comando date.

buenas(){
  #la hora del sistema
  date=`date +%H`   
  if [ $date -le 15 ]; #compruebo que la hora es menor o igual a 15
  then
    echo "Buenos dias"
  elif [ $date -le 20 ]; #compruebo que la hora es menor o igual a 20
  then
    echo "Buenas tardes"
  else # si no es ninguna de las 2 anteriores es "Buenas noches"
    echo "Buenas noches"
  fi
}
buenas

