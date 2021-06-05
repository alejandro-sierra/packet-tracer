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

permisos(){
read -p "Introduce el nombre del usuario" usuario
permiso=$(sudo cat /etc/group | grep crontab | grep $usuario)
if [ -z permiso ];
then
    echo "El usuario no tiene permisos para utilizar el crontab"
else
    echo "El usuario si tiene permisos"
fi
}

anyadir(){
    echo "minuto (0-59)
          |     hora (0-23)
          |     |       dia del mes (1-31)
          |     |       |       mes (1-12)
          |     |       |       |       dia de la semana (0-6 donde 0=Domingo)
          |     |       |       |       |       comandos
          |     |       |       |       |       |

          *     *       *       *       *       date > ~/fecha.txt"

    echo ""
    read -p "Minuto: " minuto
    read -p "Hora: " hora
    read -p "Dia del mes: " diaMes
    read -p "Mes: " mes
    read -p "Dia de la semana: " diaSemana
    read -p "Comando: " comando

    echo "$minuto" "$hora" "$diaMes" "$mes" "$diaSemana" "$comando" >> /var/spool/cron/crontabs/$USER
}

salir=0
while [ $salir -eq 0 ];
do
    echo ""
    echo "***** GESTION DEL CRONTAB *****"
    echo "a) Listado de todas las tareas"
    echo "b) Comprobar que el usuario tiene provilegios"
    echo "c) Añadir tareas"
    echo "d) Eliminar tareas"
    echo "q) Salir"
    read -p "Elige una opcion: " opcion

    case $opcion in
        a)
            sudo cat /var/spool/cron/crontabs/$USER 
        ;;
        b)
            permisos
        ;;
        c)
            anyadir
        ;;
        d)
        read -p ""
        eliminar=$()
        #sed -i /$restaurar/d ./respaldo.txt #borrado del registro en respaldo

        ;;
        q)
            salir=1
        ;;
    esac
done