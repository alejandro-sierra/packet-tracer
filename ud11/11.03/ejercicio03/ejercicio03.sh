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

for ((;;));
do
        echo ""
        echo "*****MENU*****"
        echo "1) Mostrar procesos del sistema"
        echo "2) Matar un proceso"
        echo "3) Salir"
        read -p "Elige una opcion: " opcion

        if [ $opcion -eq 3 ];
        then
            break
        fi
done