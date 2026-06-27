#!/bin/bash

echo "Quel est ton nom ?"
read NOM

echo "Quel est ton age ?"
read AGE

if [ "$AGE" -ge 18 ]; then
       	echo "Bonjour $NOM tu es majeur"
else
	echo " bonjour $NOM tu es mineur"
fi




