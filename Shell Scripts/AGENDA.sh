#!/bin/bash
# Agenda
# Autor: Miguel Pérez-Montes Lozano
# Fecha: 03/02/2025
clear

while true; do

	echo "Menú de la Agenda"
	echo "a - Añadir una entrada"
	echo "b - Buscar por Dni"
	echo "c - Ver la agenda completa"
	echo "d - Eliminar todas las entradas de la agenda"
	echo "e - Finalizar"

	read -p "Ingrese una de las opciones (una letra): " opc
	case $opc in

			a)
				echo "Has ingresado en la opción a"
				echo
				read -p "Introduce un Dni: " dni

				if  grep "^$dni:" Agenda.txt > /dev/null ; then
					echo "El usuario ya existe"
				else
					read -p "Introduce un nombre para el nuevo usuario : " nmb
					read -p "Introcude los apellidos: " apll
					read -p "Introduce la localidad: " lcl
					echo "$dni:$nmb:$apll:$lcl" >> Agenda.txt
				fi
			;;


			b)	read -p "Introduce un Dni: " dni

				if  grep "^$dni:" Agenda.txt > /dev/null ; then
					name=$(grep "^$dni:" Agenda.txt | cut -f 2 -d ":")
					apll=$(grep "^$dni:" Agenda.txt | cut -f 3 -d ":")
					lcl=$(grep "^$dni:" Agenda.txt | cut -f 4 -d ":")
					echo
 					echo "La persona con el DNI número $dni es : $name $apll, y vive en $lcl"
					echo
				else
					echo "Error: Ese Dni no esta en la base de datos"
					echo
				fi
			;;

			c)


				if  cat Agenda.txt  > /dev/null; then
					cat Agenda.txt
				else
					echo "Agenda vacia"
					echo
				fi
			;;

			d)
				> Agenda.txt
				echo
				echo "Se ha eliminado todo el contenido"
				echo
			;;

			e)
				break
			;;

			*)
				echo
				echo "El input no es valido"
				echo
			;;

	esac
done
