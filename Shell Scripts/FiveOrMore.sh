#!/bin/bash
# Five Or More
# Autor: Miguel Pérez-Montes Lozano
# Fecha: 05/02/2025
clear

if [ $# -ne 2 ]; then
	echo
	echo "Número de parámetros incorrectos"
	echo
	exit
fi

if [ -f $1 ]; then

	echo
	echo "El fichero en cuestión ya existe"
	exit
fi

if [ -d $2 ]; then

echo "Este script está hecho por Miguel Pérez-Montes Lozano"

for i in $2/*.txt; do

	lin=$(wc -l $i | cut -f 1 -d " ")
	N=$(basename $i)
	if [ $lin -ge 5 ]; then

		echo "El fichero $i tiene 5 o más lineas"
		echo "$N"
		echo "$N" >> $1
		wds=$(wc -w $i | cut -f 1 -d " ")
		echo "El archivo original tenia un total de $wds palabras" >> $N.q
		cat $i >> $N.q
	fi
done
		Total=$(wc -l $1 | cut -f 1 -d " ")
		echo "Hay un total de $Total ficheros" >> $1
else
	echo "No tiene suficientes lineas"
fi
