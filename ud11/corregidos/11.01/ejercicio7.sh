#!/bin/sh

#Ejercicio7

#Defino la contraseña

pass="Jogonar14?"

#Pido la contraseña

read -p "Introduce la contraseña: " contrasena

#Cuento el primer intento

intentos=1

#Compruebo si no he puesto la contraseña real
if [ $contrasena != $pass ]; 
then
#Si no he hecho los tres intentos
	while [ $intentos -le 2 ];
	do
#Pido de nuevo la contraseña
		read -p "Contrasena erronea, inténtalo de nuevo:" contrasena
		if [ $contrasena = $pass ];
		then
			echo "Contraseña correcta, bienvenido"
			intentos=1
#Como la he puesto bien salgo del while
			break
		else
#Como no la he puesto bien sumo 1 a los intentos
			intentos=$((intentos+1))
		fi
	done
#Si he consumido todos los intentos informo de que has superado el limite.
	if [ $intentos -eq 3 ];
	then
		echo "Has superado el número de intentos permitidos"
	fi
else
#Como esta bien informo al usuario
	echo "Contraseña correcta, bienvenido"
fi

