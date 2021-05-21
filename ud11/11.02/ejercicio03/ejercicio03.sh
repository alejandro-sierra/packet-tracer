#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.02-03
# Construye un programa AGENDA que permita mediante un menú el
# mantenimiento de un pequeño archivo LISTA con el nombre, dirección y
# teléfono de varias personas. Incluye las opciones:
# a) añadir (añadir un registro)
# b) buscar (buscar entradas por nombre, dirección o teléfono)
# c) listar (visualizar todo el archivo).
# d) ordenar (ordenar los registros alfabéticamente).
# e) borrar (borrar el archivo).

for ((;;));
do
    until [ $opcion -eq 6 ];
    do
        echo ""
        echo "*****MENU*****"
        echo "1) Añadir (añadir un registro)"
        echo "2) Buscar (buscar entradas por nombre, dirección o teléfono)"
        echo "3) Listar (visualizar todo el archivo)"
        echo "4) Ordenar (ordenar los registros alfabéticamente)"
        echo "5) Borrar (borrar el archivo)"
        echo "6) Salir"
        read -p "Elige la opcion: " opcion
        echo ""

        case $opcion in
            1) #Anyadir un contacto
            if [ -a lista.txt ]; #comprobara si la lista existe
            then
                echo "El fichero existe"
            else #si no existe la lista la crea
                touch lista.txt
            fi

            echo "*****Datos del contacto nuevo*****" #pedimos los datos del contacto
            read -p "Nombre: " nombre
            read -p "Direccion: " direccion
            read -p "Telefono: " telefono
            echo $nombre";"$direccion";"$telefono >> lista.txt
            break
            ;;
            2) #Buscar una entrada
            read -p "Busqueda por nombre, direccion o telefono: " busqueda
            grep -i $busqueda ./lista.txt | cat
            break
            ;;
            3) #Listar lista.txt
            cat ./lista.txt
            break
            ;;
            4) #Listado de la lista.txt ordenado alfabeticamente
            sort ./lista.txt
            break
            ;;
            5) #Borrado de contactos
            read -p "Contacto a borrar: " borrado
            grep -i $borrado ./lista.txt | cat #le mostramos primero el contacto que va a borrar
            echo ""
            read -p "Seguro que quires borralo? (s/n): " seguro #nos a seguramos de que quiere borrar lo
            if [ $seguro = "s" ];
            then
                sed -i /$borrado/d ./lista.txt #borrado del contacto elegido
            else
                break
            fi
            break
            ;;
            6)
                exit
                ;;
        esac
    done
done
