#!/bin/bash

#autor Alejandro Ballesta Sierras
#ejercicio11.03-02
# Realiza un script para gestionar los usuarios y grupos necesarios para alumnos
# de un centro, obteniendo los datos de un fichero que se le pasa como
# argumento y que tendrá información de alumnos
# (Nombre,Apellidos,Nif,Clase,Especialidad,NºExpediente).
# a) Si no se le pasa un fichero o el que se le pasa no existe, devolverá un
# mensaje de error.
# b) Se creará cada grupo cuyo nombre se obtendrá del campo Clase, dentro
# del cual se encontrarán sus usuarios correspondientes.
# c) Se creará cada usuario cuyo nombre se obtendrá del campo
# NºExpediente, su clave se corresponderá con el campo Nif, y tendrá un
# directorio de trabajo con el mismo nombre de usuario.
# d) Para cada usuario también se almacenará su Nombre y Apellidos, además
# de incluirse en el grupo secundario Alumnos.
# e) El programa generará un fichero de bitácora con el resultado de la
# ejecución de cada uno de los comandos (recuerda usar $? para saber si el
# último comando ejecutado lo ha hecho con éxito o no).
# NOTA: deberás usar los comandos useradd, usermod, groupadd, groupmod.

#Comprobamos que nos a pasado algun parametro
if [ $# -ne 1 ];
then
    echo "Debes pasar un parametro"
    exit
fi

#Comprobamos que el fichero existe
existe=$(find / -name $1 2>null)
if [ -z $existe ];
then
    echo "El fichero no existe, prueba con otro"
    exit
if

#Creamos los grupos
grupo=$(cat $1 | cut -d, -f4)
