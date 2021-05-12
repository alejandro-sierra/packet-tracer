#!/bin/sh

#autor Alejandro Ballesta Sierras
#Ejercicio02

buenas(){
  date=`date +%H`
  
  if [ $date -le 15 ]; then
    echo "Buenos dias"
  elif [ $date -le 20 ]; then
    echo "Buenas tardes"
  else
    echo "Buenas noches"
  fi
}
buenas

