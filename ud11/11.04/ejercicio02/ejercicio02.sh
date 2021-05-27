#!/bin/bash

# **********************************************************************************
#autor Alejandro Ballesta Sierras
# Ejercicio 11.04 - 02
#
# Crea un script para la programación de tareas en el sistema. Al lanzar el script
# debe aparecer un menú con las siguientes opciones (40%):
# a) mostrar el listado completo con las tareas programadas en el sistema
# b) comprobar si el usuario pasado como parámetro puede programar tareas.
# Si no se le pasa parámetro, comprobará si el usuario actual tiene permisos
# para programar tareas.
# c) añadir tareas usando un asistente que irá preguntando al usuario por cada
# una de la opciones necesarias para programar la tarea. Al finalizar el
# asistente el programa programará la tarea y comprobará si se ha realizado
# con éxito.
# d) eliminar tareas programadas. Deberá primero listar las tareas, el usuario
# elegirá la tarea que desea eliminar. El script debe pedir confirmación de la
# eliminación.
# NOTA: Deberás usar el comando crontab así como los ficheros involucrados con él.
# **********************************************************************************

salir=0
while [ $salir -eq 0 ];
do
    echo ""
    echo "*****INFORME DE IP LIBRES*****"
    echo "a)"
    echo "b)"
    echo "c)"
    echo "q) Salir"
    read -p "Elige una opcion: " opcion

    case $opcion in
        a)
            echo "Eleccion A"
        ;;
        b)
            echo "Eleccion B"
        ;;
        c)
            echo "Eleccion C"
        ;;
        q)
            salir=1
        ;;
    esac
done