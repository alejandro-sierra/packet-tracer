#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.03-04
# Crea un script que funcione de manera similar a la papelera de reciclaje de
# Windows. El programa debe mostrar el siguiente menú e implementar sus
# operaciones:
# a) eliminar archivo. Esta operación recibe la ruta completa de un archivo y lo
# mueve al directorio /home/alumno/recycled. Si no existe dicho directorio, el
# programa ha de crearlo.
# b) restaurar archivo. Esta operación recibe el nombre de un archivo y lo
# mueve, desde la papelera de reciclaje, al directorio en el que estuviera
# anteriormente. El proceso de eliminación, debe haber almacenado, por
# tanto dicho directorio en un fichero de texto.
# c) restaurar toda la papelera. Esta operación es similar a la anterior, pero se
# efectúa sobre todos los ficheros de la papelera.
# d) vaciar la papelera. Esta opción vacía el contenido de la papelera. Ninguno
# de los archivos será recuperable.
# e) mostrar la papelera. Esta opción muestra el contenido de la papelera.
# f)
# salir. Sale del programa.

#Comprobamos que existe el directorio
if [ -d ~/recycled ];
then
    echo "El directorio de respaldo existe"
else #si no existe la lista la crea
    mkdir ~/recycled
fi

for ((;;));
do
    until [ $opcion -eq 6 ]; #Solo salbremos el bucle si al opcion es igual a 6
    do


        echo ""
        echo "*****PAPELERA DE RECICLAJE HIGHCOST*****"
        echo "1) Eliminar archivo"
        echo "2) Recuperar archivo"
        echo "3) Restaurar toda la papelera"
        echo "4) Vaciar la papelera"
        echo "5) Mostar la papelera"
        echo "6) Salir"
        read -p "Elige una opcion: " opcion

        case $opcion in
        1) #Nombre del archivo a eliminar
        read -p "Nombre del archivo a eliminar: " eliminar
        buscarFichero=$(find / -name $eliminar 2>null)
        if [ -z $buscarFichero ];
        then
            echo "Fichero no existe"
        else
            echo "El $eliminar a sido reciclado con exito"
            sudo mv $buscarFichero ~/recycled
            echo $eliminar":"$buscarFichero >> respaldo.txt #Grabamos en el fichero la copia de respaldo
            
        fi
            break
        ;;
        2) #Restaurar un archivo
        read -p "Nombre del fichero a restaurar: " restaurar
        buscarRestauracion=$(grep -i $restaurar ./respaldo.txt | cut -d: -f2)
        sudo mv ~/recycled/$restaurar $buscarRestauracion
        echo "El fichero ~/recycled/$restaurar a sido restaurado a $buscarRestauracion"
        sed -i /$restaurar/d ./respaldo.txt #borrado del registro en respaldo
            break
        ;;
        3) #Restuarar toda la papelera
        listaFichero=$(grep -i ./respaldo.txt | cut -d: -f1)
        restaurarTodo=$(grep -i ./respaldo.txt | cut -d: -f2)
        for i in $listaFichero;
        do
            for j in $restaurarTodo;
            do
            sudo mv ~/recycled/$i $j
            done
        done
        echo "Todo restaurado"
            break
        ;;
        4) #Vaciar la papelera
        rm -r ~/recycled/*
        rm -r ./respaldo.txt
        touch ./respaldo.txt
            break
        ;;        
        5) #Mostar el contenido de la papelera
        ls -l ~/recycled
            break
        ;;
        6) #Con el 3 salimos del programa
            exit
        ;;
        esac
    done
done