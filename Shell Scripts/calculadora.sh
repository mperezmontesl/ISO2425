#!/bin/bash
# Calculadora
# Autor: Miguel Pérez-Montes Lozano
# Fecha: 04/02/2025
clear

	echo "Este script está hecho por Miguel Pérez-Montes Lozano"
	if [ $# -ne 2 ]; then
		echo "Numero de parametros incorrecto"
		exit
	fi

	if [ -f $1 ]; then
		echo "El fichero en cuestión ya existe"
		exit
	fi

	num=0

	while true; do

		echo "Menu de Operaciones"
		echo "S - Realizar una suma"
		echo "R - Realizar una resta"
		echo "M - Realizar una multiplicación"
		echo "D - Realizar una division"
		echo
		read -p "Escriba el tipo de operación y 2 valores, separando todo con espacios: " op op1 op2

		case $op in

			S)
				echo
				echo "Ha escogido la opción de suma"
				echo
				echo $op $op1 $op2 >> $1

			;;

			R)
				echo
				echo "Ha escogido la opción de resta"
				echo
				echo $op $op1 $op2 >> $1
			;;

			M)
				echo
				echo "Ha escogido la opción de multiplicación"
				echo
				echo $op $op1 $op2 >> $1
			;;

			D)
				echo
				echo "Ha escogido la opción de división"
				echo
				echo $op $op1 $op2 >> $1
			;;

			*)
				echo
				echo "El input no es correcto, porfavor añada uno correcto"
				echo
			;;

		esac

		if [ $num -lt $2 ]; then
			num=$((num+1))
		else
			echo "Numero máximo de iteraciones alcanzada"
			echo

			pwd calculadora.txt
			echo
			cat calculadora.txt
			break
		fi
	done
