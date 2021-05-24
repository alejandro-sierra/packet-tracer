#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.03-03
# Crea un script para monitorizar los procesos del sistema. Una vez ejecutado, el
# programa debe mostrar un menú de usuario con los siguientes elementos:
# a) Mostrar los procesos del sistema con la información más detallada posible
# (cantidad de CPU consumida, memoria utilizada, etcétera).
# b) Matar un proceso en ejecución cuyo nombre o identificador se pasa como
# parámetro. Deberá informar al usuario del resultado de la acción. Usa el
# comando killall para esta tarea.
# NOTA: usa los comandos ps, killall o top.

#Comprobamos que se haya pasado un elemento por parametro, si no se sale del script
if [ $# -ne 1 ];
then
    echo "Debes introducir un parametro"
else
    for ((;;));
    do
       until [ $opcion -eq 3 ]; #Solo salbremos el bucle si al opcion es igual a 3
           do
           echo ""
           echo "*****MENU DE PROCESOS*****"
           echo "1) Mostrar procesos del sistema"
           echo "2) Matar un proceso"
           echo "3) Salir"
           read -p "Elige una opcion: " opcion

           case $opcion in
           1) #Mostramos todos los procesos con el mayor detalle
           echo "Para salir pulsa la 'Q'"
           top
           break
           ;;
            2) #Borramos el proceso pasado por parametro
            read -p "Estas seguro de que quieres elimiar este proceso? (s/n): " seguro
            if [ seguro="s" ];
            then
            killall $1
            echo "El proceso $1 ha sido eliminado"
            else
                break
            fi
            ;;
           3) #Con el 3 salimos del programa
           exit
           ;;
           esac
       done
    done
fi