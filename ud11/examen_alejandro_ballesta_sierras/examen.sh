#!/bin/bash
#autor Alejandro Ballesta Sierras

#Funciones
crearTique(){
fecha=$(date | tr ' ' ':' | cut -d':' -f2,5,6,7 | tr -d ':')
numeroTiques=$(ls ./tiques | cut -d'd' -f1 | cut -d'e' -f2 | sort -nr | head -1)
nuevoNumeroTic=$(($numeroTiques+1))
nombreTique="tique"$nuevoNumeroTic"de"$fecha
}

listarTique(){
lisProducto=$(cat $buscarTique | cut -d',' -f1)
lisCantidad=$(cat $buscarTique | cut -d',' -f2)
lisPrecio=$(cat $buscarTique | cut -d',' -f3)
printf "Producto  Cantidad  Precio  Subtotal\n$lisProducto  $lisCantidad  $lisPrecio"
}

sumarTiques(){
    
}

#Comienzo del programa
correcto=0
while [ $correcto -eq 0 ];
do
    echo "1) Crear tique"
    echo "2) Mostrar tique"
    echo "3) Sumar tiques"
    echo "4) Salir del programa"
    read -p "Elige una opcion: " opcion

    case $opcion in
        1)
        seguro='s'
        crearTique
        while [ $seguro == "s" ];
        do
            read -p "Producto: " producto
            read -p "Cantidad: " cantidad
            read -p "Precio: " precio
            echo ""
            read -p "Quieres introducir otro producto? (s/n): " seguro
            echo "$producto,$cantidad,$precio" >> ./tiques/$nombreTique
        done 
        ;;
        2)
        read -p "Elige el tiques a mostar: " tique
        buscarTique=$(find ./tiques -name $tique 2>null)
        if [ -z $buscarTique ];
        then
            echo "El tique no existe"
        else
            listarTique
        fi
        ;;
        3)
        read -p "Indica el dia: " dia
        buscarDia=$(ls ./tiques/ | grep de$dia)
        if [ -z $buscarDia ];
        then
            echo "No hay tiques creados con este dia"
        else
            sumarTiques
        fi
        ;;
        4)
            correcto=1
        ;;
    esac
done