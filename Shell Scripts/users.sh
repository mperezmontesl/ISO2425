x#!/bin/bash
# Users
# Autor: Miguel Pérez-Montes Lozano
# Fecha: 11/02/2025
clear

fecha=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")


if [ $# -ne 1 ]; then
	num=1000
else
	num=$1
fi


		echo
		echo "=================================================================="
		echo
		echo "Informe de usuarios el día $fecha a las $hora"
		IFS=:

		while read us x uid gid d h shell; do
			if [ $num -lt $uid ]; then
				echo "$us - $uid"
				total=$(($total+1))
			fi
		done < /etc/passwd
		echo "Total: $total usuarios"
		echo
		echo "=================================================================="
		echo
		echo "$fecha - $hora - El usuario $us ha solicitado un informe de usuarios" >> /tmp/logeventos
