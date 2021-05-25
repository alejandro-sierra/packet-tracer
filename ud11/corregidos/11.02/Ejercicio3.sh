#!/bin/sh

#Ejercicio3

#Inicializo la vaariable para salir del menú

salir=0

#Mientras no se seleccione salir del menu

while [ $salir -eq 0 ];
do

#Visualizo el menu

	printf " 1) Añadir \n 2) Buscar \n 3) Lista \n 4) Ordenar \n 5) Borrar \n 6) Salir \n"
	read -p "Elige lo que quieres hacer con la agenda: " opcion

#Selecciona las distintas opciones

	case $opcion in

#Añadir un registro al fichero lista.txt

		1)
			echo "Vamos a añadir un registro"
			read -p "Dime el nombre a añadir: " nombre
			read -p "Dime la dirección: " direccion
			read -p "Dime el número de teléfono: " telefono
			echo "$nombre;$direccion;$telefono">>lista.txt
		;;
		2)

#Buscar por cualquier registro
#Mientras no seleccione volver al menu principal

			control=0
			while [ $control -eq 0 ];
			do

#Menu para buscar por las distintas opciones

				printf " 1) Nombre \n 2) Dirección \n 3) Número de teléfono\n 4) Volver al menú\n"
				read -p "Por qué campo quieres buscar? " buscar

#Busco por nombre
				case $buscar in
					1)
						control=1
						read -p "Dime el nombre a buscar: " nombre

#Busco si existe y compruebo que he encontrado algo
#Como puede encontrar varios registros los pongo todos en la misma linea para que no me de error

						encontrado=$(cat lista.txt | cut -d';' -f1 | grep $nombre | tr '\n ' ';')
						if [ -z $encontrado ];
						then
							echo "Nombre no encontrado"
							control=0
						else

#Me quedo con todos los encontrados y los muestro por pantalla

							Nombre_econtrado=$(cat lista.txt | cut -d';' -f1 | grep $nombre)
							Direccion=$(cat lista.txt | grep $nombre | cut -d';' -f2)
							Telefono=$(cat lista.txt | grep $nombre | cut -d';' -f3)
							echo "El nombre es: $Nombre_econtrado \nLa dirección es: $Direccion \nEl teléfono es: $Telefono"
						fi
						;;

#Busco por dirección

					2)
						control=1
						read -p "Dime la dirección a buscar: " direccion

#Busco si existe y compruebo que he encontrado algo
#Como puede encontrar varios registros los pongo todos en la misma linea para que no me de error


						encontrado=$(cat lista.txt | cut -d';' -f2 | grep $direccion | tr '\n ' ';')
						if [ -z $encontrado ];
						then
							echo "Direccion no encontrada"
							control=0
						else

#Me quedo con todos los encontrados y los muestro por pantalla

							Nombre_econtrado=$(cat lista.txt | grep $direccion | cut -d';' -f1)
							Direccion=$(cat lista.txt | grep $direccion | cut -d';' -f2)
							Telefono=$(cat lista.txt | grep $direccion | cut -d';' -f3)
							echo "El nombre es: $Nombre_econtrado \nLa dirección es: $Direccion \nEl teléfono es: $Telefono"
						fi
					;;

#Busco por telefono

					3)
						read -p "Dime el número de teléfono a buscar: " telefono

#Busco si existe y compruebo que he encontrado algo
#Como puede encontrar varios registros los pongo todos en la misma linea para que no me de error

						encontrado=$(cat lista.txt | cut -d';' -f3 | grep $telefono | tr '\n ' ';')
						if [ -z $encontrado ];
						then
							echo "Telefono no encontrado"
							control=0
						else

#Me quedo con todos los encontrados y los muestro por pantalla

							Nombre_econtrado=$(cat lista.txt | grep $telefono | cut -d';' -f1)
							Direccion=$(cat lista.txt | grep $telefono | cut -d';' -f2)
							Telefono=$(cat lista.txt | grep $telefono | cut -d';' -f3)
							echo "El nombre es: $Nombre_econtrado \nLa dirección es: $Direccion \nEl teléfono es: $Telefono"
						fi
						control=1
					;;

#Vuelvo al menu principal

					4)
						control=1
					;;
					*)
						echo "Esa opción no es posible"
						sleep 5
						clear
					;;
				esac
			done
		;;

#Muestro el contenido del archivo lista.txt

		3)
			printf "Nombre \t\t\t Dirección \t\t\t Número de teléfono \n"
			cat lista.txt | tr ";" "\t\t\t"
		;;

#Ordeno el fichero 


		4)
			sort -f lista.txt -o lista.txt
		;;

#Borro el archivo

		5)
			rm -r lista.txt
		;;
		6)

#Salgo del programa

			echo "Salir"
			salir=1
		;;
		*)
			echo "Valor erroneo"
		;;
	esac
done

