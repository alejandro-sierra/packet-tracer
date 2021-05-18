#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio04
# Realiza un script que admita un único parámetro correspondiente al nombre de
# un fichero de texto. Si el fichero existe, debe contar el número de líneas del
# mismo a través del comando wc y mostrar un mensaje indicando dicho
# número. Si el fichero no existe, debe mostrar un mensaje de error y salir.
resultado=$(find / -name "$1" -type f -exec wc -l {} \; 2>null)

if [ -z "$resultado" ]
then 
  echo "No existe el fichero"
else
  echo "$resultado" | cut -d ' ' -f 1
fi